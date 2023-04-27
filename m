Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF055C77B7C
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 09:10:41 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.72])
 by mx.groups.io with SMTP id smtpd.web10.15946.1682586634627233460
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 02:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=E7ZVf6mQ;
 spf=pass (domain: kpit.com, ip: 40.107.222.72, mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJxXCp09hFxg1/bl/NTCKM5baOjYLeq8m1R1FadaJGLgKYHjOiW27jmQmf40wblYWx+gwV/G4ykkGg4/26b3LJ55JQ+95az5iH/POWLLTs4Df4jVz7q43D9LwBmxG9Nabgisms1p2MweLRoK9oXOXROh74n8rUWWo10FErZJxXiFfoiW8Z1JKU2lsocrcwwYM+Fwa6zvYT8LJsxMEuWULokNL+k+O8JU9C9yMCKgDOk4SaF4DPpLIG+rCiB5rffBjXM62/jzXfpnujhVFXLQhcHXX1Rz23t9jkC12ZseOjPQV/iTINyso6DZ5hU4GElxASHII/VoppnHFvjo9O0t0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/SBEkn050mFES3st+V/App0jDVr3BSH4EU6t2pR16I=;
 b=JfTNm4lPk51/ONsnqc/kBliiyYy4VM26PtRnbZhAiTn4EOJLb5WCoeU7WHwxnrTDXXSXgpLS7PhM5LGx9jqsA3N46Nf3cQFosquZehJA+09/PU3Xq/2mbhTv1+3JnIFpDT6zod3shFPhmnnDp8+P4pYW8wjX+QNJBM6Y9iEG7mCgMuwfB/4/btnZhx+UaRIF4ccRP7cYXz9gDl0GZJ4EStS1WYNgwBk5z7OLMYsUTLSkdy1mlAjKPVYScXv/6qNcSMZWQ/idagWZsnrUmBwwvbTOdotC1pqTgULMB/rzwJGGEHzz+3+t6tVXzOd+ARANEA8aiK751HHhhbbGdD1TzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/SBEkn050mFES3st+V/App0jDVr3BSH4EU6t2pR16I=;
 b=E7ZVf6mQKeoKcwOk9Yms3vV27uIdr0NamHQNq0Tm2kKds5+2Y4QqnzSU++aKOwTSxTGbq34c1LxfC7U3PUMQIxJ/cax7LOA0gg6VZIfq0wumGhGGdUyTyEM9wTV+ER4b32LEK4vJReZiRqHpv4SckqXmICB8FHDtn9R2vuRxhNY=
Received: from MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:c4::9)
 by PN2PR01MB8792.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:119::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 09:10:26 +0000
Received: from MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b39:c39a:d78a:491d]) by MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b39:c39a:d78a:491d%7]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 09:10:26 +0000
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
To: virendra thakur <thakur.virendra1810@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta][kirkstone][PATCH] qemu: Whitelist CVE-2023-0664
Thread-Topic: [meta][kirkstone][PATCH] qemu: Whitelist CVE-2023-0664
Thread-Index: AQHZeOexvJGFY3DIOEeA8Yk3d7OPjK8+3kyj
Date: Thu, 27 Apr 2023 09:10:26 +0000
Message-ID: 
 <MA0PR01MB9355931AAF91264037B10C9E9D6A9@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
