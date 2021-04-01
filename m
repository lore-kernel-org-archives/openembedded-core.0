Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.47])
 by mx.groups.io with SMTP id smtpd.web09.4456.1617262574340582691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 00:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=CfgW8tj6;
 spf=pass (domain: kpit.com, ip: 40.107.138.47, mailfrom: purushottam.choudhary@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJzY5egbWwNEbrVvlarhx9IumS0ENi6rXJaihsnvbtKWRZFmOZflggsl4zmCQ9F+RVQuBjUu5PbIp7xcRIMcHk+lH+Jl+T0DIADviXGKpwrs9PRf2UAlS4BjpLWhEyrDVAno3zOVape1OIbdh/nYOUVwdUzsT7dmxIjdySzZO8fx92DezrKcRd1/zG52mUGNNU9USsTcIVY7AMt1TGmzGhw1H4k0iOT2zzwksdzkp2/gsO5pnqoRnpb78XYbzWJBbt5ZYLupLBFY9obHCvCGlLM1KqgTutGKj2VclzrVjxJVmAUE15gJnV5KKvVYKBvbDKMlnukdbWUrFs4xeX7RtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FX4g/0NXDly6xGg6jV50aBXMPWtQfIt0uGy/RMk4zM=;
 b=ke2oFA5DjUOmehpJ4uJQbmJLReINYFhrN2rNmfUwHIrU2HPqKjzg22/VBMaMemfRdenqq+2m67l9ewqTqnmrnDzl01yQgNnjA1D/m8wXwmiaQ1gzL9xvg97lWAi2guNrN72KpJQo4DbHilbMEKDgNca5p2vfZVzGeb+3sdCWZiGvP1x+HmP/ne2oaUSpwztGpM0dSvzQgg6n6mMG2q8ELOck/I6aesKaOSESnNOXJrvaTXcSkWnnOMG0rqT7hlcKhN3ZZvAA+NVu1YeVXTqQcL38J+/3GDUMWJTKufbrGXWYZ2A6PBvCUqSQxbmqEZy/6BQ/FquKaAFZ0ej6Gagnog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FX4g/0NXDly6xGg6jV50aBXMPWtQfIt0uGy/RMk4zM=;
 b=CfgW8tj6ocQULmT0nBA/UawQQ5gQkzxl0BA9Ci+gOH4XRD4i2sjPKxEfal3lzTncv9vo+w6zV+NBiGf2OfBIPmJE6DjBy0+IG8MfH/hoFYM5Yk09UwkyB/dkSs/T2Ca19xifa0RvZ0oe3/2jXRHVQJv6YqEJhX19f9i+ghlPgAg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1c::9)
 by PN2PR01MB5286.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:58::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 1 Apr
 2021 07:35:59 +0000
Received: from PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ec0c:730d:7fe9:9cd6]) by PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ec0c:730d:7fe9:9cd6%7]) with mapi id 15.20.3999.027; Thu, 1 Apr 2021
 07:35:59 +0000
From: "Purushottam choudhary" <purushottam.choudhary@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: harpritkaur.bhandari@kpit.com,
	nisha.parrakat@kpit.com
