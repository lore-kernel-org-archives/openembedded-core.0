Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40070.1793010710108282949
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cMJiWU5I;
 spf=pass (domain: est.tech, ip: 40.107.159.33, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8lIUPqmsQKb2vl5SN322T9Lg/S//9YBuxEkFEzKjGzNfax7pdRQEZd4QeyTd3v2tV+LVqlH2L0zKgjcpKjlCB6NiUwf4lKREwTVIqkK/+UEUCoO94nripHx20qM6E/UsUcmUMLOo4gyncqVwxM6H39y4KIwLinUeXMozW1Bm/rBQuQ4JZWg3jKhANWubUw8QBr+xaftwUxfWjHjZ3pYgBcmyL+6PBJFxIGF8Mr4M3ZFtrV9kMGs0K751mqOc2f5JV+v/lly17ym58WJIrjHjpQDAZZwSwaAmdCV/VySBUlm6AEOSYFajSYQoDxN5ncyPRjJzGBYq7y0fN/9F5CZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqKmw8uTxtoPG21BWgrWEUFSyFZ8xKvLhbZEEie8dq4=;
 b=ZxBk5dSdcySNzp8fxobEbPTewhXC5Y883K8H4AqamuJSprUihZQZTVTZQoGBeBP8DKBM02rupKnwxScY+Dm9BPtgDgPLQ4Lccq0lIAnHszmTohXZQF2QoHvW0Yg0Pd9mSSFao0O4Upbo53PJH5kafzVEm/HdgU//EfZyZLo7soGsBfJ2eUqj1qyPuhf/9l3neM6H1CLBzHrl4/RHYdfnGRaMAWYu5oG0fccuDn/QWTOjbp3rXBQY/G6AxzC+r+vztoTIKCf2yFmNgsFhkMpux9S5JiTkSjNXly3rkuXwemiUjPT7pX3o8+TS1mCqbDLqXc91DopIeEaEJOg4TbTqNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqKmw8uTxtoPG21BWgrWEUFSyFZ8xKvLhbZEEie8dq4=;
 b=cMJiWU5I0ff8NMVTx+28IAK0ccAZ5a/ytJ9PvKpE86qXNoL0I6eNKvzJQmlqsq8DkuZGaZ1hq6eJYEtp8yYOtUjmvD51B3JwmFpohMr5097Uj1eeX91ixh3MaM/p2MlsiHmQz74L1I7n5XJMnNCANdJd2RnFo73sGXB2cgH6CiwKHxXt4USt2eqI9wPL8iok337HiL4fyIeMDf2RPEJWZ/5B82Y7Cg72o2eVlRxaVXYDrX+/SWayBMbzZC5XMuDPxU5iZR1csoax3iUyNR+k08+Mlr0Yywpy9JYCQO6swSZxpoDclwOG1FWGZOWtDlYBcVRblQHdYeEv2HvFAsQI4A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA4P189MB1280.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:31:45 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:31:44 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/12] patch: upgrade 2.8 -> 2.8.1
