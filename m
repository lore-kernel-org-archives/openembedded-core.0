Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.47])
 by mx.groups.io with SMTP id smtpd.web11.12825.1616766387383045928
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 06:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=eokYQpBM;
 spf=pass (domain: kpit.com, ip: 40.107.139.47, mailfrom: purushottam.choudhary@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqSexbBM/JiX869XTe/J8A2C9iA+aktOOMfmTHU2BMQXyYmoMuD9CuKYfnzAKCD5Ku584UisvokE+ahyNuSud3adIfEu9d2Bdjb9lTUYrE2P9f9/GVBREprxPkn3OCPWzMoseVsayHNUed7p6XKuODn3tNO+FGT6qbxJPRlBhcMS8xgf+1u4J1JVYsEzHIvc4tBkXDHnfAWeudaoWimYjoVGXyINNP25sjQbyaJ7hE7gQ8ZdxinKO4xXYhmwyNBcuCSfYQxwS4yjsFnJ506ZNIBihenbcUFBPJrQp9lSgXbxPnPMyR54URqkcu2EzK6rovkBy8p8VOE6riKUcPr5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ob9/rAB8P0OFlcjvyBKA/hrVBOt8UH37WCzmN6Bl6eM=;
 b=kjzIT35jqyLhpipYRGXdmvSeawktxfjFDbvEtZIrrKhBHGVTzVYyAklfpa7Ge83Q8uyKSuuxlegPkQQ6+/NQ/8JylSHZscS+WLk+3MEQHaXUtlTVzKGjfAEpS6pVNM/Uq4MBgQut4UsiCYUmWchVnch/RmQDiGFrWgVZdSEZIcq2YN69QA7XxdNQEgzs8a8m7hotd2QKlKeQwji9Z5Z58g3Szh6TN/rTJVD8+LL/HXav14+tJEcpqY0nsGhjFPpxEO0JmSG01ttSDvzp7VSvjkHzwQmG1a4A6O5usIRBC8Be1Mgga5X9h1hCOhHLLB4SJ6pN+X3aumgXdgnL0mAotA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ob9/rAB8P0OFlcjvyBKA/hrVBOt8UH37WCzmN6Bl6eM=;
 b=eokYQpBM63NZUbPe5joP103dIaQ2wBU1/5sgMdV7Xdgz2MjwsLq8OwUnXLZ6/WA5Jp+TaBOYwqDxkNTZjHSi0tkSmlM4eBQPcoxKaS1dT4TBT54FxEf1cbIGfM4fwmySlc9UskjTUnj6vI7w2XRDg0lVLdaHzxffRz8bvI5GypA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1c::9)
 by PN1PR0101MB1646.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:17::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Fri, 26 Mar
 2021 13:46:13 +0000
Received: from PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ec0c:730d:7fe9:9cd6]) by PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ec0c:730d:7fe9:9cd6%7]) with mapi id 15.20.3977.025; Fri, 26 Mar 2021
 13:46:13 +0000
