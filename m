Return-Path: <akuster808@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 44FE16073D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 14:36:20 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id x1so4216017iop.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 06:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=DK0G7XGR7KDTg/kWXY89hN1ztVcLE9xLelrc+pSdEnk=;
	b=UzZnI9lcWKobnrrdZDl3O4/SfH48rXLjyNJddPmUgwe2HKaXa+7eScPCEVez9XTHBz
	pHT/BRhYx/6RAdUI1Z6aotRCXQV7N4vxIryjhoyo91jgF4BCwEGBv21E++WLHhq9qqnS
	YACk6PDmghyMAvIIshqtC9xzcR+egqjejQmAMnt/UcFLghXTZFV3HtOJqbJhsr/zwlQq
	6MJ4a+hK0866EdLjAdUCntVgtl/thNDHj1BQIstla2ixQ5KWugL+rwd6WK6sFeWbu5kg
	wQLJJNRY40EqadmJJefh84ZDzyDBYD3TwmBZbzu/LlnTM7YrhN0wu50olCA9+0Cxypht
	3f/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=DK0G7XGR7KDTg/kWXY89hN1ztVcLE9xLelrc+pSdEnk=;
	b=DFJ9UwUhixeKVd7n37igmzFaOjdct9RFUzma63GpIyvro8gmJO/F2FW3G15KoKvJ4s
	UiGNrPgeuUHJ5sgpZXRSmMZ1MVbt7g3ooWerED4xiaraSkRT6mctiIIy2gSpyb/bhHLk
	yxElMeFlo5esanfr2CB2rBL387sH4semvIVO7c9c/hrxW+Dj/PINXyAk3XgkZQl4kfDK
	/uAeY4rt0JcIEClZOgxF277f7nFUbXdsR5u/x7Ll3wCPwpFmHoWCDE7nRtnlOtHGb2tT
	ggZyoG7EoTDrKiyp+QpBTiHqwjomp8aGI7Qdi+NLFhHksb+i+z8u1fF2HOR306oErw5b
	c6/w==
X-Gm-Message-State: APjAAAUUnsov15U6glJnb7xLdIYjT8DWchMu8uo8UL/HlEL1fw9ns19k
	hc0nKPX8QmmcKmUOkq0QL3Xjni9r
X-Google-Smtp-Source: APXvYqws3AfhvrtmE2pM9KpjETgcuov5yqd+ZTgYVmn+Wm8DpkM17J7+6JcrUtB+xLfhJYISZ29xPg==
X-Received: by 2002:a63:450:: with SMTP id 77mr31393003pge.290.1580314551466; 
	Wed, 29 Jan 2020 08:15:51 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:9c41:27a8:c371:1cdd?
	([2601:202:4180:a5c0:9c41:27a8:c371:1cdd])
	by smtp.gmail.com with ESMTPSA id
	17sm3163176pfv.142.2020.01.29.08.15.50
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 29 Jan 2020 08:15:50 -0800 (PST)
To: Sumit Garg <sumit.garg@linaro.org>,
	openembedded-core@lists.openembedded.org
References: <1579595173-23336-1-git-send-email-sumit.garg@linaro.org>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <2736c79c-ff8e-3d90-52cd-b264bba74d09@gmail.com>
Date: Wed, 29 Jan 2020 08:15:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579595173-23336-1-git-send-email-sumit.garg@linaro.org>
Subject: Re: [zeus][PATCH] core: recipes: fix some native tools dependencies
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/21/20 12:26 AM, Sumit Garg wrote:
> Some native tools dependency issues were seen while building with
> external GCC tool-set rather than source GCC tool-set. While building
> with source tool-set these dependencies were implicitly met which is not
> the case with external tool-set. So explicitly state these native tools
> dependencies.
Do these changes need to be in master?

- armin
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  meta/recipes-extended/man-db/man-db_2.8.7.bb       | 2 +-
>  meta/recipes-extended/psmisc/psmisc.inc            | 2 +-
>  meta/recipes-graphics/xorg-app/xorg-app-common.inc | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/man-db/man-db_2.8.7.bb b/meta/recipes-extended/man-db/man-db_2.8.7.bb
> index 083b237..0d73b03 100644
> --- a/meta/recipes-extended/man-db/man-db_2.8.7.bb
> +++ b/meta/recipes-extended/man-db/man-db_2.8.7.bb
> @@ -10,7 +10,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
>  SRC_URI[md5sum] = "ec0b23c8314a1654c4d059b2c18ce43d"
>  SRC_URI[sha256sum] = "b9cd5bb996305d08bfe9e1114edc30b4c97be807093b88af8033ed1cf9beb326"
>  
> -DEPENDS = "libpipeline gdbm groff-native base-passwd"
> +DEPENDS = "libpipeline gdbm groff-native base-passwd flex-native"
>  RDEPENDS_${PN} += "base-passwd"
>  
>  # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
> diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
> index 594a10c..6de5acb 100644
> --- a/meta/recipes-extended/psmisc/psmisc.inc
> +++ b/meta/recipes-extended/psmisc/psmisc.inc
> @@ -7,7 +7,7 @@ command sends a specified signal (SIGTERM if nothing is specified) to \
>  processes identified by name.  The fuser command identifies the PIDs \
>  of processes that are using specified files or filesystems."
>  SECTION = "base"
> -DEPENDS = "ncurses virtual/libintl gettext-native"
> +DEPENDS = "ncurses virtual/libintl gettext-native xz-native"
>  LICENSE = "GPLv2"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
> diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> index 3529cb2..211e399 100644
> --- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> +++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> @@ -12,6 +12,6 @@ INC_PR = "r8"
>  
>  SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
>  
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig distro_features_check gettext
>  
>  FILES_${PN} += " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"


