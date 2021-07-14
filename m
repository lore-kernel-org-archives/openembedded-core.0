Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.48])
 by mx.groups.io with SMTP id smtpd.web09.6099.1626266895603992484
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=YJwVG0it;
 spf=pass (domain: kpit.com, ip: 40.107.139.48, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxnX0vcxX49/uKJTihUo4FEzPdnvQq52Bl/mCzfecKQlm8jC1KgF7WroHzRNquv/LEqkhgGKqP00sm+wzjNrnEPLVk3fHiF6L2ti1jW2KMpfDeKlR0rDEvCr2Ubjf8Vw99WI2l2KEPRuxDREbtZ2cilbpvc3TNkRljpCF4HOYzImro5y1Vi9TOEsr7iXi22TV+GeJgWGjRPuHpupb976jPXs9rV7g9ncxZt0uK2eFEGxB1iBERxJYh7Y9Nuq+hMNMHV8gCo0juUu78xqXnVU60Md0NmvJG3gDjFrCrfAX/ReQrLqjj1uje4jCEvn1sV6y0ti02eyRBfyXSP+rp3ByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jezli5XJS7I/8WrrhTjBT2r6sUK1oauI550gnYzL5Z4=;
 b=PQxKhsKB8U3HyORKy0fQpyEnTdWc4WdBliSwF16RzN+TNgaFBtcaH7kpoH6VFGdUiex5JXcpNe0qAokNGtopKib8BZB3k9XUbTL1984B2LAQDodml+pGJRWp0yet5tZyARj5DgJgubiCOV6tUB6N/tvZ02ODdbcDsA0Oz4/iO0r8qUNSDCBCaPtusD47CpdPNOlKDB2eI8X0qf60RXMY9kQr0d9XDa3Py0CkuDuPdXMsysS3KU0pE07KihCZScWoOFmW06/5j/BfvJC8UvJskY5SZNY8/s1fR16Jsj9Iy68l5jpqMlVraK6LlW7bpWeXygdJte+83mokjT6m/5BBUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jezli5XJS7I/8WrrhTjBT2r6sUK1oauI550gnYzL5Z4=;
 b=YJwVG0its5qKCu1EE9SERRZ+vT6crej7iaQtQ/73cdtmbTwoUeTRzQ1TUjiOuTY16YVfUvQKrciZvpuxtRRcLJZLgixEe8bJEbSL45cxA+CDoJSBwqxJxlVDuU4CLdCaZEyoFiaNC/UCAfcMyE5D0QKTb12UFYIf5JBD7xdE2S0=
Received: from MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:78::11)
 by MA1PR01MB3420.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:75::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 12:48:09 +0000
Received: from MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e58d:b799:ba51:4fa5]) by MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e58d:b799:ba51:4fa5%7]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 12:48:09 +0000
From: "saloni" <saloni.jain@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, "nishaparrakat@gmail.com" <nishaparrakat@gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] openssh: Add fixes for CVEs reported for openssh
Thread-Topic: [OE-core] [poky][dunfell][PATCH] openssh: Add fixes for CVEs
 reported for openssh
Thread-Index: AQHXU+6+MF4D1oMctk6r4wSlqBqDqatCtOig
Date: Wed, 14 Jul 2021 12:48:09 +0000
Message-ID: 
 <MA1PR01MB41084D68932879F937B0770187139@MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM>
