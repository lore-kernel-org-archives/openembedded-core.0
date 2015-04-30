Return-Path: <Jagadeesh.Krishnanjanappa@caviumnetworks.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0075.outbound.protection.outlook.com [157.56.111.75])
	by mail.openembedded.org (Postfix) with ESMTP id 399E365CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 17:13:58 +0000 (UTC)
Received: from BY1PR0701MB1144.namprd07.prod.outlook.com (25.160.105.12) by
	BY1PR0701MB1143.namprd07.prod.outlook.com (25.160.105.11) with
	Microsoft SMTP
	Server (TLS) id 15.1.148.16; Thu, 30 Apr 2015 17:13:57 +0000
Received: from BY1PR0701MB1144.namprd07.prod.outlook.com ([25.160.105.12]) by
	BY1PR0701MB1144.namprd07.prod.outlook.com ([25.160.105.12]) with
	mapi id 15.01.0148.008; Thu, 30 Apr 2015 17:13:57 +0000
From: "Krishnanjanappa, Jagadeesh"
	<Jagadeesh.Krishnanjanappa@caviumnetworks.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] qt4-embedded: add checking for AArch64 ilp32
Thread-Index: AQHQd1WIO/A4BmCdi0axVDQNNH4B4p1l40Hw
Date: Thu, 30 Apr 2015 17:13:56 +0000
Message-ID: <1430414032769.54823@caviumnetworks.com>
References: <1429086228-27288-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
In-Reply-To: <1429086228-27288-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [64.2.3.194]
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0701MB1143;
x-microsoft-antispam-prvs: <BY1PR0701MB11434A6BF6D9E2AD382A4FA68ED60@BY1PR0701MB1143.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0701MB1143; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0701MB1143; 
x-forefront-prvs: 056297E276
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(377424004)(377454003)(46102003)(122556002)(2501003)(99286002)(2351001)(5001960100002)(92566002)(102836002)(106116001)(50986999)(76176999)(87936001)(40100003)(77156002)(86362001)(450100001)(36756003)(2656002)(2900100001)(54356999)(66066001)(117636001)(2950100001)(15975445007)(19580405001)(19580395003)(62966003)(110136002)(107886002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0701MB1143;
	H:BY1PR0701MB1144.namprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2015 17:13:56.3764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0701MB1143
Subject: Re: [PATCH] qt4-embedded: add checking for AArch64 ilp32
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
X-List-Received-Date: Thu, 30 Apr 2015 17:14:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ping.

Regards,
Jagadeesh
________________________________________
From: Krishnanjanappa, Jagadeesh
Sent: Wednesday, April 15, 2015 1:53 PM
To: openembedded-core@lists.openembedded.org
Cc: Krishnanjanappa, Jagadeesh
Subject: [OE-core][PATCH] qt4-embedded: add checking for AArch64 ilp32

From: "Krishnanjanappa, Jagadeesh" <jagadeesh.krishnanjanappa@caviumnetwork=
s.com>

1. Cross-compiling qt4-embedded and qt4-x11-free applications for AArch64 i=
lp32
   (both big and little endian) fails with below error,

(snip)
In file included from ../3rdparty/javascriptcore/JavaScriptCore/runtime/Col=
lector.h:31:0,
                 from ../3rdparty/javascriptcore/JavaScriptCore/runtime/JSG=
lobalData.h:32,
                 from ../3rdparty/javascriptcore/JavaScriptCore/interpreter=
/CallFrame.h:26,
                 from ../3rdparty/javascriptcore/JavaScriptCore/runtime/Cla=
ssInfo.h:26,
                 from ../3rdparty/javascriptcore/JavaScriptCore/runtime/JSO=
bject.h:27,
                 from ../3rdparty/javascriptcore/JavaScriptCore/API/JSCallb=
ackConstructor.h:30,
                 from ../3rdparty/javascriptcore/JavaScriptCore/API/JSCallb=
ackConstructor.cpp:27:
../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h: In instantiat=
ion of 'TO QTWTF::bitwise_cast(FROM) [with TO =3D int; FROM =3D double]':
../3rdparty/javascriptcore/JavaScriptCore/runtime/JSImmediate.h:52:49: requ=
ired from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h:63:1: error: s=
ize of array is negative
../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h: In instantiat=
ion of 'TO QTWTF::bitwise_cast(FROM) [with TO =3D double; FROM =3D int]':
../3rdparty/javascriptcore/JavaScriptCore/runtime/JSImmediate.h:57:47: requ=
ired from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h:63:1: error: s=
ize of array is negative
make[1]: *** [obj/release/JSCallbackConstructor.o] Error 1
-- CUT --

    the error is because of JSVALUE64 is being defined while compiling
    programs for AArch64 ilp32. This makes equal condition checking of
    intptr_t and double datatypes as false, and results in -1 (negative)
    as array size in bitwise_cast function.
    The patch defines JSVALUE64, if the programs are being compiled for
    AArch64 64bit NOT for ilp32.

2. qt4_arch.inc is modified to set system architecture as aarch64 if the
   TARGET_ARCH is other than aarch64. Without this modification, for
   TARGET_ARCH equal to aarch64_32, aarch64be, aarch64be_32; the system
   architecture is set as 'generic' and results in below error.

configure log:
(snip)
64-bit AMD 80x86 (x86_64)
'-opensource' is unsupported, using 'generic'
'x86_64' is supported
System architecture: 'generic'
Host architecture: 'x86_64'
-- CUT --

build error:
(snip)
In file included from ../../include/QtCore/qatomic_generic.h:1:0,
                 from ../../include/QtCore/../../src/corelib/arch/qatomic_a=
rch.h:64,
                 from ../../include/QtCore/qatomic_arch.h:1,
                 from ../../include/QtCore/../../src/corelib/thread/qbasica=
tomic.h:227,
                 from ../../include/QtCore/qbasicatomic.h:1,
                 from ../../include/QtCore/../../src/corelib/thread/qatomic=
.h:46,
                 from ../../include/QtCore/qatomic.h:1,
                 from ../../include/QtCore/../../src/corelib/tools/qbytearr=
ay.h:45,
                 from ../../include/QtCore/qbytearray.h:1,
                 from ../../include/QtCore/../../src/corelib/tools/qstring.=
h:46,
                 from ../../include/QtCore/qstring.h:1,
                 from ../../include/QtCore/../../src/corelib/kernel/qobject=
.h:48,
                 from ../../include/QtCore/qobject.h:1,
                 from ../../include/QtCore/../../src/corelib/kernel/qcoreap=
plication.h:45,
                 from ../../include/QtCore/qcoreapplication.h:1,
                 from qdbusintegrator.cpp:42:
../../include/QtCore/../../src/corelib/arch/qatomic_generic.h: In instantia=
tion of 'bool QBasicAtomicPointer<T>::testAndSetOrdered(T*, T*) [with T =3D=
 const QString]':
