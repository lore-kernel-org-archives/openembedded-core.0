Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A833C7EE22
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 10:58:06 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.13971.1684407484488007393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 03:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7VBO8aKmLmH33KALAvrwspw5K0Zr/5U4AF6tRDn9e0kqiLHgjXb2oLbgAGCC7o0flJk5+lWJ1Ruh4yzZu7gmUB11eScPQcbQxN67S/0qlTcNZLSW9NeQ8t9AnToEECu4EYY5Lpm0ZlMKJ9AO0zbeRvhl/0D9enXm9EdxGNnXMmlmVxDdPcGtJmqvDxxoQeocbi6zDZm5AnaEGop7Rhc1wpgi4gMrCTCEbFGu/1B/WpskC+Cv175kzn9LWDU+5DP3GM9H5xF8/fZogZ+wzm9wGsAk7OnzGE/zWANq9Wtq97nOSdGQ/ILQoXxDu1xMQ7O+bIWft7J5i1q50iT2gMX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdJjlu6hzr0wCEfRjOMDZb0yS0qtHXm/0z+0iCSG9Sw=;
 b=cUasC2SQYgEutcJaRWPxtSB2Q/aK1r9MMdv00jZEva0WUSQvGRTHILFOGUzi0TFWR6dPlBgGhLjnvXap2m6hX2nqUSyfh5yhlw61Eb5wgZ83pJeT/CGCKJImBajMAwPlJNWw63+Sd53PwH1bQhxrN/FsHvlyY+C7pD9tsn/0QW3QrbbyedLUDA98b/gXlCnbVQvTBweTvCz3NVTQiDVwy5WDzodyI6XUvmLFiMsrVTgSUD82IBlicrNgGlxujHeZB840DJIziL0+oAxCIS+GMqVmK54MO0cNhl2bgPTfQXvFa4LUd68WEqs38XB82+XLoRTxIxTM5uNfMDZSyLToag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdJjlu6hzr0wCEfRjOMDZb0yS0qtHXm/0z+0iCSG9Sw=;
 b=LHUrqpZFPGBZfPs8AvFA14E2ZEVwEQcPPkflLLn7lI1OJQGxbZYlmO9F3S0hpAVNWLotj2yJEL2bHy4EuD/MJ2GtK0hKSLjnZZuu5Yev7Roni5utElYrFxMurt1vjxo1tYiUqTVm5WFVGmLT3lIHMBEQPS88dnTWM2CyAjIFMUA=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: Re: [PATCH 4/7] gconf: remove explicit gobject-introspection DEPENDS
Thread-Topic: [PATCH 4/7] gconf: remove explicit gobject-introspection DEPENDS
Thread-Index: AQHZiCXsXXJoFeVYJUODaF1BfhoI0a9f3YR4
Date: Thu, 18 May 2023 10:57:59 +0000
Message-ID: <DB4PR02MB10030379D818A067443FECF04E27F9@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230516184031.2255171-1-ross.burton@arm.com>
 <20230516184031.2255171-4-ross.burton@arm.com>
