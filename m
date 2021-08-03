Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.1101.1627966276293880707
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 21:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UCb1vKKQ;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3849e838b0=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1734aS1w019695
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Aug 2021 21:51:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=05nIwVHHTxTf/ytqkKUCrZB15VFzBcAbyqBAUi34I1E=;
 b=UCb1vKKQdMcY+Wfrp9oVYTz1C/EiduWIqK7/Ll41uAxc0Y4lHa0uNUs80UCitGQwhHdR
 PkukRPQw1QbyI4B1a346bMJRvgbExhHo12wNTpN0AHlXEfmllK4XvseyofiREQwOCDe8
 eZcWuCn5uDPtqCuUot1KkWxdZVedNXvu+1eLvS1+bW/p4XQEJ2lRVb2Gsp8Ow0Y7hAO1
 6bHUdEQduQTDNuAwEvv0lEz18d9YpxzvmOklenM80Oy8gxBqC8vWyLKG7ILOHlalQMoc
 9+LbDfp23pMtKwSH+C/UR3LM2TpodKv6YRTqI897lMxyD23Kad3nL6j4ODiLWbOyWXGX DA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a68kjrsw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 21:51:15 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1734pFqc012433
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Aug 2021 21:51:15 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a68kjrsw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Aug 2021 21:51:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liTXsLrRrOFbbtStvCgx98f0cRgkWcNctzDSrddCKedUhIAQPY3joZeW4VbrvVAMPuWmatBHBzCbc+iHsNY3/BXXPwhdBt4q8xcdOAj4g2CAXrTRR56A9ZeYrVEA0qpOBeCLEz8qfO5+qNaH3qYf72V1WDJSfuV4QH52wXk+M469rzb7rcZ4Zh54V4f7m8DQSU1OSK+7rwdlpTHZOsHoeIW28LlZEzMYjTOLZrC+azPye+rT4QJjbusjZky3TNgi8AFRlSWFpVQdKYwFIB5i5/LkY8vxjMPNmaCYjvrLwu6vBHeonQ3lyst/I2x5eY72oEVDhROCEmz7Wy7dj8KGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05nIwVHHTxTf/ytqkKUCrZB15VFzBcAbyqBAUi34I1E=;
 b=lvjSDQYm6g1/pTEnmC1eua78sg8oT+/43bQw/pgoiyZhRushZdnecHKaFopYFh4YUTFLSo9kE+oucYlUx7iiXln9ovKBN+E8BFqLApODzxFF06yyfGupD3hk7JKkkPbHAiHzHz1sGfi21dYRUiU98lFf4TqzklsMFtJCCagc9o8LO+zqpwLtj8z8v4QpypbWUxIrOBn1vI2dSnSD21vRmeeZ4WtgQg/bYcT+J8sVSXH6STLUKDw2WaVsDdgaWjpXO/ZGkoR6PxOuoC2hAHKanKSRU4yHXkK96dIDYurLJK6sZNturGs6821QmyFcXOU1y+BkLoTbSi8CqgFtaJAxqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5635.namprd11.prod.outlook.com (2603:10b6:5:35f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 3 Aug
 2021 04:51:12 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::24fe:fb1b:ce1e:d109]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::24fe:fb1b:ce1e:d109%9]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 04:51:12 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] gobject-introspection: fix default search path for girdir
Thread-Topic: [OE-core][PATCH] gobject-introspection: fix default search path
 for girdir
Thread-Index: AQHXh54DGF9ElbpP70yFwqSq5WfA4qthNlOl
Date: Tue, 3 Aug 2021 04:51:11 +0000
Message-ID: 
 <CO6PR11MB56021A3A8E66FB735C3CF3B4EDF09@CO6PR11MB5602.namprd11.prod.outlook.com>
References: 
 <20210802062543.101415-1-Qi.Chen@windriver.com>,<CANNYZj_OVpNG31euNAgWYbCQ-PBr1A-wQvJmaJGRVnXxQQ0-Pw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_OVpNG31euNAgWYbCQ-PBr1A-wQvJmaJGRVnXxQQ0-Pw@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc6c8ddf-028f-413e-ec40-08d9563a5151