qdbusintegrator.cpp:76:1:   required from here
../../include/QtCore/../../src/corelib/arch/qatomic_generic.h:197:88: error=
: invalid conversion from 'const void*' to 'void*' [-fpermissive]
../../include/QtCore/../../src/corelib/arch/qatomic_generic.h:108:20: error=
: initializing argument 2 of 'bool QBasicAtomicPointer_testAndSetOrdered(vo=
id* volatile*, void*, void*)' [-fpermissive]
../../include/QtCore/../../src/corelib/arch/qatomic_generic.h:197:88: error=
: invalid conversion from 'const void*' to 'void*' [-fpermissive]
../../include/QtCore/../../src/corelib/arch/qatomic_generic.h:108:20: error=
: initializing argument 3 of 'bool QBasicAtomicPointer_testAndSetOrdered(vo=
id* volatile*, void*, void*)' [-fpermissive]
make[1]: *** [.obj/release-shared-emb-auto/qdbusintegrator.o] Error 1
make[1]: *** Waiting for unfinished jobs....
-- CUT --

   So, select system architecture (via QT_ARCH) as aarch64 for
   AArch64 and its other variants

Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@cavium=
networks.com>
---
 meta/recipes-qt/qt4/qt4-4.8.6.inc                  |  1 +
 .../qt4/qt4-4.8.6/add_check_for_aarch64_32.patch   | 55 ++++++++++++++++++=
++++
 meta/recipes-qt/qt4/qt4_arch.inc                   |  2 +-
 3 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/add_check_for_aarch64_32.=
patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc b/meta/recipes-qt/qt4/qt4-4.=
8.6.inc
index 19f52a7..0cb7f80 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.6.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.6.inc
@@ -28,6 +28,7 @@ SRC_URI =3D "http://download.qt-project.org/official_rele=
ases/qt/4.8/${PV}/qt-ever
            file://0032-aarch64_add_header.patch \
            file://0034-Fix-a-division-by-zero-when-processing-malformed-BM=
P.patch \
            file://Fix-QWSLock-invalid-argument-logs.patch \
