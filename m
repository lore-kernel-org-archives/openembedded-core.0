Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BB2887E38D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 14:10:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45DXfq1rQnz3L;
	Wed, 29 May 2019 16:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559139027;
	bh=gb2K5MQZpbzewMmtmL7AcnKcUcntrIDtovsYoL7dvpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nn2Z0dxpbyO8zPwcSrUP27dX+6l0tDxZ2MDwA4TZ/GqZIepN2HyTsWQwKhsZvbWBl
	rS7VKn3p8TY9ERh47lQWOhlVzb7bmENPCXRGavQKgYYDCR2BUTMIvk4WIbrYGEz8VA
	o+BUC7JVKEaz2Lh9jeIov4l6dKfnxM1G88UsYi0S/C03lRzCwP92xqIQnfBDv5hJ38
	sAgoUk2xa5B3cee9mAMqZgZ+tt6wQo/5E5uw6M5JxNmA4MGSk2lEu3XZj9BSl3GnSb
	044svlA7FQeatNtKTbWXIo19VNfvurESOG4FNEXrTRa/Zr6uUqS+YjPK6CLcO4wpkh
	XoqwiZuOE8EGlunwSBxcbWMtP77xNUxZdh2/jpSPWHBk/cSjMmMRy9fEegpn4q4k5r
	bf8DFAQCTOG7g8xWHzuHlFN6yxw0sMSNmvACkWMX5a5wPODO2FUcp83NTw2jnQtTgS
	ARG8+q86R+NYNGWJUSAZOecsY+tSCkni1OyzuXXeXRh9HB/d7rW4CeBLdekEt2trDQ
	2Nbi8J7fULR1962z+vfED6eedxq9amoF2a5+yJYHWZ+JHRMR0XkIUsZu5nl/EaxJU5
	qC9AqEsf4RdgxN3+084anbDpCWAOVjbsg2l23E8hDd0r1Cwqkv0z+ZpZVBbYvUmD4b
	G1A+3UCFJHSsx5WQQC1R0rCU=
Date: Wed, 29 May 2019 17:10:25 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190529141025.GB28892@localhost>
References: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
	<1559137838-8972-4-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1559137838-8972-4-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH 3/9] gnutls: no need to inherit binconfig
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
X-List-Received-Date: Wed, 29 May 2019 14:10:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 29, 2019 at 06:50:32AM -0700, Armin Kuster wrote:
> From: Ross Burton <ross.burton@intel.com>
> 
> This recipe doesn't ship a *-config binary, so don't inherit binconfig.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-support/gnutls/gnutls_3.6.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/gnutls/gnutls_3.6.4.bb b/meta/recipes-support/gnutls/gnutls_3.6.4.bb
> index 6d2a11d..d79a39d 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.6.4.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.6.4.bb
> @@ -24,7 +24,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
>  SRC_URI[md5sum] = "63363d1c00601f4d11a5cadc8b5e0799"
>  SRC_URI[sha256sum] = "c663a792fbc84349c27c36059181f2ca86c9442e75ee8b0ad72f5f9b35deab3a"
>  
> -inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
> +inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
>...

This doesn't look appropriate for a stable branch.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


