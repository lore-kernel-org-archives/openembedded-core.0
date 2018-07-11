Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 21573 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Jul 2018 05:14:11 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0099.outbound.protection.outlook.com [104.47.0.99])
	by mail.openembedded.org (Postfix) with ESMTP id 4BBB374E1A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 05:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=E5McpUTF8I40hEsqHLFZyGS1UGFH/unExPxZLE8ezm8=;
	b=eZl7LePlxp0L1hq5Gn74RLz/XQHftELQ2XiRSc2slFN0G80NFbtHxlsqZW6geVrSjFziBaHtLmn5g76TPv3vVc1iCA6EzApSr3YezAj2GQFDv63hJkQM/GkFOuS65rgN0G0smDMknEdy5QbxMbxA8v6ND/Xa01DQA7wnI3zuc0I=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from prevas-ravi.prevas.se (81.216.59.226) by
	VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:e5::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.952.17;
	Wed, 11 Jul 2018 11:39:10 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2018 13:38:56 +0200
Message-Id: <20180711113856.7518-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: AM5P194CA0002.EURP194.PROD.OUTLOOK.COM
	(2603:10a6:203:8f::12) To VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:800:e5::11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 529def66-43d2-4960-f1fc-08d5e722eb2f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600053)(711020)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR1001MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	3:VIFQiBbjQ+cUjaeqgmVVJqqNgpMPLPK4OmYbmSr0s4SoFxDRgCHM9ZrEA8UuFTGh1VeELGt+3Btbm6QDXc2RzSq6MNZ7TN73DkbeBm5XoOkJba1LJfF+iuGPIJMlbi6i+jDcDDO1LIG4VBbIxIDlYb1awrbACLlT36FU4eJ8POx+lcl3OPBv8WUQpqmFvBiejA7AFohdjZuegpwuqHek5wBlItvCI2VVCwp+8Df0kVw04If9sq9K0YBcnVusF+QG;
	25:uvU6DZcZVoOvv5r5V13dZDbB04troY0Xtsv5y4oloAa2xq0m+NzlT6oh+8gVioDlYYY2FEvt5pioTuHyfhHPgBRrA/hKLVVL5ZQabKCsMc9u5c0ON6iJl4waa5uk/rx495Vy6ExDxwfdLvHoOUT+5qVLDza7Eti0eQAknDmJVSLnI/00+zRDzPNAZJPAA2qni9kYo8qxrbjOrMVQIBL+N4n7cgEXcrPx9rcIKRZLSbThNRlhuonqFmer9pluCiK5CIZLWzee8oNvzmdkwbYuZ91SWQMP0qdQIiVUvcIVQbqU+JIGkSUzvYcJyAEhY/1H5yWStygvGP0TkbLa+SUQWA==;
	31:B+uZg6Y4SOR62LvTyegZUfLc2Jv0K2VifCndaosLyKJd+ygTc29pVQWGbOVhT71XFhn6pYnNF043dMvpaB20LjDi+gQNhgBid6XT9WJONZ2EVyeoCXZ40GCsh5VzyNhpv8BQOc5zkYRMJmzRGDWhvTDEvFsKwX0/A7x1BlxgyGUz46/h5kIromL/JyY5Ctt/wjmkMj381ouv3GknehxJwYy+zrct9lJlZ37jmErKmtc=
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1342:
X-Microsoft-Antispam-PRVS: <VI1PR1001MB1342618C5D1CFD4711C2E4C98A5A0@VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(3231311)(944501410)(52105095)(10201501046)(93006095)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:VI1PR1001MB1342; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR1001MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	4:VFVVAZbLRagTCtiN9n9oIz1Kmu3UfYZb9PCA4MPOUEKMALMUc/Ir3CtjGCgTLJBDAeZjCaHok4N3aEd4lkHxfN9wlcsZpaLv7Zp3//zMS8c2AKq6Z/JwDttfSd2j4Irkx7viBvBB7Kze5IukyT/D5OhWBSjVCLBut8Ss8Tuaupn1uVR0ChHhhTRCA8uoNWjSzhMh1juHlcAXsqIHZt4VNsZhe+55ai6GTB640/XPpWd82xY9kTSrJx56H0Hgx2ICvL0apFxfIaPuqy4UyQRGcw==
X-Forefront-PRVS: 0730093765
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(39850400004)(396003)(136003)(366004)(189003)(199004)(8936002)(316002)(8976002)(81166006)(44832011)(81156014)(50226002)(36756003)(66066001)(48376002)(2906002)(47776003)(8676002)(6512007)(486006)(476003)(2616005)(956004)(25786009)(305945005)(1076002)(7736002)(68736007)(6486002)(50466002)(14444005)(74482002)(69596002)(6116002)(3846002)(6666003)(6916009)(2351001)(105586002)(26005)(72206003)(5660300001)(107886003)(16586007)(106356001)(2361001)(4326008)(54906003)(16526019)(53936002)(186003)(6506007)(478600001)(386003)(42882007)(51416003)(53416004)(97736004)(52116002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR1001MB1342;
	H:prevas-ravi.prevas.se; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR1001MB1342;
	23:XK1UG59UwM14vJLykInXke+d/n/rhPrWvty+5Fb?=
	=?us-ascii?Q?ogyt8qtboz8mG1ARvjyFdnYMnir3r6BrcKUa8zH1+IKV1SlLgjArMwhJx4d0?=
	=?us-ascii?Q?WBSVg4UCKT3Y3131Hj8/t8nAJcQq7amIMwhQpjOYX72Zw0Y6ZSBIcgUuI8ya?=
	=?us-ascii?Q?/AzC+to2Igbm3YaObuwtgt7NNPbjP42ADy1pC9QaiBIcsO6n9xsrtegtKYhJ?=
	=?us-ascii?Q?dvPoR4HDxs90JV8RcKVpbQIL4YD0I4XhOcn9dvHh/Vjvjzr6RkTrG3og8OBw?=
	=?us-ascii?Q?bBTwoUWS+RHz2rgSsTi8WymdXwWddF4s2RK3x4/y6lLLf7ufHhE+u8q9LSte?=
	=?us-ascii?Q?0VSHN/VFuEaqxJZaEKk+o4gZ13ZtRCFFGoBcmG3T21QsW7MTgc8Y/sbE3tos?=
	=?us-ascii?Q?xrvliaNJn+vZK2czG+5cvo4/5JWsnqrCpZbfPEbKIdScB8uBrqYREUjth7dz?=
	=?us-ascii?Q?cgpMRXr44mltVs8DzOhfnzngi3uGlcToCmbRWMU306imifHl+6INn+esRhyu?=
	=?us-ascii?Q?3zHK2/o/9kI9ZXB0q11U/CVNHCGvAelyON41gm6C6k+3JCKuKE1ZWfX+bWBB?=
	=?us-ascii?Q?087aV9az4ofgpA32RYXg1rRoVmkVMUe0c+JYtD+t0ppGirVhMFtPSpEj+zM1?=
	=?us-ascii?Q?LAUgDjvUsK8uzE75DPSCq0CfMCZxuPwpGNW8PZotmqSDhiEyeEET6X9zgld7?=
	=?us-ascii?Q?bu3aVFGiePcTfxChHktUUuyH4wg4QACurwGkQhnEMozqjyi59uXFNCLi4HYk?=
	=?us-ascii?Q?3Jqw9KZfDkR4WORG5x1LCfn2Hb/axjay46faykUA7Pp+2+leCsXus1wEJEwS?=
	=?us-ascii?Q?6Z8xqT7tMhqm6ZaJtFV3iwOQxZPllEMPJgaHZ2B04T1grpPop5JbXhJzOpbc?=
	=?us-ascii?Q?0+yI+UD5t4ISdp3u3dSf1zphwhqiD5pMjpAyWrL5hwUxXYPEwwiW1bLZlYBa?=
	=?us-ascii?Q?79wDHblhmJC/V1jVyRCW3uMNhDwFe0XUpH/TsMISLHFcpSxvluk3KHOU+rMK?=
	=?us-ascii?Q?Vc9X7GoLYHQDyTQYYPAdk2IyWPQau3oQ+izgJdt1gXgErSPZoJLw7Ht/A0ux?=
	=?us-ascii?Q?j23YGmRUJ/Tv4NHnAkSYMTazoPc7oK6F7eVYxbmHRw/Ax1m/HfjlrjeK7nMc?=
	=?us-ascii?Q?6GJe1rS+Sz3wP8ajQXSuargcapoy0Ptmnkr/pu911ZyXbrSVD3wrfY4fCx6G?=
	=?us-ascii?Q?7YSFxXKF7GoHe8gmaccbNi7/vDs9cHqRqwM795rwrBS0rBnDph0Aa4IULyGe?=
	=?us-ascii?Q?vSApklM2GDF5EH19p4Zzdz3meRDI13xHPSLjayXOsphHras1Q0gEj5i2rD4w?=
	=?us-ascii?Q?KlKAK+W8L3OFy/HkK08jPQuN3YnkBVaGgS5MyLsOO+MTy9ZjIU8ycmv2O1Uk?=
	=?us-ascii?Q?TKoUVog=3D=3D?=
X-Microsoft-Antispam-Message-Info: bSInsUoXM3JLHr3ryh2ycj8hdkIJH5LHdOC3U0tma5drIH3/AO2rzg7WsISmYhXb9Le8D2dHhiQDGD+pRW8kKLwFiLhi1swpDPnEhJYtnPEc+XnGJDDM2SdCKQe4N1vcn1ERrDXQIq1DOKtwEJNxRd1Q17BjP5Gi0fAXGGF/S8SuuaRYjsBm9XeccAN6EjDjBhBMo8x/GYdilj9kS9fT9cvaA6u2aECICqbLD45wasU2lZvVVU2BFgTRBKb0DRaH44qfXtNk0HJw4g3oZ9wPpHGhU9vsq7jxs7DMaW/fOD00KlXKr/NeedIvoqKAsNfqjJAuLJURk7JrVgGkqSdN4uJ2aNyhwBDvaWBgv1ahzgY=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	6:/WTrXvOwzpiCMwpYNSLa0j1r64cpeyeHRm36NJrDy8VnCxSQp9HlJcTLaZNcDHBngdhjhXly0aVOVZnrDl35Ps5sXvKN+KG6G5Clzryo18PV7P8Pp1tK+OdmQq7hA3BFGhs/GMCH5YxIVQN8XvP6NHTmEqiGjz7mGUzsoEmVvKi6WMDsgJMoqN9bAaPfaSQQ7NZ2h4ElrHvnt38uSN06X0cK4KbBdFOdSu570e4a0VT8Nt8kqDAJ3kiQp/GU6cpmIC+/wsbQ/AycXs2dt6CB+XgoUWxeR3H851UrunnZliSNBwBn+vWvUt59CcERF9wIDsJ7rhOoHRE2yDD6DQ/Lek/duZ2UafbKOv5EgvqG/PM/9Qc467lh2NqxLX7WwGNFj4N+NlaXGz7rzSHn4KkGRLgqx1C4ngaAjMa/QDJVJ1R0UfJ9/oJqbKH5wAXoBIJqZcDNIKg73jVHuWJ+RxelEw==;
	5:iOIynP6d25dbjurJRuJbrhoWH57tVKg5P7ZLiUzt32b9DDn/uzxkJeQxSoDpB1M4LFzO0OlGsejMx4f+bo/9bJGYTnKN7JvTLiC4juNTDJHmtVh2VocmVOuneHG1fYHbL7usbwiURssGs9SOZIrbH+g2Kn3Q2yzLijdZXy5JguQ=;
	24:ENpKyZ9f4FZ+gpZMsBk4sqbvzqpKl73unl2lHUrRUqiKrDBlNlzAmzDLB+g5fX5+zf/QjyzqdYWNiC2XuotNpsfsffnynf0Fm7B1fr3L7vY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	7:BpjzsKVPy4aA1DVI6YArWgunuRxC37JIbjnInPy6t+JOee5bY4CfkjOH6y9DAQ+Gp3Q2eUGt6XSD56Ys+CPdG5triGXBXr82IdJlETd21OLWMMODHn4q4qb2zYe2aDycobikIGkNjUOrZkU1gGVb5KZ242f4f15SebH7ttN1s2NGmZJvZcRPyxE5kgZHiVtI5f0si3fHuYF++RqQMar2MEfvsjaJ565qAeNTuW9i5KRbshFmPKD0OVmaH6Sury3m
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2018 11:39:10.0422 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 529def66-43d2-4960-f1fc-08d5e722eb2f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1342
Cc: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
Subject: [RFC PATCH] package.bbclass: improve -dbg and -src package ordering
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
X-List-Received-Date: Thu, 12 Jul 2018 05:14:12 -0000
Content-Type: text/plain

nativesdk-gpgme fails package_qa when setting PACKAGE_DEBUG_SPLIT_STYLE
= "debug-with-srcpkg".

ERROR: nativesdk-gpgme-1.10.0-r0 do_package_qa: QA Issue: non debug package contains .debug directory: nativesdk-python3-gpg path /work/x86_64-nativesdk-oesdk-linux/nativesdk-gpgme/1.10.0-r0/packages-split/nativesdk-python3-gpg/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python3.5/site-packages/gpg/.debug/_gpgme.cpython-35m-x86_64-linux-gnu.so [debug-files]

This turns out to be because the automatic moving of the -dbg package to
the beginning of the package list is disabled in that case, so the
python3-gpg packages that the recipe prepends to PACKAGES ends up before
the -dbg package.

It's not clear why the "and not split_source_package" was added when
debug-with-srcpkg was introduced. Presumably the intention was to
prevent the -dbg package to end up before the -src package, which we of
course need to. But at the same time, we still need -dbg packages to end
up before all other packages.

Using list.insert(0, ...) also means that if there happens to more than
one -dbg package, their relative ordering gets inverted in the new list.

This tries to fix these issues by sorting the packages by (priority,
original position), where priority is 10 for -src, 30 for -dbg and 50
for everything else. That guarantees that packages of the same "type"
preserve their relative ordering, while also ensuring that -dbg always
preceed other packages. This scheme is also quite extensible, and,
should the need arise, one could even expose the priorities as a knob
the recipe author could use to ensure specific orderings of packages
instead of the somewhat fragile and coarse-grained method of "prepend or
append, and ensure you do that in a proper order".

Probably the autodebug condition needs to stay, but I think the
split_source_package condition in the preceding elif should be removed,
so that that logic applies to all packages called -src, not just the one
we might have created a few lines above.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/classes/package.bbclass | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8276046369..72b9c66c3b 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1151,21 +1151,22 @@ python populate_packages () {
 
     # Sanity check PACKAGES for duplicates
     # Sanity should be moved to sanity.bbclass once we have the infrastructure
-    package_list = []
+    package_dict = {}
 
-    for pkg in packages.split():
-        if pkg in package_list:
+    for i, pkg in enumerate(packages.split()):
+        if pkg in package_dict:
             msg = "%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg
             package_qa_handle_error("packages-list", msg, d)
         # If debug-with-srcpkg mode is enabled then the src package will have
         # priority over dbg package when assigning the files.
         # This allows src package to include source files and remove them from dbg.
         elif split_source_package and pkg.endswith("-src"):
-            package_list.insert(0, pkg)
-        elif autodebug and pkg.endswith("-dbg") and not split_source_package:
-            package_list.insert(0, pkg)
+            package_dict[pkg] = (10, i)
+        elif autodebug and pkg.endswith("-dbg"):
+            package_dict[pkg] = (30, i)
         else:
-            package_list.append(pkg)
+            package_dict[pkg] = (50, i)
+    package_list = sorted(package_dict.keys(), key=package_dict.get)
     d.setVar('PACKAGES', ' '.join(package_list))
     pkgdest = d.getVar('PKGDEST')
 
-- 
2.16.4