References: <20210528182415.22031-1-nishaparrakat@gmail.com>
In-Reply-To: <20210528182415.22031-1-nishaparrakat@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06542b95-4038-499c-c51f-08d946c5a23a
x-ms-traffictypediagnostic: MA1PR01MB3420:
x-microsoft-antispam-prvs: 
 <MA1PR01MB3420B14C1DDC651A4AB9253587139@MA1PR01MB3420.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Efqu5EZek17YJUX9PpDT8vaiuENCFOhfBZlQuoF2DU7P1r1wXkQiWUsrsUYJu0wvHFSZ7DqRglirQJ9rW51/VkgudmecSlXgO0Kfm36aqftsPi/CjER4519GDfXziRPDBTydFY+0HAiq4QdaObKRWvM/gNya0FjHWZGlOS+lZuAaLgseAe/cEq80ByBqtfBAg7PdhO2PTpKE7Uwg26+KUVULNvoRnwPN7aUDudR8wwrtTMvCuRlb2bNOE2TQxRa+cFLnsIkCxuc4xMoq1s1QwlWto2AyeU7lwXd0npZZUznJh25udJ8skJF78ldHQk9qbVLvlaJqubmLjcilzKF+/77fn9aHdtiiUB8z4cE13llbe2ivr/SfvF1ob44XBC4q6pmhsUhzL7xUyJGrmwvbOzwLWwkl1AQJ0dtgDRW7BcKMs11yNqqtIrj0GR+5RhzT75/HFuBxRp/BTi5zpY0M934YiAGDe22Da1hFkXT86ADmIh6w4oQGrEqb+dFCcrlmSpJJ9oxN/z2FCwAQg4wbUzNO985VgMfYBX4vABc1GI51ITZO4lsgyyHTQ0kNEPKy0Nu6KNpzB8MOgX79myJRNudeGZ4LuqBCEXn0DCAbk73DlT8MXl5ax3LhkApss4p++BBNxFBXpQ2JGp29bYc91lIZyXT/6s4iFL7nqAxly+gQ2BLWQUNrCIfAvbs5Aaa1/qjl64BGBQsRV4IHF7UtaJmyyuwJvFyy1tTmT55MaovorGXbcBouRsZuolF7SRcW27HBxWtNMsb/g2eTYIJ+pXKBU1dX8hO1B1pywDXTQKmVnyZegVcFOVgyjO80naoK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39850400004)(376002)(346002)(30864003)(18265965003)(18074004)(166002)(71200400001)(76116006)(122000001)(38100700002)(33656002)(66946007)(45080400002)(8676002)(83380400001)(478600001)(316002)(966005)(7696005)(55016002)(110136005)(9686003)(6506007)(66574015)(66446008)(64756008)(66476007)(2906002)(66556008)(186003)(52536014)(19627405001)(86362001)(8936002)(5660300002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?uwYGQr1MUFjAMWLeY3fnV109t3hd0Czyn/hqx9mYSsCmFytK2SGBOrDiAZoi?=
 =?us-ascii?Q?wmxDG0JyO4ej2ppWMBUKHcL9bp2CZ8e7c0d+PLUujeBvmRnlBvGbISBi1aPf?=
 =?us-ascii?Q?Pz5jiqXl38fw7XWRBrGW3mMPoHIWom2OnDWyj/jeXujPfmDsFdzLPkMP3SYr?=
 =?us-ascii?Q?fDNcH2Wes8W1yr76tMH1gKCQCihfcqKY6XMBqKLB8O7J/3/aiE3+m+hTc9dJ?=
 =?us-ascii?Q?CiYHfM53EJ6+UgvgUrAEmQsUMDS4ui5Y1Wh21wcc6iLJnMueT2FNKNllKZDF?=
 =?us-ascii?Q?6WRoLAPM4YPV5gD28L5+hO2sCvtvLJThwqTWMObEFozFrFujpZD/99OfWR8f?=
 =?us-ascii?Q?ktRlEzFIhVQ5lZdYJHBeMTuYiPWYLXuOwA0v/zD7SbBfqdYf8j85exK/W56g?=
 =?us-ascii?Q?yBynNNXlOP+otu2CPH/eQLProV6lKvyEUaJ4gvKZsjnY8n7WnRRYKo6/zOYB?=
 =?us-ascii?Q?PqFnYadaOpb8vRCXqrdUrs2LKggAKfet4ztTMhY4SEz0gaNPjt7P2689zweY?=
 =?us-ascii?Q?Ma/vMlnFjgnX7uWlbbRbasFgL+aRhL0CQ1fcRHT1HZggMqZn2M/tyhK3GFyV?=
 =?us-ascii?Q?gsGFAvDf3MINcoOVmhCRCdGCjMMmr6q4y9U++b7qajc25ZW/oI6PNRcR6hyp?=
 =?us-ascii?Q?BFtscLWMmCOOb4LTZNdunrUAorNNk5kWELOJiGE6uhnmzlv6ieOviOtWd/qo?=
 =?us-ascii?Q?pit18I60Z6YqETrSspj9pix3Qpwh3CtRxKRSixgMSLZDJz6cKmPtlS0nfclj?=
 =?us-ascii?Q?2Am9HzVFfZo6eS/Wym4O/WjY5UqqsLc36vTxgEvh68ucqyYKP4EGPEyBD4ES?=
 =?us-ascii?Q?3EaKw/dT3LnwEqgzzxq+5Om+YdzU4x0NFZuSqnm50uc23FZ0G6xsaAenh5O5?=
 =?us-ascii?Q?SlbirzmUVuE+Jarx4Dzt6n3Tbx8srzEQXXcX0GG5hVuNbNFxXvF+Ig+vDK1r?=
 =?us-ascii?Q?nClUR1kcgplS17cPEQx/RFLnBBxSlrgC6RjLYktwcHYpVcLMgesLdTMI084N?=
 =?us-ascii?Q?QRdj4BhcXwEg0mATlPjMLJcL9iReRF90nAI0IpxMy3g6uHFkFo+qOForNDFW?=
 =?us-ascii?Q?wKRrqYUvfm8hfZTLKxBb1EBxXE7ZvmlV6CJMnFpv0BSq3tkRMynTUSOAYPkR?=
 =?us-ascii?Q?SDG9yqTaebDbXbSKgsl4piQoytYX699vYDnBTXrIKW/Pvwj7gZcVOPP93Xxl?=
 =?us-ascii?Q?m8Rffmaqa/Lnj/56qaq8ROo6illi51FGtXc2xjd711mxqRNGdoNja+r1e9mQ?=
 =?us-ascii?Q?+Hcs799/JRasmnzIBX9vyTHnmlXWuPhEEBlRs06NTkGOMFYUMw+d+jy0su+n?=
 =?us-ascii?Q?7j2olGgssqtmME8erOtdUbO6xli8Q0jVwKaDdvJuZzl/wOp98ee3zPlZmt+w?=
 =?us-ascii?Q?pjn9Dx6T8izHm+rQMcc62tsbtUy8?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4108.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 06542b95-4038-499c-c51f-08d946c5a23a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 12:48:09.2029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H7AQNr2LN4t/MgRqxLg8PW3sJzCvWbCWunawRPkE+5AxONY8rUEQv56ZienfaE4YIA97P/G+U8hFd0ukeN4m8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB3420
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB41084D68932879F937B0770187139MA1PR01MB4108INDP_"

--_000_MA1PR01MB41084D68932879F937B0770187139MA1PR01MB4108INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Please take the below changes and merge them in upstream dunfell branch.

Thanks & Regards,
Saloni



Thanks & Regards,
Saloni
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Nisha Parrakat via lists.openembedded.org <nish=
aparrakat=3Dgmail.com@lists.openembedded.org>
Sent: Friday, May 28, 2021 11:54 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Sana Kazi <Sana.Kazi@kpit.com>
Subject: [OE-core] [poky][dunfell][PATCH] openssh: Add fixes for CVEs repor=
ted for openssh

From: Sana Kazi <Sana.Kazi@kpit.com>

Applied patch for CVE-2020-14145
Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fa=
nongit.mindrot.org%2Fopenssh.git%2Fpatch%2F%3Fid%3Db3855ff053f5078ec3d3c653=
cdaedefaa5fc362d&amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C9e4063537db7=
438df0b708d92205dda0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637578230=
901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D58nmotzZqm2Po%2BHL7cacUspoI2mp=
3bigzMX%2B7cXWPcs%3D&amp;reserved=3D0

Also, whitelisted below CVEs:

1.CVE-2020-15778:
As per upstream, because of the way scp is based on a historical
protocol called rcp which relies on that style of argument passing
and therefore encounters expansion problems. Making changes to how
the scp command line works breaks the pattern used by scp consumers.
Upstream therefore recommends the use of rsync in the place of
scp for better security. https://apc01.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1860487&amp;dat=
a=3D04%7C01%7Csaloni.jain%40kpit.com%7C9e4063537db7438df0b708d92205dda0%7C3=
539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C1000&amp;sdata=3DD7a5ndV1zxZZoyL1%2FQC4IDm2NfzdhZZqAVL2twU1fyg%3D&amp;r=
eserved=3D0

2.CVE-2008-3844: It was reported in OpenSSH on Red Hat Enterprise Linux
and certain packages may have been compromised. This CVE is not
applicable as our source is OpenBSD.
Links:
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
ytracker.com%2Fid%3F1020730&amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C9=
e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%=
7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DFocRMgY0OzvtyRPecXK=
2mZEPApTJHBpYj0iLAkhbE3Q%3D&amp;reserved=3D0
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.sec=
urityfocus.com%2Fbid%2F30794&amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C=
9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0=
%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV=
2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D19HGox5nLLnCLciNmH=
2%2F7rSXyY8CxeR2JPB14LdpdpY%3D&amp;reserved=3D0

Also, for CVE-2007-2768 no fix is available yet as it's unavoidable
drawback of using one time passwords as per
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2007-2768&amp;data=3D04%7C01%7Csaloni.=
jain%40kpit.com%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D=
kK%2BD5EqSg8Kzy4zwiRjExvJ0twLz4GmObWrZ8tgHkP8%3D&amp;reserved=3D0
Also it is marked as unimportant on debian
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2007-2768&amp;data=3D04%7C01%7Csaloni.=
jain%40kpit.com%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D=
FyhZJD1IsmrvacTdRJJv6xm3qpsjg7kuA3eIsw9iL48%3D&amp;reserved=3D0

Mailed to CPE to update database for CVE-2020-15778, CVE-2008-3844
and CVE-2007-2768. We can upstream CVE-2020-14145 till we recieve
response from CPE.

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 .../openssh/openssh/CVE-2020-14145.patch      | 97 +++++++++++++++++++
 .../openssh/openssh_8.2p1.bb                  | 13 ++-
 2 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020-1414=
5.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch=
 b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
new file mode 100644
index 0000000000..3adb981fb4
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
@@ -0,0 +1,97 @@
+From b3855ff053f5078ec3d3c653cdaedefaa5fc362d Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 18 Sep 2020 05:23:03 +0000
+Subject: upstream: tweak the client hostkey preference ordering algorithm =
to
+
+prefer the default ordering if the user has a key that matches the
+best-preference default algorithm.
+
+feedback and ok markus@
+
+OpenBSD-Commit-ID: a92dd7d7520ddd95c0a16786a7519e6d0167d35f
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ sshconnect2.c | 41 ++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 38 insertions(+), 3 deletions(-)
+
+CVE: CVE-2020-14145
+Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fanongit.mindrot.org%2Fopenssh.git%2Fpatch%2F%3Fid%3Db3=
855ff053f5078ec3d3c653cdaedefaa5fc362d&amp;data=3D04%7C01%7Csaloni.jain%40k=
pit.com%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff61502855=
c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D58nmotzZ=
qm2Po%2BHL7cacUspoI2mp3bigzMX%2B7cXWPcs%3D&amp;reserved=3D0]
+Comment: Refreshed first hunk
+
+diff --git a/sshconnect2.c b/sshconnect2.c
+index 347e348c..f64aae66 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: sshconnect2.c,v 1.320 2020/02/06 22:48:23 djm Exp $ */
++/* $OpenBSD: sshconnect2.c,v 1.326 2020/09/18 05:23:03 djm Exp $ */
+ /*
+  * Copyright (c) 2000 Markus Friedl.  All rights reserved.
+  * Copyright (c) 2008 Damien Miller.  All rights reserved.
+@@ -102,12 +102,25 @@ verify_host_key_callback(struct sshkey *hostkey, str=
uct ssh *ssh)
+        return 0;
+ }
+
++/* Returns the first item from a comma-separated algorithm list */
++static char *
++first_alg(const char *algs)
++{
++      char *ret, *cp;
++
++      ret =3D xstrdup(algs);
++      if ((cp =3D strchr(ret, ',')) !=3D NULL)
++              *cp =3D '\0';
++      return ret;
++}
++
+ static char *
+ order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port)
+ {
+-      char *oavail, *avail, *first, *last, *alg, *hostname, *ret;
++      char *oavail =3D NULL, *avail =3D NULL, *first =3D NULL, *last =3D =
NULL;
++      char *alg =3D NULL, *hostname =3D NULL, *ret =3D NULL, *best =3D NU=
LL;
+        size_t maxlen;
+-      struct hostkeys *hostkeys;
++      struct hostkeys *hostkeys =3D NULL;
+        int ktype;
+        u_int i;
+
+@@ -119,6 +132,26 @@ order_hostkeyalgs(char *host, struct sockaddr *hostad=
dr, u_short port)
+        for (i =3D 0; i < options.num_system_hostfiles; i++)
+                load_hostkeys(hostkeys, hostname, options.system_hostfiles=
[i]);
+
++      /*
++       * If a plain public key exists that matches the type of the best
++       * preference HostkeyAlgorithms, then use the whole list as is.
++       * Note that we ignore whether the best preference algorithm is a
++       * certificate type, as sshconnect.c will downgrade certs to
++       * plain keys if necessary.
++       */
++      best =3D first_alg(options.hostkeyalgorithms);
++      if (lookup_key_in_hostkeys_by_type(hostkeys,
++          sshkey_type_plain(sshkey_type_from_name(best)), NULL)) {
++              debug3("%s: have matching best-preference key type %s, "
++                  "using HostkeyAlgorithms verbatim", __func__, best);
++              ret =3D xstrdup(options.hostkeyalgorithms);
++              goto out;
++      }
++
++      /*
++       * Otherwise, prefer the host key algorithms that match known keys
++       * while keeping the ordering of HostkeyAlgorithms as much as possi=
ble.
++       */
+        oavail =3D avail =3D xstrdup(options.hostkeyalgorithms);
+        maxlen =3D strlen(avail) + 1;
+        first =3D xmalloc(maxlen);
+@@ -159,6 +192,8 @@ order_hostkeyalgs(char *host, struct sockaddr *hostadd=
r, u_short port)
+        if (*first !=3D '\0')
+                debug3("%s: prefer hostkeyalgs: %s", __func__, first);
+
++ out:
++      free(best);
+        free(first);
+        free(last);
+        free(hostname);
+--
+cgit v1.2.3
diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_8.2p1.bb
index 6ed54a8139..64a0a72a8f 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "https://apc01.safelinks.protection.outlook.c=
om/?url=3Dhttp%3A%2F%2Fftp.openbsd.org%2Fpub%2FOpenBSD%2FOpenSSH%2Fportable=
%2Fopenssh-%24&amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C9e4063537db743=
8df0b708d92205dda0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63757823090=
1384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DPp7eKEBz5q1T1q17mC%2FFDo9ta6OgJL=
ihdlV8z1L2nvU%3D&amp;reserved=3D0{PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patc=
h \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://CVE-2020-14145.patch \
            "
 SRC_URI[md5sum] =3D "3076e6413e8dbe56d33848c1054ac091"
 SRC_URI[sha256sum] =3D "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff=
8bcebdff64e671"
@@ -35,7 +36,17 @@ CVE_CHECK_WHITELIST +=3D "CVE-2007-2768"
 # and when running in a Kerberos environment. As such it is not relevant t=
o OpenEmbedded
 CVE_CHECK_WHITELIST +=3D "CVE-2014-9278"

-# CVE only applies to some distributed RHEL binaries
+# As per upstream, because of the way scp is based on a historical protoco=
l called rcp
+# which relies on that style of argument passing and therefore encounters =
expansion
+# problems. Making changes to how the scp command line works breaks the pa=
ttern used
+# by scp consumers. Upstream therefore recommends the use of rsync in the =
place of
+# scp for better security. https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1860487&amp;=
data=3D04%7C01%7Csaloni.jain%40kpit.com%7C9e4063537db7438df0b708d92205dda0%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637578230901384840%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&amp;sdata=3DD7a5ndV1zxZZoyL1%2FQC4IDm2NfzdhZZqAVL2twU1fyg%3D&am=
p;reserved=3D0
+CVE_CHECK_WHITELIST +=3D "CVE-2020-15778"
+
+# CVE-2008-3844 was reported in OpenSSH on Red Hat Enterprise Linux and
+# certain packages may have been compromised. This CVE is not applicable
+# as our source is OpenBSD. https://apc01.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fsecuritytracker.com%2Fid%3F1020730&amp;data=3D04%7C01=
%7Csaloni.jain%40kpit.com%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DFocRMgY0OzvtyRPecXK2mZEPApTJHBpYj0iLAkhbE3Q%3D&amp;reserved=3D0
+# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.=
securityfocus.com%2Fbid%2F30794&amp;data=3D04%7C01%7Csaloni.jain%40kpit.com=
%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D19HGox5nLLnCLci=
NmH2%2F7rSXyY8CxeR2JPB14LdpdpY%3D&amp;reserved=3D0
 CVE_CHECK_WHITELIST +=3D "CVE-2008-3844"

 PAM_SRC_URI =3D "file://sshd"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MA1PR01MB41084D68932879F937B0770187139MA1PR01MB4108INDP_
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
: 12pt; color: rgb(0, 0, 0);">
Hello,<br>
<div><br>
</div>
<div>Please take the below changes and merge them in upstream dunfell branc=
h.<br>
<div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;margin:0">
<div><br>
</div>
<div>Thanks &amp; Regards,</div>
<span>Saloni </span></div>
</div>
</div>
</div>
<br>
</div>
<div>
<div id=3D"Signature">
<div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div><br>
</div>
<div><br>
</div>
<div>Thanks &amp; Regards,</div>
<div>Saloni <br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Nisha Parrakat via lists.openembedded.org
 &lt;nishaparrakat=3Dgmail.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, May 28, 2021 11:54 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<br=
>
<b>Cc:</b> Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
<b>Subject:</b> [OE-core] [poky][dunfell][PATCH] openssh: Add fixes for CVE=
s reported for openssh</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
<br>
Applied patch for CVE-2020-14145<br>
Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fanongit.mindrot.org%2Fopenssh.git%2Fpatch%2F%3Fid%3Db3855ff053f50=
78ec3d3c653cdaedefaa5fc362d&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com=
%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D58nmotzZqm2=
Po%2BHL7cacUspoI2mp3bigzMX%2B7cXWPcs%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fanongit=
.mindrot.org%2Fopenssh.git%2Fpatch%2F%3Fid%3Db3855ff053f5078ec3d3c653cdaede=
faa5fc362d&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C9e4063537db743=
8df0b708d92205dda0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63757823090=
1384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D58nmotzZqm2Po%2BHL7cacUspoI2=
mp3bigzMX%2B7cXWPcs%3D&amp;amp;reserved=3D0</a><br>
<br>
Also, whitelisted below CVEs:<br>
<br>
1.CVE-2020-15778:<br>
As per upstream, because of the way scp is based on a historical<br>
protocol called rcp which relies on that style of argument passing<br>
and therefore encounters expansion problems. Making changes to how<br>
the scp command line works breaks the pattern used by scp consumers.<br>
Upstream therefore recommends the use of rsync in the place of<br>
scp for better security. <a href=3D"https://apc01.safelinks.protection.outl=
ook.com/?url=3Dhttps%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1860=
487&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C9e4063537db7438df0b70=
8d92205dda0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637578230901384840=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DD7a5ndV1zxZZoyL1%2FQC4IDm2NfzdhZZqA=
VL2twU1fyg%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.redhat.com%2Fshow_bug.cgi%3Fid%3D1860487&amp;amp;data=3D04%7C01%7Csaloni.=
jain%40kpit.com%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdat=
a=3DD7a5ndV1zxZZoyL1%2FQC4IDm2NfzdhZZqAVL2twU1fyg%3D&amp;amp;reserved=3D0</=
a><br>
<br>
2.CVE-2008-3844: It was reported in OpenSSH on Red Hat Enterprise Linux<br>
and certain packages may have been compromised. This CVE is not<br>
applicable as our source is OpenBSD.<br>
Links:<br>
<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fsecuritytracker.com%2Fid%3F1020730&amp;amp;data=3D04%7C01%7Csaloni.jain=
%40kpit.com%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff6150=
2855c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D=
FocRMgY0OzvtyRPecXK2mZEPApTJHBpYj0iLAkhbE3Q%3D&amp;amp;reserved=3D0">https:=
//apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecuritytrack=
er.com%2Fid%3F1020730&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C9e4=
063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C=
637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu=
MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DFocRMgY0OzvtyRPec=
XK2mZEPApTJHBpYj0iLAkhbE3Q%3D&amp;amp;reserved=3D0</a><br>
<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fwww.securityfocus.com%2Fbid%2F30794&amp;amp;data=3D04%7C01%7Csaloni.jai=
n%40kpit.com%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff615=
02855c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3D19HGox5nLLnCLciNmH2%2F7rSXyY8CxeR2JPB14LdpdpY%3D&amp;amp;reserved=3D0">h=
ttps://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.secu=
rityfocus.com%2Fbid%2F30794&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com=
%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D19HGox5nLLn=
CLciNmH2%2F7rSXyY8CxeR2JPB14LdpdpY%3D&amp;amp;reserved=3D0</a><br>
<br>
Also, for CVE-2007-2768 no fix is available yet as it's unavoidable<br>
drawback of using one time passwords as per<br>
<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fbugzilla.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2007-2768&amp;amp;data=3D04=
%7C01%7Csaloni.jain%40kpit.com%7C9e4063537db7438df0b708d92205dda0%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C10=
00&amp;amp;sdata=3DkK%2BD5EqSg8Kzy4zwiRjExvJ0twLz4GmObWrZ8tgHkP8%3D&amp;amp=
;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fbugzilla.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2007-2768&amp;amp;data=
=3D04%7C01%7Csaloni.jain%40kpit.com%7C9e4063537db7438df0b708d92205dda0%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C1000&amp;amp;sdata=3DkK%2BD5EqSg8Kzy4zwiRjExvJ0twLz4GmObWrZ8tgHkP8%3D&am=
p;amp;reserved=3D0</a><br>
Also it is marked as unimportant on debian<br>
<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-2768&amp;amp;data=3D04=
%7C01%7Csaloni.jain%40kpit.com%7C9e4063537db7438df0b708d92205dda0%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C10=
00&amp;amp;sdata=3DFyhZJD1IsmrvacTdRJJv6xm3qpsjg7kuA3eIsw9iL48%3D&amp;amp;r=
eserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-2768&amp;amp;data=3D=
04%7C01%7Csaloni.jain%40kpit.com%7C9e4063537db7438df0b708d92205dda0%7C35394=
51eb46e4a26a242ff61502855c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
1000&amp;amp;sdata=3DFyhZJD1IsmrvacTdRJJv6xm3qpsjg7kuA3eIsw9iL48%3D&amp;amp=
;reserved=3D0</a><br>
<br>
Mailed to CPE to update database for CVE-2020-15778, CVE-2008-3844<br>
and CVE-2007-2768. We can upstream CVE-2020-14145 till we recieve<br>
response from CPE.<br>
<br>
Signed-off-by: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
Signed-off-by: Nisha Parrakat &lt;nishaparrakat@gmail.com&gt;<br>
---<br>
&nbsp;.../openssh/openssh/CVE-2020-14145.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 97 +++++++++++++++++++<br>
&nbsp;.../openssh/openssh_8.2p1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 13 ++-<br>
&nbsp;2 files changed, 109 insertions(+), 1 deletion(-)<br>
&nbsp;create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020=
-14145.patch<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch=
 b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch<br>
new file mode 100644<br>
index 0000000000..3adb981fb4<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch<br>
@@ -0,0 +1,97 @@<br>
+From b3855ff053f5078ec3d3c653cdaedefaa5fc362d Mon Sep 17 00:00:00 2001<br>
+From: &quot;djm@openbsd.org&quot; &lt;djm@openbsd.org&gt;<br>
+Date: Fri, 18 Sep 2020 05:23:03 +0000<br>
+Subject: upstream: tweak the client hostkey preference ordering algorithm =
to<br>
+<br>
+prefer the default ordering if the user has a key that matches the<br>
+best-preference default algorithm.<br>
+<br>
+feedback and ok markus@<br>
+<br>
+OpenBSD-Commit-ID: a92dd7d7520ddd95c0a16786a7519e6d0167d35f<br>
+<br>
+Signed-off-by: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
+---<br>
+ sshconnect2.c | 41 ++++++++++++++++++++++++++++++++++++++---<br>
+ 1 file changed, 38 insertions(+), 3 deletions(-)<br>
+<br>
+CVE: CVE-2020-14145<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fanongit.mindrot.org%2Fopenssh.git%2Fpatch%2=
F%3Fid%3Db3855ff053f5078ec3d3c653cdaedefaa5fc362d&amp;amp;data=3D04%7C01%7C=
saloni.jain%40kpit.com%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;a=
mp;sdata=3D58nmotzZqm2Po%2BHL7cacUspoI2mp3bigzMX%2B7cXWPcs%3D&amp;amp;reser=
ved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fanongit.mindrot.org%2Fopenssh.git%2Fpatch%2F%3Fid%3Db3855ff053f5078ec3d3c=
653cdaedefaa5fc362d&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C9e406=
3537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63=
7578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D58nmotzZqm2Po%2BHL7=
cacUspoI2mp3bigzMX%2B7cXWPcs%3D&amp;amp;reserved=3D0</a>]<br>
+Comment: Refreshed first hunk<br>
+<br>
+diff --git a/sshconnect2.c b/sshconnect2.c<br>
+index 347e348c..f64aae66 100644<br>
+--- a/sshconnect2.c<br>
++++ b/sshconnect2.c<br>
+@@ -1,4 +1,4 @@<br>
+-/* $OpenBSD: sshconnect2.c,v 1.320 2020/02/06 22:48:23 djm Exp $ */<br>
++/* $OpenBSD: sshconnect2.c,v 1.326 2020/09/18 05:23:03 djm Exp $ */<br>
+ /*<br>
+&nbsp; * Copyright (c) 2000 Markus Friedl.&nbsp; All rights reserved.<br>
+&nbsp; * Copyright (c) 2008 Damien Miller.&nbsp; All rights reserved.<br>
+@@ -102,12 +102,25 @@ verify_host_key_callback(struct sshkey *hostkey, str=
uct ssh *ssh)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+ }<br>
+ <br>
++/* Returns the first item from a comma-separated algorithm list */<br>
++static char *<br>
++first_alg(const char *algs)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *ret, *cp;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D xstrdup(algs);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((cp =3D strchr(ret, ',')) !=3D NULL)<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; *cp =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
++}<br>
++<br>
+ static char *<br>
+ order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port)<br=
>
+ {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *oavail, *avail, *first, *last, *alg,=
 *hostname, *ret;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *oavail =3D NULL, *avail =3D NULL, *f=
irst =3D NULL, *last =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *alg =3D NULL, *hostname =3D NULL, *r=
et =3D NULL, *best =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t maxlen;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hostkeys *hostkeys;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hostkeys *hostkeys =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ktype;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u_int i;<br>
+ <br>
+@@ -119,6 +132,26 @@ order_hostkeyalgs(char *host, struct sockaddr *hostad=
dr, u_short port)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; options.nu=
m_system_hostfiles; i++)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; load_hostkeys(hostkeys, hostname, options.system_hostfiles=
[i]);<br>
+ <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If a plain public key exists that =
matches the type of the best<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * preference HostkeyAlgorithms, then=
 use the whole list as is.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Note that we ignore whether the be=
