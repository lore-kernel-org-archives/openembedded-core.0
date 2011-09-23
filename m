Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@intel.com>) id 1R6wat-00077d-DS
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 05:38:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Sep 2011 20:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,427,1312182000"; d="scan'208";a="67342340"
Received: from irsmsx601.ger.corp.intel.com ([163.33.7.164])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2011 20:32:05 -0700
Received: from irsmsx102.ger.corp.intel.com (163.33.3.155) by
	irsmsx601.ger.corp.intel.com (163.33.7.164) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 23 Sep 2011 04:32:04 +0100
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.79]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.105]) with mapi id
	14.01.0323.003; Fri, 23 Sep 2011 04:32:04 +0100
From: "Purdie, Richard" <richard.purdie@intel.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] populate_sdk_rpm: add
	pkgconfig(pkg-config)	to the list
Thread-Index: AQHMeZmKjhfZhe64U0e+a8khpjAPFpVaT4V+
Date: Fri, 23 Sep 2011 03:32:03 +0000
Message-ID: <ACACFD211CF4804FA46249D0B0281C8E03F665@IRSMSX101.ger.corp.intel.com>
In-Reply-To: <e29f6f15240fca1ca22a88aec8e167165153e66b.1316745222.git.sgw@linux.intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.184]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] populate_sdk_rpm: add pkgconfig(pkg-config)	to the list
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Sep 2011 03:38:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Unless this goyt mangled by this device it still looks to have whitespace p=
roblems.

Richard

----- Original Message -----
From: Saul Wold [mailto:sgw@linux.intel.com]
Sent: Friday, September 23, 2011 03:35 AM=0A=
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [OE-core] [PATCH 1/1] populate_sdk_rpm: add pkgconfig(pkg-config)	=
to the list

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/populate_sdk_rpm.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_=
sdk_rpm.bbclass
index e837f9e..b550427 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -35,7 +35,7 @@ fakeroot populate_sdk_rpm () {
 	export INSTALL_PACKAGES_NORMAL_RPM=3D"${TOOLCHAIN_TARGET_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=3D""
 	export INSTALL_PACKAGES_LINGUAS_RPM=3D""
-	export INSTALL_PROVIDENAME_RPM=3D"/bin/bash /usr/bin/env /usr/bin/perl pk=
gconfig"
+	export INSTALL_PROVIDENAME_RPM=3D"/bin/bash /usr/bin/env /usr/bin/perl pk=
gconfigpkgconfig(pkg-config)"
 	export INSTALL_TASK_RPM=3D"populate_sdk-target"
=20
 	# Setup base system configuration
--=20
1.7.6


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


