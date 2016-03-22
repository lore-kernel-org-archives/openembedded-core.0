Return-Path: <saul.wold@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 18AB06FF6B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 01:50:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 21 Mar 2016 18:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,374,1455004800"; d="scan'208";a="938801238"
Received: from cmdeoliv-mobl4.amr.corp.intel.com ([10.254.120.177])
	by orsmga002.jf.intel.com with ESMTP; 21 Mar 2016 18:50:57 -0700
Message-ID: <1458611456.5327.25.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
Date: Mon, 21 Mar 2016 18:50:56 -0700
In-Reply-To: <1458336286-21607-1-git-send-email-sgw@linux.intel.com>
References: <1458336286-21607-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH v2] parselogs: add new whitelist entries to address 4.4.3 issues
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
X-List-Received-Date: Tue, 22 Mar 2016 01:50:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Did this v2 get missed?  I see the first patch got merged.

Sau!

On Fri, 2016-03-18 at 14:24 -0700, Saul Wold wrote:
> Adds intel-corei7-64 with x86-common, this makes the x86-common
> whitelist available for intel-corei7-64 bsp also.
> 
> [YOCTO #9179]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/lib/oeqa/runtime/parselogs.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/lib/oeqa/runtime/parselogs.py
> b/meta/lib/oeqa/runtime/parselogs.py
> index 431c436..4def533 100644
> --- a/meta/lib/oeqa/runtime/parselogs.py
> +++ b/meta/lib/oeqa/runtime/parselogs.py
> @@ -54,6 +54,7 @@ x86_common = [
>      'wrong ELF class',
>      'Could not enable PowerButton event',
>      'probe of LNXPWRBN:00 failed with error -22',
> +    'pmd_set_huge: Cannot satisfy',
>  ] + common_errors
>  
>  qemux86_common = [
> @@ -110,6 +111,7 @@ ignore_errors = {
>          '(EE) open /dev/fb0: No such file or directory',
>          '(EE) AIGLX: reverting to software rendering',
>          ] + x86_common,
> +    'intel-corei7-64' : x86_common,
>      'crownbay' : x86_common,
>      'genericx86' : x86_common,
>      'genericx86-64' : x86_common,
> -- 
> 2.5.0
> 

