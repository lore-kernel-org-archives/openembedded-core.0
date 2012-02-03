Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtPv5-00082O-GQ
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 21:39:43 +0100
Received: by pbbb4 with SMTP id b4so2851993pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 12:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JYcSaiOGcxafwgKPHmMTturCdbVyn7lNqQrn/Y33XGo=;
	b=ZsKY4VO7+pcfV+Z/RK/4HnR/Xf3QOuLXJ0w6LeIofvfMjBVxCCetor9DpxMDdERZtq
	eHoi8HwV4aouIzHXbqrQmzxLlO+D/sHG0E9c67Vc8DOd30IAwlgQnMCaWa4qao14y93e
	A0RXck0F2OcknOjYgNdAIfXiLis6aNSx4FV8Q=
Received: by 10.68.228.6 with SMTP id se6mr17251908pbc.80.1328301104686;
	Fri, 03 Feb 2012 12:31:44 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id a5sm15360029pbh.15.2012.02.03.12.31.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 12:31:43 -0800 (PST)
Date: Fri, 3 Feb 2012 12:31:30 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Wade Farnsworth <wade_farnsworth@mentor.com>
Message-ID: <20120203203130.GA20937@sakrah.homelinux.org>
References: <4F1F26C6.8050501@mentor.com> <4F21A9CF.3020103@mentor.com>
	<4F2C3541.5000409@mentor.com> <4F2C3571.7030509@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4F2C3571.7030509@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/3] systemtap: bump SRCREV to grab version 1.7
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
X-List-Received-Date: Fri, 03 Feb 2012 20:39:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/02/12 12:28), Wade Farnsworth wrote:
> Bump SRCREV to the latest stable version of systemtap.
> 
> Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
> ---
>  meta/recipes-kernel/systemtap/systemtap_git.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
> index ebacc43..e3e21d8 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
>  DEPENDS = "elfutils sqlite3"
>  
> -SRCREV = "820f2d22fc47fad6e09ba886efb9b91e1247cb39"
> -PR = "r2"
> -PV = "1.6+git${SRCPV}"
> +SRCREV = "83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81"
> +PR = "r3"

since PV was being upped PR could have been reset to 0

> +PV = "1.7+git${SRCPV}"
>  
>  SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
>  
> -- 
> 1.7.0.4
> 

-- 
-Khem


