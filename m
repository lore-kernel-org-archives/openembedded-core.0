Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D139465C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 15:58:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 13 Oct 2015 08:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,678,1437462000"; d="scan'208";a="791656624"
Received: from besquive-mobl2.amr.corp.intel.com ([10.252.206.244])
	by orsmga001.jf.intel.com with ESMTP; 13 Oct 2015 08:58:19 -0700
Message-ID: <1444751898.2440.2.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
In-Reply-To: <1444429304-22379-1-git-send-email-anibal.limon@linux.intel.com>
References: <1444429304-22379-1-git-send-email-anibal.limon@linux.intel.com>
Organization: Intel Corporation
Date: Tue, 13 Oct 2015 10:58:18 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Subject: Re: [PATCH] bash: Disable custom memory allocator
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Oct 2015 15:58:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hey Anibal, a line or 2 in mentioning the issue at the git commit
message would be required. You're only mentioning that there is an
issue and it would be informational to say what it is, even though the
bug number is at the end.

On Fri, 2015-10-09 at 17:21 -0500, Aníbal Limón wrote:
> Bash is failing trying to allocate memory [1] using the custom
> memory allocator if we disable it the issue is fixed.
> 
> The major distributions also disabled by default [2], so we
> don't have a good reason to use it.
> 
> [YOCTO #8452]
> 
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8452#c0
> [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8452#c5
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>  meta/recipes-extended/bash/bash.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes
> -extended/bash/bash.inc
> index c06f157..020409f 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -7,7 +7,7 @@ DEPENDS = "ncurses bison-native"
>  inherit autotools gettext texinfo update-alternatives ptest
>  
>  EXTRA_AUTORECONF += "--exclude=autoheader"
> -EXTRA_OECONF = "--enable-job-control"
> +EXTRA_OECONF = "--enable-job-control --without-bash-malloc"
>  
>  # If NON_INTERACTIVE_LOGIN_SHELLS is defined, all login shells read
> the
>  # startup files, even if they are not interactive.