From: "Purushottam choudhary" <purushottam.choudhary@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com
Subject: [poky][dunfell][PATCH] buildhistory.bbclass: store MAINTAINER variable
Date: Fri, 26 Mar 2021 19:16:04 +0530
Message-Id: <1616766364-22994-1-git-send-email-purushottam.choudhary@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2405:201:a410:a032:4d1e:ffb5:cb07:ac8f]
X-ClientProxiedBy: PN2PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::7) To PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1c::9)
Return-Path: purushottam.choudhary@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2405:201:a410:a032:4d1e:ffb5:cb07:ac8f) by PN2PR01CA0032.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:22::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 13:46:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ee567aed-1e88-4b0c-49a4-08d8f05d84bd
X-MS-TrafficTypeDiagnostic: PN1PR0101MB1646:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN1PR0101MB1646960489BA1D3FCA5BD37690619@PN1PR0101MB1646.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2Lck2UBpn2dq8fuUsKjiNA+h+689lCLk0mh0ZOJzCGyho2T0GAmm/Gj+mXq5njLFlYHiotHE+BwBP2rP5Y/ph5VI5THj0LVpE4h0W0DsgWmbWKWDMsA+PnLnOEfuvvREYxzFjhcFUHjmKLEeCArZuElcuEuwZn5CRXkAwMe2kaBrVNAzHfYJc1xgmSuC0C0n/Bm9ltFwiANHTM+ZoCApqurmiUZdtYgg43kloSuzfPVJ1OWAtr+pz9X+2ywL/X15hBRrxwbkwHzv898PVyr0ORlOJjH7d3HywnAKL+IfQwUQBL7L3+GEg+L+1v7LqAfW2xstjThdEphPml76tovGCtWiQAdy4uxsl5d4xElTIak1BDGXqQBQNnMv9st2vLjpDog8LyX4zMBwMApzKZJ2IJN6EyGtTEOhJkaZzXb0HwIBbcj08YFQrLLngCBv98r8IhEcX0f9tYWl6sSFbXh20DDkHny3bSFBWzEIrGgxL+UjTdaWhbDsUHgAd3++AsMh2R6E/TwaWp3J22JcbNS4MRlsoc8frlkXPJg0DxpBxVNLSsH//KzXsbPfNW5Ztiy/UG5axtPviyYeq3TPiUDTui9Rocjelu9LrSys3ATVzW0y3Z19iy4waG6lX65tkzFqwRjElLEaPVFUFMrbXtLDiSbOnJMEuof5AzlnGX/e9ZC1hjn8KQ3md8bwNwsup3ec
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(107886003)(66574015)(6916009)(36756003)(66946007)(69590400012)(66476007)(4326008)(83380400001)(6666004)(66556008)(44832011)(38100700001)(6512007)(86362001)(8936002)(2616005)(2906002)(6506007)(5660300002)(316002)(52116002)(8676002)(16526019)(478600001)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?/mo6qHIIJZhwU9PEREmaDq2ef3ht+bb93OUmnZelmRC/cCZ6/GxCF5bRxBob?=
 =?us-ascii?Q?EBSz5f+VVsB5oCHv1cI8RzbyyfT8oM5Kh8wAnF0H0zWpvfwdqeizEC+tp9Gm?=
 =?us-ascii?Q?8ppnmXo90UlEnUpSEkp1aP55lh0s6tlOxW91zf4Ro5J0opqqC07pTgDtR2Kl?=
 =?us-ascii?Q?efFdhPAJBJx9y0i4NP6UDG8JuxQJo1bpJcDRhg6xRmTn5ZBvNmEM3IRlezEI?=
 =?us-ascii?Q?m4GmNSA3uTVnBYFGVnx4lClc3TsnHUngOb1vHEcRYIMnE+UL29T/8UCoDubB?=
 =?us-ascii?Q?D1EDKq/+zDEIgFZnCZQTeE7scSmsWeFbjHEGpDJF/I9T6ZjC8ubuowBWYyVJ?=
 =?us-ascii?Q?mL836gy4cLYtlKj3BNRDwlMUZdz2tfntSbSxd03xAY9m+DaH8mfdMGy4nZxy?=
 =?us-ascii?Q?/Q054/XDKk3k9rKyOFaA5VIqWXupKTcHYrpQlCrN3L7f2Sv0s5qFHjKYuQv3?=
 =?us-ascii?Q?zFYxSzGnAR0exKTTCaM6HyK3LNoCRO4iVxwvTaQJkKJQ8q+MRpMIiKGu/x7h?=
 =?us-ascii?Q?p3+zW0kXKwOJ9WK2/YJkQh2ethugyzMx1JOY7u5puK5JdJ3VY/vK1FT/mV32?=
 =?us-ascii?Q?uwyee+4bdCIAVok4EpFXk7s1+gJfxyrFUmlrdUHCVRWrY2cjxeXfQO7P2Rbu?=
 =?us-ascii?Q?aylydlKQ2AtntusdM3nYL0hcArQcGqbbikouV0JFYrhQxJbgIaofpGmm98Qr?=
 =?us-ascii?Q?huZdHSZCWyGo3XYqmL4kg0HNb/KOc4hLJenEndZW2WSrymp/Weri4AwcSvEb?=
 =?us-ascii?Q?65qrsHojZbJxSzqzoAFNaWReVhKYHeSdmce5bTtloD7//bwUIJ+TfyeIjOSV?=
 =?us-ascii?Q?/p/s3dVjTgrpWoYShxsmmKEltyhH/TSolzVzYHlQKSA5ybcReN22TlKUj/Nd?=
 =?us-ascii?Q?ntSoD/RVkf+cImBI62W4STYjzSbk6m5lLRPBao4dtJecmoSkQKxN/A/JUfFI?=
 =?us-ascii?Q?IzuiQy1as0UimbRULsNgNgKPcJQf60K8w2E0vA3iMtOOsUv7gt+7faG5i8lr?=
 =?us-ascii?Q?AmZWJ+pbSZ0FIEH0lWLjgZ7NfyX3TTbYRRIh8IsQVK5+BdJn3sxwdSiuXgBB?=
 =?us-ascii?Q?c7dzX/h0xkixG8zUmCRRTXAxEYHp/PQu2d7mL366wJDHmluigt3wiAOLC09s?=
 =?us-ascii?Q?rIN++dI81n5N0hs5G1i2ZQLYleLhQwr8/8Bsj64BqleChSMR8slBDC4FDu2f?=
 =?us-ascii?Q?gntI9qyh8l4So6y//av+XLqzKoQg1NDRadvs4tAft8sASpiRptoTQlJIClIE?=
 =?us-ascii?Q?HNoAJH+Rdp+PqKujnKx+jvXWf0Ybn0OloeIBXo6+sKVNuojdxH28JVw6eVKe?=
 =?us-ascii?Q?rZh0UM4XeyPMFjMYgAvCWPuuewPAgqv+0ftSoH7zhWEQhYrErBLxFttG79mm?=
 =?us-ascii?Q?pTcJ922dtEu2FNCKI1HCrUMmkRc1?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee567aed-1e88-4b0c-49a4-08d8f05d84bd
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 13:46:12.5066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bETO2gwFsHG1WOHI4aQb0vsxJdPegURKJpNCQZHjKqn1LRJPszvqIallBOQB/qM9tBF/zOMFlHqcTftk8ldkTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1646
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The maintainer declaration in the buildhistory
is useful for tracking the maintainer of recipes.
This change adds the MAINTAINER variable for
recipes and packages to its buildhistory data.

Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
---
 meta/classes/buildhistory.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index 8a1359a..04fac82 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -109,6 +109,7 @@ python buildhistory_emit_pkghistory() {
             self.pe =3D "0"
             self.pv =3D "0"
             self.pr =3D "r0"
+            self.maintainer =3D ""
             self.depends =3D ""
             self.packages =3D ""
             self.srcrev =3D ""
@@ -126,6 +127,7 @@ python buildhistory_emit_pkghistory() {
             self.pkge =3D ""
             self.pkgv =3D ""
             self.pkgr =3D ""
+            self.maintainer =3D ""
             self.size =3D 0
             self.depends =3D ""
             self.rprovides =3D ""
@@ -162,6 +164,8 @@ python buildhistory_emit_pkghistory() {
                     pkginfo.pkgv =3D value
                 elif name =3D=3D "PKGR":
                     pkginfo.pkgr =3D value
+                elif name =3D=3D "MAINTAINER":
+                    pkginfo.maintainer =3D value
                 elif name =3D=3D "RPROVIDES":
                     pkginfo.rprovides =3D value
                 elif name =3D=3D "RDEPENDS":
@@ -215,6 +219,7 @@ python buildhistory_emit_pkghistory() {
     pr =3D d.getVar('PR')
     layer =3D bb.utils.get_file_layer(d.getVar('FILE'), d)

+    maintainer =3D d.getVar('MAINTAINER') or ''
     pkgdata_dir =3D d.getVar('PKGDATA_DIR')
     packages =3D ""
     try:
@@ -251,6 +256,7 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.pe =3D pe
     rcpinfo.pv =3D pv
     rcpinfo.pr =3D pr
+    rcpinfo.maintainer =3D maintainer
     rcpinfo.depends =3D sortlist(oe.utils.squashspaces(d.getVar('DEPENDS')=
 or ""))
     rcpinfo.packages =3D packages
     rcpinfo.layer =3D layer
@@ -270,6 +276,7 @@ python buildhistory_emit_pkghistory() {
         pkge =3D pkgdata.get('PKGE', '0')
         pkgv =3D pkgdata['PKGV']
         pkgr =3D pkgdata['PKGR']
+        pkg_maintainer =3D d.getVar('MAINTAINER_%s' % (pkg,), True) or mai=
ntainer
         #
         # Find out what the last version was
         # Make sure the version did not decrease
@@ -293,6 +300,7 @@ python buildhistory_emit_pkghistory() {
         pkginfo.pkge =3D pkge
         pkginfo.pkgv =3D pkgv
         pkginfo.pkgr =3D pkgr
+        pkginfo.maintainer =3D pkg_maintainer
         pkginfo.rprovides =3D sortpkglist(oe.utils.squashspaces(pkgdata.ge=
t('RPROVIDES', "")))
         pkginfo.rdepends =3D sortpkglist(oe.utils.squashspaces(pkgdata.get=
('RDEPENDS', "")))
         pkginfo.rrecommends =3D sortpkglist(oe.utils.squashspaces(pkgdata.=
get('RRECOMMENDS', "")))
@@ -368,6 +376,7 @@ def write_recipehistory(rcpinfo, d):
         f.write(u"DEPENDS =3D %s\n" %  rcpinfo.depends)
         f.write(u"PACKAGES =3D %s\n" %  rcpinfo.packages)
         f.write(u"LAYER =3D %s\n" %  rcpinfo.layer)
+        f.write(u"MAINTAINER =3D %s\n" % rcpinfo.maintainer)

     write_latest_srcrev(d, pkghistdir)

@@ -386,6 +395,7 @@ def write_pkghistory(pkginfo, d):
             f.write(u"PE =3D %s\n" %  pkginfo.pe)
         f.write(u"PV =3D %s\n" %  pkginfo.pv)
         f.write(u"PR =3D %s\n" %  pkginfo.pr)
+        f.write(u"MAINTAINER =3D %s\n" % pkginfo.maintainer)

         if pkginfo.pkg !=3D pkginfo.name:
             f.write(u"PKG =3D %s\n" % pkginfo.pkg)
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