References: <20230427090657.32563-1-thakur.virendra1810@gmail.com>
In-Reply-To: <20230427090657.32563-1-thakur.virendra1810@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB9355:EE_|PN2PR01MB8792:EE_
x-ms-office365-filtering-correlation-id: ab84659d-c87e-45b3-6520-08db46ff3d53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wzBBbRsy+mLcnT9KxQKDBXb+x9u4B0QGHYXKY9N5r3aqgFuWuADwcvQXpid2z3dPuqdy9POy3TGiCHkFGMp2uv5R+wP5aSb1kM76ookmzuC+UJtyYry+w1Har4LXSc15/zlgnc2gDW1NJp0v9h+6FKLK5pz4n8tgKUCJecVSXer/QALH+W/ywCtIgKfjLjsYZs+PO35fb05BXvR1lzc3z2KHdwpCtaGTYUQKEghlVat+cg1mgGm72LDF/9KfIN2Ocy8+O8cUMp+qYFgSvRBw4c+OFUUO//bihD/LKLDZ1FQoUu5I0/1iyD4qR8hLyzoT33QBPCbrfPgXZnbYVBi5ZEpyjjk5FR1uO+KGc9Qf3UsTAJNM1j6fBRWAkSdK2WFEFB4tKANwvBakZWYaIfIBTDpK0s2T5UXjReqseAZA7WMQAaSd+dDssmTsFLco7ScjP/rS7LmBV5fFePKYqzSf+6lltV99ykyp4NUl1h4fZwGtbUrEUmIXB9n7eVyqccEuMWdy+6+FuPzEnt+SEs6B/Uvbu4f4nRkLP+U9sMN3TX0hpkQs0iTeGbyjl3KoCluNMMUZao9R+G89jSO5TCORH5LBRdQJfyKuObgHkxC8+LE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(451199021)(38100700002)(38070700005)(41300700001)(19627405001)(8676002)(122000001)(8936002)(7696005)(316002)(64756008)(66476007)(66556008)(66946007)(66446008)(166002)(66574015)(83380400001)(2906002)(5660300002)(52536014)(76116006)(86362001)(186003)(91956017)(110136005)(966005)(26005)(6506007)(53546011)(9686003)(45080400002)(33656002)(55016003)(478600001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?lb+vlDzsbQDbwYi8G38KJ5zHc0eJgVz8BMEdLfxQzXs+rAJxWPkFpiqDLa/y?=
 =?us-ascii?Q?07QQLwe4zqowBdBTBm11ldYJTpQ7BxZQJ5obQWV2H12tmqQG9tWY28phj49U?=
 =?us-ascii?Q?uvXIT3VY08jyIAG9E73ecv0VmQD6EjSW1cVtUAGRa51QGh6z1T65SQ0tSjxq?=
 =?us-ascii?Q?hPIgMp2C0i9UPYIymBoIQR4KEapUG2rKytSs1IUiiuMFWjYGvaa++E6tHzaC?=
 =?us-ascii?Q?tsOLje8lM9xaoR7Etb9kvie8IKyuObceSSShMDCi2Hwl3HoSG0gsGgQtcvmu?=
 =?us-ascii?Q?X+u9qwHvStb9DKhwgkUGbP4J7TaOWjCxXXHkeM3gTSOSOWYfsB/W/ZLFXS8v?=
 =?us-ascii?Q?8hJ1y8C4sX3X1venj/N1Tq5X0L9sU4uuvmLRkc/b3nATz9yqVRdURzP7YGHA?=
 =?us-ascii?Q?KfdBlCu5fRyguTRzc4zJmjpXlCpWz2VN1aMplW4nbS1gc4InejqFLMooIMYH?=
 =?us-ascii?Q?ETRq3paM6xxX2ZcJjvUadoq7NP4Fw4A1DRH9nx+geDwjL5brdNwz2TPhzya4?=
 =?us-ascii?Q?E0/qw+61/Ev4uncck/snNiNM+QUEn7yD9mJFHUPSSxtDVzaIMFjO3ZgdBXH7?=
 =?us-ascii?Q?mhe1TkJd/vsS6xDWM3iSaMjmys/7mnTXRws8mdjSd1L1myDXWqbZzv0+6Qu4?=
 =?us-ascii?Q?EUDabbmqN4TyFQ8RZ9WmkeLxSDqFkS4eEtBDYHGLur3tuOvNJKVX6MSJPaxR?=
 =?us-ascii?Q?YRryoxmSm3z8d+MtiZ86vfvLMvX2uUTo/LdOzLcJC8qB7qzJmnNAzPQm+o7Q?=
 =?us-ascii?Q?iaSfYyyMI28UIhzzGgTJ00kmA+dQd7oOXIpNDsX2NIIKDknOqN/2IGf6XbZI?=
 =?us-ascii?Q?COszcOQAaDDabvxAFlpxyGfu4GSut/4UoFDe7MzP8/eNcD6oSfP5PKc9JXVp?=
 =?us-ascii?Q?DBDaRDIb0YCwsKlIQH+dP60ZTsJsDZhEq1Y8D50FnOR6S4om9AL9tfrJpOOT?=
 =?us-ascii?Q?1j9UfZJWqeQMXDqAuvkdinn0TXKxUvTV9TmKxSISuLSuN/Gdvc+1bf4p5Xbl?=
 =?us-ascii?Q?yuvyqLGVDiJh1JblhlHYqxqgTtCsEetubI/fH1X7v6tZnq5Fgmr93MJYdNTR?=
 =?us-ascii?Q?N1PnkDUCVasTXqgG8lnGnwzsZ4t6GsfHUG+VIBtRR+JoAftwZFcauNnNb8So?=
 =?us-ascii?Q?dBAXulOz1D22lktf+1nePjuw6pKQqrJL6EL7OINkIMKoz5YhzPYq/Pkc75j/?=
 =?us-ascii?Q?nXvVa0tdHjQln2WJUala4fr9H63qYju9FWM7WI3MNcFTX/1XQE6HW3WYpheO?=
 =?us-ascii?Q?v7WvwKwEkPUX6jfDT7OrslXMBGSPUlyW2tgl7JhmnCquP3pFkqcWAibzuv6L?=
 =?us-ascii?Q?MaA/4L+upmDHF4Q3ze/NfExPLxuxkuwLWXtpamSTwpDg2RvfZnXH1/oJY9ax?=
 =?us-ascii?Q?axYwIW2Dt8Y9x4Z29w3gezweoQB9gSCX7ANzJU7n32Opl8slqgPhjCEH+/eY?=
 =?us-ascii?Q?j75Zkn7P2SvDfnp653w9HNmjMVd6bwb6uUyggo0jyNUvkW1NQ+5SpOD2/0a6?=
 =?us-ascii?Q?pfTZliDrGuUKV8tuBOSD0k/XJOO3hGSnsw3MuGDRB6Wz6as5FdsI+kw9pJ1u?=
 =?us-ascii?Q?DmbV/8dkKQLfqU1TuyM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MA0PR01MB9355931AAF91264037B10C9E9D6A9MA0PR01MB9355INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ab84659d-c87e-45b3-6520-08db46ff3d53
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 09:10:26.2190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UbumZxg+yGQfxTtyrjVPwWStXuMvWvbsbRf88nsmUkq+IRGYqTdDQ6tQ6u6+n31choKJMjwtrJWtFLNlnv3PAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB8792
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180490

