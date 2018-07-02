Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 16559 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 03 Jul 2018 03:13:06 UTC
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60102.outbound.protection.outlook.com [40.107.6.102])
	by mail.openembedded.org (Postfix) with ESMTP id 19C1178930
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 03:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RuT9s3cZTLBKqbWWGU4uQTuyI0UUkCS6qDfBOdPMBGg=;
	b=iQZAXUXbdCSwDiZGTgi5frm2mJcBXzGvDHJu2g2GlsLCVV2eHdAaqlFrGzF6d/QaSg77KwRZGyO8TObGZapybUK1ScZ06KhvR5wEY3VAnHI41F/t8ivU9Hb5YigivK6M9zEAzH9+rFzfLdsPBTguxhdjs3PoDPzU3xFmPjASANU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from prevas-ravi.prevas.se (81.216.59.226) by
	VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:e5::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.906.20;
	Mon, 2 Jul 2018 13:28:22 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2018 15:28:06 +0200
Message-Id: <20180702132806.13059-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: AM6PR03CA0005.eurprd03.prod.outlook.com (2603:10a6:20b::18)
	To VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:800:e5::11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdec0063-46b6-4320-b1ed-08d5e01faec1
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600053)(711020)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR1001MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	3:7jv6Yaos6YuJO3sMG6g2Y7vSyyhWmjXnnYZHp6eiN4ivCJd9o0SKwWtOlMIgzk8nI1vitwCpuXNdEhUtm+QmbpIy1w+hDtt65t6Z2O2CUM4ek9q8hZhKK2OyzPunnJRNIn39PsX6O4Jy8thUdYBxboQ08rmbIvQhvoY75LKbF83W23cDDvMHsWN8qNSjZCh7OIw90DQ8pP1FLrPuMGbMoeNZgjg2admv0rUCxKu2UNp0p5nFX4ycOANE2kTRjWyp;
	25:PHXkJgxrOCB1+uJxdICqX2aopK2EVAuFmpRari1rGs/uLaIb3pAZWp5r4eerdlSalPo3xqcC25nkXlBCZbLmSGwm5ZmtJ+WRgHHAcWm9a1IZ9eSEKlbCq6/pqbjw2Jd6EItx7lRDlBMIeUUBh7gGuhyRtP+Krb0UqbDp3pvD6IbF1F2SIff+NMHBoysAE/MTRvJxqOfDWK+ASEWImTIV+bz1K3/DQF/TQGiZhruYiH5RglJt9DL27LlvH45CjB+YJJNpywJSyA42Z6V20X4nIdIxiP1AM281FEP7jAWWSdnzHVn3SO1GlAnIAcur41Y2TvwXrU6O49HhQNXOhPvqHg==;
	31:cPza1dN19Uoob87xx0K0BQtr/sl9jBBi6pKE/f8Cgp/GeHaW1QWhzDeE2/tplw9Mz72w+rdjgV4igvu0PlacCLYBD4pFbpdg9PcjOyHZmoCdCGlG/pQO2b5jso/3rHCEqCTy11KY1Ml7TIMlc+WFFjLG0/vqdILzOA1mtgrsbFoPweaksCyBX+yRdvLvz5hBMc3byStFPqlRyuhZGw7BRA7KyO9ES8Y/cID050npVNs=
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1342:|VI1PR1001MB1342:
X-Microsoft-Antispam-PRVS: <VI1PR1001MB134277546C5189106ED445758A430@VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(3231254)(944501410)(52105095)(10201501046)(3002001)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:VI1PR1001MB1342; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR1001MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	4:kqXjw/QSfXi1/rvPygKa7dPuSTi/Y5jWFUXup9fKaXbI+xTFg/Kk9vge/Q79QGbVvNxmxJkVtYlrpZT7x+/kxuOt1dtX9M9SF6V2JUANuK8iAR+5+kncGOsUyIvOXIYqc0VCDbl9wpEawYX7PmOeIEMgxPGSUf6MChou5ts0chmoihavF2HWMwrCohaR+dg0e+GucX18jgDMHm6irTHWop23a3bDbMcE/ShoPQchQuNJh8LMBeUMYyG6NsqRXna9teN6vtxZffAJq4PY1UHIKg==
X-Forefront-PRVS: 07215D0470
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(136003)(376002)(366004)(346002)(39850400004)(396003)(199004)(189003)(105586002)(97736004)(16586007)(486006)(16526019)(66066001)(186003)(6666003)(52116002)(50466002)(5660300001)(51416003)(53416004)(4326008)(476003)(69596002)(8936002)(42882007)(305945005)(36756003)(44832011)(26005)(48376002)(316002)(2351001)(6506007)(386003)(956004)(6916009)(2616005)(74482002)(478600001)(6512007)(1857600001)(7736002)(106356001)(47776003)(2906002)(81166006)(14444005)(81156014)(72206003)(68736007)(2361001)(25786009)(6486002)(53936002)(3846002)(6116002)(50226002)(1076002)(8676002)(8976002)(107886003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR1001MB1342;
	H:prevas-ravi.prevas.se; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR1001MB1342;
	23:PxbHDXHCxboVbu0tlnhuI67NbDE+Ze6GDOg/MrW?=
	=?us-ascii?Q?PFFEKkA0ccFVyp5Sq/Xi+cgUKA21IKEcou43RpL2SDxl5VYHiErZss20EOjZ?=
	=?us-ascii?Q?6H/OFJLimYbm9T/XZP9xTs4DZ7q9GKHstm+6ICbpJbASueKrGKBbI63MOmlE?=
	=?us-ascii?Q?Nwax6nmIyd6mYjbcXQiM5d6UQGIvkCV6Gus+X2Tv8btAVT/+EE5iQx8+4NzC?=
	=?us-ascii?Q?LNUsAB/jUMwvtNmDri2HaTLWlSdI5q8ptlVrS70LGoGhI+A7a4L4PNxCI+IR?=
	=?us-ascii?Q?EKqY+m9/CD5dPdn1JWAE0SrfocPebamwhhyQ3uBck1J2vkMWu+9AER9iuN9d?=
	=?us-ascii?Q?iKIBnkm17PSJPDpDHJcRVIRx/KxbuZ7ci2TxvNb7dSgpXyW05lRIUpD3Mkaq?=
	=?us-ascii?Q?r+TTpa23wnO5dFtiD4V+3ESUQ+/9gpSq54wrzjI2CWo4vh9MmsolkSSFZnYv?=
	=?us-ascii?Q?wLlPrzaH+sVcj38I0yy7CfPDGGyC2sQdxihvGauYI9ITaW2Y4pwRgDDBei2/?=
	=?us-ascii?Q?HPwQZt1DAuaTKkI01DjhX//TUdA69Vh9LYPPouIW+j/N9VfKDWNJkoKUdoFb?=
	=?us-ascii?Q?hbWQYCHRMbo7bX1bnTWdoKhhnvnEhk63rbEdl9o/9++CeB9PA8vIXzekzzPK?=
	=?us-ascii?Q?NfTzakwGJvbk9XRAnwWV6Cpws9Iv/VfsliRbWYJ0McuTnFynKA+oQmNIQtml?=
	=?us-ascii?Q?QRrAu+SfBTPzcf5eFeuEJNEepOSepR8tIZ2UjgLvQK6aUdEWAprmqskvx3zL?=
	=?us-ascii?Q?MIw//M1n9Aa2AgpVVu1gAa+DYdoecTUk3wkV2C1WNO8yC6QAw3pcZg1k1usH?=
	=?us-ascii?Q?izwET8IJwnUpu7MwAw2XAJZ3jb/y8r3AUv6FLTH5NHWUm2Gux/mnY/1/IHoM?=
	=?us-ascii?Q?pgBk3Khm0ev5H2Zzong9dIStVR+EFK6MrPNvAY61T1XeqvmEHHByH3hMORx6?=
	=?us-ascii?Q?cQDn7vw+4ri0kauPtxPnIeUjW1S43avpZ4RuyEswKK5XhDxaz36eWHNkLFEK?=
	=?us-ascii?Q?qPNUUIFNA385JriurE1FXuS08id/TZyeEehLFWsDOpfPnmQJBYDIUXDJXlSq?=
	=?us-ascii?Q?62uQwc0/eH6mwEP43mqMFAdMsVg+5U88Exo1hYiiZeGKnT/JCBv6rU85rM1p?=
	=?us-ascii?Q?PmJp4zEQCpgsmg9AIM58ZBgJ9M9e09FwjYFf5h/ulgrEJ3thINxDR78wkXOm?=
	=?us-ascii?Q?0/3gBI42iNKoHXzTk224rYF1s4wnVLN+jgpK4ykdI8kEXwy+YGRJVTzTwgrz?=
	=?us-ascii?Q?23jkNerSnyzZpOiNuBe6XqNRYGb/MWTFJZDjq87qpBm+xOSVloEtV8IucIwp?=
	=?us-ascii?Q?4hxtc8WCpq4gLWxGl666+sGE93u6exdj+2NwxeU/Z/76s4hDDuFa6aAk+l+V?=
	=?us-ascii?Q?RZ9Kerw=3D=3D?=
X-Microsoft-Antispam-Message-Info: 5SkqIiTSYxjrUr1Q0ruwO/BDT1p1C7d0jvh87+WwO8QE4Ih9lc9yZGP5FUbMX3BePxVenQZvbzNzJE0T0Lh9jXui4gE6Bwga+UoetWdYt1jc6nAGLfWBEVepYVkxkfGbJ6fqNixDpnEQCYYVItCIDYvXXyhmkZSW9sT7Yd07avL/8IvYIfUQBjoYRGL21heyLvO1jvP6YX5WkBTz+ouBlAd/rbzIobET69zJFeE+eiYm4rZtKUnW8IQ+N4/5FxyMHONKyLWlnACfUGofY633v9vieCoEHs6qWrrSV5ofQK0cztXCBLA7VA7kBQwAZ8Vt/ONZIf6XGCrV91uXVtUydPDEE99lr/YRq4s77YYHMBc=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	6:4/GUiRlZgJJaAYuy2FwioZZ48clNNNBPgPVRIvEtNYHGuNdO2YfpOzpQfRSdmouWcHTFwC6/1MFi5RpiJ/yFPbrSRun+rpijcTbqpIx3FnXkzZOxkGia9WTulOZf1x1E0IL/fPg3mTX7snWxWSCF32GlIp4JUf+Xmi//av7C7CADvmdBLyAGveBrv9yE5un/KPqA+Ww53PG4HcEKmiI1ZKg5LrRjgMci3gym1eHfqOBvZVmZoov5DfKJ5ja4ujZCn/TGlDVN4IDGXm5B8iJDoZ6K415Ph2KLCtIG9ZgrIR/QShiTC7FUbaAo/kG+Vnk0X/Siep33pnyork/3awTbWs2MN+eEHqYl9cVaXepzxw9kB8n98iuvkR20/+0zatHwJUWOy6fLQkEt8oVmnUlXVM9sEpq/xK0bQJOhJS2GedKuYC6K4DJ5igjTgp2eblZdZqrQ9nyXzQnere3KkjubuA==;
	5:/l83LVTtNs1wAxEay/pKg0TyTGyaFFs8qV4uU1Nrwo+MMMPh4rGNtC5nE4onCocA4ZiHdqjELPMeGoik6xZVWEKKiwgnhmChK8lEXStJLMVeASvnCBj8gC/4IGD93854DmnTyHIYteugxapgTuxz8gt7nSqHUJXNH/khdaMHNXY=;
	24:h3E6m5q9h2xsYTg9oADp4/44Ar7X2uK2+thX/hTG/YRlhtxeuqzvc2JkRm0HTdcLxHyIH4v/AooRCNtCvP3zVBIngyDDyepG364e9Utyu44=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	7:u7yFL75fUMSXWgiqH6aUHMaIeKXbBWAz8IEfSBylYutBMZwDi6wWBwxfmlolpJvkDlk4wdvwDG/xhpSziSJ7l1rZ2YgPYGLo9juuaejUk8QbtyRtn7Kcn2kyrX48GtT+lcB/8lKlMT9zaAm+rw3Z9IdW9AvOJJd2lvdonxLW297uPrmzKREW/j84YvJowXNUjzH/L9Z2wXeuebHtuGWe/mPJMNnMQ+cqNg0K/twIk5AMxFBUs2L89mZ15zYYIL51;
	23:OVHDKbxnOVFx4AfIVOWW9/r7V1ZRiCaKG3666FMDONQDbZsKoLfR5c3WE8KLFAQbPU4NByVJgaEdQn6g7rCvY8xEDwkyG9q11gV8VSraQBkIcsgKQqj8cTju1RfWe1SP6ny+/9tFea9FEKKRr5b2UA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2018 13:28:22.0888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdec0063-46b6-4320-b1ed-08d5e01faec1
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1342
X-OriginatorOrg: prevas.dk
Subject: [PATCH] util-linux: alternatify fstrim
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2018 03:13:07 -0000
Content-Type: text/plain

I hit

update-alternatives: Error: not linking [...]/rootfs/sbin/fstrim to /bin/busybox.nosuid since [...]/rootfs/sbin/fstrim exists and is not a link

The solution seems to be to tell the alternatives system that util-linux
can also provide fstrim.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-core/util-linux/util-linux.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 8b633e9ac6..8d8f3962ff 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -75,7 +75,7 @@ FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 
 FILES_util-linux-agetty = "${base_sbindir}/agetty"
 FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${BPN}"
-FILES_util-linux-fstrim = "${base_sbindir}/fstrim"
+FILES_util-linux-fstrim = "${base_sbindir}/fstrim.${BPN}"
 FILES_util-linux-cfdisk = "${base_sbindir}/cfdisk"
 FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
 FILES_util-linux-swaponoff = "${base_sbindir}/swapon.${BPN} ${base_sbindir}/swapoff.${BPN}"
@@ -245,6 +245,9 @@ ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
 ALTERNATIVE_util-linux-fdisk = "fdisk"
 ALTERNATIVE_LINK_NAME[fdisk] = "${base_sbindir}/fdisk"
 
+ALTERNATIVE_util-linux-fstrim = "fstrim"
+ALTERNATIVE_LINK_NAME[fstrim] = "${base_sbindir}/fstrim"
+
 ALTERNATIVE_util-linux-agetty = "getty"
 ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
 ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
-- 
2.16.4


