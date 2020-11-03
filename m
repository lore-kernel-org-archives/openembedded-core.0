Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.49])
 by mx.groups.io with SMTP id smtpd.web09.1699.1604394489998965033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 01:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@skidata.onmicrosoft.com header.s=selector2-skidata-onmicrosoft-com header.b=Yx7Rqlfu;
 spf=pass (domain: skidata.com, ip: 40.107.22.49, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRaCv/+vcQv1MlfnkEke/UoBub64Hmph94KJKj+K2701puYerNi38u7FVeA0FgHStxuXihf/SIY4YZY44towwVXnf1RnKR7dLcf0lUjbZfAqwcnUf95UMD2KRkkdMY+4UrAK7GKFXSSHForFFPC25JbzvV8O1JMWg3o8LY/ht2jrxcws9HJmZvMjLd/7IqNVwD/9vZoBI6STUfi4f9HnfOj2a9v0HmtP2T5wsN/LTSn1HdaBSoAXbhdT6Q9rx1yOwPhCJmQvdmLJAR3eSsQsrr91grgxtVvf6cKXh5GthhKDHRXrnGXVcTIxC/fNkkrd1g7d592wEU/WB607zg9q1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCeDZjbo/PVfknoBzwxjPYYojdeTY+9lYfhhsYexOlU=;
 b=WI1ZfZcPB7dCsJ0eXKYbp+lGZ0cM2NNjGsNLBaQ2BSZVYSpOSdCwzimz1fqE7cbLM3PYOTPJWkGnrC65hxBnEQW4BrOU/sC6CkAwC6SlVrXO1yNd+fuiSxcHg0cSb+QsG8xc/cwVhQYiTKOR9hb2aSIqK4sy6maD60p3/LJh45xcCg6ADkF2PrhpXH8/nJY7b9VB3hiem/v4sHEW6voZIynTY3MSge2Ih/EZ6E1ROdMFm1owP+dhw1Ye182z9jnnw+4XzM0/PVgiyYhRA4rDz36RPsW0XPldOr42w2b7/wpo8J5xF5fqSBZxaz3tsy8dsF9kK4CQNhCOHyq6gYL3hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skidata.onmicrosoft.com; s=selector2-skidata-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCeDZjbo/PVfknoBzwxjPYYojdeTY+9lYfhhsYexOlU=;
 b=Yx7RqlfuB8pEhZPgwysG1Ir4Uh3cF0+K2u8g5ILLPdtYkg5fF4RZFqEhawmT84c94zyQEPOA5tcYR/5l7aTJQXfpPs73kut09fpmghnAdvZZpFKpjCNO4KHF3EgNpvitLlRQgxZKAJESQQH6R9a6UHDeWQrIlhZweC0stlupeKw=
Authentication-Results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=skidata.com;
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19) by VI1PR01MB6989.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:198::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 09:08:07 +0000
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::a162:c96a:232:50ec]) by VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::a162:c96a:232:50ec%3]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 09:08:07 +0000
Date: Tue, 3 Nov 2020 10:07:59 +0100
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Steve Sakoman <steve@sakoman.com>
CC: openembedded-core@lists.openembedded.org
Subject: Re: [dunfell][PATCH] xcb-proto: backport fix for python gcd function
Message-ID: <20201103090536.GA6121@brokenbit>
References: <20201030134551.44013-1-dev@bubus.at>
In-Reply-To: <20201030134551.44013-1-dev@bubus.at>
X-Originating-IP: [83.215.125.121]
X-ClientProxiedBy: AM0PR04CA0122.eurprd04.prod.outlook.com
 (2603:10a6:208:55::27) To VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19)
