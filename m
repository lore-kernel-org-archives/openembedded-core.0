Return-Path: <contrib@zhengqiu.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F87C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 19:14:31 +0000 (UTC)
Received: from st43p00im-ztdg10063201.me.com (st43p00im-ztdg10063201.me.com [17.58.63.182])
 by mx.groups.io with SMTP id smtpd.web10.51722.1674501262218234023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 11:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhengqiu.net header.s=sig1 header.b=KCb2R2e1;
 spf=pass (domain: zhengqiu.net, ip: 17.58.63.182, mailfrom: contrib@zhengqiu.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhengqiu.net;
	s=sig1; t=1674501261;
	bh=tNdA7vUjri51yVSFYbWiw48RHKahRvfOzmXrALxgrRg=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=KCb2R2e1pqU6FACBZFMcHDc0fEBHKzlXImjUQXiO8deFnU7Nl/NgTuETprhiD7hF7
	 AeuMan+2NqrVg4e9z3HTAkB5Y1p2cifIvhAY9I23lMgpgLd92l9pmoryHIeQ5IBHL1
	 tF2g6NHCwwWfu1P+Yh/l7OhlESndgZFvHy56GNZLnKBhMMSXc97iy41PP5chHfAK4B
	 /kaw11HuI8ylvV3155TN+4dOmWfZdBmkuI0dG0vRlc0JeTFoztzdE7WXr11ZWc/yCW
	 C1om6+BbdKfZvAqtEYLCBUAvnjc0hI4Y7rk9iuEcHRLFYC6F+Ogo9Ny69Mo4Brrouw
	 L/o7s32FxFWcA==
Received: from smtpclient.apple (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
	by st43p00im-ztdg10063201.me.com (Postfix) with ESMTPSA id A9EA638061D;
	Mon, 23 Jan 2023 19:14:20 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [OE-core] [PATCH] vim: upgrade 9.0.0947 -> 9.0.1211
From: contrib@zhengqiu.net
In-Reply-To: <20230117164244.382243-1-Randy.MacLeod@windriver.com>
Date: Mon, 23 Jan 2023 14:14:08 -0500
Cc: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <84E7BFCE-8C99-4216-86BE-9801D87E5AAC@zhengqiu.net>
References: <20230117164244.382243-1-Randy.MacLeod@windriver.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Proofpoint-GUID: vmiygHHUH1QpXWt0Cut6DbyqeTeFdmwb
X-Proofpoint-ORIG-GUID: vmiygHHUH1QpXWt0Cut6DbyqeTeFdmwb
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-17=5F04:2020-02-14=5F02,2022-01-17=5F04,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 clxscore=1030 bulkscore=0 mlxlogscore=956
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2301230185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 19:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176316

In the recipe it includes following:
# Remove when 8.3 is out
UPSTREAM_VERSION_UNKNOWN =3D =E2=80=9C1=E2=80=9D

Should we attempt to remove it, given that this is now 9.0?

> On Jan 17, 2023, at 11:42 AM, Randy MacLeod =
<Randy.MacLeod@windriver.com> wrote:
>=20
> Includes fixes for:
>   https://nvd.nist.gov/vuln/detail/CVE-2023-0049
>   https://nvd.nist.gov/vuln/detail/CVE-2023-0051
>   https://nvd.nist.gov/vuln/detail/CVE-2023-0054
>   https://nvd.nist.gov/vuln/detail/CVE-2023-0288
>=20
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
> meta/recipes-support/vim/vim.inc | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/vim/vim.inc =
b/meta/recipes-support/vim/vim.inc
> index d86841efaa..9bc6881fce 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -20,8 +20,8 @@ SRC_URI =3D =
"git://github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps \
>            file://no-path-adjust.patch \
>            "
>=20
> -PV .=3D ".0947"
> -SRCREV =3D "cc762a48d42b579fb7bdec2c614636b830342dd5"
> +PV .=3D ".1211"
> +SRCREV =3D "f7d1c6e1884c76680980571f1cf15e0928d247b5"
>=20
> # Remove when 8.3 is out
> UPSTREAM_VERSION_UNKNOWN =3D "1"
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176054): =
https://lists.openembedded.org/g/openembedded-core/message/176054
> Mute This Topic: https://lists.openembedded.org/mt/96333742/7355053
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[contrib@zhengqiu.net]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


