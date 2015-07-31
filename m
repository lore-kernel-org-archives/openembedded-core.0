Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B3DD37647D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:09:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 31 Jul 2015 03:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,583,1432623600"; d="scan'208";a="773942891"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.23.101])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2015 03:09:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Lucian Musat <george.l.musat@intel.com>
Date: Fri, 31 Jul 2015 11:09:49 +0100
Message-ID: <65381770.ZZ0mdPmW1q@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.8-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1438332025-4208-1-git-send-email-george.l.musat@intel.com>
References: <1438332025-4208-1-git-send-email-george.l.musat@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oeqa/ptest: Modified regex to find FAILED testcases no just FAIL.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jul 2015 10:09:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Lucian,

On Friday 31 July 2015 11:40:25 Lucian Musat wrote:
> Some ptests output failed tests as FAILED instead of FAIL, like glib and
> pango.
> 
> Bug #6601
> 
> Signed-off-by: Lucian Musat <george.l.musat@intel.com>
> ---
>  meta/lib/oeqa/runtime/_ptest.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/runtime/_ptest.py
> b/meta/lib/oeqa/runtime/_ptest.py index 81c9c43..ba68234 100644
> --- a/meta/lib/oeqa/runtime/_ptest.py
> +++ b/meta/lib/oeqa/runtime/_ptest.py
> @@ -20,7 +20,7 @@ class PtestRunnerTest(oeRuntimeTest):
> 
>      # a ptest log parser
>      def parse_ptest(self, logfile):
> -        parser = Lparser(test_0_pass_regex="^PASS:(.+)",
> test_0_fail_regex="^FAIL:(.+)", section_0_begin_regex="^BEGIN:
> .*/(.+)/ptest", section_0_end_regex="^END: .*/(.+)/ptest") +        parser
> = Lparser(test_0_pass_regex="^PASS:(.+)",
> test_0_fail_regex="^FAIL(?:ED)?:(.+)", section_0_begin_regex="^BEGIN:
> .*/(.+)/ptest", section_0_end_regex="^END: .*/(.+)/ptest") parser.init()
>          result = Result()

I thought the way ptest was supposed to work was that ptest output would be
modified to match Automake format rather than us accepting different values:

http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#testing-packages-with-ptest

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

