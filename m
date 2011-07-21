Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QjxiR-00048q-PT
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 20:11:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Jul 2011 11:07:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,242,1309762800"; d="scan'208";a="28640587"
Received: from doubt.jf.intel.com (HELO [10.7.199.53]) ([10.7.199.53])
	by orsmga002.jf.intel.com with ESMTP; 21 Jul 2011 11:07:11 -0700
Message-ID: <4E286AEA.6060208@linux.intel.com>
Date: Thu, 21 Jul 2011 11:07:38 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1311267679.git.bruce.ashfield@windriver.com>
	<129417014aaa71318ddb7c94a8fa88e7cdc8e165.1311267679.git.bruce.ashfield@windriver.com>
In-Reply-To: <129417014aaa71318ddb7c94a8fa88e7cdc8e165.1311267679.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 4/4] kern-tools: update SRCREV
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2011 18:11:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/21/2011 10:16 AM, Bruce Ashfield wrote:
> Fixes [YOCTO #1261]
> 
> Updating the SRCREV to pickup some branch creation fixes that
> were causing an invalid branch name to be used on a repository
> that couldn't support it (i.e. standard/base on a 2.6.34).
> 
> With this the 2.6.34 and 3.0 -rt branches will build.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  .../kern-tools/kern-tools-native_git.bb            |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index f7600ca..1fbb1f7 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
>  
>  DEPENDS = "git-native guilt-native"
>  
> -SRCREV = "f8eb067b023d590b6cd8deddf6f96d6a820997af"
> +SRCREV = "f5a915c277a37ba5949b4c0778356189e7dd9ec0"
>  PR = r10
>  PV = "0.1+git${SRCPV}"
>  

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


