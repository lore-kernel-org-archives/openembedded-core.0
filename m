Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F17C4167E
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:38 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.12427.1649778685916689810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 08:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=C74F+c1g;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649778686;
  x=1681314686;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=q825dj46bLDLHSnRfVWPctHN6LYvwZTZS/jQjzMribU=;
  b=C74F+c1gKrVfNLRLUUWSq3vefA2wC3a8hwHHxfbhNfwkJgx2ikKhoMdb
   ThrntoqQ/MojhOb/1uX9YghZ6dmzZFLM7Sdjy18qeMTIgg1BO7Rl+wiqL
   J5vqJLkvLoZ8QyYAdjKBBYdKCfeIuDzDrMVWRcNim7dxvz3oFlSBUUIgi
   Z+NrhsgqSat8G5xu9kXU74W6N0DYWJF4WNt2iSKV9BSVIKLifqUJvQnHE
   b0z/Txhuhq/5EIYP9epzQxixviXS51vDRzqUu9r2DT7zo9z2VYVHwTnwx
   KxQ+YYGoYM/WN+JQMYrmotOQHLeZDNmGj+Cs9vDc8AAbPJkCMLDUWn7Mi
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Konrad Weihmann <kweihmann@outlook.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 4/4] libcap: add pam_cap license
Thread-Topic: [OE-core] [PATCH 4/4] libcap: add pam_cap license
Thread-Index: AQHYTjyIDo07FulWpka66IoWi7Uge6zsa9/w
Date: Tue, 12 Apr 2022 15:51:23 +0000
Message-ID: <cff19ae9e0184849a228b9115a330ec2@axis.com>
References: <20220412070956.1117150-1-kweihmann@outlook.com>
 <HE1PR0902MB180188D93D61C68AC2F96236A8ED9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
In-Reply-To: 
 <HE1PR0902MB180188D93D61C68AC2F96236A8ED9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164277

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Konrad Weihmann
> Sent: den 12 april 2022 09:10
> To: openembedded-core@lists.openembedded.org
> Cc: Konrad Weihmann <kweihmann@outlook.com>
> Subject: [OE-core] [PATCH 4/4] libcap: add pam_cap license
>=20
> If libcap is compiled with pam in PACKAGECONFIG
> additional one additional license text becomes effective,
> add that as a conditional
>=20
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/recipes-support/libcap/libcap_2.63.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/libcap/libcap_2.63.bb b/meta/recipes-su=
pport/libcap/libcap_2.63.bb
> index f3133f9ded..aed1f0a510 100644
> --- a/meta/recipes-support/libcap/libcap_2.63.bb
> +++ b/meta/recipes-support/libcap/libcap_2.63.bb
> @@ -5,7 +5,11 @@ users, without giving them full root permissions."
>  HOMEPAGE =3D "http://sites.google.com/site/fullycapable/"
>  # no specific GPL version required
>  LICENSE =3D "BSD-3-Clause | GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://License;md5=3De2370ba375efe9e1a095c26d37e48=
3b8"
> +LIC_FILES_CHKSUM_PAM =3D "file://pam_cap/License;md5=3D0ad4c9c052b9719ee=
4fce1bfc7c7dee4"
> +LIC_FILES_CHKSUM =3D "\
> +	file://License;md5=3De2370ba375efe9e1a095c26d37e483b8 \
> +	${@oe.utils.ifelse('pam' in (d.getVar('PACKAGECONFIG') or '').split(), =
'${LIC_FILES_CHKSUM_PAM}', '')} \

This can be simplified to:

	${@bb.utils.contains('PACKAGECONFIG', 'pam', '${LIC_FILES_CHKSUM_PAM}', ''=
, d)} \

> +"

And use four spaces, not tabs, to indent bitbake variables.

>=20
>  DEPENDS =3D "hostperl-runtime-native gperf-native"
>=20
> --
> 2.25.1

//Peter


