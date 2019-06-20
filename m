Return-Path: <jrey@linux.ibm.com>
X-Greylist: delayed 4986 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 20 Jun 2019 22:50:44 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by mail.openembedded.org (Postfix) with ESMTP id B1DD97D584
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 22:50:44 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x5KLRCKb056601 for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 17:27:39 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2t8hsx0hyj-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 17:27:39 -0400
Received: from localhost
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <openembedded-core@lists.openembedded.org> from
	<jrey@linux.ibm.com>; Thu, 20 Jun 2019 22:27:38 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
	by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 20 Jun 2019 22:27:36 +0100
Received: from b03ledav005.gho.boulder.ibm.com
	(b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x5KLRZYP43778320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 21:27:36 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D62FBBE04F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 21:27:35 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5898BE051
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 21:27:35 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 21:27:35 +0000 (GMT)
MIME-Version: 1.0
Date: Thu, 20 Jun 2019 16:29:15 -0500
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openembedded-core@lists.openembedded.org
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19062021-0036-0000-0000-00000ACE3B8D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011299; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000286; SDB=6.01220872; UDB=6.00642277;
	IPR=6.01002010; 
	MB=3.00027397; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-20 21:27:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062021-0037-0000-0000-00004C4BF3CD
Message-Id: <bda7b5327801b5556be27645fde22d04@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-20_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906200153
Subject: [PATCH] dropbear: new feature: disable-weak-ciphers
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
X-List-Received-Date: Thu, 20 Jun 2019 22:50:44 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

dropbear: new feature: disable-weak-ciphers

Enhances dropbear with a new feature "disable-weak-ciphers", on by 
default.
This feature disables all CBC, SHA1, and diffie-hellman group1 ciphers 
in
the dropbear ssh server and client.

Disable this feature if you need to connect to the ssh server from older
clients.  Additional customization can be done with local_options.h as 
usual.

Tested: On dropbear_2019.78.

Upstream-Status: Inappropriate [configuration]

Signed-off-by: Joseph Reynolds <joseph.reynolds1@ibm.com>
---
  meta/recipes-core/dropbear/dropbear.inc            |  6 ++--
  .../dropbear/dropbear-disable-weak-ciphers.patch   | 37 
++++++++++++++++++++++
  2 files changed, 41 insertions(+), 2 deletions(-)
  create mode 100644 
meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc 
b/meta/recipes-core/dropbear/dropbear.inc
index b74d186..dcbda74 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -20,7 +20,8 @@ SRC_URI = 
"http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
             file://dropbear@.service \
             file://dropbear.socket \
             file://dropbear.default \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 
'${PAM_SRC_URI}', '', d)} "
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 
'${PAM_SRC_URI}', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 
'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', 
'', d)} "

  PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                 file://0006-dropbear-configuration-file.patch \
@@ -46,8 +47,9 @@ SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
  BINCOMMANDS = "dbclient ssh scp"
  EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} 
${BINCOMMANDS}"'

-PACKAGECONFIG ?= ""
+PACKAGECONFIG ?= "disable-weak-ciphers"
  PACKAGECONFIG[system-libtom] = 
"--disable-bundled-libtom,--enable-bundled-libtom,libtommath 
libtomcrypt"
+PACKAGECONFIG[disable-weak-ciphers] = ""

  EXTRA_OECONF += "\
   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', 
'--disable-pam', d)}"
diff --git 
a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch 
b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
new file mode 100644
index 0000000..764aebd
--- /dev/null
+++ 
b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
@@ -0,0 +1,37 @@
+diff --git a/default_options.h b/default_options.h
+index 9000fcc..bfb8a8f 100644
+--- a/default_options.h
++++ b/default_options.h
+@@ -91,7 +91,7 @@ IMPORTANT: Some options will require "make clean" 
after changes */
+
+ /* Enable CBC mode for ciphers. This has security issues though
+  * is the most compatible with older SSH implementations */
+-#define DROPBEAR_ENABLE_CBC_MODE 1
++#define DROPBEAR_ENABLE_CBC_MODE 0
+
+ /* Enable "Counter Mode" for ciphers. This is more secure than
+  * CBC mode against certain attacks. It is recommended for security
+@@ -101,7 +101,7 @@ IMPORTANT: Some options will require "make clean" 
after changes */
+ /* Message integrity. sha2-256 is recommended as a default,
+    sha1 for compatibility */
+ #define DROPBEAR_SHA1_HMAC 1
+-#define DROPBEAR_SHA1_96_HMAC 1
++#define DROPBEAR_SHA1_96_HMAC 0
+ #define DROPBEAR_SHA2_256_HMAC 1
+
+ /* Hostkey/public key algorithms - at least one required, these are 
used
+@@ -149,12 +149,12 @@ IMPORTANT: Some options will require "make clean" 
after changes */
+  * Small systems should generally include either curve25519 or ecdh 
for performance.
+  * curve25519 is less widely supported but is faster
+  */
+-#define DROPBEAR_DH_GROUP14_SHA1 1
++#define DROPBEAR_DH_GROUP14_SHA1 0
+ #define DROPBEAR_DH_GROUP14_SHA256 1
+ #define DROPBEAR_DH_GROUP16 0
+ #define DROPBEAR_CURVE25519 1
+ #define DROPBEAR_ECDH 1
+-#define DROPBEAR_DH_GROUP1 1
++#define DROPBEAR_DH_GROUP1 0
+
+ /* When group1 is enabled it will only be allowed by Dropbear client
+ not as a server, due to concerns over its strength. Set to 0 to allow
-- 
1.8.3.1


