Return-Path: <ting.liu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0236.outbound.protection.outlook.com [207.46.163.236])
	by mail.openembedded.org (Postfix) with ESMTP id 14A3C7037A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 09:52:29 +0000 (UTC)
Received: from BLUPR03CA036.namprd03.prod.outlook.com (10.141.30.29) by
	BL2PR03MB145.namprd03.prod.outlook.com (10.255.230.13) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Wed, 16 Jul 2014 09:37:18 +0000
Received: from BN1AFFO11FD018.protection.gbl (2a01:111:f400:7c10::177) by
	BLUPR03CA036.outlook.office365.com (2a01:111:e400:879::29) with
	Microsoft
	SMTP Server (TLS) id 15.0.985.8 via Frontend Transport; Wed, 16 Jul 2014
	09:37:18 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD018.mail.protection.outlook.com (10.58.52.78) with Microsoft
	SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Wed, 16 Jul 2014 09:37:18 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6G9bE64031022;
	Wed, 16 Jul 2014 02:37:15 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jul 2014 17:38:10 +0800
Message-ID: <1405503492-27938-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(50466002)(110136001)(83072002)(105606002)(106466001)(89996001)(81342001)(92726001)(92566001)(85852003)(20776003)(104016003)(46102001)(36756003)(2351001)(64706001)(99396002)(87286001)(81542001)(76482001)(81156004)(80022001)(88136002)(107046002)(86152002)(69596002)(21056001)(87936001)(50986999)(86362001)(44976005)(95666004)(229853001)(83322001)(84676001)(102836001)(4396001)(68736004)(6806004)(85306003)(97736001)(74502001)(47776003)(74662001)(77156001)(104166001)(19580405001)(50226001)(48376002)(31966008)(77982001)(79102001)(93916002)(62966002)(19580395003)(26826002)(33646002);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB145;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0274272F87
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.158.2
	as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/3] python-numpy: add support for powerpc64 architecture
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
X-List-Received-Date: Wed, 16 Jul 2014 09:52:30 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 .../python/python-numpy/powerpc64/_numpyconfig.h   |   30 ++++
 .../python/python-numpy/powerpc64/config.h         |  139 ++++++++++++++++++++
 meta/recipes-devtools/python/python-numpy_1.7.0.bb |    4 +
 3 files changed, 173 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/powerpc64/config.h

diff --git a/meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h
new file mode 100644
index 0000000..be57ac2
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h
@@ -0,0 +1,30 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 16
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_SIZEOF_PY_INTPTR_T 8
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x00000007
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta/recipes-devtools/python/python-numpy/powerpc64/config.h b/meta/recipes-devtools/python/python-numpy/powerpc64/config.h
new file mode 100644
index 0000000..c30b868
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/powerpc64/config.h
@@ -0,0 +1,139 @@
+#define HAVE_ENDIAN_H 1
+#define SIZEOF_PY_INTPTR_T 8
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta/recipes-devtools/python/python-numpy_1.7.0.bb b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
index f8974cf..903ec7b 100644
--- a/meta/recipes-devtools/python/python-numpy_1.7.0.bb
+++ b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
@@ -42,6 +42,10 @@ CONFIGFILESURI_powerpc = " \
     file://config.h \
     file://_numpyconfig.h \
 "
+CONFIGFILESURI_powerpc64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
 
 S = "${WORKDIR}/numpy-${PV}"
 
-- 
1.7.3.4