Date: Mon, 26 Oct 2026 11:31:29 +0100
Message-ID: <20261026103138.3137-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::23) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA4P189MB1280:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b88cd2-4ab1-40b6-857e-08df334c54f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|10067099003|56012099006|3023799007|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: uLz9QwmsEZnlnFcoouZahPRmN+VmZ09NTPVqFlqWGajEmtmj1vU3LvgvhvaEyJXUiuw+aYCb3OMPqfsJ/czex5FCBay7tlwnJDMXE+VuBnmvi7bFQBtYz5kj05/v9l2mXjP0esBzy8/ACrbJxzG53stqZos8J0+fJ3WwNXH4Z1Jvby2Hl1TvxD0gIkbazOXkHdp/RTsh0ReR2YIAIei5X/cwiulc0kJSWNqVigUT2JC8yWsjYDvkfFwGx03P7GnbJr1Auzmje+lDBKsJbHUe7Ol6RVJwXCcuYsMB6c+JcDKuQPjw3zeLAlmWkFdkvz4CjxwEdSJRkOdHUvBvhq9TFDOF8EYVceeyVJKbtneqyqlAfvFVYtQW3bgD6NAdxRWuVGOTQSoxMYa9qFA5YouJhZeNFqkSfNOEtHMzBL57tFEHsJlkjrmLrjiSu2jVWF/UJSNTJ5rmcbFuFM62pZ2QR9bDZ8q9I/Elc8G2IVB6QrEZegxzkHpFPCGQG+LMm9KlffrNnK6ZHKTrFZ9lEdTXPHu0FhZ9EkjMD8vDUls83Gh87fZm5YqmTlptozyoaZrH/LI7lC3mCYG9Mk6cnRIrm2z6wlBfkZa86OyYF4Y343kL5GtYKbvMCHOveWn8lMNlyXzU10cUCpehsjroTs7F6SMRKPFSw0kiZjOzJLo5l7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+mRj24ugVkGJXUMtMzEkG+rTgGnsmvyAUi/jnTPOvWBKC0Z5goQinEw0ic4k?=
 =?us-ascii?Q?1Jlwtf4HF+7M9t8vCoC/fVSbEtvvEqUsPwHsskaxJpdQBdoZRJnTJhCbuls4?=
 =?us-ascii?Q?NXH8k0b4tZzHMmBoie0j/vZqwlDMERrbLhzZEKedsT2IBHsLP/rKHTvDyQJB?=
 =?us-ascii?Q?3LyWP7Es4OHyX88UobAv9s+g68JeIdgX/JT0o5T+bJiSt7lu46GWYkxmFCH4?=
 =?us-ascii?Q?EzqHkZfTi1HxrRNWx2lWv3ECdc9losRoIpriHDzcBGyl0MemNrGrsxjBfkgt?=
 =?us-ascii?Q?i/WCtXNzkwhoHMn/geIHkc76BKPayG2IJOEcXsG5nozpqusdnvAyBRJo5Lc0?=
 =?us-ascii?Q?VZ3KG/hzSHbRucQGbH9aEqJPrw5BumESQu2jI7p8+71PDmyhNbBNGkPfKgb3?=
 =?us-ascii?Q?flVOUW9IlG3GRU4c/NOH523nLHnYuU8KX2VZxPu1aV2S9W1+uraiyCUH/rzx?=
 =?us-ascii?Q?oZeWLLUe2KdY4SSeU67tl3itI1l/V4wz1Gdl03EGtA+nn/9XzyfRBYLwvSIT?=
 =?us-ascii?Q?X8N2QmgIrfhiBQpPdDT2P4eD/u9P3DXBxZk7PKV53WZc4e+YpMgUakNVgZg1?=
 =?us-ascii?Q?966FnocWHrD+QyzZtRZLhuuwfNPZ1dzsLXjIGjLvM+rJ3QJMlyoOeFNx1W3/?=
 =?us-ascii?Q?RHkQZkMtOu2QUU4nE2BiaimfbJmEZye8brqv79/mQKp0FqpMLqBBSPSuK+9m?=
 =?us-ascii?Q?gX4z7xcg8RtK4Io3vHlB4xy+v5TlpFFfigRY4h1aR4LFP5iBxvTtgC/HQMxr?=
 =?us-ascii?Q?TPbq81CIU3Ne4DrEMRuow7rc46PMvHxw/6+zB1uEu964/3kd4jvZJW+NM1F9?=
 =?us-ascii?Q?azgiKjAfVPW/RkXCe0Pr+7l92eQ7iQaOUQnG0z7P58Eq/RnB/vPrBl/isRgk?=
 =?us-ascii?Q?CjuhHbOsCP2ernqmzgdsv9H6PVuMq39aPoH+3OKxQkmWSXzpWXvgDYdy7Zn5?=
 =?us-ascii?Q?Ge7UR1NP5QW3SjhlzYobDNaQma8ey50eYy0yqHZA7rPkJGVavthvmIlSoovo?=
 =?us-ascii?Q?YsRUbwsiMfkSFdlWw5sB8z9QKV9YVabYw8cTItMUqahVBRTj8i5zFV/Dyo4z?=
 =?us-ascii?Q?izp0tcpYfirOl31kEd1y71NBKjYNVn52sJngM6Ww8RIkKcZj6LBq6ygqRU5q?=
 =?us-ascii?Q?QXp32wCBrttY8VKeOUAgsxpjzjJiB4nqi8Rtau6ad2bdAGPfKHqrOuUd6dxw?=
 =?us-ascii?Q?OQoSR5sybo5yMt0zX3GqoDZTCPcpa0EAhHJYkQ8zf3v3zKSWA6/lzF8HkOfp?=
 =?us-ascii?Q?W92DucVO3LP0Kbjx5HA7WrX4TNeSe0WKAegy8tfeid3m13bwHlWYgb9xsVzS?=
 =?us-ascii?Q?dTf4PVt751acbCecO8j88dkolCWlKuIRKoLI7kyXHvtwUDU2dCP/+PDGja7p?=
 =?us-ascii?Q?X/uslMzV8ENis/PuMS4g2NpOAF62cm122Paikh1s9Kv7dilUCi2WdmkB7tQG?=
 =?us-ascii?Q?DsjIPDCEZWGjw5Ku0ZuB6rIk62nTD7uRPnol8PQZf/8hDIuMlezFOqCO9c6m?=
 =?us-ascii?Q?5jSzE5N24jO54tckH0OTZinBKApD9soLPhOFxDUA/INJslMQgwMQn7GP0NO3?=
 =?us-ascii?Q?VmWhusdIqWCAuP4Zsg61FK781Nye8zhH2V+dN1sCDd5O+O8KzgDH1JMv69MV?=
 =?us-ascii?Q?lEjp9srWU4q1g1C4+46iJwnQl0ccWbHsW+8KcZFq+BF7V6vAFP7Q/bkZjoUd?=
 =?us-ascii?Q?xmMS8HLgjDt2hDMyf++Xn6nbhhMGGgeUh+BflHCxx4dF+5JLYe7okjW8y8qA?=
 =?us-ascii?Q?VBMk61GdSQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b88cd2-4ab1-40b6-857e-08df334c54f7
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:31:44.7697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hj3C72fN0ji63gHMQyOhUHTVDSj7h/F5B2pM/NLJrE9VVh/VuI2/L2rv7B626D4yGRjOI0Ze0U0E+7AHqh9eM1COUyAyV5a2vo4SEDJxYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 10:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248662