x-ms-traffictypediagnostic: CO6PR11MB5635:
x-microsoft-antispam-prvs: 
 <CO6PR11MB5635DF74E0D8383E3BCD746EEDF09@CO6PR11MB5635.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HrnIrvjIw37w3v6LIrZpOIUrt0951kdKCirsLc/IvKmTePR86XEUaa6E6aXgRBUGvP1/YzRMAzyXXHFiHnDIy5H8lrVnzzc/nmLJj92nHxQqNpoWBe3MosriusaRe0I9F+Scb49FBgJIHQ1iKUNq8A98liKqgKzq+HoZHtsqzpDwQcO4MxDPWBsSvBa1t/lP8O2AwN+Q6v2cTa4JTof52uKPquLgGxG94/qMaVF5PIRRuSMKYJlG+pps1yR4cJw3Hn5H1uW6tgMCox1AOBHhTOrLWTNHzQn3gqAra6AuxoBkfTgwGcbajmEEBmKnP8TGqj1RzOjEreRbxeYfjtaG7PHSEhsq8nmtutQLccalNgi3eRFEjwpGwmpI/0GfwIK7YUFtFESyRu1XH+nxSxRW77jfzKKeseZqoHRGTZ7TpJ0HBLbnckeJ71ySPrc0mKETUw6LKuNK8Tr9VNjyhYqtE/u+iwPoNj6UCxDsz7ymrhXzGSGmH2OTqZxT1nGBHntdg4r1q+KXygmFg5sF0nGmpnopfgNXLBcqOm/mCznQYBq50qPLI8WCjI3dT6Ejp1Udc0KNB1Q4z0cGzvQRhUynN/PdwKoV4S4oesWfW6+/cgWKH8VsHSto1tT4Za9UsRgFlSP0FK/2M9I/n4PJPL2yOqL7Bqt4IGp+yI/b34bkvcr/hoQRbMf12B+PFtqKQ13t+biFlrm6IEN0tEeQzdXNLa0eDQ6RraUct12H33KACWhcXFu/LR5DNBxXNI7h+xsKAluY9jG+KFQy2h6KCyWjH9RtCbrXlBcNv/uL+daopKM4CgyJczIcJIaqkzZT7imjMOh5IAVUHj9SKFPM9Ar0Ew==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39850400004)(366004)(346002)(52536014)(8936002)(6506007)(53546011)(478600001)(8676002)(71200400001)(316002)(166002)(4326008)(76116006)(66476007)(19627405001)(83380400001)(66556008)(186003)(9686003)(7696005)(66446008)(64756008)(55016002)(6916009)(38070700005)(66946007)(38100700002)(122000001)(91956017)(2906002)(26005)(33656002)(86362001)(966005)(5660300002)(9126006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?FSdTqwSzFR7r6mKeoZ4gpE9gTbwmSxiPiit8c6Nw3r2rpjvFF0qUxnmohzam?=
 =?us-ascii?Q?7JXZngBDPtr8ddWQVDB5nA+W+T0Hx3H3EjpkUTDW8btKhSiJ4fgW6ge/okOs?=
 =?us-ascii?Q?43JPl62+o7oW9WFeZ9XpXV2QuBO8G7TgkqLn+VaY8N4Nw4hOepG1ZRJZkp8n?=
 =?us-ascii?Q?E17I+yCZnPOD9356k6tUotgFUD6vc7VrTOHwYuaOghSLXziRkz+HVOECMssF?=
 =?us-ascii?Q?Ew0oFEELd03oJEyx4hC+xIaBpEslQR5QMe5mnQmA8Snl2VeGcHQOR1VtMs25?=
 =?us-ascii?Q?6SVcQTI51EIaGRIZN000a/w1ZHpm+1Oh9/F7VcK0Z77bNAH6gXknSr9x4vso?=
 =?us-ascii?Q?TPJmzwE1t2FFj1KKsgeUMXz/Pd5bYeuA/SBZ2pwxOSplqBoKtP2ZwBOx0Y1d?=
 =?us-ascii?Q?LZsIEn1+9HlZtw86AsYUKafHe1dvD6I0l6akCP2xYfFl1ww2Fp3hzXejGS52?=
 =?us-ascii?Q?1FqX1b9lS54So4A0bEt41Uqz5jcxjgfWN2z5iHsd7ZkL06tm/aCtLstO5U6L?=
 =?us-ascii?Q?KfCLdJOwg1Wx3IkVVqbgNqrIwmCSZZ8gdnbvx3qAi2o7n+qYR9dhRlu+OdDe?=
 =?us-ascii?Q?t9NnukQKYn1rTb21+QYrXlJlKHWWImyChVdYHqMtoAN8V1ztJcVqFp1ocqwo?=
 =?us-ascii?Q?dyAHvxQ0n9np9NszqoaRhA56IbxNiNwdPhfIzC1nf3fcNC4P05vATmh61yU1?=
 =?us-ascii?Q?WLCfLx8wgr9HXFsv4EDJ9o94YOuAhu+ia7N5PzCLIvppNxLiFX9gtP6HqOkU?=
 =?us-ascii?Q?9liODp2IAuMaBj8QkixQKvf8YYSR55Bx44c0bi+dd4o3dexDbGmW2rVqoilw?=
 =?us-ascii?Q?zSeQkbUjtB8Ljm52Xa2GLctKKC90ZwF7uexmdI5cgdlOgIyr3OlyUJDR7Z0/?=
 =?us-ascii?Q?+1Ca8GSw9vkhApEhHUR6lsWcLzbQKMfLMCXCenbxcm1Zw+G39F2PE8oJWBdH?=
 =?us-ascii?Q?wzqWSI+GlrKvyj/sFl2V6xR81cSLhvMoGSSAr7zMEOvQBoTWPR5jlSV+U8jL?=
 =?us-ascii?Q?uhNysmez0q6gajDoH4k7jLF5hg45N5agep2y5PpGevT5FAlH+VLmWfy1FvpN?=
 =?us-ascii?Q?INOtahl17nRXHizTCNfmStjxLEASnfXVMUlqDucBnsOqcdyHnnfNryPM/DNm?=
 =?us-ascii?Q?8bJtnoTfRCjc52bnhYENEoTwgXOPFU3+WCY8qrljFmRrsfpxC53KC9Xiwu1p?=
 =?us-ascii?Q?2S7pEdscbApE9MxWIdIrsZAQgWiRBwe7xKImzh/WqZvdkqiNFh1Dp1hWZPHm?=
 =?us-ascii?Q?/h50pU6qAvtDSmvjOikYSD7XHtxnwDWlw1/ze3ScNkiOoAMpr2kZVaMaEck9?=
 =?us-ascii?Q?QTs=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6c8ddf-028f-413e-ec40-08d9563a5151
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2021 04:51:12.1155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: POkQXyia/sUWpxWJ+nKDG9FrXApa2YNvA4chdu5NeX+WsdNGqxSGuKFCMlJRsHczJXbmx1f4MIROsS4y/x47uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5635
X-Proofpoint-ORIG-GUID: La7QxoXfAUWfQ38SuPj2eOKmDoXh5n2C
X-Proofpoint-GUID: xKwvbfgUDbOCl9iZlqPm3cjZpfsU9hJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-02_10,2021-08-02_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108030030
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB56021A3A8E66FB735C3CF3B4EDF09CO6PR11MB5602namp_"

--_000_CO6PR11MB56021A3A8E66FB735C3CF3B4EDF09CO6PR11MB5602namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I didn't notice the previous email.
The reason that it's not seen on autobuilder is that it's runtime error.
At build time, it uses a wrapper which adds extra parameters including the=
 correct path. That's why we didn't see any error at build time.

Regards,
Qi
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Monday, August 2, 2021 20:57
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] gobject-introspection: fix default search pa=
th for girdir