Subject: [poky][master][PATCH] buildhistory.bbclass: store MAINTAINER variable
Date: Thu,  1 Apr 2021 13:05:50 +0530
Message-Id: <1617262550-10558-1-git-send-email-purushottam.choudhary@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2405:201:a410:a032:b07e:a957:93b5:1ff7]
X-ClientProxiedBy: PN2PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::6) To PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1c::9)
Return-Path: purushottam.choudhary@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2405:201:a410:a032:b07e:a957:93b5:1ff7) by PN2PR01CA0031.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:22::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3999.27 via Frontend Transport; Thu, 1 Apr 2021 07:35:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3fddf08-e567-4273-f92c-08d8f4e0cad7
X-MS-TrafficTypeDiagnostic: PN2PR01MB5286:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB5286793B503CD8ECCAD2D911907B9@PN2PR01MB5286.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OHOgibx6qTl0l1Xhxmjn/Em+HlR8SgM8kfNdv8sUyXIynVBEG7hN/SjyMcSdANDFDdIocn1NK/2KYiSFYcgLtMHWMjUwmUgS7W9EA91l/1rmUfSMccEE9mvAl0IkJ9eUYcDvXEa6iptm4o1IuREderAmce/xDtA+h1ciPAZL8n3y7no2yWjCLy0JK0TXyvhnZtrGwh09QZbMGSOzqoK6RVzFvZXXxDHuk09ftRx5sd/gq2t7vcxVH1qxGR8+gWsIxR44pijfhOLwSblr/gQ1rSeYCzvlApiDyWppg9LeB3oYmMuxu33wXDP/2a3nd/swSFDeLFirbGKBoBq+BuQNKnwY96qBHjf2x44fS+cpLjpx7Og1NRks2bau5GbJLx568WG9+FFPEy2mN/1QJvJmqDRXbAuoxzTe0wG+StIor0g0oPrjw1l7du6gU24fweCzfAC70jjGgvjy+cve/jG+h8BGpNEMYwkYv93I0XjX29WiWIK3nW6TY6eaXEpUuzllDsIqmNXTe5hunTrFBXrS/0C6g6Z0u9fs41EiLgkV+5ydMl+MHsO3wFPF1gttdeO+V68raOzIECkIkAooYI9y/7nc4Ysp/L0zQsQdsOnRePbpKaqppOnUADzf5mT3cngS9qNuLoa8YMj5XcNzaDJ4MF3RjfFxV1hxEg2EY/sBJY93lYBAUK9xhvekvyA3EMsu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39850400004)(136003)(366004)(316002)(5660300002)(6506007)(2616005)(83380400001)(66574015)(107886003)(478600001)(8936002)(2906002)(4326008)(69590400012)(6486002)(16526019)(186003)(6512007)(38100700001)(66476007)(66556008)(6916009)(66946007)(52116002)(44832011)(86362001)(6666004)(36756003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?1bFYIBFey+4uNBcJ62PV95x1ndRpRrJeEHey/XvUCRDKVPXMCFobtX4/Ua4A?=
 =?us-ascii?Q?mXM/caqvF1XDhucymWLfsHn4wWJ3j2QlB+Lo2dafpYBhNa+sPGegArm4hZtz?=
 =?us-ascii?Q?+uuxMPmcXQf+ijBwNL0qPxDyDMEt6EU6d75VB1DaF/Cne0+DNbQUOR97TBus?=
 =?us-ascii?Q?QswRR8hc/U7zXFEwoqEa9/yywDux2NMTT65fb454vKrPk5I676ohypuqCbKg?=
 =?us-ascii?Q?+BN62hgYBy2BMxHdgdhB3rLH9+YX3IaSEGIHxb+8qayHoXK7hjzXdFUXbrFO?=
 =?us-ascii?Q?NzdSqxrbdYOFQxwn9EoZ6inAdM5tDTCYwZ6TCQ2jFYP8NYqQDtWi9DtdjZEn?=
 =?us-ascii?Q?kGMJWXgF3mhP5CmKu0umEaYvxGGZb0ZKVAQF4P4wGzLEvouSYGHqFe4fWUjS?=
 =?us-ascii?Q?tVXrUn0CkZmyJiHcrN625MbTRBK2+AdirECm5fGah+NDo7G9/cNeAXeNLDVG?=
 =?us-ascii?Q?Uc3/pnndFJYGqpH40L4eYKv1NtsX7+dUMKJG0f7Z8RenYyNlZhNsxgjcUWoq?=
 =?us-ascii?Q?HCg7V+HbFVuBGhfdlzefC4xWawgoAh4zlFvA3Cmd/Oscf0HprbIWg7diOMoz?=
 =?us-ascii?Q?PQYse+t+jQ/Si9zf6ekpi8aFrNHo5Ql67UVIqJUuzB+wSGNv6DgmHNrdZq4u?=
 =?us-ascii?Q?TJxbecgvIdYF76qraZchVllDT9dDOa+3sFHAhrYoBV9pmwC1oVh5hBeSk6QJ?=
 =?us-ascii?Q?dpBxICDlfL5rjZ1+tOeJmk4Lb4wLLjXiWD471UxR6NpZ5RB/7Yn40Vq6/HaW?=
 =?us-ascii?Q?i05zKeZ7VuLxiLB10HykIMjJz7z+hHXVLdTRrJZMl61J++KEWr5E0sZS9Otq?=
 =?us-ascii?Q?pNdftvfYGZlp4m2Hoet23jGl55GPoxkKANLIpk0F5KbS72hNyJz1Otd4yzpD?=
 =?us-ascii?Q?9wj2LlXwU2H1nEZy2hLSVWjZcVHU/mgf5owoJPgZCisiJ0QA2wP5fhuHDQaI?=
 =?us-ascii?Q?U7zAkZhazy7oyu7+/3cHUEwYpXWpWFJGIE/eT2bUyYiOzpdVkJUZLA6xSB36?=
 =?us-ascii?Q?u4wyx8dbv+Yy3IvejUkZ1yUuAapKMpi8MJCFfm5J3uPvFlCA2hZna8xZK+Gt?=
 =?us-ascii?Q?0q/oPZiz35p1M6Uu7cmbFzFIsyJS9KSd6VqExwcNORQ+zVsi09ggAcOgpyOC?=
 =?us-ascii?Q?I76bomJnl0Tog84JwUBDD6zdaGpFDSVjrwgpzK7MN/qwgmvbJv+5HMr+NkkP?=
 =?us-ascii?Q?YTHfQ1683gBORC7opBH3VfbtxJQyeN4kvW4kENQmDHOMxI1xllRid50WHH03?=
 =?us-ascii?Q?8eeq1L6Eqdi2D1Vx06knCimyOj6md9XbQWroFK5Sczv9xQ6T5+mifcP4JSIl?=
 =?us-ascii?Q?hqVsHhmdZEEQIVF/ZHsZ6RrXfDXi4OBifYp5PJw432aMRe2KQIMckQuaGMh6?=
 =?us-ascii?Q?y3ZhBkfJqrFG3PlXy6aJb3bopmyn?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fddf08-e567-4273-f92c-08d8f4e0cad7
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 07:35:58.9114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fq6lEi8sHRxMxFTTqrQP/gJLJF84LhBgxEe/6vpnlhi4QxxnDmxH0xTxm3URLFNAl610BKJWkYOkhr913goYlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB5286
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
index 49af61c..23357af 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -119,6 +119,7 @@ python buildhistory_emit_pkghistory() {
             self.config =3D ""
             self.src_uri =3D ""

+            self.maintainer =3D ""

     class PackageInfo:
         def __init__(self, name):
@@ -131,6 +132,7 @@ python buildhistory_emit_pkghistory() {
             self.pkge =3D ""
             self.pkgv =3D ""
             self.pkgr =3D ""
+            self.maintainer =3D ""
             self.size =3D 0
             self.depends =3D ""
             self.rprovides =3D ""
@@ -167,6 +169,8 @@ python buildhistory_emit_pkghistory() {
                     pkginfo.pkgv =3D value
                 elif name =3D=3D "PKGR":
                     pkginfo.pkgr =3D value
+                elif name =3D=3D "MAINTAINER":
+                    pkginfo.maintainer =3D value
                 elif name =3D=3D "RPROVIDES":
                     pkginfo.rprovides =3D value
                 elif name =3D=3D "RDEPENDS":
@@ -220,6 +224,7 @@ python buildhistory_emit_pkghistory() {
     pr =3D d.getVar('PR')
     layer =3D bb.utils.get_file_layer(d.getVar('FILE'), d)
     license =3D d.getVar('LICENSE')
+    maintainer =3D d.getVar('MAINTAINER') or ''

     pkgdata_dir =3D d.getVar('PKGDATA_DIR')
     packages =3D ""
@@ -257,6 +262,7 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.pe =3D pe
     rcpinfo.pv =3D pv
     rcpinfo.pr =3D pr
+    rcpinfo.maintainer =3D maintainer
     rcpinfo.depends =3D sortlist(oe.utils.squashspaces(d.getVar('DEPENDS')=
 or ""))
     rcpinfo.packages =3D packages
     rcpinfo.layer =3D layer
@@ -274,6 +280,7 @@ python buildhistory_emit_pkghistory() {
         pkge =3D localdata.getVar("PKGE") or '0'
         pkgv =3D localdata.getVar("PKGV")
         pkgr =3D localdata.getVar("PKGR")
+        pkg_maintainer =3D localdata.getVar('MAINTAINER_%s' % (pkg,), True=
) or maintainer
         #
         # Find out what the last version was
         # Make sure the version did not decrease
@@ -297,6 +304,7 @@ python buildhistory_emit_pkghistory() {
         pkginfo.pkge =3D pkge
         pkginfo.pkgv =3D pkgv
         pkginfo.pkgr =3D pkgr
+        pkginfo.maintainer =3D pkg_maintainer
         pkginfo.rprovides =3D sortpkglist(oe.utils.squashspaces(localdata.=
getVar("RPROVIDES") or ""))
         pkginfo.rdepends =3D sortpkglist(oe.utils.squashspaces(localdata.g=
etVar("RDEPENDS") or ""))
         pkginfo.rrecommends =3D sortpkglist(oe.utils.squashspaces(localdat=
a.getVar("RRECOMMENDS") or ""))
@@ -375,6 +383,7 @@ def write_recipehistory(rcpinfo, d):
         f.write(u"LICENSE =3D %s\n" %  rcpinfo.license)
         f.write(u"CONFIG =3D %s\n" %  rcpinfo.config)
         f.write(u"SRC_URI =3D %s\n" %  rcpinfo.src_uri)
+        f.write(u"MAINTAINER =3D %s\n" % rcpinfo.maintainer)

     write_latest_srcrev(d, pkghistdir)

@@ -393,6 +402,7 @@ def write_pkghistory(pkginfo, d):
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
