Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UBKQN-00059K-IB
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 08:30:36 +0100
Received: by mail-pa0-f46.google.com with SMTP id kp14so1637903pab.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 23:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=wUy1Jw/y6VL5w4tCcS7KfssLVstWMhqU9KVL1wrLuLM=;
	b=i2QFZvusVXpQk/zIBRtgTeJm3jlpVL4i300MQ9xi1bbdPJOyb7JgtuNWBNYsXfDI0G
	rjZKsloazdzYvkquP8Nm4FZJKf+7nQl78h3ZUHO6zDM9Bckv6SIhSxz1G44dDfX9ReNc
	tS/26hH0izWSQXi+YpiQAWvtMbaaPrEq5gdPpl4/G+z5s0BWGyT7jNlcHCWy1feP01Fd
	MgcEk2zFlDvuJ8Td/T8u1lg/Rwfgv5WUczDzPr4fi2K0OJ/t9f3kwLm3/D4UlPyFVq/H
	twdIS646UpD4DpL1XMZJeoct5cwL/vxxmKirzkYRjYDXOMMv+dmfyML5vwGCo31gLYUN
	OG7Q==
X-Received: by 10.66.52.116 with SMTP id s20mr17563213pao.70.1362122051911;
	Thu, 28 Feb 2013 23:14:11 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id hu2sm11094642pbc.38.2013.02.28.23.14.10
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 23:14:11 -0800 (PST)
Date: Thu, 28 Feb 2013 23:14:01 -0800
From: Khem Raj <raj.khem@gmail.com>
To: jeffrey.honig@windriver.com
Message-ID: <20130301071400.GB2908@sakrah.homelinux.org>
Mail-Followup-To: jeffrey.honig@windriver.com,
	openembedded-core@lists.openembedded.org
References: <1362103971-2618-1-git-send-email-jeffrey.honig@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1362103971-2618-1-git-send-email-jeffrey.honig@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Help ncurses-native find terminfo on RHEL 6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 07:30:37 -0000
X-List-Received-Date: Fri, 01 Mar 2013 07:30:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (28/02/13 21:12), jeffrey.honig@windriver.com wrote:
> From: Jeffrey C Honig <jeffrey.honig@windriver.com>
> 
> [ CQID: WIND00405305 ]

same as the other patch

> 
> When using ncurses from sstate cache it is not able to find terminfo
> for screen on RHEL 6.  While RHEL 6 has /lib/terminfo, it is not
> complete, the complete terminfo database is in /usr/share/terminfo.  This
> results failure of programs linked to ncurses, such as menuconfig.
> 
> Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
> ---
>  meta/recipes-core/ncurses/ncurses.inc |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index 9250e9d..040495c 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
>  SECTION = "libs"
>  DEPENDS = "ncurses-native"
>  DEPENDS_class-native = ""
> -INC_PR = "r14"
> +INC_PR = "r15"
>  
>  inherit autotools binconfig multilib_header
>  
> @@ -51,8 +51,8 @@ EX_TERMCAP = ""
>  EX_TERMCAP_virtclass-native = ":/etc/termcap:/usr/share/misc/termcap"
>  EX_TERMCAP_virtclass-nativesdk = ":/etc/termcap:/usr/share/misc/termcap"
>  EX_TERMINFO = ""
> -EX_TERMINFO_virtclass-native = ":/etc/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
> -EX_TERMINFO_virtclass-nativesdk = ":/etc/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
> +EX_TERMINFO_virtclass-native = ":/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
> +EX_TERMINFO_virtclass-nativesdk = ":/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
>  
>  # Helper function for do_configure to allow multiple configurations
>  # $1 the directory to run configure in
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


