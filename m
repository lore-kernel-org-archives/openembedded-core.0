Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F9CC2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 21:11:54 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.13288.1700514708749399649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 13:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=M+/GFFA/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14B6A24000D;
	Mon, 20 Nov 2023 21:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700514706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jm6+BVINnGeiNS0RBf0KKvKDPcO5F+o1mssmlkay2X4=;
	b=M+/GFFA/feIvrdzWPAGm8iQFBk0gFxybk+9g0aKkDkzmdofl+/eXR9LZ+YkOa3zwv7b7dP
	Fatx8YlODi9kQMx2jOrCGYI6Y9TVXJGwyNpUkQ6EoGMWQX3crWBXaGshUgKYl2qUTW7aNW
	ckYmtTYa4F2Xcgz2CiyhtxTfK1ZtRZKZ3rDc4MrWUzrAZFb1ZDMQRViD9nSmjgeX4hBvLw
	KfAgJ7Jp2/9Sge7NUPJN7nTOqhXlEA8fugaOLHUvypORyz2Xym+IraUNca7YNSS/susErg
	t1gA1+XYvogctoORs2foTgBrd83qWUp+69/1kuGYDszqKm1Os0lnfKEf050cMg==
Date: Mon, 20 Nov 2023 22:11:45 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 4/4] python3-cython: upgrade 0.29.36 -> 3.0.5
Message-ID: <2023112021114550af6fde@mail.local>
References: <20231117194905.2080320-1-tgamblin@baylibre.com>
 <20231117194905.2080320-4-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117194905.2080320-4-tgamblin@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 21:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190930

Hello Trevor,

Do you mind rebasing, this cnflicts with changes that are now on master?

On 17/11/2023 14:49:05-0500, Trevor Gamblin wrote:
> License-Update: Update license link to use https
> 
> cython 3.0.x attempts to remain compatible with 0.29.x but still makes
> some major changes (in addition to fixing old issues). For a complete
> overview it's best to view the CHANGES.rst doc rather than including
> them here: https://github.com/cython/cython/blob/master/CHANGES.rst.
> 
> Note that more source files were added to cython_fix_sources to avoid
> the following:
> 
> |WARNING: python3-cython-3.0.5-r0 do_package_qa: QA Issue: File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Utils.c in package python3-cython-src contains reference to TMPDIR
> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/StringIOTree.c in package python3-cython-src contains reference to TMPDIR
> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Compiler/Parsing.c in package python3-cython-src contains reference to TMPDIR
> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Compiler/Code.c in package python3-cython-src contains reference to TMPDIR
> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Plex/Machines.c in package python3-cython-src contains reference to TMPDIR
> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Plex/DFA.c in package python3-cython-src contains reference to TMPDIR
> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Plex/Transitions.c in package python3-cython-src contains reference to TMPDIR [buildpaths]
> 
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  meta/recipes-devtools/python/python-cython.inc             | 4 ++--
>  .../{python3-cython_0.29.36.bb => python3-cython_3.0.5.bb} | 7 +++++++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb => python3-cython_3.0.5.bb} (73%)
> 
> diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
> index 6aec6b012f1..e757e3f7c87 100644
> --- a/meta/recipes-devtools/python/python-cython.inc
> +++ b/meta/recipes-devtools/python/python-cython.inc
> @@ -5,11 +5,11 @@ It's designed to bridge the gap between the nice, high-level, easy-to-use world
>  and the messy, low-level world of C."
>  SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
>  PYPI_PACKAGE = "Cython"
>  BBCLASSEXTEND = "native nativesdk"
>  
> -SRC_URI[sha256sum] = "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
> +SRC_URI[sha256sum] = "39318348db488a2f24e7c84e08bdc82f2624853c0fea8b475ea0b70b27176492"
>  UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
>  
>  inherit pypi
> diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-devtools/python/python3-cython_3.0.5.bb
> similarity index 73%
> rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
> rename to meta/recipes-devtools/python/python3-cython_3.0.5.bb
> index 78be2b94edb..94074aaf811 100644
> --- a/meta/recipes-devtools/python/python3-cython_0.29.36.bb
> +++ b/meta/recipes-devtools/python/python3-cython_3.0.5.bb
> @@ -24,10 +24,17 @@ cython_fix_sources () {
>  		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/FusedNode.c \
>  		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Scanning.c \
>  		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Visitor.c \
> +		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Parsing.c \
> +		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Code.c \
>  		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Actions.c \
>  		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Scanners.c \
> +		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Machines.c \
> +		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/DFA.c \
> +		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Transitions.c \
>  		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Runtime/refnanny.c \
>  		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Tempita/_tempita.c \
> +		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/StringIOTree.c \
> +		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Utils.c \
>  		${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do
>  		if [ -e $f ]; then
>  			sed -i -e 's#${WORKDIR}/Cython-${PV}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' $f
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190860): https://lists.openembedded.org/g/openembedded-core/message/190860
> Mute This Topic: https://lists.openembedded.org/mt/102654597/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