The concerns are the same as the previous time this patch was submitted:

This is not seen in the autobuilder, how can it be reproduced?

Also, please submit upstream first.


Alex

On Mon, 2 Aug 2021 at 08:25, Chen Qi <Qi.Chen@windriver.com<mailto:Qi.Chen=
@windriver.com>> wrote:
When running g-ir-scanner, we get the following error:

  Couldn't find include 'GObject-2.0.gir' (search path:
  '['/usr/lib64', 'gir-1.0', '/usr/local/share/gir-1.0', '/usr/share/gir-1=
.0',
  '/usr/share/gir-1.0', '/usr/share/gir-1.0']')

This is because g-ir-tool-template.in<https://urldefense.com/v3/__http://g=
-ir-tool-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpck=
k63XwzQq-riVTsPB7qUVyKRXwDEQ$> is not setting girdir correctly.
It's using the prefix instead of the actual girdir.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com<mailto:Qi.Chen@windriver.com=
>>
---
 ...-ir-tool-template.in-fix-girdir-path.patch | 33 +++++++++++++++++++
 .../gobject-introspection_1.68.0.bb<https://urldefense.com/v3/__http://go=
bject-introspection_1.68.0.bb__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkk=
oD52jcpckk63XwzQq-riVTsPB7qUVzZmyFvTA$>           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-intro=
spection/0001-g-ir-tool-template.in-fix-girdir-path.patch

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspectio=
n/0001-g-ir-tool-template.in-fix-girdir-path.patch b/meta/recipes-gnome/gob=
ject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-gir=
dir-path.patch
new file mode 100644
index 0000000000..c0d263946b
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-=
g-ir-tool-template.in-fix-girdir-path.patch
@@ -0,0 +1,33 @@
+From b01b448613b76f9acefdfd89ee01686dc7a67df4 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com<mailto:Qi.Chen@windriver.com>>
+Date: Tue, 13 Jul 2021 02:05:11 -0700
+Subject: [PATCH] g-ir-tool-template.in<https://urldefense.com/v3/__http:/=
/g-ir-tool-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcp=
ckk63XwzQq-riVTsPB7qUVyKRXwDEQ$>: fix girdir path
+
+In case gir_dir_prefix is set, it's possible that g-ir-scanner
+cannot find the .gir files. This is because that the girdir
+is set to gir_dir_prefix, which is wrong. It's not a prefix,
+it the actual gir dir.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com<mailto:Qi.Chen@windriver.co=
m>>
+---
+ tools/g-ir-tool-template.in<https://urldefense.com/v3/__http://g-ir-tool=
-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq=
-riVTsPB7qUVyKRXwDEQ$> | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/g-ir-tool-template.in<https://urldefense.com/v3/__http=
://g-ir-tool-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52j=
cpckk63XwzQq-riVTsPB7qUVyKRXwDEQ$> b/tools/g-ir-tool-template.in<https://ur=
ldefense.com/v3/__http://g-ir-tool-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy9=
2u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVyKRXwDEQ$>
+index 6e98f52e..62c07c31 100755
+--- a/tools/g-ir-tool-template.in<https://urldefense.com/v3/__http://g-ir=
-tool-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63=
XwzQq-riVTsPB7qUVyKRXwDEQ$>
++++ b/tools/g-ir-tool-template.in<https://urldefense.com/v3/__http://g-ir=
-tool-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63=
XwzQq-riVTsPB7qUVyKRXwDEQ$>
+@@ -55,7 +55,7 @@ builtins.__dict__['DATADIR'] =3D datadir
+
+ # Respect gir_dir_prefix
+ girdir =3D ''
+-girdir =3D os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@=
'))
++girdir =3D os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@=
', 'gir-1.0'))
+ builtins.__dict__['GIRDIR'] =3D [girdir]
+
+ # Again, relative paths first so that the installation prefix is relocat=
able
+--
+2.30.2
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspectio=
n_1.68.0.bb<https://urldefense.com/v3/__http://gobject-introspection_1.68.0=
.bb__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7=
qUVzZmyFvTA$> b/meta/recipes-gnome/gobject-introspection/gobject-introspect=
ion_1.68.0.bb<https://urldefense.com/v3/__http://gobject-introspection_1.68=
.0.bb__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsP=
B7qUVzZmyFvTA$>
index 048deabe64..647511f7ad 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.=
0.bb<https://urldefense.com/v3/__http://gobject-introspection_1.68.0.bb__;!=
!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmy=
FvTA$>
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.=
0.bb<https://urldefense.com/v3/__http://gobject-introspection_1.68.0.bb__;!=
!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmy=
FvTA$>
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc434e8128a68b=
edd59b80b2ac1eb1c4a \

 SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}=