+           file://add_check_for_aarch64_32.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/add_check_for_aarch64_32.patch b=
/meta/recipes-qt/qt4/qt4-4.8.6/add_check_for_aarch64_32.patch
new file mode 100644
index 0000000..ad5103d
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.6/add_check_for_aarch64_32.patch
@@ -0,0 +1,55 @@
+Author: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetwor=
ks.com>
+Date:   Sun Apr 12 19:27:10 2015 +0530
+
+[PATCH] add checking for AArch64 ilp32
+
+Cross-compiling qt4-embedded and qt4-x11-free applications for AArch64 ilp=
32
+(both big and little endian) fails with below error,
+
+(snip)
+In file included from ../3rdparty/javascriptcore/JavaScriptCore/runtime/Co=
llector.h:31:0,
+                 from ../3rdparty/javascriptcore/JavaScriptCore/runtime/JS=
GlobalData.h:32,
+                 from ../3rdparty/javascriptcore/JavaScriptCore/interprete=
r/CallFrame.h:26,
+                 from ../3rdparty/javascriptcore/JavaScriptCore/runtime/Cl=
assInfo.h:26,
+                 from ../3rdparty/javascriptcore/JavaScriptCore/runtime/JS=
Object.h:27,
+                 from ../3rdparty/javascriptcore/JavaScriptCore/API/JSCall=
backConstructor.h:30,
+                 from ../3rdparty/javascriptcore/JavaScriptCore/API/JSCall=
backConstructor.cpp:27:
+../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h: In instantia=
tion of 'TO QTWTF::bitwise_cast(FROM) [w
+../3rdparty/javascriptcore/JavaScriptCore/runtime/JSImmediate.h:52:49: req=
uired from here
+../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h:63:1: error: =
size of array is negative
+../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h: In instantia=
tion of 'TO QTWTF::bitwise_cast(FROM) [w
+../3rdparty/javascriptcore/JavaScriptCore/runtime/JSImmediate.h:57:47: req=
uired from here
+../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h:63:1: error: =
size of array is negative
+make[1]: *** [obj/release/JSCallbackConstructor.o] Error 1
+-- CUT --
+
+the error is because of JSVALUE64 is being defined while compiling program=
s
+for AArch64 ilp32. This makes equal condition checking of intptr_t and dou=
ble
+datatypes as false, and results in -1 (negative) as array size in bitwise_=
cast
+function.
+
+Upstream-Status: Pending
+
+Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviu=
mnetworks.com>
+
+--- a/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Platform.h        201=
4-04-11 00:07:12.000000000 +0530
++++ b/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Platform.h        201=
5-04-10 22:19:51.066279426 +0530
+@@ -214,6 +214,9 @@
+ #define WTF_CPU_AARCH64 1
+ #if defined(__AARCH64EB__)
+ #define WTF_CPU_BIG_ENDIAN 1
++#if !defined(__LP64__)
++#define WTF_CPU_AARCH64_32 1
++#endif
+ #endif
+ #endif
+
+@@ -903,7 +906,7 @@
+ #endif
+
+ #if !defined(WTF_USE_JSVALUE64) && !defined(WTF_USE_JSVALUE32) && !define=
d(WTF_USE_JSVALUE32_64)
+-#if (CPU(X86_64) && (OS(UNIX) || OS(WINDOWS) || OS(SOLARIS) || OS(HPUX)))=
 || (CPU(IA64) && !CPU(IA64_32)) || CPU(ALPHA) || CPU(AIX64) || CPU(SPARC64=
) || CPU(MIPS64) || CPU(AARCH64)
++#if (CPU(X86_64) && (OS(UNIX) || OS(WINDOWS) || OS(SOLARIS) || OS(HPUX)))=
 || (CPU(IA64) && !CPU(IA64_32)) || CPU(ALPHA) || CPU(AIX64) || CPU(SPARC64=
) || CPU(MIPS64) || (CPU(AARCH64) && !CPU(AARCH64_32))
+ #define WTF_USE_JSVALUE64 1
+ #elif CPU(ARM) || CPU(PPC64)
+ #define WTF_USE_JSVALUE32 1
diff --git a/meta/recipes-qt/qt4/qt4_arch.inc b/meta/recipes-qt/qt4/qt4_arc=
h.inc
index 07512db..e94c284 100644
--- a/meta/recipes-qt/qt4/qt4_arch.inc
+++ b/meta/recipes-qt/qt4/qt4_arch.inc
@@ -4,7 +4,7 @@ ARM_INSTRUCTION_SET =3D "arm"

 set_arch() {
    case ${TARGET_ARCH} in
-       aarch64)  QT_ARCH=3Daarch64 ;;
+       aarch64*) QT_ARCH=3Daarch64 ;;
        arm*)     QT_ARCH=3Darm ;;
        i*86*)    QT_ARCH=3Di386 ;;
        mips*)    QT_ARCH=3Dmips ;;
--
1.8.2.3


