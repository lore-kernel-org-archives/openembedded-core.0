Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B36C7EE2D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 10:49:16 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.13834.1684406952058189685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 03:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNMFg2GB3Aa55o1qghoYR9Oz0fDwuoj2Nb8kQRKHJwH7QyZUl182gvO8IuF+z4hwfDBMNy5v5ddRwf2PI4aO4lGm5LLtIXFC05HL2EZOkqMIe49ddsTk0NrAarIAtAF5F+6FFSiEvbHW0BWVTVapFAkT5/zzs3polpb5grqas1wDhjjHeMoJwP91o6LIKyGveRsTV8r8UCNOXnJgrHycm8PtDVUV1Q5SrwkLIzIqZKpgAeDSyLfjddPwm6JpRVbwzjHRrBNWtFbSGshvzeMAVNpTkTiKbym2NRmRxc+pHJiC28+dEG/gAnW/e05EOOFRexCq+n1wtyRdBpIEHFoZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MT0dbpE/+98kjz2iEH9Mmt+IaK3HPGnuglJsmG9bFiU=;
 b=D6G470OWXL00Cr4kLIM7NJLz8tCZ/azKNe9hqnDghTZC7sWvjLUWcJebXp2+dtEiAp4calugTxVusR/7dmfuH1ZuzG6b6VL8gZDJVEeb5KdKhL9O7m6PJMaAxQ/H0eBpudUz0CCps4dXFEbBTIZWChEyZmy5TMVU/sR4OEukIlMY5zEDLvQ2yNcKtuzwTOMLjFJu/M9uXcKPc67DwycSaJZqVqDhy7xEAZFAe0F4pTR2hkM3PLBA8/alDqnelcp59a1nQGM/XNkLyTGtpYmtffo3CNW+7H023pljZtzdMGblzrU4DTM4kO2VTweC3LL3A0b2yBvWHrMpm4BbeBnOsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MT0dbpE/+98kjz2iEH9Mmt+IaK3HPGnuglJsmG9bFiU=;
 b=ky5hKLvoN+jWhKq4ruElDnNNjx9TmAcYLR6XrnoUAU+Dzm2XJBHuahxLbH/pleAU54kXm/7c4MzgTeWGtKuyizhkYedqGkOzP8TaqNKUebRto0WzOI5bIGGVXaOZE9b8P+DaZN54cEemRuEw0MBMe38mJmjWtKEXw55/+DPU/s4=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: Re: [PATCH 6/7] python3-pygobject: mandate gobject-introspection-data
 DISTRO_FEATURE
Thread-Topic: [PATCH 6/7] python3-pygobject: mandate
 gobject-introspection-data DISTRO_FEATURE
Thread-Index: AQHZiCXu7PDV3AQZSEmT1tu9T4HEZa9f2oFo
Date: Thu, 18 May 2023 10:49:08 +0000
Message-ID: <DB4PR02MB10030D5405A91EAD95AC68552E27F9@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230516184031.2255171-1-ross.burton@arm.com>
 <20230516184031.2255171-6-ross.burton@arm.com>