--_000_MA0PR01MB9355931AAF91264037B10C9E9D6A9MA0PR01MB9355INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

please ignore this patch
________________________________
From: virendra thakur <thakur.virendra1810@gmail.com>
Sent: Thursday, April 27, 2023 2:36 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Subject: [meta][kirkstone][PATCH] qemu: Whitelist CVE-2023-0664

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

From: Virendra Thakur <virendrak@kpit.com>

This CVE is related to Windows.

Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fn=
vd.nist.gov%2Fvuln%2Fdetail%2FCVE-2023-0664&data=3D05%7C01%7CVirendra.Thaku=
r%40kpit.com%7C6a79de45761d49fb5d6608db46fecf4f%7C3539451eb46e4a26a242ff615=
02855c7%7C0%7C0%7C638181832489901831%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=
=3DxXSAxOehMYxawXB12m6bE%2BgZY5RO6U9ABlUSDhL%2BeRo%3D&reserved=3D0<https://=
nvd.nist.gov/vuln/detail/CVE-2023-0664>

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index a6ee958e4b..2517fccf93 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -112,8 +112,13 @@ CVE_CHECK_IGNORE +=3D "CVE-2007-0998"
 # https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugz=
illa.redhat.com%2Fshow_bug.cgi%3Fid%3D1609015%23c11&data=3D05%7C01%7CVirend=
ra.Thakur%40kpit.com%7C6a79de45761d49fb5d6608db46fecf4f%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C638181832489901831%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7=
C&sdata=3DH7T6fq5I5sFUvNSDuE9GTkAxontU9MO8O5m%2Bvoqjp1A%3D&reserved=3D0<htt=
ps://bugzilla.redhat.com/show_bug.cgi?id=3D1609015#c11>
 CVE_CHECK_IGNORE +=3D "CVE-2018-18438"

