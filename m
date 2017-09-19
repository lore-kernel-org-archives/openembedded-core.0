Return-Path: <yin.thong.choong@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8631B71AC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 05:28:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Sep 2017 22:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,416,1500966000"; d="scan'208";a="901637019"
Received: from pgsmsx102.gar.corp.intel.com ([10.221.44.80])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Sep 2017 22:28:24 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.27]) by
	PGSMSX102.gar.corp.intel.com ([169.254.6.144]) with mapi id
	14.03.0319.002; Tue, 19 Sep 2017 13:28:23 +0800
From: "Choong, Yin Thong" <yin.thong.choong@intel.com>
To: 'Andrea Adami' <andrea.adami@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 2/2] sysvinit-inittab: start_getty: Cleanup comments
Thread-Index: AQHTLntqVSssTxQm/keije1v7d1f1qK7jt3A
Date: Tue, 19 Sep 2017 05:28:23 +0000
Message-ID: <CF0C948DE8E2634BB64BF489FF9EF7E7DF7A6D@PGSMSX105.gar.corp.intel.com>
References: <1505518550-13471-1-git-send-email-andrea.adami@gmail.com>
	<1505518550-13471-3-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1505518550-13471-3-git-send-email-andrea.adami@gmail.com>
Accept-Language: en-SG, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] sysvinit-inittab: start_getty: Cleanup comments
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
X-List-Received-Date: Tue, 19 Sep 2017 05:28:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Look's good to me.=20

Thanks and Regards
Choong Yin Thong


-----Original Message-----
From: Andrea Adami [mailto:andrea.adami@gmail.com]=20
Sent: Saturday, September 16, 2017 7:36 AM
To: openembedded-core@lists.openembedded.org
Cc: Choong, Yin Thong <yin.thong.choong@intel.com>; Saul Wold <sgw@linux.in=
tel.com>; Andrea Adami <andrea.adami@gmail.com>
Subject: [PATCH 2/2] sysvinit-inittab: start_getty: Cleanup comments

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../sysvinit/sysvinit-inittab/start_getty          | 26 +++++++++++-------=
----
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta=
/recipes-core/sysvinit/sysvinit-inittab/start_getty
index f0d9f8c..e15ae35 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -1,16 +1,16 @@
 #!/bin/sh
-##########################################################################=
##########
-# This script is use to automatic start serial console once power up.
-# Script enhancement has been done base on Bug YOCTO 10844.
-# Configuration can be done in meta/conf/machine/*.conf variable SERIAL_CO=
NSOLES.
-# Most of the information is retrieve from /proc virtual filesystem which =
-# contain all the runtime system information (eg. system memory, device mo=
unt, etc).
-##########################################################################=
##########
+#######################################################################
+######## # This script is used to automatically set up the serial=20
+console(s) on startup.
+# The variable SERIAL_CONSOLES can be set in meta/conf/machine/*.conf.
+# Script enhancement has been done based on Bug YOCTO #10844.
+# Most of the information is retrieved from /proc virtual filesystem=20
+containing # all the runtime system information (eg. system memory, device=
 mount, etc).
+#######################################################################
+########
=20
 # Get active serial filename.
 active_serial=3D$(grep "serial" /proc/tty/drivers | cut -d/ -f1 | sed "s/ =
*$//")
=20
-# Re-phrase input parameter from ttyS target index (ttyS1, ttyS2, ttyAMA0,=
 etc).
+# Rephrase input parameter from ttyS target index (ttyS1, ttyS2, ttyAMA0, =
etc).
 runtime_tty=3D$(echo $2 | grep -oh '[0-9]')
=20
 # Backup $IFS.
@@ -19,14 +19,14 @@ DEFAULT_IFS=3D$IFS
 IFS=3D"$(printf '\n\t')"
=20
 for line in $active_serial; do
-	# File is availability, file content current active serial target index.
+	# Check we have the file containing current active serial target index.
 	if [ -e "/proc/tty/driver/$line" ]
         then
-		# File content a lot of unknown serial. We use -v to remove all unmatch =
and get left off.
-		# Tail use to avoid 1st line included into the filter because 1st line i=
s file description.
-		activetty=3D$(grep -v "unknown" "/proc/tty/driver/$line" | tail -n +2 | =
grep -oh "^\s*\S*[0-9]")
+		# Remove all unknown entries and discard the first line (desc).
+		activetty=3D$(grep -v "unknown" "/proc/tty/driver/$line" \
+			    | tail -n +2 | grep -oh "^\s*\S*[0-9]")
 		for active in $activetty; do
-			# Check if both index is match then proceed to enable the serial consol=
e.
+			# If indexes do match then enable the serial console.
 			if [ $active -eq $runtime_tty ]
 			then
 				if [ -c /dev/$2 ]
--
2.7.4


