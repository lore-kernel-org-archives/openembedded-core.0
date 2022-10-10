Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0CDC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 12:22:35 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.5610.1665404548199724365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 05:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=QLa8IMOV;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1665404548;
  x=1696940548;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=D50AP6bqlEuR6XBHbkWjIzR4VOl44sIAijjaVzZBuWM=;
  b=QLa8IMOVA0VVKtTMvkI68taBwA4RANj3kPv5GJITt34r2YJElt9esTfk
   7Bq+YNvAE2266hOow/ls4a5XKWMg6BSUFXgBp1BAhzuIclw6Eyu6L95Pc
   DgY3+WVs4M/InHagVQT1ETpkbUz7uLORQksFnOB/vc85hQ6TvtI4ge8N7
   +d1mIblV9Iit0wDyTEVNzKg5ypa4W7Qy62wTRbBs6CE5qxcaOvQZQbFyC
   8WzfsKgYBuQrWRIk5NlQMucbfhRkvRWJ4GYnjHQ1XnFvWO2PWMRDg10rr
   HMebpF9bJMhgCmDH7+8xcAm6MlqtLL8rAaPKBgrV7JgFBycZNJpLTE7t+
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: wangmy <wangmy@fujitsu.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] systemd-boot: upgrade 251.4 -> 251.5
Thread-Topic: [OE-core] [PATCH] systemd-boot: upgrade 251.4 -> 251.5
Thread-Index: AQHY3IW4DDHl6MpY7UiTOpWOxXMEv64HjCFQ
Date: Mon, 10 Oct 2022 12:22:23 +0000
Message-ID: <b378694c8bed4f55b2af56eb7517cc41@axis.com>
References: <1665391949-8225-1-git-send-email-wangmy@fujitsu.com>
 <1665391949-8225-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1665391949-8225-2-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 12:22:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171575

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of wangmy
> Sent: den 10 oktober 2022 10:52
> To: openembedded-core@lists.openembedded.org
> Cc: Wang Mingyu <wangmy@fujitsu.com>
> Subject: [OE-core] [PATCH] systemd-boot: upgrade 251.4 -> 251.5
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../systemd/{systemd-boot_251.4.bb =3D> systemd-boot_251.5.bb}    | 0
>  meta/recipes-core/systemd/systemd.inc                           | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/systemd/{systemd-boot_251.4.bb =3D> systemd-boo=
t_251.5.bb} (100%)
>=20
> diff --git a/meta/recipes-core/systemd/systemd-boot_251.4.bb b/meta/recip=
es-core/systemd/systemd-boot_251.5.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot_251.4.bb
> rename to meta/recipes-core/systemd/systemd-boot_251.5.bb
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
> index 71eb93f23a..09353e14c7 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -14,7 +14,7 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaab=
aa882bbe \
>                      file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107900=
8b364516c"
>=20
> -SRCREV =3D "2a674b4b66af1a050a0362b646d2fca90c90112e"
> +SRCREV =3D "654ae8c1e4b6ba367ba09936462fe2eb1ad8ea2e"
>  SRCBRANCH =3D "v251-stable"
>  SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH} \
>  "
> --
> 2.25.1

You cannot update systemd-boot without also updating systemd as they=20
share the systemd.inc file.

//Peter


