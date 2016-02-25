Return-Path: <joseph.lutz@novatechweb.com>
X-Greylist: delayed 930 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Feb 2016 23:20:08 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0131.outbound.protection.outlook.com [157.56.110.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1C76C7735E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 23:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=NOVATECHWEB.onmicrosoft.com; s=selector1-novatechweb-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=GrYCp/a0prXrfcraeKoriloXHhoQdNHxQ2qG3gFvtIM=;
	b=XzDW4f5DTi4wQynfcB83dqWxjLi7FOrmlo2irLfOsnW3mQq7d0ZfhCBjZseTd9S2KZsHGtljr7Hk67ksUE5EiyIYkjDhBQzCjcZOZmxqcrUiXhBcnWDwsL3ajx4NohUW4evzkaATOcgvHVPTRhoqBhj2ZiogKrp81gEH6IiiLvE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=novatechweb.com;
Received: from nova.novatech-llc.com (216.21.169.52) by
	BLUPR07MB561.namprd07.prod.outlook.com (10.141.205.141) with Microsoft
	SMTP Server (TLS) id 15.1.415.20; Thu, 25 Feb 2016 23:04:33 +0000
From: "Joseph A. Lutz" <joseph.lutz@novatechweb.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Feb 2016 17:02:35 -0600
Message-ID: <1456441355-13599-1-git-send-email-joseph.lutz@novatechweb.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [216.21.169.52]
X-ClientProxiedBy: SN1PR0701CA0020.namprd07.prod.outlook.com (25.162.96.30) To
	BLUPR07MB561.namprd07.prod.outlook.com (10.141.205.141)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR07MB561;
	2:a5oz7YGvUZ3H7VVu7bRxOtTNQxeTXZD9WyuwXGtNvb2Y25jVcup9j8mg/A4g2dmqTBYeAKV2RAoCkBJ/xTY7Rz6t2l3dsSh1Cvj4vpmzlo6toCBXTAyeM73qu2URFJKURrHY49IUpc/LkuLJ2tNKOg==;
	3:34hvhKdsfY27b9PbAIe0TVWljm3UNrAqRagPRQVeZxoetXIvr7G9QRXnZHmEU5q3MFPpUH5+adc6BJE41ZG09Cj5lE2T9yG4qKcbv4gheHRsngs2eIfoUi4ZphsJuG8g;
	25:1eqF2w+t28GW6wgdHhzssyv0E2OYktPzUUbBsXFouaZf92GPDrwbzm/87nhmLvgdU0TvfRyVgoUesUd2UM4lpvAIVYvpDcAIAGbczmYSt2YGkdiUvZtRTQvtO6Lvu3dKoY6pjvGu9BdlfU/hOWnsBmjZ43ub7zbxbv+U2Kcirib+pQBUWK+0suks8F3zK4UqAmPBkT38e73W3c578HKwkznSqG3N7C7fC4c6PyyyXagCNjUPTwKBpRP0pnD9f5rgK1QE5H0wCBmTIBiw05fpLqYBockg6CAwkGUNEM48kjP2ipZDBsaYCzYa44ihyXPD7YpIf0xodTCd4iH5Wy0E8g==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR07MB561;
X-MS-Office365-Filtering-Correlation-Id: 402dd5b3-fe23-4923-60a4-08d33e3806a0
X-Microsoft-Exchange-Diagnostics: 1; BLUPR07MB561;
	20:xxULeSnzaVY9928P15L8j9H+WeekQ+pPqOMNNZRkyL79gJ94M7Da/dpYAj2mq49OtqKcXUNGlVdrQflKu3YR/U5H3+raaiJ23OZF14ovpfXJjPxy9gWan34WUvACTqyGt/EDcbYo9MPD+ywJqOueJY2LzJe/nh5X9QmVqnuoCQXiSljnMslx+2MC3SHf8+HIK0qzRfPx8FrRIMEjw7U8nK+LkQaoVnNsheqpK21EfkKvWNXoFjDTOKuAs7ayyxHeJJQCqfI4kAwTj/xVybCR1XFoG2ReZWFrWEnBoqe0U/HGVO45j63pIXJV1GLcT45kSrXOn71m8BWSHZFR+IDrxbALPutA9hBUUNCGxhKVybwTI45NvTA1JMP05O9m+mLputcnOK16yAU5QIaJeYOwiDqNlTOS2RMIlIm9Bezz85wmRQNaNDuQqgPQwG4BB8GaTRlxGAV1xeS0hkgSi6C48SoTlRq6WbLqGsJLb6hcfQxz3YQw9dmhP5L9CuYe4wq3uzV+WcveZNarZzGVzh1slkYPSGSQqbC8ZcFkzddc9rZRc5RJWWXjEcQIKhFUjIVmdVmESTCeS9Mg0XSGHA036GPEKe/OZP4LlPlGZ1d+Lfw=
X-Microsoft-Antispam-PRVS: <BLUPR07MB561EC4C1893FE9E344AF5C5FBA60@BLUPR07MB561.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR07MB561; BCL:0; PCL:0; RULEID:; SRVR:BLUPR07MB561; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR07MB561;
	4:836TE1zLxLPPwvbAHCRAt4lkewvnwnNo9+m9iBadJE92LlegY4iZxC0KNmuAsMvVlQIav8VwFHVq0e3zWUnn3Onx6lOCG0WYgNETNL1bk+Zljh7buoboHFcsEIj0rbIvm6WxGjBwCP82DzCbNuexICtR6PY2rtnQxhbZDwm0hW6/f/D3sSYJ1xcP2mOfpnXucepRv7fayuPVYcVAoQCF4s0AbQqqQh7p3RIFIFfh+Ga8HdaSlx960thwHJpKThZGxw6iHlm4gpWIHy31JG8jQfhjQ3vmMLAxHpwGVnIb2rtTmTSq227BqhQG1DQtxRZ4ZX7Ms532rGZI7i+/joAp+BJfszYbOd29neqgcLS42qfJmQX+UR8UC1FfHP6Jmcm4
X-Forefront-PRVS: 08635C03D4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(377424004)(5008740100001)(87976001)(48376002)(50986999)(1096002)(50226001)(86362001)(42186005)(5003940100001)(53416004)(40100003)(122386002)(92566002)(5004730100002)(66066001)(450100001)(47776003)(4326007)(4001150100001)(6116002)(3846002)(4001430100002)(189998001)(107886002)(33646002)(77096005)(5001960100002)(50466002)(2906002)(19580405001)(229853001)(586003)(19580395003)(2351001)(110136002)(36756003)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR07MB561;
	H:nova.novatech-llc.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR07MB561;
	23:VCst7Eb0zWHm9CzDI+4yNdPSaCMoe/EXoBwdeRxeQD?=
	=?us-ascii?Q?LUswbumjcoAGn0xy5ZN7Xjkk6MgZ4sEYm3cZrA+sYAL34ITCa9Nyg1DghV2B?=
	=?us-ascii?Q?rJVGmZO0eBBis/QIb0FNOx4rA0gZh76+Qrg7e5aAYJtvk0K6CbSzunnQT7dq?=
	=?us-ascii?Q?Mm+JsHX+SdPHWsYDjx1rF+PNUezEt2Lx8/9DZTYdAbC+AbHDt9b5Yt7B80dx?=
	=?us-ascii?Q?qY+S+MyORWLt+e0c0mUQuN70e2BLbD7f93lYlRYYkqsZ8GnQrXjhMfl1aDm0?=
	=?us-ascii?Q?W9bhQZ+VNdHuj4/J7rWhgPGDpNsdBiP6DnPQyc3rcs6SB6TvrKnbSzMC3Q1j?=
	=?us-ascii?Q?qGuJHV9C/pz7u+ecfck5wyHYkgQjAJCDIZrsXkzJFM9l2DmpCgAGIlz71yh7?=
	=?us-ascii?Q?6aZeKAENFhb7BIDl5We1/08TMdjByfzmm89xz14qeCIiuqlh+R1VJ6zSbx/5?=
	=?us-ascii?Q?rWp7mRUFmEMC35nj3sBPWGuQCtAp0jm5BN2vZIuKBzVojcWq669l3odM5idK?=
	=?us-ascii?Q?aco16SuchFyKgwKeAZButJ56bf9DcdUtUPGTi6lX4SVszTHPCUA62tI9Vlnp?=
	=?us-ascii?Q?RfVaN9/JsSFFFKDCKBA/ctBvj9SlV1Dc0SgX9Weo07DRfsywkkqayZYl5lVr?=
	=?us-ascii?Q?ScvwIjbWvMMB8KUteMNWaL1oppwsLfhSzlzClsT4qM0QYSnS12EkFCKnA65+?=
	=?us-ascii?Q?j8aMymk7FeuSqJa95UIb4LNVsjFJRE42xxEhwXJTa5tTLvNUyv7XR/3PHma+?=
	=?us-ascii?Q?pthgZjjA3uKi/QvE03lx/1mBh3Hq++nUUFu7JtIZ4BHk5NrHDeVCFLJIdZUk?=
	=?us-ascii?Q?PK4xn9/QEbIpV1lH276ipQ4GrxHKpJ3vDSAxgWRsAFcTG6Sq11u2Lp973iBH?=
	=?us-ascii?Q?y62bmYh5ldY0R9hf+UiN+38GWtnB2mhNExwrvRmYFGbN4l6IsyRhfSf0mgMx?=
	=?us-ascii?Q?1ud9JDFEvD+FISnKyIuM6Smjwb/VrBY9yQO4H+DBUPqS14ec6jBPU+8Qxzla?=
	=?us-ascii?Q?Ot6TiK7kzt6LC/N5jUYATspaWKIQH0Y94M80beapDpQJXt1niHyUFI3Il512?=
	=?us-ascii?Q?KBrV3oVuF3NM85hpALzRdmvFne/66Ru0/dYZi5ghwoYZNLkQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR07MB561;
	5:HPWCNfr5MZGsgPmbmvQ28WRMENfu2hY/9YA/hbPKJASccPG676qubZhc+WU11+QhHW7zLL0eHD4YUXq5ym3VGw96ILCiBBzlYmfqx7b2+TojqVQQUC5IGa8eTANIR+znoG5UrtfHY+BEJP3il5/Obg==;
	24:ACtvG3W3fZFfRmr4Vby6YS2JtFXj1Z5oFue0VA1efG/UpEp9dTOaKaOXECLFdgNDXT+4ts37m+QlYfZX1KuIZyPi/gJM0KeDEeBzWdhgK9Q=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: novatechweb.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2016 23:04:33.6980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR07MB561
Subject: [PATCH] automake: remove patch
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
X-List-Received-Date: Thu, 25 Feb 2016 23:20:11 -0000
Content-Type: text/plain

The patch being removed in this commit removes *.pyc files from being
compiled. This dose not allow a user to select which files are included
in the image. Since optimization is no longer the default for python
we should have the ability to choose what is included in the image.

Signed-off-by: Joseph A. Lutz <joseph.lutz@novatechweb.com>
---
 ...-compile-compile-only-optimized-byte-code.patch | 42 ----------------------
 meta/recipes-devtools/automake/automake_1.15.bb    |  1 -
 2 files changed, 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/py-compile-compile-only-optimized-byte-code.patch

diff --git a/meta/recipes-devtools/automake/automake/py-compile-compile-only-optimized-byte-code.patch b/meta/recipes-devtools/automake/automake/py-compile-compile-only-optimized-byte-code.patch
deleted file mode 100644
index f8334a7..0000000
--- a/meta/recipes-devtools/automake/automake/py-compile-compile-only-optimized-byte-code.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-* OE-Core's python creates the same binary output
-  for both pyc and pyo, so disable the creation of
-  pyc files by automake.
-
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
-
-Updated for automake-1.12.6
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-
-diff -Nurd automake-1.12.6/lib/py-compile automake-1.12.6/lib/py-compile
---- automake-1.12.6/lib/py-compile	2012-12-13 21:57:31.000000000 +0200
-+++ automake-1.12.6/lib/py-compile	2012-12-27 19:34:01.426015140 +0200
-@@ -115,26 +115,6 @@
-     filetrans="filepath = os.path.normpath('$destdir' + os.sep + path)"
- fi
- 
--$PYTHON -c "
--import sys, os, py_compile, imp
--
--files = '''$files'''
--
--sys.stdout.write('Byte-compiling python modules...\n')
--for file in files.split():
--    $pathtrans
--    $filetrans
--    if not os.path.exists(filepath) or not (len(filepath) >= 3
--                                            and filepath[-3:] == '.py'):
--	    continue
--    sys.stdout.write(file)
--    sys.stdout.flush()
--    if hasattr(imp, 'get_tag'):
--        py_compile.compile(filepath, imp.cache_from_source(filepath), path)
--    else:
--        py_compile.compile(filepath, filepath + 'c', path)
--sys.stdout.write('\n')" || exit $?
--
- # this will fail for python < 1.5, but that doesn't matter ...
- $PYTHON -O -c "
- import sys, os, py_compile, imp
diff --git a/meta/recipes-devtools/automake/automake_1.15.bb b/meta/recipes-devtools/automake/automake_1.15.bb
index e3cb85b..4ce26b4 100644
--- a/meta/recipes-devtools/automake/automake_1.15.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.bb
@@ -19,7 +19,6 @@ RDEPENDS_${PN} += "\
 RDEPENDS_${PN}_class-native = "autoconf-native hostperl-runtime-native"
 
 SRC_URI += " file://python-libdir.patch \
-            file://py-compile-compile-only-optimized-byte-code.patch \
             file://buildtest.patch \
             file://performance.patch"
 
-- 
2.6.2


