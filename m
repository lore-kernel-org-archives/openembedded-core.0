Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.58])
 by mx.groups.io with SMTP id smtpd.web10.3567.1607501561805591483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 00:12:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DoCI/5Xd;
 spf=pass (domain: windriver.com, ip: 40.107.92.58, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFdMLRJyOF8WtDjPaEx1l2Ir9hAC8vvoHuvBRe3mnSX+ei9E+W8dcg8b16YgonxLyIJa/so/zlzAnIhVIL7vjC8THiqJywtDYwhi9gZVRCvgqsj1OAcQtC97tkzGOskEmdrD60f5Q4ZDxFVI+cHcvsGhs99JNvmhUckKp5KZlZSInMDtEu0fCDD/9pX397Cj1ghuo5o9PnV6udqIeKNewl61cIQqoRsbugm9cJJ5v+rWtkLaMV0jFM+lzV2JrY//gSTWzgWIHBT1uE9qdDxhaMwsdWn1T5MCyMyf4fes25p3Sk5RSi16gdHAhk7IziJCQ/maCqSVIoPSANKWQ3ODOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c38AOYtMgEUpMgk414rWQjx2UjJQNwyLANma3iNmcnM=;
 b=J3td+K91loTqZLRBvMkuWdcwix8sjWcMepSRwglPD2KP5rifCipTTh/k47akFEES3v4aFS55/iCmTSb4x1xL+pJQ4LFsVtoaKjhN6rf123V3ljMZfEM2WmeeR6T48ImrugmINHTxvWuyURF+eExyYGB65c4BXh6PE4fSyULle9EKHrZbK2KgYBV/lz54s5FYvXuomNEv4xpONNnbf8ZmY8w4GolC790U48vIBlQjICTFjR4Jn6bqfpXtI160cPvqWZRkBg/HfxyUDStN6hJcr67yfqkqVMNjAX1LSuKq98DZhojIiD/wCXv32MW2t0jcfHqtt65CpJYD7CCB1H8gPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c38AOYtMgEUpMgk414rWQjx2UjJQNwyLANma3iNmcnM=;
 b=DoCI/5XdNIAEMTMozkpqtLUsxlRSoaJEFt6Y8aGVV3JI4ha/gclTwZNqjFtwKTLjnV5U6knUskXI+M18oq/qwnhtMlrdIjkeiXvMiE6QnJE8k9eSEjPNBmtdEJVxsQUCS6/jMSTy/7tY7bpzfox/tw7QSqvWszzaebXUubox5fY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4916.namprd11.prod.outlook.com (2603:10b6:303:9c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 9 Dec
 2020 08:12:40 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 08:12:40 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dhcpcd: upgrade 9.3.2 -> 9.3.4
Date: Wed,  9 Dec 2020 16:12:29 +0800
Message-ID: <20201209081229.108525-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0117.apcprd03.prod.outlook.com
 (2603:1096:203:b0::33) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK0PR03CA0117.apcprd03.prod.outlook.com (2603:1096:203:b0::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 9 Dec 2020 08:12:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c41518df-f7a2-418a-f53a-08d89c1a3294
X-MS-TrafficTypeDiagnostic: CO1PR11MB4916:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4916BAFFB7FD4EDFF34A72F1F9CC0@CO1PR11MB4916.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:233;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eeBGexKcRODnYS9HisBamz5xKVOttGAW3rTOyXsM3DZpu0sgBQIxPucybazYp5FfaSXNPDFfKFTK3uHk0E8sAhyiMWnNMGY/I2LIF/sO2uzSttScOxkOwrVW8QwE8YfI5uhNzNIXqsmzC8XP9Bj+0Q1gniPzJf4pg5RH0u7a4/AtKCJW5emQMFlxUId/RKBWR89oK1kbK6UXCLn1q/rCP5p2sIZfZ/YIJEH4LlUB9J2QSEBMYEKCdJhG8h0BUZ0eV3f/XphR3XJ5pvu6pDGzOYrAy8GLLobaeevSySNQ7Z548q/WOsfGCYoONjN+TR/uxOqL4BdwQCI4uWgzHblBQw04V8K9WhdDPAc3JmPpZTEuYDGSYjUvIBcpNVOBIhvHMzfczUwPc8DTVbqU73ka1MFlYYD0MhTZGHHMwRbhKNisVFIgSWrjVThVVw4rhBN1Q8ZbN0uKpqYIrtFL6cFsDw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(6486002)(66556008)(6506007)(83380400001)(66946007)(66476007)(26005)(16526019)(52116002)(186003)(2616005)(86362001)(6512007)(6916009)(1076003)(8936002)(508600001)(34490700003)(6666004)(956004)(2906002)(36756003)(44832011)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?LkB5vzIEMKR6Eb2r2Egfq0Ftc1JGWX/jqzNOzQzCOw9mOfuGQCDy7Rx4NrVj?=
 =?us-ascii?Q?jg0Cpmw1rUwuAGNQWEdoR4C9mtT3NJiAQCN9H2haP+U2m8CcAvvQyZqzmkPT?=
 =?us-ascii?Q?GVeCUVPrGYj8/16e8gD6oyOHSENh4bgYT7iIkGwvG0sQm9z/Tor7CjALrGYO?=
 =?us-ascii?Q?FhzSo2WzR19n2y7y+mbdBpDzuMnSwWaFx2qQ0iK4HCI/SXamIFWRpKnJKR+7?=
 =?us-ascii?Q?/Ad5rklI2Qqvjv6Z/jl1CzMZ343eic9memCDYm0KLMBc7x0dCKkm8XaDo6uU?=
 =?us-ascii?Q?ibz+cfCjK+sB/znQKDKCc2Rb/aaAPSQYlHg/pg7oyrXs2dVArSKl8TsNKhcz?=
 =?us-ascii?Q?U70HNlgunAY3N8owH7t8TLsRPmVZamKR3PjRd2jg9cNgBbozRnatFyB3nuNH?=
 =?us-ascii?Q?x2gzosCXGYjmIl+IbCfIHqxkq98D9ChTzVOeSPNPlWAFXoWSYrwc/gfOvT8A?=
 =?us-ascii?Q?xL6QdRVLDRLl5e4WgWPvsZwTHG2VI8vYannYJuTUaVRgZiq9FLbtsdUAnkQc?=
 =?us-ascii?Q?PeDv8khkGnENuMx1r8w+0WJ5ZQR8Aq0675zg8levOsIiT06OtRscJRegNrEw?=
 =?us-ascii?Q?rVP+Vy/k7SUk05DTwhKoR8q9zJ3QHN2CfHR2zmUm5VUKu7zVgjITzBdbTJIr?=
 =?us-ascii?Q?pPa583utaFZCmglUA3YIYHASY2PSTd5zURUpI2hIj0gO8Q+fQ6U+KU7onJsX?=
 =?us-ascii?Q?O6zb0CUhJTyZO/5g6YgXoJHziRhw0/7VS3Hs/HyLID/fUDBv5ATtuVwWar/M?=
 =?us-ascii?Q?7+FXwUzXMVaWk+BPZtUH3WdQGffYMkAZ6iY5Ykg2K2SiYWyxbTmexVaBQA3E?=
 =?us-ascii?Q?PocVAdYF6pGcU/yQhO/FKPh44NAdMPUrFSWFMKTjlV5hZ2RBvw3Ta2+9Hn4o?=
 =?us-ascii?Q?n/qIHHPj226yzzkqyJpYbDN/fCqHZKW2B3g+x83sIJ3uN55YWA05i4lRRBrB?=
 =?us-ascii?Q?5RwKSuLi4X0a1DO8PVar0g7wkk3S2g48H3vs+FJWXjc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 08:12:40.1444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: c41518df-f7a2-418a-f53a-08d89c1a3294
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jmmgd7KZG1yl1Ems63tpXEaVYqsuG5E1AJQSOVCZ3eD3oMPZuKFmdor4miDvA5oEyDEbBoI0hk0xyAb3XfovGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4916
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Backport a patch to fix privsep build error on ppc.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{dhcpcd_9.3.2.bb =3D> dhcpcd_9.3.4.bb}      |  3 +-
 ...p-build-by-including-sys-termios.h-f.patch | 29 +++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_9.3.2.bb =3D> dhcpcd_9.3.4=
.bb} (91%)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-Linux-Fix-p=
rivsep-build-by-including-sys-termios.h-f.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.2.bb b/meta/recipe=
s-connectivity/dhcpcd/dhcpcd_9.3.4.bb
similarity index 91%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.2.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb
index cca60ddae2..cd81f17773 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.2.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb
@@ -13,11 +13,12 @@ UPSTREAM_CHECK_URI =3D "https://roy.marples.name/downlo=
ads/dhcpcd/"
=20
 SRC_URI =3D "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz=
 \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
+           file://0001-Linux-Fix-privsep-build-by-including-sys-termios.h-=
f.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
            "
=20
-SRC_URI[sha256sum] =3D "6d49af5e766a2515e6366e4f669663df04ecdf90a1a60ddb1d=
7a2feb4b5d2566"
+SRC_URI[sha256sum] =3D "5c823a0b981b52e7e0fd3183ae220422d6fcc3aa511af31dcb=
1a7ee6cb0f1c39"
=20
 inherit pkgconfig autotools-brokensep systemd useradd
=20
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-Linux-Fix-privsep-=
build-by-including-sys-termios.h-f.patch b/meta/recipes-connectivity/dhcpcd=
/files/0001-Linux-Fix-privsep-build-by-including-sys-termios.h-f.patch
new file mode 100644
index 0000000000..095e3eb409
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-Linux-Fix-privsep-build-b=
y-including-sys-termios.h-f.patch
@@ -0,0 +1,29 @@
+From e7c22336461ee345a5668eed6158e935cd4cdf1a Mon Sep 17 00:00:00 2001
+From: Mikhail Efremov <sem@altlinux.org>
+Date: Tue, 8 Dec 2020 16:15:28 +0000
+Subject: [PATCH] Linux: Fix privsep build by including sys/termios.h for a=
ll
+ platforms
+
+Upstream-Status: Backport
+[https://roy.marples.name/cgit/dhcpcd.git/commit/?id=3De7c22336461ee345a56=
68eed6158e935cd4cdf1a]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/privsep-linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index e588ecd7..1fbe97fa 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -29,6 +29,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/prctl.h>
+ #include <sys/syscall.h>
++#include <sys/termios.h>	/* For TCGETS */
+=20
+ #include <linux/audit.h>
+ #include <linux/filter.h>
+--=20
+2.25.1
+
--=20
2.25.1

