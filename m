Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8A9C5DF85
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 14:00:22 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7775.1787234415878368415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 07:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bDXn8g/Z;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A3B254E412FC;
	Thu, 20 Aug 2026 14:00:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72CF5602B8;
	Thu, 20 Aug 2026 14:00:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5842511C76375;
	Thu, 20 Aug 2026 16:00:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787234412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z/hisUISBRTlkl21mn94sJDNnyszDn0abLNqLod+7I4=;
	b=bDXn8g/ZQIcqtaithB0oAT348yrTq2EOXHqfa3hpzQmORMJvdkSoOFnQhx2/+NBh7sd5JA
	Xf3uY9TMHfLHhr6+6YDYOwCB3tfEFtxRU9sI3cP7iaxp2ewklXqnul6w/U05bgPwJLfAyZ
	3KmQUgfcxI+ekwNq1gvmPVGRU0wk2V2/PQ84PsyNNIUJ+FRGC337G/6jZ5CMdCDjISCaj+
	nSjX6cZD7aCkgxIezDhS97bcOExece7wmrzqBy0EcI1ZvshTIFMFlU85UCVuY+HNA/xbrX
	pl6Rs68/KwAnIf2NU1E8PztRPPf7IFtDxeO6MYfP9drf/UoQja3z84iBVqbDkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Aug 2026 16:00:10 +0200
Message-Id: <DKTTQ1JHXUT1.YLV6D4K6U9DW@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v1] lua: upgrade 5.5.0 -> 5.5.1
Cc: <pratik.farkase@ericsson.com>
References: <20260820134950.32831-1-pratik.farkase@est.tech>
In-Reply-To: <20260820134950.32831-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 14:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243862

Hi,

On Thu Aug 20, 2026 at 3:49 PM CEST, Pratik Farkase wrote:
> Release: http://www.lua.org/ftp/
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
>  meta/recipes-devtools/lua/{lua_5.5.0.bb =3D> lua_5.5.1.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/lua/{lua_5.5.0.bb =3D> lua_5.5.1.bb} (91%)
>
> diff --git a/meta/recipes-devtools/lua/lua_5.5.0.bb b/meta/recipes-devtoo=
ls/lua/lua_5.5.1.bb
> similarity index 91%
> rename from meta/recipes-devtools/lua/lua_5.5.0.bb
> rename to meta/recipes-devtools/lua/lua_5.5.1.bb
> index 905dd01001..acf62fc855 100644
> --- a/meta/recipes-devtools/lua/lua_5.5.0.bb
> +++ b/meta/recipes-devtools/lua/lua_5.5.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Lua is a powerful light-weight programming language designe=
d \
>  for extending applications."
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://doc/readme.html;beginline=3D299;endline=3D3=
20;md5=3D0e573c143cb6491b41cf02cfbcb8c267"
> +LIC_FILES_CHKSUM =3D "file://doc/readme.html;beginline=3D299;endline=3D3=
20;md5=3Dc3c162d21db328baa0fc31baece7c9d5"

I think you need to set the License-Update: tag in your commit message
(https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#li=
cense-updates)

Antonin

