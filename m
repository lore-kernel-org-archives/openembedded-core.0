Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0089.outbound.protection.outlook.com [104.47.41.89])
	by mail.openembedded.org (Postfix) with ESMTP id 05EA871A92
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 20:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ht5mfZLYlx/j+f3Mreb4JqsaHKNGxekeZhxqvbFOKyM=;
	b=Qrx7na5rN8CeMiPw/hJGrPk1tyvtjcFm9G5zjunr1INlueyNBxNWUdPafXODQ1bsQ7O18/bzfJh+rpSJDcabuj7B4rdAA0PGkGUCnJ0FQ9vDeQE2bcyxGnJQhyldukY8TnmGB0F21NeMr46ALiCk4ybhuJwJ28rjjyy3QGlIpPU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	DM5PR01MB2684.prod.exchangelabs.com (10.172.185.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1019.17; Thu, 6 Apr 2017 19:53:57 +0000
From: Martin Kelly <martin@xevo.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Apr 2017 12:55:29 -0700
Message-ID: <1491508529-2862-1-git-send-email-martin@xevo.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY1PR0801CA0073.namprd08.prod.outlook.com (10.166.203.41)
	To DM5PR01MB2684.prod.exchangelabs.com (10.172.185.142)
X-MS-Office365-Filtering-Correlation-Id: af7c6630-eaee-42c2-80f0-08d47d26a9fb
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:DM5PR01MB2684; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR01MB2684;
	3:PQeYPOg6Yrebi4xAuUn3WurbwOE2lAMV4H/xi1Ezg91EdWkrpt8z738DwZ8LnJdXSHbtyhplSlG1gSCzJsoByJaWpWuAGwS0h34rXOv7VCXIcwMsIkgeGWgcSjhkQy5gXEI6T68Iu7LbTLb8Pe/iLVmX3inHe3O3wpguMtHmcc6PC2SVsNZ/ZvKpcBwcXtImKNDzs8gcuYvtEYGbsbiG89u2UhRB+eiqUuJdIoQmsBr0IJbA4OBnEXUE9Uc6xaOmwks3Gx1zcZa18YaZaOHHkcralw1/Hum/WnpHOo8XjYXvAHbHqAfmkS5VlR96RZFw0/Wb/7MgdMF53itKQEYTnw==;
	25:zMpeMJ1O1zpOxrR5fGFBHKbVS213tn6QKDfS2cp6JC8tmWzvg3BNoU8d11SXNYtnAocVEzUcDSFazefVzCY5rkO2Sdvqey8FuT6z3DCArPiq1cKcn5xpldK4waB5FR5DvzpIBUDNGfZ2YNu4W1/sZ1TaAwX0UExkBjwCvv2fyRvL1Eo/ww1Jg7xM3572qUk1nY649qRdoh5DASzhgSm+6kXM/JoGG+NFB01MjGsERUgwei9kFzoy2SRDSBMu7H+ti4gNklUDHUCdZ3I7pS9xg4SMV45gCIEeJWgS1lxPhO8jQzsef1iF4KHneMYYSL8//0YJ2a5VPh744JIh5n2SM1C7TIhhdAWKI8Wq3WJk2Z65LtNOpgWnffhlsW2urRxPFjGeyoCuL0QORYhkiO8g+NmhScV83qD7KL1qDJTu2fScz/RoXYQawBvmxiH93Dw5EJXuQEyabrrHXTY8S/CdaQ==
X-Microsoft-Exchange-Diagnostics: 1; DM5PR01MB2684;
	31:VR9JUP7/HSKd6jfqoPQ4Lw+MBMiSEYh40Xc8DVkqbhHzcX0Jn2HZbnl2/axyCiPe1JfoPPZke0J8e/AWzaI27NTB7v4iuU2ZO6nGK8mNB8kPegZXrVlkP0HIInT/Sq1FBGk7TEVjNhjLPPtmtKdgUMjPmxIPzrv/PT/UMfSjbF/PXmGT3vVFG8EQlennPD1XFLhIQRGpvRI4yFTUpDFRvL1qJoCbqxYNAkL7Mlyxsvo=;
	20:qy3WmMlyCIt2k0oaiLpgS/E/p+vEjU00p1Zd6PsqxnCmoWP/XH5zf2G5TZ0NhrDFuVoFAtOCv8s3o6N/LLOmpelFGt4Tmu6nH/Rxsp+/LOPjT32LZQoz51zwiqxlAx2W3cmbmaIb1xdm33wqg3tn0ZBZpMmrMvHCV01mkB8t6Qa+BBL8isYjQKMwMIgh0AI0j8EZfzVHp8FP0wES53KmsGd057Rn8kAGF2LWAo64lt4qgAJF1ymS6GfI9+D6T+3zTTEnaROJzgn/SSMhJ24Wp7S54B454/O9IIRmM1cpzxz9gSvGyCLv3vvjsjbGMJF+1RkZ/l1hLnJ6ghJ7XJ5V4A==
X-Microsoft-Antispam-PRVS: <DM5PR01MB26841952D39452A94ABDBDE4AB0D0@DM5PR01MB2684.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123562025)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(20161123560025)(6072148);
	SRVR:DM5PR01MB2684; BCL:0; PCL:0; RULEID:; SRVR:DM5PR01MB2684; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR01MB2684;
	4:9TXo6qkmf/SEo+PiUkqWX+6xsDisiudHKTfhxhnlxgEAdrihwWiBaWVAgIBGpzK0bN7YyHJzIwCjl2GWjNJ6Z84R/LwLBRnZVHo9xPzQ6ZB6hkCbVZxI9Pw6MJVzhpTwsksXhjWcvCccr0IrwqCC13XSMtJGX80ltHoMKT3ZP4NKx3KBq9sOQ4EfsUtYDDoOD7eVq/Hbldh+14Bhi5P23ymlUirJQpyt0yCu6+PHQWjbdWPs7WKKve/8zgWfMR5R68uru9iPPSAeZ9yLM7PcxvnWE5Pztwa9KVFpn8JNbmej6Sj1COmqqndNCi/pCFM/rA23t62N8SWHgtdJ9HDz3LBM2+8pf07HEBIgBTeZ+vr4fqBhTR+7JYAb43yAanTAPoo3q+g2U4QK7LdM7PtocRo+VX8kL+y1N2vlQwLlXKaa5qgEp0dCPCZZS2N2ldGg6wBLpVJy+Gamk0Td8JDOhOYycfaafU+9gk076amTcPsaNMx0JrS6SISVdYENjSfSIkH5ETyxNyorgi1kh5Au2Y6Doe+WsGytZhySoY/Zt9GdO7g5aS25VjTu3W+uEwYWzZrfbpb2HV5dZxdt/DIfPx6OK43+5Xsg5OxZsKB3ziLkPq6+zvppi3qTldHTVqQY33XwTwoZYJj7Pd5FcVW+FG8w/l3UfmYuxfiadw6ly0cDTAGaKAyjujQsqSD+BicCbMyyPmzmjLv8DVJaqTwebQ==
