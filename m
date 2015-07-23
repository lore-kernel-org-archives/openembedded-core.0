Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 60C64761B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 13:40:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 23 Jul 2015 06:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,530,1432623600"; d="scan'208";a="529008936"
Received: from jsanz-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.30.146])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Jul 2015 06:40:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Costin Constantin <costin.c.constantin@intel.com>
Date: Thu, 23 Jul 2015 14:40 +0100
Message-ID: <2222392.Tt1iFe0I6f@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.7-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1437658844-12604-1-git-send-email-costin.c.constantin@intel.com>
References: <1437658844-12604-1-git-send-email-costin.c.constantin@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] oeqa/buildoptions.py: automate test case 929: check for correct GPL licenses
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
X-List-Received-Date: Thu, 23 Jul 2015 13:40:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Costin,

On Thursday 23 July 2015 16:40:44 Costin Constantin wrote:
> Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
> ---
>  meta/lib/oeqa/selftest/buildoptions.py | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/buildoptions.py
> b/meta/lib/oeqa/selftest/buildoptions.py index e79be9e..ab009f2 100644
> --- a/meta/lib/oeqa/selftest/buildoptions.py
> +++ b/meta/lib/oeqa/selftest/buildoptions.py
> @@ -132,6 +132,36 @@ class BuildImagesTest(oeSelfTest):
>          res = bitbake("core-image-directfb", ignore_status=True)
>          self.assertEqual(res.status, 0, "\ncoreimagedirectfb failed to
> build. Please check logs for further details.\nbitbake output %s" %
> res.output)
>
> 
> +    @testcase(929)
> +    def test_gpl_licenses(self):
> +        """
> +        Test for checking that correct GPL licenses are used when
> explicitly required. 
> +        """
> +        self.add_command_to_tearDown('cleanup-workdir')

I really don't think we should be calling cleanup-workdir here. If we have 
specific things to bitbake -c clean, by all means do that - but cleanup-workdir 
goes through and deletes everything that's not current, which is excessive for 
this one test.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