st preference algorithm is a<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * certificate type, as sshconnect.c =
will downgrade certs to<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * plain keys if necessary.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; best =3D first_alg(options.hostkeyalgorith=
ms);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lookup_key_in_hostkeys_by_type(hostkey=
s,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sshkey_type_plain(=
sshkey_type_from_name(best)), NULL)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; debug3(&quot;%s: have matching best-preference key type %s, &quot;<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;using HostkeyAlgorithms verbatim&quot;,=
 __func__, best);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ret =3D xstrdup(options.hostkeyalgorithms);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; goto out;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Otherwise, prefer the host key alg=
orithms that match known keys<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * while keeping the ordering of Host=
keyAlgorithms as much as possible.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oavail =3D avail =3D xstrdup(op=
tions.hostkeyalgorithms);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; maxlen =3D strlen(avail) + 1;<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first =3D xmalloc(maxlen);<br>
+@@ -159,6 +192,8 @@ order_hostkeyalgs(char *host, struct sockaddr *hostadd=
r, u_short port)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*first !=3D '\0')<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; debug3(&quot;%s: prefer hostkeyalgs: %s&quot;, __func__, f=
irst);<br>
+ <br>
++ out:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(best);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(first);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(last);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(hostname);<br>
+-- <br>
+cgit v1.2.3<br>
diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_8.2p1.bb<br>
index 6ed54a8139..64a0a72a8f 100644<br>
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb<br>
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb<br>
@@ -24,6 +24,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://apc01.safelink=
s.protection.outlook.com/?url=3Dhttp%3A%2F%2Fftp.openbsd.org%2Fpub%2FOpenBS=
D%2FOpenSSH%2Fportable%2Fopenssh-%24&amp;amp;data=3D04%7C01%7Csaloni.jain%4=
0kpit.com%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DPp=
7eKEBz5q1T1q17mC%2FFDo9ta6OgJLihdlV8z1L2nvU%3D&amp;amp;reserved=3D0{PV}.tar=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://fix-potential-signed-overflow-in-pointer-arithmatic.patch">
file://fix-potential-signed-overflow-in-pointer-arithmatic.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://sshd_check_keys">file://sshd_check_keys</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://add-test-support-for-busybox.patch">file://add-test-support-for-=
busybox.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2020-14145.patch">file://CVE-2020-14145.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[md5sum] =3D &quot;3076e6413e8dbe56d33848c1054ac091&quot;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;43925151e6cf6cee1450190c0e9af4dc36b41c12=
737619edff8bcebdff64e671&quot;<br>
@@ -35,7 +36,17 @@ CVE_CHECK_WHITELIST +=3D &quot;CVE-2007-2768&quot;<br>
&nbsp;# and when running in a Kerberos environment. As such it is not relev=
ant to OpenEmbedded<br>
&nbsp;CVE_CHECK_WHITELIST +=3D &quot;CVE-2014-9278&quot;<br>
&nbsp;<br>
-# CVE only applies to some distributed RHEL binaries<br>
+# As per upstream, because of the way scp is based on a historical protoco=
l called rcp<br>
+# which relies on that style of argument passing and therefore encounters =
expansion<br>
+# problems. Making changes to how the scp command line works breaks the pa=
ttern used<br>
+# by scp consumers. Upstream therefore recommends the use of rsync in the =
place of<br>
+# scp for better security. <a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1=
860487&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C9e4063537db7438df0=
b708d92205dda0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637578230901384=
840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DD7a5ndV1zxZZoyL1%2FQC4IDm2NfzdhZ=
ZqAVL2twU1fyg%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.redhat.com%2Fshow_bug.cgi%3Fid%3D1860487&amp;amp;data=3D04%7C01%7Csaloni.=
jain%40kpit.com%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdat=
a=3DD7a5ndV1zxZZoyL1%2FQC4IDm2NfzdhZZqAVL2twU1fyg%3D&amp;amp;reserved=3D0</=
a><br>
+CVE_CHECK_WHITELIST +=3D &quot;CVE-2020-15778&quot;<br>
+<br>
+# CVE-2008-3844 was reported in OpenSSH on Red Hat Enterprise Linux and<br=
>
+# certain packages may have been compromised. This CVE is not applicable<b=
r>
+# as our source is OpenBSD. <a href=3D"https://apc01.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Fsecuritytracker.com%2Fid%3F1020730&amp;amp=
;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C9e4063537db7438df0b708d92205dda0=
%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637578230901384840%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C1000&amp;amp;sdata=3DFocRMgY0OzvtyRPecXK2mZEPApTJHBpYj0iLAkhbE3Q%3D=
&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
ytracker.com%2Fid%3F1020730&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com=
%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DFocRMgY0Ozv=
tyRPecXK2mZEPApTJHBpYj0iLAkhbE3Q%3D&amp;amp;reserved=3D0</a><br>
+# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fwww.securityfocus.com%2Fbid%2F30794&amp;amp;data=3D04%7C01%7Csaloni.=
jain%40kpit.com%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdat=
a=3D19HGox5nLLnCLciNmH2%2F7rSXyY8CxeR2JPB14LdpdpY%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.sec=
urityfocus.com%2Fbid%2F30794&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.co=
m%7C9e4063537db7438df0b708d92205dda0%7C3539451eb46e4a26a242ff61502855c7%7C0=
%7C0%7C637578230901384840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D19HGox5nLL=
nCLciNmH2%2F7rSXyY8CxeR2JPB14LdpdpY%3D&amp;amp;reserved=3D0</a><br>
&nbsp;CVE_CHECK_WHITELIST +=3D &quot;CVE-2008-3844&quot;<br>
&nbsp;<br>
&nbsp;PAM_SRC_URI =3D &quot;<a href=3D"file://sshd">file://sshd</a>&quot;<b=
r>
-- <br>
2.17.1<br>
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

--_000_MA1PR01MB41084D68932879F937B0770187139MA1PR01MB4108INDP_--