X-Forefront-PRVS: 02698DF457
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39400400002)(39450400003)(39410400002)(39830400002)(305945005)(7736002)(5660300001)(36756003)(50226002)(47776003)(66066001)(50466002)(575784001)(6486002)(3846002)(6916009)(6666003)(5003940100001)(2351001)(6506006)(189998001)(53416004)(42186005)(6512007)(33646002)(110136004)(38730400002)(25786009)(4326008)(107886003)(2906002)(8676002)(50986999)(6116002)(53936002)(81166006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR01MB2684;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR01MB2684;
	23:3Tz53GwzyVfUf5u5plPb0nF8t9uiJpRAcDRG1Ii2o?=
	=?us-ascii?Q?Wb67B/vfFDRBXXzEqy3C28TXkq7B3liiEB1W3LUWtqt7HeeNp7avK/eLO0fe?=
	=?us-ascii?Q?f6IUeJdwpt5veTsem6j9FagSYKHe+P6Rq438HOuslE9arTRgr/6iLwn+GfZM?=
	=?us-ascii?Q?VB1ZPOIWAAf2/qk/aIkQByT5WhCoxuab16uNvVULCRmcvveMromP2GInrtbr?=
	=?us-ascii?Q?w0Yikcy9Dd9PyJIB4jM0EJSY6mP3XSMmxGY/jE2vtyKN7t0nSgg0de8JIOtY?=
	=?us-ascii?Q?YL/9IxHFQbHA8N66a0vOaR27buA/CHaYnawQWt5bq8jTwV0Rfs0NcJL1oi2V?=
	=?us-ascii?Q?JJpi7fs/UmOhTLViiaBCuyj8JDsmeVrBHcGRsgUrNgoQzmyVNneXlKZQL2q4?=
	=?us-ascii?Q?OZ1QOApn2rKEBTaoQZAcSqujQM8bzWdLwaYUtD3yQ2sfUQ98hRn+XqUOBvN3?=
	=?us-ascii?Q?unk2tbqZIhdS9Lp58aCvED2rpPrJcCotVIyKJb3hy7ZKEPA4ajs/V9Q43exu?=
	=?us-ascii?Q?5P0KhKzxDpDABSPSeFR5P1+OHoM0cKFU/BLuE7ZqU+NHddExxQqPX8ChOZPh?=
	=?us-ascii?Q?88mK3rkVjvvjBWyPei3QODTWhJ26aN124n5woeuQdQiDqutlJMaJuqzw3iOe?=
	=?us-ascii?Q?6lM1pZEw0A14jNFHIJ/wJ2wJHnGPKRYzQKdZPg2q/VX1xWIvVQXRAPUy29J6?=
	=?us-ascii?Q?YGRsn1hq1AD893rTSSXNJ3CkLgZaYBCDgB/G2/I40xLj9gJbhRTPmuM3+AN2?=
	=?us-ascii?Q?OR9O2AMnDMhxTuWCpJaPWsuMJ4tBk60IU+v+pIeDtfYkPCZmW9odnChfd7eK?=
	=?us-ascii?Q?yMWcPphgXoORpMFEi993/1xrJOPaflORftA9/gqK0PEJ59DRgSDclaWI2icA?=
	=?us-ascii?Q?9TF6sQn0/xg/I+/3wi+6tBjdg1zhjIxtEgV/jnUBq1Oi/pDI8kPC33B7DVQ0?=
	=?us-ascii?Q?4p/fClM8Fi+kPi4LNMSoZfGawX1vD2ibI/vcadykA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR01MB2684;
	6:Xp9oSCL6hEZtushY5mY0BI33xC9v+ut0LcHfYtWeFar/h2qLmTPf/biAxMEFCqoeB9BuhK/tgoDex8OGG5iCNf82beOyoiUQZ8uJq+JnoYMMqFEOVUKoVT742lBNoSoA7SQKH8VNavjZvUZ+NCyQLEWWwSa2AI9+QrlkLuowU2MnkOCcoW2ousU6+87TFbJI7g/82Eb3gzcdvI4ypI6kdcM6XfysgGV5Fs7oUhzhw6q1t/Dnzd/kIx3eE+Gq6iEpEaL/Vv0Wkjg6oBeINajz7Wjg07qQLMyCbct2Y5vOouwYSwZb2tQj2Bg3iC7A5FV1YoJvbv4QP0ZAVIZUoswq3UQgQr847ek6SFTmW0gazUA45Q64m3+KLPAjgOMz71nBjODnPZ2eMWo9XDtBk6YQmg==;
	5:8Y609QpbfdgunYjLvM6e5guRMEVcUpTh7rCJ1dQnE7923Gu5SoM3TWcR+VEPIFwDMv56Jne/F6olnJN8xxc0k/ijHD59ubSTSusUs/yOZWPzCSpb1Knfxut//OSuF0o96yEmu2YYj4t+mMpsgjGUbA==;
	24:0wbehPBbtgXwypzBasUuAGk8ZeS312t4+Azqfkivf8zQbw4PHglrWz5AANV9AGQ8zr6d+DwZldT7LElZdCb9hKIB0FdLd3II6ag74rqcvls=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR01MB2684;
	7:q2hiirpSH9xosYp4czUcNA4j52zHdV882enowbP+QTIfqpGAuG3orhAlOfkdSnVFT0A2SI0LlOd7SYqRlpJVEZ2IXGCBW+3hkp1dfGa9WBnuKLKafK/nsPpbFQ/0PybkVX6zt5+jzfhfLSDiJu3QpuiSw6lwjOv3X2MlJOT2MODUd0REDIbQYPzts2W7bkJUur9/kquFIEGslONcpl/KrOG4yknJsauzmVT9bnCFpgzjW9fiiO/czvfFNJG66cPujRbeK0HG3DDlMddOKTRMENBLhgFa/OK8demlZKWyZteCGR5ETaUIBf2QeXg9Luen1n/fMXYBEoeRCLYkjTJ1EQ==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2017 19:53:57.8322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2684
Subject: [PATCH] libsdl: enable X11 for nativesdk
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
X-List-Received-Date: Thu, 06 Apr 2017 20:08:57 -0000
Content-Type: text/plain

From: Martin Kelly <mkelly@xevo.com>

Currently, the following situation fails:

- Build an SDK and image. Make the image support graphics but not X11.
- Extract SDK and copy image somewhere outside of the Yocto workspace. Do
  runqemu on the image.

This results in the error:
"Could not initialize SDL(No available video device) - exiting"

This error occurs because libSDL attempts to load libX11 for video devices. When
it fails, qemu also fails.

Note that the same runqemu command will work fine from within the Yocto
workspace environment because it will use the native libSDL -- which supports
X11 -- rather than the nativesdk libSDL. In addition, the command will work fine
as long as DISTRO_FEATURES includes x11, because then the nativesdk libSDL will
be compiled with X11 support.

Although the example above may seem a bit silly, this is actually a pretty bad
error because it breaks the ability to build an SDK and image on one machine and
run it on a different machine.

Fix the issue by building nativesdk-libsdl with X11 support -- even when
DISTRO_FEATURES does not include X11 -- as we already do for libsdl-native.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      | 3 ++-
 meta/recipes-graphics/xorg-lib/libxcb_1.12.bb      | 1 +
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index c802a6f..89d84ab 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -43,8 +43,9 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
+# Without X11 support, qemu will fail because SDL cannot find video devices.
 PACKAGECONFIG_class-native = "x11"
-PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG_class-nativesdk = "x11"
 
 PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
index a38bdea..6d7e675 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
@@ -31,6 +31,7 @@ inherit autotools pkgconfig distro_features_check
 # The libxau and others requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 REQUIRED_DISTRO_FEATURES_class-native = ""
+REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
 
 export PYTHON = "python3"
 
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 6f4e444..b397923 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -25,3 +25,4 @@ UNKNOWN_CONFIGURE_WHITELIST += "--enable-malloc0returnsnull --disable-malloc0ret
 
 REQUIRED_DISTRO_FEATURES ?= "x11"
 REQUIRED_DISTRO_FEATURES_class-native = ""
+REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
-- 
2.1.4