-COMPATIBLE_HOST:mipsarchn32 =3D "null"
-COMPATIBLE_HOST:mipsarchn64 =3D "null"
+# As per https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2023-0664&data=3D05%7C01%7CVirendra.T=
hakur%40kpit.com%7C6a79de45761d49fb5d6608db46fecf4f%7C3539451eb46e4a26a242f=
f61502855c7%7C0%7C0%7C638181832490058063%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sd=
ata=3DrfqpcETziItn7gIUQX24YmfRaYDgdpjD79%2BXY8IKcOE%3D&reserved=3D0<https:/=
/nvd.nist.gov/vuln/detail/CVE-2023-0664>
+# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugz=
illa.redhat.com%2Fshow_bug.cgi%3Fid%3D2167423&data=3D05%7C01%7CVirendra.Tha=
kur%40kpit.com%7C6a79de45761d49fb5d6608db46fecf4f%7C3539451eb46e4a26a242ff6=
1502855c7%7C0%7C0%7C638181832490058063%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdat=
a=3Dik0WJ0BmNJFP5iid0HYWobhDvZLde0SA5sUSCdjAPCU%3D&reserved=3D0<https://bug=
zilla.redhat.com/show_bug.cgi?id=3D2167423>
+# this bug related to windows specific.
+CVE_CHECK_IGNORE +=3D "CVE-2023-0664"
+
+COMPATIBLE_HOST_mipsarchn32 =3D "null"
+COMPATIBLE_HOST_mipsarchn64 =3D "null"
 COMPATIBLE_HOST:riscv32 =3D "null"

 # Per https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
lists.nongnu.org%2Farchive%2Fhtml%2Fqemu-devel%2F2020-09%2Fmsg03873.html&da=
ta=3D05%7C01%7CVirendra.Thakur%40kpit.com%7C6a79de45761d49fb5d6608db46fecf4=
f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638181832490058063%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C3000%7C%7C%7C&sdata=3DP667j7d18q0rpZfx6ojcRlyZxrtQ%2Ben0uX1D3TukZ1=
s%3D&reserved=3D0<https://lists.nongnu.org/archive/html/qemu-devel/2020-09/=
msg03873.html>
--
2.25.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MA0PR01MB9355931AAF91264037B10C9E9D6A9MA0PR01MB9355INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
please ignore this patch<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> virendra thakur &lt;t=
hakur.virendra1810@gmail.com&gt;<br>
<b>Sent:</b> Thursday, April 27, 2023 2:36 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Virendra Kumar Thakur &lt;Virendra.Thakur@kpit.com&gt;<br>
<b>Subject:</b> [meta][kirkstone][PATCH] qemu: Whitelist CVE-2023-0664</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: This email originated from outside of the=
 KPIT. Do not click links or open attachments unless you recognize the send=