Return-Path: richard.leitner@skidata.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brokenbit (83.215.125.121) by AM0PR04CA0122.eurprd04.prod.outlook.com (2603:10a6:208:55::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 09:08:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 610a818f-3ad6-43e9-8596-08d87fd7fa67
X-MS-TrafficTypeDiagnostic: VI1PR01MB6989:
X-Microsoft-Antispam-PRVS: 
	<VI1PR01MB6989A53271F01E45DBAD0254F0110@VI1PR01MB6989.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9k+6nhtoh5VCcg9Nkky1hbSH/gj5r8sNzS7LqaiTHoeugJzZjQGBbhsmPHlp5Hij60S64+uSRmSKNcVQKiUMR+jcJALp/HpfTV9SAfRivY4HzPaiSx/oqcjlAQg2kdGJ5XNVLU3/EcdMbClhElIBra49OaS2GA2b3hy15tYmUmZOkPbpj0A5Y7uQnG3Eat+oPfilpw5o+09w2bl58RMvM621XT2/AIzlKH3oHnTDnn7DLTEZKzdttKnuXCV8QyS5BWH/KYPMy5cPmZPlOd1XoUybvfPRHr0Youkk8/ex8Q9l+9p91jkmBYbNH6sxEEUJmDjRvgHA5bjaBtHNl7iZ7JwKbZ6Mr0KM3+etfpWmHksCpv7r4tWbSK9niDrvh1+jFYkSwOzWnR/+nF8aLe3CtA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR01MB5007.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(39850400004)(136003)(396003)(346002)(376002)(366004)(16526019)(6666004)(26005)(5660300002)(6916009)(4001150100001)(186003)(2906002)(52116002)(8676002)(9576002)(1076003)(44832011)(8936002)(86362001)(6496006)(9686003)(4326008)(33716001)(66574015)(316002)(66556008)(66946007)(478600001)(956004)(33656002)(966005)(55016002)(66476007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LWGp8yMN3KkhM2WKOwf4h1ccpamRnLPL8h7Zp3+kdKF3XIZwhjNF9MmXXYztTWroyXoEN0Jv29jcMQE8rm8zEWew2W+jdOM/cFls6wEvj8sPF/4xIlvPX+7eyyYqwP1NH2o+W43PmWKYH7NsC8g4EvK9Naa5e1jKddXeP4J+4OL/IUsngt8JK92Uc4mZzs4jzpYlq1MY4AZAaDrj2eWFYby9VBXqU/HJEhGVzYr7D8yqp3UW4lah5kfBAoxfue8Q3s+ILe3pmwNHlRcrIO/9FSxk0kkEdSoQZZDUUqnYjK51HE1e/BTlBFxULwF92ZQUsg2B4EF9zmLFtSgPtW95sLiLw7wGcuOjcxEkFodKZua0sfsPg0aotsnUddr32hcwoLepYIWW+oNmAA7K6/zIqpjng0itz+uzXgCUA7W2f5+k8gZRHbUfLRlGawiDVFkEvOhT41B3ddYyCQr4qgOT/QwZ6QSI7O+PiS+BzRrAgPFHNx0qmbCMBluJQWcvG/h0nF2xM1XfLFgjI5tP8mS008qxn9tGIS07qpuXJowOuByqsTGFbflynXhVLkGDyd+lu9HaNz9Wzh5mNpNB5yPeAQj0TucbrQTT4vydv1CdyJySqOgJm/ydLuN+4pTB2og1u+53ojoYmyfPHOO7KYbzrQ==
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 610a818f-3ad6-43e9-8596-08d87fd7fa67
X-MS-Exchange-CrossTenant-AuthSource: VI1PR01MB5007.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 09:08:07.1868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3d52ce8f-cef6-4b27-bace-cf9989cf3973
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGt1fuxAwq2RjjfFab4auPuDG8z5+vHoKtNNx0SsJPhiA+mA8wUs2yQj5LMYyaCRrY3RY93NZMl73gmiUHyiNF4cTJJwEKLec2ZVJoIGFHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB6989
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,
friendly reminder for this patch as the initial fix was merged to master
a few days ago as commit 1476d40d3e (xcb-proto: update to 1.14.1, 2020-10-2=
8).

Is backporting the patch fine for dunfell or should xcb-proto be
updated?

Thanks!

regards;rl

On Fri, Oct 30, 2020 at 02:45:51PM +0100, Richard Leitner wrote:
> From: Richard Leitner <richard.leitner@skidata.com>
>=20
> This backports the fix [1] for the following build error for nativesdk on
> Fedora 33 which is caused by the removal of fractions.gcd() in favor of
> math.gcd() in python 3.9 [2]:
>=20
> ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib64/python=
3.9/fractions.py)
>=20
> [1] https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/426ae35be=
e1fa0fdb8b5120b1dcd20cee6e34512
> [2] https://bugs.python.org/issue39350
>=20
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  ...1-xcbgen-use-math-gcd-for-python-3-5.patch | 40 +++++++++++++++++++
>  .../xorg-proto/xcb-proto_1.13.bb              |  3 +-
>  2 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcbge=
n-use-math-gcd-for-python-3-5.patch
>=20
> diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcbgen-use-m=
ath-gcd-for-python-3-5.patch b/meta/recipes-graphics/xorg-proto/xcb-proto/0=
001-xcbgen-use-math-gcd-for-python-3-5.patch
> new file mode 100644
> index 0000000000..f9f4424da5
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcbgen-use-math-gcd=
-for-python-3-5.patch
> @@ -0,0 +1,40 @@
> +From 426ae35bee1fa0fdb8b5120b1dcd20cee6e34512 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Esser?=3D <besser82@fedoraproject.o=
rg>
> +Date: Mon, 1 Jun 2020 12:24:16 +0200
> +Subject: [PATCH] xcbgen: Use math.gcd() for Python >=3D 3.5.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +fractions.gcd() has been deprecated since Python 3.5, and
> +was finally dropped in Python 3.9.  It is recommended to
> +use math.gcd() instead.
> +
> +Signed-off-by: Bj=F6rn Esser <besser82@fedoraproject.org>
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/proto/xcb=
proto/-/commit/426ae35bee1fa0fdb8b5120b1dcd20cee6e34512]
> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> +---
> + xcbgen/align.py | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/xcbgen/align.py b/xcbgen/align.py
> +index d4c12ee..5c4f517 100644
> +--- a/xcbgen/align.py
> ++++ b/xcbgen/align.py
> +@@ -2,7 +2,12 @@
> + This module contains helper classes for alignment arithmetic and checks
> + '''
> +=20
> +-from fractions import gcd
> ++from sys import version_info
> ++
> ++if version_info[:2] >=3D (3, 5):
> ++    from math import gcd
> ++else:
> ++    from fractions import gcd
> +=20
> + class Alignment(object):
> +=20
> +--=20
> +GitLab
> +
> diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb b/meta/re=
cipes-graphics/xorg-proto/xcb-proto_1.13.bb
> index 7467090920..1f41821302 100644
> --- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
> +++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
> @@ -11,7 +11,8 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd763b081cb10c223435b01e00dc0a=
ba7 \
>                      file://src/dri2.xml;beginline=3D2;endline=3D28;md5=
=3Df8763b13ff432e8597e0d610cf598e65"
> =20
> -SRC_URI =3D "http://xcb.freedesktop.org/dist/${BP}.tar.bz2"
> +SRC_URI =3D "http://xcb.freedesktop.org/dist/${BP}.tar.bz2 \
> +           file://0001-xcbgen-use-math-gcd-for-python-3-5.patch"
>  SRC_URI[md5sum] =3D "abe9aa4886138150bbc04ae4f29b90e3"
>  SRC_URI[sha256sum] =3D "7b98721e669be80284e9bbfeab02d2d0d54cd11172b72271=
e47a2fe875e2bde1"
> =20
> --=20
> 2.28.0
>=20
