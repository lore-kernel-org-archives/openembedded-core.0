Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1F37872C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 19:35:51 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id t5-v6so4770210ioa.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 12:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uwtqseZ97zOpa5wYwinatYoGeG5UeEQ+OHgJgSZH3y4=;
	b=u1VnkHfCBxBBpull3cjriPcKwKfsAJKCTKzeUFx61gXq3cvk3w+mpw98hMEgZAegmi
	+jcrYHLPNGeCQESuoObIOhadl1RGgosMUOlWPwTh8csYMEyaoVcZdtiPdHEQtC1NhrkF
	pfAOgJBdjsljtktIO5lXJGO023s1CE2O7XvS//dG+cUPkBG0POlhpdN3CNGRvNZqx3lu
	/qztJjjoQnwPCYEygbKJL2vutSlOX+0IgjnGs5FBuRBdmw80FKHhDKIshfTnLE6l0h70
	eTqdcUqokItoztKIu/AIg40TDeynvg4w8n+yy6StDR+ApUsPhcQKznQQQggMertUXclf
	KMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uwtqseZ97zOpa5wYwinatYoGeG5UeEQ+OHgJgSZH3y4=;
	b=InBykWdAGYLBQbS0aZdExXoVdLF3VToOsiK+Yvdw/Ap1ecG2G9cTzVZ4eRPqFBtGnH
	H+f2J6mkGCfQVNPEX6HegDY16SWWSKwlO1mimuzECaYlAhfvcVh1Tmu7hzRC6K5faPVg
	hzc0YJLAJz/3/b7buJhB7BK+TLpE1YKUPZYlIHZeB7+Ao4+jdZqeSii9OB7n6H0Csloz
	/qPZ+bZHeB4yE18Hr8rPpaAFvf5c6b6/9vh+3AysJeJsBeARw7dCzat/TpB++kWDYNoH
	4rlXFPvn6/tQUDG5QlBPC5gyJJhcg7oer718NEiVL5APx7larnlEm4U+Ts4Tn2nWM2Ut
	Ytxw==
X-Gm-Message-State: APt69E3nrs2chLfdzLW+HeEXyL44GZjQWClQD5ckPpEYWViF9NHXgipL
	cZdz+N6tkGLQr1JvCZbdEGUmSuW47rgvK2n9B0utkA==
X-Google-Smtp-Source: ADUXVKLPBFYUG8XAGmSV8zxaLpShjX5xlHO74SeEM4NIv2635mpvfmajq7XpQZh601yBp37efQaBiWTK4hx/J5VYKbE=
X-Received: by 2002:a6b:e603:: with SMTP id
	g3-v6mr10603503ioh.216.1528227352424; 
	Tue, 05 Jun 2018 12:35:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:f614:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 12:35:32 -0700 (PDT)
In-Reply-To: <20180604163905.17292-1-dev@sashko.rv.ua>
References: <20180604163905.17292-1-dev@sashko.rv.ua>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jun 2018 20:35:32 +0100
Message-ID: <CAJTo0Lb6RUUcs4Xv+OOo7N8pHyAW2Oeg60jNTeprxiNrA_5MwA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] minicom: fix SRC_URI
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
X-List-Received-Date: Tue, 05 Jun 2018 19:35:51 -0000
Content-Type: text/plain; charset="UTF-8"

The Debian mirror network can't be relied upon as files are removed
once they're not in any releases.  For this reason, we prefer
snapshot.debian.org for SRC_URI (with DEBIAN_MIRROR for the upstream
check).

Ross

On 4 June 2018 at 17:39, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
> The original source, alioth.debian.org has been permanently taken down
> by the Debian Project. Use Debian mirrors instead.
>
> Source: https://wiki.debian.org/Alioth
>
> Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
> ---
>  meta/recipes-extended/minicom/minicom_2.7.1.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
> index e6afe2b655..d963da7436 100644
> --- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
> +++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "Text-based modem control and terminal emulation program"
> -HOMEPAGE = "http://alioth.debian.org/projects/minicom/"
> +HOMEPAGE = "https://salsa.debian.org/minicom-team/minicom/"
>  DESCRIPTION = "Minicom is a text-based modem control and terminal emulation program for Unix-like operating systems"
>  SECTION = "console/network"
>  DEPENDS = "ncurses virtual/libiconv"
> @@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
>                      file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
>
> -SRC_URI = "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz \
> +SRC_URI = "${DEBIAN_MIRROR}/main/m/minicom/minicom_${PV}.orig.tar.gz \
>             file://allow.to.disable.lockdev.patch \
>             file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
>             file://0001-Fix-build-issus-surfaced-due-to-musl.patch \
> @@ -16,7 +16,7 @@ SRC_URI = "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz
>  SRC_URI[md5sum] = "9021cb8c5445f6e6e74b2acc39962d62"
>  SRC_URI[sha256sum] = "532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1"
>
> -UPSTREAM_CHECK_URI = "https://alioth.debian.org/frs/?group_id=30018"
> +UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/m/minicom/"
>
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

