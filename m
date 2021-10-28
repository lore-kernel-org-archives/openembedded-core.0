Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2655EC433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 15:44:07 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.14839.1635435845499042549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 08:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=MMfc/XAT;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635435845;
  x=1666971845;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lkmT4WjHJShy7CsaZwXMREBpF6PaojwOJruToKH63ME=;
  b=MMfc/XATdGS7ZzVET8k9TC56lCTQG6WoYot/6jzHedHuphJRY0HoqJw1
   I+KO4msorX8ycEoCn0uzNvgr/Pqc1mW38fzlDFZLvVbUQcsx++Q79s5yH
   OxciLrvZSdGTQNJtMpJYHTddpfaMA0mA8ACJzlXSzjaNXlbeOoqllVXfG
   BHBWk9iZh2P1GDb302H50HkVUKGxVBSkxz5SaigElfKXr1qRjBIf05mUi
   jDnpykTm6ekfL256sLeGebGQxCRynO7pT91XQbZLcLkyMqHJX7MSYlXIz
   NBDmj4g2aBj0/0gRrZeFbC6NiwueI1I/ZHTo1DzRt6iyMSKprb3s9/n81
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <ross@burtonini.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 11/14] libx11-compose-data: set precise BSD
 license
Thread-Topic: [OE-core] [PATCH 11/14] libx11-compose-data: set precise BSD
 license
Thread-Index: AQHXoBdRHylTpuQRkUCaM9wiRafn0Kvo5DXw
Date: Thu, 28 Oct 2021 15:44:02 +0000
Message-ID: <ad8c7af2003344a89c26c7b910fc30dc@axis.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
 <20210902162435.1375245-11-ross.burton@arm.com>
In-Reply-To: <20210902162435.1375245-11-ross.burton@arm.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 15:44:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157598

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Ross Burton
> Sent: den 2 september 2021 18:25
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 11/14] libx11-compose-data: set precise BSD
> license
>=20
> "BSD" is ambiguous, use the precise licenses BSD-2-Clause BSD-4-Clause.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> index 7519b4c018d..e53ccc6aea8 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> @@ -8,7 +8,7 @@ python () {
>=20
>  require xorg-lib-common.inc
>=20
> -LICENSE =3D "MIT & MIT-style & BSD"
> +LICENSE =3D "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"

Why is this marked as BSD-4-Clause? Looking at the COPYING file and=20
searching the code I can find no trace of any license text with the=20
advertising clause from BSD-4-Clause. What am I missing?

>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D172255dee66bb0151435b2d5d709f=
cf7"
>=20
>  SRC_URI[md5sum] =3D "c5fa5a86a20e3591bed6c046498d4b8f"
> --
> 2.25.1

//Peter