/${BPN}-${PV}.tar.xz \
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapp=
er.patch \
+           file://0001-g-ir-tool-template.in-fix-girdir-path.patch \
            "

 SRC_URI[sha256sum] =3D "d229242481a201b84a0c66716de1752bca41db4133672cfcf=
b37c93eb6e54a27"
--
2.30.2





--_000_CO6PR11MB56021A3A8E66FB735C3CF3B4EDF09CO6PR11MB5602namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
I didn't notice the previous email.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
The reason that it's not seen on autobuilder is that it's runtime error.</=
div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
At build time, it uses a wrapper which adds extra parameters including the=
 correct path. That's why we didn't see any error at build time.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Regards,
<div>Qi</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &l=
t;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Monday, August 2, 2021 20:57<br>
<b>To:</b> Chen, Qi &lt;Qi.Chen@windriver.com&gt;<br>
<b>Cc:</b> OE-core &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH] gobject-introspection: fix default se=
arch path for girdir</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div>The concerns are the same as the previous time this patch was submitt=
ed:</div>
<div><br>
</div>
<div><span class=3D"x_gmail-im">
<div dir=3D"auto">This is not seen in the autobuilder, how can it be repro=
duced?</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Also, please submit upstream first.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
<div>Alex<br>
</div>
</span></div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Mon, 2 Aug 2021 at 08:25, Chen =
Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&g=
t; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bor=
der-left:1px solid rgb(204,204,204); padding-left:1ex">
When running g-ir-scanner, we get the following error:<br>
<br>
&nbsp; Couldn't find include 'GObject-2.0.gir' (search path:<br>
&nbsp; '['/usr/lib64', 'gir-1.0', '/usr/local/share/gir-1.0', '/usr/share/=
gir-1.0',<br>
&nbsp; '/usr/share/gir-1.0', '/usr/share/gir-1.0']')<br>
<br>
This is because <a href=3D"https://urldefense.com/v3/__http://g-ir-tool-te=
mplate.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-ri=
VTsPB7qUVyKRXwDEQ$" rel=3D"noreferrer" target=3D"_blank">
g-ir-tool-template.in</a> is not setting girdir correctly.<br>
It's using the prefix instead of the actual girdir.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
&nbsp;...-ir-tool-template.in-fix-girdir-path.patch | 33 +++++++++++++++++=
++<br>
&nbsp;.../<a href=3D"https://urldefense.com/v3/__http://gobject-introspect=
ion_1.68.0.bb__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQ=
q-riVTsPB7qUVzZmyFvTA$" rel=3D"noreferrer" target=3D"_blank">gobject-intros=
pection_1.68.0.bb</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +<b=
r>
&nbsp;2 files changed, 34 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-=
introspection/0001-g-ir-tool-template.in-fix-girdir-path.patch<br>
<br>
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspectio=
n/0001-g-ir-tool-template.in-fix-girdir-path.patch b/meta/recipes-gnome/gob=
ject-introspection/gobject-introspection/0001-g-ir-tool-template.in-fix-gir=
dir-path.patch<br>
new file mode 100644<br>
index 0000000000..c0d263946b<br>
--- /dev/null<br>
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-=
g-ir-tool-template.in-fix-girdir-path.patch<br>
@@ -0,0 +1,33 @@<br>
+From b01b448613b76f9acefdfd89ee01686dc7a67df4 Mon Sep 17 00:00:00 2001<br=
>
+From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_bla=
nk">Qi.Chen@windriver.com</a>&gt;<br>
+Date: Tue, 13 Jul 2021 02:05:11 -0700<br>
+Subject: [PATCH] <a href=3D"https://urldefense.com/v3/__http://g-ir-tool-=
template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-=
riVTsPB7qUVyKRXwDEQ$" rel=3D"noreferrer" target=3D"_blank">
g-ir-tool-template.in</a>: fix girdir path<br>
+<br>
+In case gir_dir_prefix is set, it's possible that g-ir-scanner<br>
+cannot find the .gir files. This is because that the girdir<br>
+is set to gir_dir_prefix, which is wrong. It's not a prefix,<br>
+it the actual gir dir.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" targe=
t=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
+---<br>
+ tools/<a href=3D"https://urldefense.com/v3/__http://g-ir-tool-template.i=
n__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qU=
VyKRXwDEQ$" rel=3D"noreferrer" target=3D"_blank">g-ir-tool-template.in</a> =
| 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/tools/<a href=3D"https://urldefense.com/v3/__http://g-ir-too=
l-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQ=
q-riVTsPB7qUVyKRXwDEQ$" rel=3D"noreferrer" target=3D"_blank">g-ir-tool-temp=
late.in</a> b/tools/<a href=3D"https://urldefense.com/v3/__http://g-ir-tool=
-template.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq=
-riVTsPB7qUVyKRXwDEQ$" rel=3D"noreferrer" target=3D"_blank">g-ir-tool-templ=
ate.in</a><br>
+index 6e98f52e..62c07c31 100755<br>
+--- a/tools/<a href=3D"https://urldefense.com/v3/__http://g-ir-tool-templ=
ate.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTs=
PB7qUVyKRXwDEQ$" rel=3D"noreferrer" target=3D"_blank">g-ir-tool-template.in=
</a><br>
++++ b/tools/<a href=3D"https://urldefense.com/v3/__http://g-ir-tool-templ=
ate.in__;!!AjveYdw8EvQ!J_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTs=
PB7qUVyKRXwDEQ$" rel=3D"noreferrer" target=3D"_blank">g-ir-tool-template.in=
</a><br>
+@@ -55,7 +55,7 @@ builtins.__dict__['DATADIR'] =3D datadir<br>
+ <br>
+ # Respect gir_dir_prefix<br>
+ girdir =3D ''<br>
+-girdir =3D os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@=
'))<br>
++girdir =3D os.path.abspath(os.path.join(filedir, '..', '@gir_dir_prefix@=
', 'gir-1.0'))<br>
+ builtins.__dict__['GIRDIR'] =3D [girdir]<br>
+ <br>
+ # Again, relative paths first so that the installation prefix is relocat=
able<br>
+-- <br>
+2.30.2<br>
+<br>
diff --git a/meta/recipes-gnome/gobject-introspection/<a href=3D"https://u=
rldefense.com/v3/__http://gobject-introspection_1.68.0.bb__;!!AjveYdw8EvQ!J=
_A1otd5YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmyFvTA$" rel=3D"=
noreferrer" target=3D"_blank">gobject-introspection_1.68.0.bb</a>
 b/meta/recipes-gnome/gobject-introspection/<a href=3D"https://urldefense.=
com/v3/__http://gobject-introspection_1.68.0.bb__;!!AjveYdw8EvQ!J_A1otd5YXy=
92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmyFvTA$" rel=3D"noreferrer=
" target=3D"_blank">gobject-introspection_1.68.0.bb</a><br>
index 048deabe64..647511f7ad 100644<br>
--- a/meta/recipes-gnome/gobject-introspection/<a href=3D"https://urldefen=
se.com/v3/__http://gobject-introspection_1.68.0.bb__;!!AjveYdw8EvQ!J_A1otd5=
YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmyFvTA$" rel=3D"norefer=
rer" target=3D"_blank">gobject-introspection_1.68.0.bb</a><br>
+++ b/meta/recipes-gnome/gobject-introspection/<a href=3D"https://urldefen=
se.com/v3/__http://gobject-introspection_1.68.0.bb__;!!AjveYdw8EvQ!J_A1otd5=
YXy92u0Rt13BFCPh2oDkkoD52jcpckk63XwzQq-riVTsPB7qUVzZmyFvTA$" rel=3D"norefer=
rer" target=3D"_blank">gobject-introspection_1.68.0.bb</a><br>
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc434e812=
8a68bedd59b80b2ac1eb1c4a \<br>
<br>
&nbsp;SRC_URI =3D &quot;${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version(&q=
uot;${PV}&quot;, 2)}/${BPN}-${PV}.tar.xz \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-giscanner-ignore-err=
or-return-codes-from-ldd-wrapper.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0001-g-ir-tool-template.i=
n-fix-girdir-path.patch \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;d229242481a201b84a0c66716de1752bca41db4=
133672cfcfb37c93eb6e54a27&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote>
</div>
</div>
</body>
</html>

--_000_CO6PR11MB56021A3A8E66FB735C3CF3B4EDF09CO6PR11MB5602namp_--