In-Reply-To: <20230516184031.2255171-4-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|AS1PR02MB7821:EE_
x-ms-office365-filtering-correlation-id: 93b5423e-64f7-47ee-5a70-08db578ebeb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AK6BRrovyL/yY3K+Mpe2hkIxNihrjq1Dd3uPsmIMOarVt6K6RqEkRbVNmCK0ojArcyKAHT/kkH37l+2QohGsVEF1XpOaYtMN/+krZ7pvKp6elJLN2950BiUEUN19BwPGE522Gz4MryRLvHn4XawbMoVlg0WZamTfy5NGI2JjC9hI+EcpVxOhEmG7lCKPhbV72KU48cUt2ZqmzRmVY4lGIT2dCW9TP+QRwY35g+3ZrY25z/76CoXO+eQOIMio5iTY0IItEbp036DJh3J1RIrCjVhFOY0OjDzL0jfzQOHHR21vUfVYXgXLpp76WHTW19sXLGxwoBAy4jBgse65lPB5cr90S3+joSADqjUYcfbxyBn6Kt1/NKH4zFAmpTzyQiqk14Nm0NxE4u4GVpirIcfWv8Gbx9rW/SD9OwHy0o4cJ2mZy4oFBgaLGP8Bfr/vJfTOTHrCpbUAH2qhmCaKjf+rx1V2UqbL5oRupUVwcedDvZquF1Ae0k/dAqdH+DXGuvJkv0bAZ9yJkPqUZyjIK/yfsJeOamqzBcWxPXWgRh7FZEF5pOWHOXI5GUIX0ZqHMEx4prjidiJPea86NKgvgWmBw98sWMJcqCp3M8ck68tZU54=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(316002)(2906002)(478600001)(52536014)(41300700001)(8936002)(4326008)(8676002)(110136005)(71200400001)(64756008)(66476007)(66446008)(66556008)(76116006)(66946007)(91956017)(5660300002)(7696005)(53546011)(9686003)(6506007)(26005)(38100700002)(186003)(55016003)(122000001)(83380400001)(38070700005)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?++DfA9zHVLJLs9esyI+km8tAA8ugcJ+EL721QzA5QpY5Dn9H+NuTxO/eCz?=
 =?iso-8859-2?Q?E36IHrAvGNSEuvQRt95B4iawhOMFJFEkZE60BZtc1xZG2cLwwBkzCrFKN1?=
 =?iso-8859-2?Q?oZ5pdmimBmcJSVMJe33C7yNY3hZr3p1Cxh9VsGMaxSeKHDWp/hhDl5IY6T?=
 =?iso-8859-2?Q?zIHWEtFfdCk9BJAfGQ4B9jO+AAoDamzch4c3Vdor1Xk3AhLdWbTNi4/T66?=
 =?iso-8859-2?Q?ABLrlGwrx8gRChqr3xH8F6uBnTun7C8ujyma4eUbAX5FTin7Nw8z6dmWru?=
 =?iso-8859-2?Q?hThrz8wxgufjNFaLwPe22ihwKJ0JGRKpHfL79blMmDvJfKmj8gH9DqWfiU?=
 =?iso-8859-2?Q?1BbFUsRZWHVLHgZ2h1w0KfFFokOapXT2Oa8ZvSCy9Gur+Jaz5T6tMwEfSA?=
 =?iso-8859-2?Q?QGXD2Dd2ihLJepldG3P6LXNrDeHC11oMz2et+tAzoF+ByNiyfSmNOi+27U?=
 =?iso-8859-2?Q?YJN+BF6piXwN+WPCuGSDibgJe8pTv/tyvVc5g2nn8/tfnnQbp2jhivH892?=
 =?iso-8859-2?Q?GaQ8gKyDNRQAzukneU1b8GQgm+Uu5clm3PLSr+37zUsbMQitqnGJz/d5JU?=
 =?iso-8859-2?Q?WnxQlwZkhOmH2UleM17igJphabdeKX5K7+AbB9NYH5Qb9fQxTdFKyk6hiH?=
 =?iso-8859-2?Q?fXPKr76rpcblxEvwarY+KyHSN4eA/aF7D/N5s2E86P/ivYfPZovMttFeHq?=
 =?iso-8859-2?Q?2n76EF+bGSeenRQzDjXyxb530QG8FBWYzz0f4VFp2UaY2BzBx/iHkx8/G3?=
 =?iso-8859-2?Q?MVawIWQYBKY7uSoBfu/oAjdlQaIvd5NIE8W/yNpauDM9JQP2QqmscwhZaN?=
 =?iso-8859-2?Q?Fvz1XRA8BcH1/sN5HZW32SfQcAanJtwrdtVv+hBHiaESpFSNwn13RA5VqG?=
 =?iso-8859-2?Q?L5m0StYK5UDoBlCybA1MbHW8KN/YzxVCAyK2R2q/ymodyJvkP4hW3+W5DZ?=
 =?iso-8859-2?Q?B2adJpC7CLFTvYgQpC3GpZw0rnKqerQNELCpjbh30Vh2CDjh3BY8iFcktW?=
 =?iso-8859-2?Q?gFNzqo5j+hrBEdPI90gEU6MCvLHCbhEh5ofZKuX9e7TG2jCsrPhDiock7A?=
 =?iso-8859-2?Q?d6inWB4tQG15Gaawl2zKZBdK7QCWwr08gfa6fBUJsID9SuHX0lI6A4Y/4J?=
 =?iso-8859-2?Q?OrDKgPHHJ8oQhcKcn7HEZZprQSNwYmQbIPWt+khWpt7FPc2Xv+wRxxJrHP?=
 =?iso-8859-2?Q?vmDSyySxJuGM+KIDegpD6B23IYjh3GODIZRpOQB68iGVnMKUVE5luRAePV?=
 =?iso-8859-2?Q?GAeUV2ip7LNbvuDp2lTRHXfkCCmkT0dKDEoMr424jAgUjJqE8qtqSWg0Co?=
 =?iso-8859-2?Q?m63EduT8FAUW+7Cdf7ynSHSv90QdQ1LnTcy78tWpbINji4A5V3/d6X7r+U?=
 =?iso-8859-2?Q?yffN2C1a7SeS9UuH2WWdjzED0yL2Xf6PbavlQiNFoJy5ebR8jwdWGW6qLW?=
 =?iso-8859-2?Q?20mI6xJFPLtob9QvT/hQ5DmvB1Eg2gujP2XsAAXrnWTD7yh1HGo5U6S5+F?=
 =?iso-8859-2?Q?y246iUunjkGhh65k95KeOJx+urqWMt+J31hQYuQTyrcEwJyHblUpftfoP1?=
 =?iso-8859-2?Q?w9xkkdgJYqQAIZdWgS/o2OhV9dYjspeuIHENaaAZvOO8ZmRmZP1ZJdxtb8?=
 =?iso-8859-2?Q?wm1OljZoTmQCk=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b5423e-64f7-47ee-5a70-08db578ebeb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 10:57:59.9068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1DZm1WO958v8wfwFZ0CBO/ndiFN+KpX2uAO6dOOCaUutXW/Kq6ifBo32nW7AbSPI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB7821
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 10:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181519

With the patch 2/7 applied, the gobject-introspection inherit pulls in gobj=
ect-introspection-native, not gobject-introspection dependency. Is this suf=
ficient? Please make sure it builds with g-i disabled.

Petr

________________________________________
From: ross.burton@arm.com <ross.burton@arm.com>
Sent: Tuesday, May 16, 2023 8:40 PM
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com; Petr Kubiz=F2=E1k - 2N
Subject: [PATCH 4/7] gconf: remove explicit gobject-introspection DEPENDS

From: Ross Burton <ross.burton@arm.com>

The gobject-introspection inherit does this for us.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/g=
nome/gconf_3.2.6.bb
index e712e4729c3..4930aeb9f03 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -7,7 +7,7 @@ HOMEPAGE =3D "https://gitlab.gnome.org/Archive/gconf"
 LICENSE =3D "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc60=
5"

-DEPENDS =3D "glib-2.0 glib-2.0-native gobject-introspection dbus dbus-glib=
 libxml2 intltool-native"
+DEPENDS =3D "glib-2.0 glib-2.0-native dbus dbus-glib libxml2 intltool-nati=
ve"

 inherit gnomebase gtk-doc gettext gobject-introspection gio-module-cache

--
2.34.1


