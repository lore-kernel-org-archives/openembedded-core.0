Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0275A6B3B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 07:52:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r727qmva010895
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Aug 2013 00:52:48 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 2 Aug 2013 00:52:47 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Aug 2013 15:52:56 +0800
Message-ID: <9df393f00dd56357375753c658cb215d991ded03.1375429844.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375429844.git.Qi.Chen@windriver.com>
References: <cover.1375429844.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 1/4] scripts/contrib/mkefidisk.sh: fix bashism
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
X-List-Received-Date: Fri, 02 Aug 2013 07:52:48 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Remove the function keyword.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/contrib/mkefidisk.sh |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index bcc2411..af06b4b 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -28,14 +28,14 @@ BOOT_SIZE=20
 # 5% for swap
 SWAP_RATIO=5
 
-function usage() {
+usage() {
 	echo "Usage: $(basename $0) DEVICE HDDIMG TARGET_DEVICE"
 	echo "       DEVICE: The device to write the image to, e.g. /dev/sdh"
 	echo "       HDDIMG: The hddimg file to generate the efi disk from"
 	echo "       TARGET_DEVICE: The device the target will boot from, e.g.  /dev/mmcblk0"
 }
 
-function image_details() {
+image_details() {
 	IMG=$1
 	echo "Image details"
 	echo "============="
@@ -46,7 +46,7 @@ function image_details() {
 	echo ""
 }
 
-function device_details() {
+device_details() {
 	DEV=$1
 	BLOCK_SIZE=512
 
@@ -71,7 +71,7 @@ function device_details() {
 	echo ""
 }
 
-function unmount_device() {
+unmount_device() {
 	grep -q $DEVICE /proc/mounts
 	if [ $? -eq 0 ]; then
 		echo -n "$DEVICE listed in /proc/mounts, attempting to unmount..."
-- 
1.7.9.5