In-Reply-To: <20230516184031.2255171-6-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|DU0PR02MB9822:EE_
x-ms-office365-filtering-correlation-id: 4ee3abca-f47c-47f4-ad8c-08db578d8211
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cpZMqlxQKJ5PvwgkQHgvQ9a+laICSEMLvUDKVeEwZbkD5txWMeIQWJeeTjYOt4cobKp+MNcx3yExtKTPqI0/VEssA6+roP9asKeh8EfVn55miCtaGLtULqW44gfZFemBfCMD7qbMlENtPBAwTs0M8qegKkLmqD2wgnGFRB67OFyrE/VXQenOXIq/LgUhM0NjVbmAgXeUZftQ/0Ad80jNYIiebi0SSD6yuchL4ZhNwBzxzy2nPVXBbv+87hYAQMrzr+avmOrMdErVwt9DtEL40QPkB60xLoavFX8bOYpydTjmewjPysYaWgj/YkZNAVQ2G6UqKtbfifDxgx37tN446NeEAAaOuOUYX/sSxzeaJAxjaHx9L7qGyMlxfe7Y8TK8uWw/BjfIJFe7MuIfhPTf6aT/pBMDcdEwO0vuddG9iwjwjNIDABW8iaIsyqOKQyCE//xHP6aWdIXcbHA/BqoIrgZxhF9G3i0LkzMPJk5XtfA2SA2b110EhuAvTbBnxGL8mXkXjIwXV7/WZKGfZ1TvBAd7lSK8dM/kxFsP1CF3Fgi4FtJn8D/u4AmSsh9o/YjUQnLjCn57RiUAivlOuygc7OlUEyOzRW3LBe121vszH4N+5ZrHKXW+As+Q9km+zb8z
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(9686003)(53546011)(6506007)(38070700005)(186003)(33656002)(2906002)(86362001)(26005)(83380400001)(55016003)(38100700002)(122000001)(41300700001)(71200400001)(7696005)(66946007)(4326008)(66476007)(76116006)(316002)(66446008)(66556008)(64756008)(110136005)(478600001)(91956017)(5660300002)(8676002)(8936002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?LERkKdugLZ3ZITz4l3XXQ8SmX35iw3b2yeylY8xTCqHWqum9mfXIs33/D2?=
 =?iso-8859-2?Q?r98lfc+8TNlu6u5ejeISb9+Q+PkUILt77lkB2fEgZpklLYYs7yDLum2iEB?=
 =?iso-8859-2?Q?U38ubD/8Ugz6xIZzMwL/DsY+2RETnnbVmca4z52k/gT3L8iFGZknSBqmyC?=
 =?iso-8859-2?Q?+bdQG/zwz0J+BBkYjfVrCjq3c/wkX36p8NpEaowertJX/sRsadtNUC+hbg?=
 =?iso-8859-2?Q?p6+/JelT7+Yb01Sl4XN+aXQlf3p+O5zUoXA34mkP9vGj9TjKg24YXLqVMp?=
 =?iso-8859-2?Q?XYrUantjbmpZ2gnnSAfUFCfAvR+XOYVp8T2hSpI79pkn+ZeMskqY+6En5Y?=
 =?iso-8859-2?Q?Bm5m7XxnMZfyf+P4Q6PMn92XnSCIwbLJkhwRBxtX7Asa2nHs+UiZpWZD1T?=
 =?iso-8859-2?Q?QBzQoYMCJ7TNW7QgtFq6il8ReysgLbU8eFXLB8rMVeaO+HjFxd/W0ozspT?=
 =?iso-8859-2?Q?jX6EbXHRtXCbRfvPMhd7Ea/adqeyQZBqjLQMf8/7T0fbfBI9e4ufhUUfGP?=
 =?iso-8859-2?Q?x2g2UsAGcSLrfPsy/ezv3Lb7uBM2UiW/2M8lYhw/epN4w0BaBBOI/ZQxPE?=
 =?iso-8859-2?Q?LJG9kOHVt95jR+DGu5GWW5vrbpO8FA6SNyX5Qayb58fhiwom8zSZIvX4ZO?=
 =?iso-8859-2?Q?DazALpjjF/eR+tjP4IRBMN693bjqJxGGw+ZAvnRLLQEyaDn6xyDMVgmXO6?=
 =?iso-8859-2?Q?pYFDDu6UfDpLuntsxB6CfnmTqZGr+cVOzfJLaNNKiwjV5okAjLaYTDiNlu?=
 =?iso-8859-2?Q?cfgkjYfCaUclkrRv3ZVh2IKlcy9G6BZRQBG/QdXHMhBAPhWsQKN+fCVLXU?=
 =?iso-8859-2?Q?WwRhsN4j94dQHpngie4N79rqJBG7cOJs9PBLKkI+2rZMOJhSEynM4LEbXc?=
 =?iso-8859-2?Q?1eawSJo2qxOuxW8s5BksWze70kyJQNxPobPZqJxbILH7x3WhzkHqvCkNpo?=
 =?iso-8859-2?Q?PVuokidobmjJ3cMMrvkbiQ32jnQyJAvAxXuR+2/F5YcxdgoUewak8uwO94?=
 =?iso-8859-2?Q?gXcmqruak7vYq24W4ruB0bsVsdD8lhyaCRuNm88lU5PYhrMFChWrgI9Y72?=
 =?iso-8859-2?Q?UO1gaT/fIc287Gnql0yaPewMLTcMABLCcefcUiR5eZGzLJrq4miVZmarwy?=
 =?iso-8859-2?Q?O3xbnH1RCn0IRoVCXH/VU0UTfhJoKMxuXiWRhuI+Dz4+qqYQyfja8Ef7Ej?=
 =?iso-8859-2?Q?Cvqi0kqr/3Oxm7i9TURf914PC8ZY9ubMxVQiZwWoQ0QE1KivInHxaeoKeF?=
 =?iso-8859-2?Q?png0LPFZ1McfUFVd4UKZMyuAStXQTLd9xH0VxueJU1XPTd2GuIRLuheLaP?=
 =?iso-8859-2?Q?GlIYUiXvbYEdvnqBFvKHq5B9KRFkUEwTnoUIMaaXZfrwpkRT4E7GJofbev?=
 =?iso-8859-2?Q?niI2eQCfG2mn3+VLe5ejQcyXaDpqqAq3y8k82MYqTafiHpUFY609ukz1Wz?=
 =?iso-8859-2?Q?YDLlI7iCXOtpKy+OFjs7BmChxODFpoPM51dy1QP2ynEyTZiMJ9kOdlVzCH?=
 =?iso-8859-2?Q?MVo+atM/v0Zc+EA2Idpl9qByMR1zm2Eam9SKfOiiN5SOf5h5k75nfkcamF?=
 =?iso-8859-2?Q?OkGQFIZPIiodEH+/lEwLNr5rknN9uAVc7vFf29KQI5p14hDXZ47eSp4z8i?=
 =?iso-8859-2?Q?tkcLsJ6IAMRhI=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee3abca-f47c-47f4-ad8c-08db578d8211
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 10:49:08.7131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u/I57yFuzlU0ZET/fvNJ3nj5hGvmYT69JLIoqyiM3di6q1JX/i2ela8SrJWtVxJA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9822
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 10:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181517

With gobject-introspection in DEPENDS, PyGObject builds always, even if gob=
ject-introspection-data is not in DISTRO_FEATURES. Is this conditional appr=
oach better?

Petr

________________________________________
From: ross.burton@arm.com <ross.burton@arm.com>
Sent: Tuesday, May 16, 2023 8:40 PM
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com; Petr Kubiz=F2=E1k - 2N
Subject: [PATCH 6/7] python3-pygobject: mandate gobject-introspection-data =
DISTRO_FEATURE

From: Ross Burton <ross.burton@arm.com>

PyGObject needs gobject-introspection to function, so add a distro
features check.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.44.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb b/met=
a/recipes-devtools/python/python3-pygobject_3.44.1.bb
index 1132e9a9ed3..43125927cd3 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e63=
1dd8edb7424769c7"
 GNOMEBASEBUILDCLASS =3D "meson"
 GIR_MESON_OPTION =3D ""

-inherit gnomebase setuptools3-base gobject-introspection upstream-version-=
is-even
+inherit gnomebase setuptools3-base gobject-introspection upstream-version-=
is-even features_check
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"

 DEPENDS +=3D "python3 glib-2.0"

--
2.34.1


