Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C33BFF8861
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 07:44:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38268.1777275878246469857
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 00:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xT2RiMC/;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8EA3F4E42ACF
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 07:44:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64B0B600D1;
	Mon, 27 Apr 2026 07:44:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F6AD107202F0;
	Mon, 27 Apr 2026 09:44:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777275875; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=091ynI43Czyb1dN1UPFg/Slm6YsS6gQKRFSpYfl66CI=;
	b=xT2RiMC/sgzt1/aRFZY9Nvw3r6xr8EHLfm1orT8admOSS8gTgL54CDgOpr/4l7Ua051YSz
	xIsB6m9An9EwsRFEVxHlwCkTg2Sv1oz8DDGbwLEsXbq9RcAbW42DERr86GXTgkwZQUkZBK
	0GqWFrZA3S+CVs73P7km1PMuhO51vUAZwAwaujnwcH6A2YtVudY1hzaFjLky0nZzH+silx
	2E9kJstacFIGEHc8/OP1mEoy1CA335yf4aHhEJxx0dT+peKF2sbnUIOTlntHViGTquD+Tm
	I5bnlgOJLpaOrty8oPxQx+++FEZAhVWuoAZxsElNlHAMS+a49i4+2j2WjTvjbw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Peter Marko <peter.marko@siemens.com>
Subject: Re: [PATCH 6/6] ffmpeg: set status for 5 CVEs
Date: Mon, 27 Apr 2026 09:44:34 +0200
Message-ID: <--nPwHMjR5aFgiGiHDM60Q@bootlin.com>
In-Reply-To: <20260426185025.13217-6-peter.marko@siemens.com>
References: 
 <20260426185025.13217-1-peter.marko@siemens.com>
 <20260426185025.13217-6-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 07:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235989

Hello Peter,

On Sunday, April 26, 2026 at 8:50=E2=80=AFPM, Peter Marko wrote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> These reappeared after update of sbom-cve-check tooling.
> Fixed version found by links from Debian security tracker.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_8.0.1.bb
> index 7bb7de3d25..9780abe184 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
> @@ -176,6 +176,11 @@ CVE_STATUS_GROUPS =3D "CVE_STATUS_WRONG_CPE"
>  CVE_STATUS_WRONG_CPE =3D "CVE-2023-51791 CVE-2023-51793 CVE-2023-51794 C=
VE-2023-51795 CVE-2023-51796 CVE-2023-51797 CVE-2023-51798 CVE-2025-22921"
>  CVE_STATUS_WRONG_CPE[status] =3D "fixed-version: these CVEs are fixed in=
 used version"
> =20
> +CVE_STATUS[CVE-2022-2566] =3D "fixed-version: these CVEs are fixed since=
 v5.1.1"
> +CVE_STATUS[CVE-2025-9951] =3D "fixed-version: these CVEs are fixed since=
 v8.0"
>  CVE_STATUS[CVE-2025-25468] =3D "fixed-version: these CVEs are fixed sinc=
e v8.0"
>  CVE_STATUS[CVE-2025-25469] =3D "fixed-version: these CVEs are fixed sinc=
e v8.0"
>  CVE_STATUS[CVE-2025-12343] =3D "fixed-version: this CVE are fixed since =
v8.0"
> +CVE_STATUS[CVE-2025-59729] =3D "fixed-version: this CVE are fixed since =
v8.0"
> +CVE_STATUS[CVE-2025-59730] =3D "fixed-version: this CVE are fixed since =
v8.0"

> +CVE_STATUS[CVE-2025-69693] =3D "fixed-version: this CVE are fixed since =
v8.1"

Why the CVE-2025-69693 is marked has fixed?

It is affecting the version 8.0.1 which is the current version of the recip=
e,
as reported by NVD:
https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=3DCVE-2025-69693

{ vulnerable: true, criteria: "cpe:2.3:a:ffmpeg:ffmpeg:8.0.1:*:*:*:*:*:*:*"=
,=20
  matchCriteriaId: "7F5CACA2-6FB6-4D6D-92D0-C9FF0E7CDB14" }

I did not investigate in which version this CVE was fixed.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