er and know the content is safe.<br>
<br>
From: Virendra Thakur &lt;virendrak@kpit.com&gt;<br>
<br>
This CVE is related to Windows.<br>
<br>
Link: <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-0664">https://ap=
c01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.nist.gov%2Fvu=
ln%2Fdetail%2FCVE-2023-0664&amp;data=3D05%7C01%7CVirendra.Thakur%40kpit.com=
%7C6a79de45761d49fb5d6608db46fecf4f%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C638181832489901831%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DxXSAxO=
ehMYxawXB12m6bE%2BgZY5RO6U9ABlUSDhL%2BeRo%3D&amp;reserved=3D0</a><br>
<br>
Signed-off-by: Virendra Thakur &lt;virendrak@kpit.com&gt;<br>
---<br>
&nbsp;meta/recipes-devtools/qemu/qemu.inc | 9 +++++++--<br>
&nbsp;1 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc<br>
index a6ee958e4b..2517fccf93 100644<br>
--- a/meta/recipes-devtools/qemu/qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/qemu.inc<br>
@@ -112,8 +112,13 @@ CVE_CHECK_IGNORE +=3D &quot;CVE-2007-0998&quot;<br>
&nbsp;# <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1609015#c1=
1">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugz=
illa.redhat.com%2Fshow_bug.cgi%3Fid%3D1609015%23c11&amp;data=3D05%7C01%7CVi=
rendra.Thakur%40kpit.com%7C6a79de45761d49fb5d6608db46fecf4f%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C638181832489901831%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%=
7C%7C&amp;sdata=3DH7T6fq5I5sFUvNSDuE9GTkAxontU9MO8O5m%2Bvoqjp1A%3D&amp;rese=
rved=3D0</a><br>
&nbsp;CVE_CHECK_IGNORE +=3D &quot;CVE-2018-18438&quot;<br>
<br>
-COMPATIBLE_HOST:mipsarchn32 =3D &quot;null&quot;<br>
-COMPATIBLE_HOST:mipsarchn64 =3D &quot;null&quot;<br>
+# As per <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-0664">https:=
//apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.nist.gov%=
2Fvuln%2Fdetail%2FCVE-2023-0664&amp;data=3D05%7C01%7CVirendra.Thakur%40kpit=
.com%7C6a79de45761d49fb5d6608db46fecf4f%7C3539451eb46e4a26a242ff61502855c7%=
7C0%7C0%7C638181832490058063%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Drf=
qpcETziItn7gIUQX24YmfRaYDgdpjD79%2BXY8IKcOE%3D&amp;reserved=3D0</a><br>
+# <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2167423">https:=
//apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzilla.redh=
at.com%2Fshow_bug.cgi%3Fid%3D2167423&amp;data=3D05%7C01%7CVirendra.Thakur%4=
0kpit.com%7C6a79de45761d49fb5d6608db46fecf4f%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C638181832490058063%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3Dik0WJ0BmNJFP5iid0HYWobhDvZLde0SA5sUSCdjAPCU%3D&amp;reserved=3D0</a><br>
+# this bug related to windows specific.<br>
+CVE_CHECK_IGNORE +=3D &quot;CVE-2023-0664&quot;<br>
+<br>
+COMPATIBLE_HOST_mipsarchn32 =3D &quot;null&quot;<br>
+COMPATIBLE_HOST_mipsarchn64 =3D &quot;null&quot;<br>
&nbsp;COMPATIBLE_HOST:riscv32 =3D &quot;null&quot;<br>
<br>
&nbsp;# Per <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/202=
0-09/msg03873.html">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.n=
ongnu.org%2Farchive%2Fhtml%2Fqemu-devel%2F2020-09%2Fmsg03873.html&amp;data=
=3D05%7C01%7CVirendra.Thakur%40kpit.com%7C6a79de45761d49fb5d6608db46fecf4f%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638181832490058063%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C3000%7C%7C%7C&amp;sdata=3DP667j7d18q0rpZfx6ojcRlyZxrtQ%2Ben0uX1D3Tuk=
Z1s%3D&amp;reserved=3D0</a><br>
--<br>
2.25.1<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MA0PR01MB9355931AAF91264037B10C9E9D6A9MA0PR01MB9355INDP_--

