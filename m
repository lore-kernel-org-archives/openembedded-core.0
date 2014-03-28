Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DF9706BFF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 16:48:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Mar 2014 09:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,751,1389772800"; d="scan'208";a="509109369"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2014 09:48:33 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.78]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.45]) with mapi id
	14.03.0123.003; Fri, 28 Mar 2014 16:48:32 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Jia, Hongxu (Wind River)" <hongxu.jia@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/5] packagegroup-self-hosted: Use
	packagegroup-core-buildessential
Thread-Index: AQHPSmpp00OHWFaagEGjKKekhtpnK5r2tZVA
Date: Fri, 28 Mar 2014 16:48:30 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1CE744B2@IRSMSX105.ger.corp.intel.com>
References: <cover.1395996410.git.hongxu.jia@windriver.com>
	<3ac712e3b9c2e6138fd34865a98a051ae16a45bf.1395996410.git.hongxu.jia@windriver.com>
In-Reply-To: <3ac712e3b9c2e6138fd34865a98a051ae16a45bf.1395996410.git.hongxu.jia@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 3/5] packagegroup-self-hosted: Use	packagegroup-core-buildessential
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
X-List-Received-Date: Fri, 28 Mar 2014 16:48:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

This is an important patch, please make sure that BA still works correctly =
after this one gets merged (including properly building an image in BA).

Thanks,
Cristian Iorga
YP
Intel Corporation

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Hongxu Jia
Sent: Friday, March 28, 2014 11:44 AM
To: openembedded-core@lists.openembedded.org
Cc: Wold, Saul
Subject: [OE-core] [PATCH 3/5] packagegroup-self-hosted: Use packagegroup-c=
ore-buildessential

From: Mark Hatle <mark.hatle@windriver.com>

Instead of manually specifying build dependencies, use the packagegroup-cor=
e-buildessential.  This ensures there is only one place that needs to be mo=
dified when toolchain items and dependencies change.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 12 +--------=
---
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/=
meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 5581d8e..fe49fb4 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -66,33 +66,23 @@ RRECOMMENDS_packagegroup-self-hosted-host-tools =3D "\
=20
 # eglibc-utils: for rpcgen
 RDEPENDS_packagegroup-self-hosted-sdk =3D "\
-    autoconf \
-    automake \
-    binutils \
     ccache \
     coreutils \
-    cpp \
     distcc \
     eglibc-utils \
     eglibc-gconv-ibm850 \
     file \
     findutils \
-    g++ \
-    gcc \
     intltool \
     ldd \
     less \
     libssp \
     libssp-dev \
     libssp-staticdev \
-    libstdc++ \
-    libstdc++-dev \
-    libtool \
-    make \
     mktemp \
+    packagegroup-core-buildessential \
     perl-module-re \
     perl-module-text-wrap \
-    pkgconfig \
     quilt \
     sed \
     "
--
1.8.1.2

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