git log --oneline v2.8..v2.8.1
c291014 (HEAD, tag: v2.8.1) Version 2.8.1
0cd45bb Prevent creation of out-of-tree files (CVE-2026-115207)
e52d17d Pacify -Wzero-as-null-pointer-constant
2fad9ea build: update gnulib submodule to latest
a2b1922 Absolute in-tree symlink target resolved relative to symlink parent
51bb613 Remove symlink caching
faba04e Don=E2=80=99t infloop on null ranges
85c1712 Port to POSIX =E2=80=98ed=E2=80=99
e6d6a4e Avoid null pointer derefence with bad hunks
54b25ac build: update gnulib submodule to latest
494ee0b maint: make update-copyright
d161c9a Skip read-only check when output file specified
4c30230 Reject empty filenames
aea6626 Add some missing filename quoting
77c2720 Fix 'make release' for proper releases

- Switch SRC_URI to the .xz tarball and update the sha256sum for 2.8.1.
- Drop CVE-2026-56288 and CVE-2026-56289 backport patches.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/patch/patch.inc         |  4 +-
 .../patch/patch/CVE-2026-56288.patch          | 75 -------------------
 .../patch/patch/CVE-2026-56289.patch          | 36 ---------
 .../patch/{patch_2.8.bb =3D> patch_2.8.1.bb}    |  2 +-
 4 files changed, 2 insertions(+), 115 deletions(-)
 delete mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56288.patch
 delete mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56289.patch
 rename meta/recipes-devtools/patch/{patch_2.8.bb =3D> patch_2.8.1.bb} (80%=
)

diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/=
patch/patch.inc
index 4b90ece07c6..108ad63996a 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -5,9 +5,7 @@ original files, producing patched versions."
 SECTION =3D "utils"
 HOMEPAGE =3D "http://savannah.gnu.org/projects/patch/"
=20
-SRC_URI =3D "${GNU_MIRROR}/patch/patch-${PV}.tar.gz \
- 	   file://CVE-2026-56289.patch \
- 	   file://CVE-2026-56288.patch \
+SRC_URI =3D "${GNU_MIRROR}/patch/patch-${PV}.tar.xz \
  	   file://run-ptest \
    	   "
=20
diff --git a/meta/recipes-devtools/patch/patch/CVE-2026-56288.patch b/meta/=
recipes-devtools/patch/patch/CVE-2026-56288.patch
deleted file mode 100644
index 7219f5a3c7d..00000000000
--- a/meta/recipes-devtools/patch/patch/CVE-2026-56288.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 101a805510356092a6d2a864bb18d440fec57f0a Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Tue, 21 Apr 2026 10:05:02 -0700
-Subject: [PATCH] Avoid null pointer derefence with bad hunks
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Micha=C5=82 Majchrowicz.
-* src/pch.c (another_hunk): Keep chars_read positive
-even with malformed hunks.
-
-CVE: CVE-2026-56288
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/patch.gi=
t/commit/?id=3De6d6a4e021660679d7fc9150f981d4920f722313]
-
-(cherry picked from commit e6d6a4e021660679d7fc9150f981d4920f722313)
-Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
----
- src/pch.c | 15 ++++++++++-----
- 1 file changed, 10 insertions(+), 5 deletions(-)
-
-diff --git a/src/pch.c b/src/pch.c
-index d9f5c61..41150fe 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -1694,7 +1694,8 @@ another_hunk (enum diff difftype, bool rev)
- 		    p_end =3D filldst-1;
- 		    malformed ();
- 		}
--		chars_read -=3D fillsrc =3D=3D p_ptrn_lines && incomplete_line ();
-+		chars_read -=3D (1 < chars_read && fillsrc =3D=3D p_ptrn_lines
-+			       && incomplete_line ());
- 		p_Char[fillsrc] =3D ch;
- 		p_line[fillsrc] =3D s;
- 		p_len[fillsrc++] =3D chars_read;
-@@ -1711,7 +1712,8 @@ another_hunk (enum diff difftype, bool rev)
- 		    malformed ();
- 		}
- 		context++;
--		chars_read -=3D fillsrc =3D=3D p_ptrn_lines && incomplete_line ();
-+		chars_read -=3D (1 < chars_read && fillsrc =3D=3D p_ptrn_lines
-+			       && incomplete_line ());
- 		p_Char[fillsrc] =3D ch;
- 		p_line[fillsrc] =3D s;
- 		p_len[fillsrc++] =3D chars_read;
-@@ -1725,7 +1727,8 @@ another_hunk (enum diff difftype, bool rev)
- 		    p_end =3D fillsrc-1;
- 		    malformed ();
- 		}
--		chars_read -=3D filldst =3D=3D p_end && incomplete_line ();
-+		chars_read -=3D (1 < chars_read && filldst =3D=3D p_end
-+			       && incomplete_line ());
- 		p_Char[filldst] =3D ch;
- 		p_line[filldst] =3D s;
- 		p_len[filldst++] =3D chars_read;
-@@ -1808,7 +1811,8 @@ another_hunk (enum diff difftype, bool rev)
- 	      fatal (("'<' followed by space or tab expected"
- 		      " at line %td of patch"),
- 		     p_input_line);
--	    chars_read -=3D 2 + (i =3D=3D p_ptrn_lines && incomplete_line ());
-+	    chars_read -=3D 2 + (3 < chars_read && i =3D=3D p_ptrn_lines
-+			       && incomplete_line ());
- 	    p_len[i] =3D chars_read;
- 	    p_line[i] =3D savebuf (patchbuf + 2, chars_read);
- 	    p_Char[i] =3D '-';
-@@ -1833,7 +1837,8 @@ another_hunk (enum diff difftype, bool rev)
- 	      fatal (("'>' followed by space or tab expected"
- 		      " at line %td of patch"),
- 		     p_input_line);
--	    chars_read -=3D 2 + (i =3D=3D p_end && incomplete_line ());
-+	    chars_read -=3D 2 + (3 < chars_read && i =3D=3D p_end
-+			       && incomplete_line ());
- 	    p_len[i] =3D chars_read;
- 	    p_line[i] =3D savebuf (patchbuf + 2, chars_read);
- 	    p_Char[i] =3D '+';
diff --git a/meta/recipes-devtools/patch/patch/CVE-2026-56289.patch b/meta/=
recipes-devtools/patch/patch/CVE-2026-56289.patch
deleted file mode 100644
index 8f98c444fc6..00000000000
--- a/meta/recipes-devtools/patch/patch/CVE-2026-56289.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From e89f7be0853836908226e1df746fe07ef7c46769 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Tue, 21 Apr 2026 13:16:10 -0700
-Subject: [PATCH] =3D?UTF-8?q?Don=3DE2=3D80=3D99t=3D20infloop=3D20on=3D20nu=
ll=3D20ranges?=3D
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Micha=C5=82 Majchrowicz.
-* src/patch.c (locate_hunk): Don=E2=80=99t attempt to optimize
-matches of a null range.  Instead, apply all the checks
-we apply to non-null ranges.
-
-CVE: CVE-2026-56289
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/patch.gi=
t/commit/?id=3Dfaba04ef4f2b410257f76c1b9dc85e350929c4b9]
-
-(cherry picked from commit faba04ef4f2b410257f76c1b9dc85e350929c4b9)
-Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
----
- src/patch.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/patch.c b/src/patch.c
-index e4d0524..1e7dfdc 100644
---- a/src/patch.c
-+++ b/src/patch.c
-@@ -1166,9 +1166,6 @@ locate_hunk (idx_t fuzz)
-     ptrdiff_t max_offset =3D MAX (max_pos_offset, max_neg_offset);
-     ptrdiff_t min_offset;
-=20
--    if (!pat_lines)			/* null range matches always */
--	return first_guess;
--
-     /* Do not try lines <=3D 0.  */
-     if (first_guess <=3D max_neg_offset)
- 	max_neg_offset =3D first_guess - 1;
diff --git a/meta/recipes-devtools/patch/patch_2.8.bb b/meta/recipes-devtoo=
ls/patch/patch_2.8.1.bb
similarity index 80%
rename from meta/recipes-devtools/patch/patch_2.8.bb
rename to meta/recipes-devtools/patch/patch_2.8.1.bb
index 33142ac5746..16188008f0b 100644
--- a/meta/recipes-devtools/patch/patch_2.8.bb
+++ b/meta/recipes-devtools/patch/patch_2.8.1.bb
@@ -3,7 +3,7 @@ LICENSE =3D "GPL-3.0-only"
=20
 CVE_PRODUCT =3D "gnu:patch"
=20
-SRC_URI[sha256sum] =3D "308a4983ff324521b9b21310bfc2398ca861798f02307c79eb=
99bb0e0d2bf980"
+SRC_URI[sha256sum] =3D "3240c7959c5347c8ed347e3c4201c0337bf4240d5cf09d6888=
9e58eeaba30e17"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"
=20
