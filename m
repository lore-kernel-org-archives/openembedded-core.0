Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D60F96BD74
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 06:56:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2013 23:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,989,1367996400"; d="scan'208";a="395838725"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga002.jf.intel.com with ESMTP; 29 Aug 2013 23:56:38 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.157]) with mapi id
	14.03.0123.003; Fri, 30 Aug 2013 07:56:04 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] packagegroup-self-hosted: Add missing python code
Thread-Index: AQHOpQxn9PNTXlipYkGIFi3/BA5QUpmtUdUA
Date: Fri, 30 Aug 2013 06:56:03 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C2E800@IRSMSX105.ger.corp.intel.com>
References: <1377817584-30537-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1377817584-30537-1-git-send-email-sgw@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH] packagegroup-self-hosted: Add missing python code
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
X-List-Received-Date: Fri, 30 Aug 2013 06:56:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK.

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Friday, August 30, 2013 2:06 AM
To: Iorga, Cristian; openembedded-core@lists.openembedded.org
Subject: [PATCH] packagegroup-self-hosted: Add missing python code

These are in the Toolchain list, so they should also be installed on the bu=
ild appliance

[YOCTO #5061]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/=
meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 429ade9..6e23ea2 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -138,6 +138,7 @@ RDEPENDS_packagegroup-self-hosted-extended =3D "\
     minicom \
     mtools \
     ncurses \
+    ncurses-terminfo-base \
     neon \
     nfs-utils \
     nfs-utils-client \
@@ -158,24 +159,29 @@ RDEPENDS_packagegroup-self-hosted-extended =3D "\
     python-core \
     python-curses \
     python-datetime \
+    python-difflib \
     python-distutils \
     python-elementtree \
     python-email \
     python-fcntl \
     python-git \
+    python-json \
     python-logging \
     python-misc \
+    python-mmap \
     python-multiprocessing \
     python-netclient \
     python-netserver \
     python-pickle \
     python-pkgutil \
+    python-pprint \
     python-re \
     python-rpm \
     python-shell \
     python-sqlite3 \
     python-subprocess \
     python-textutils \
+    python-unittest \
     python-unixadmin \
     python-xmlrpc \
     quota \
--=20
1.8.3.1


