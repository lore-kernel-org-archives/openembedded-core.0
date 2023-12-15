Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D7CC48BED
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:54 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.63599.1702649862998530236
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eyXqdr1q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=K2rBCIQ3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018c6dd713fe-3959a5ab-5c29-43f1-b33b-d0b78b4b6c6f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649861;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Es2BAp/Au+vcdpwCHlYYR0XTS1zlb9Rm6wPx0IEvhNU=;
	b=eyXqdr1qqtbhwKU31+Wy8Vfa9uW4pY+A7m+FyC26tfiUZU2s+zkcrG/cuyD1y3Od
	O3iL+M5SVFmNE5+ZeQy3uk3iVdb8zi49eoVW26hQsl3LZk7xCuIhfE/ezC9Xtr8uDFN
	sFSJkKFJ1nfn+S2oQbgjuuGRZ2LL659cpvxU5I3o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649861;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Es2BAp/Au+vcdpwCHlYYR0XTS1zlb9Rm6wPx0IEvhNU=;
	b=K2rBCIQ3D1cfW8aSDn/67xPo5XFWtyXzZNpl4YTDG7jUheow47qOGWR83LeJLOx/
	BHtQ2CQUVBDdF7Nwi/5tg8gIY0l1KYbu/YK8mJYR5GOL4z2YlYGiZoQeS+BwbMHpaKy
	YX0FZOQqKvMY1lYbzSMFFQFE4RQklzIYX3ayyqnc=
Content-Type: multipart/mixed; boundary="===============9108349123591876496=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.71 SUCCEEDED
Message-ID: <0101018c6dd713fe-3959a5ab-5c29-43f1-b33b-d0b78b4b6c6f-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:41 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192441

--===============9108349123591876496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bluez5* to *5.71* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bluez5-upgrade-5.70-5.71.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 625ed6403eaae17065f7a7a136ec806e00b961d3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 05:14:47 +0000
Subject: [PATCH] bluez5: upgrade 5.70 -> 5.71

---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   2 -
 .../0001-test-gatt-Fix-hung-issue.patch       |   2 +-
 ...et-for-building-tests-without-runnin.patch |   6 +-
 ...e_probe-failing-if-SDP-record-is-not.patch | 313 ------------------
 ...shared-util.c-include-linux-limits.h.patch |   7 +-
 .../bluez5/bluez5/CVE-2023-45866.patch        |  56 ----
 .../bluez5/{bluez5_5.70.bb => bluez5_5.71.bb} |   2 +-
 7 files changed, 9 insertions(+), 379 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.70.bb => bluez5_5.71.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 0bb157e202..e10158a6e5 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -55,8 +55,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0004-src-shared-util.c-include-linux-limits.h.patch \
-           file://0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch \
-	   file://CVE-2023-45866.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index 06ebf1cde6..3546c7c305 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From 7dcc5f46a31ac4eaa67c0ab3aaae38005db7458f Mon Sep 17 00:00:00 2001
+From e8808a2f5e17d375411c7409eaffb17e72f65022 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 24 Aug 2018 12:04:03 +0800
 Subject: [PATCH] test-gatt: Fix hung issue
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index 7c47cc1a1e..be05093551 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,4 +1,4 @@
-From a657fddd13a2e756b0af315301f1c44081e2f668 Mon Sep 17 00:00:00 2001
+From 3724958858b0ee430f37fb83388c3737d2039a3a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 7041f8e..25966cd 100644
+index e7221bd..9595fd1 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -594,6 +594,9 @@ endif
+@@ -710,6 +710,9 @@ endif
  TESTS = $(unit_tests)
  AM_TESTS_ENVIRONMENT = MALLOC_CHECK_=3 MALLOC_PERTURB_=69
  
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch b/meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch
deleted file mode 100644
index d0884338db..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch
+++ /dev/null
@@ -1,313 +0,0 @@
-From 3a9c637010f8dc1ba3e8382abe01065761d4f5bb Mon Sep 17 00:00:00 2001
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-Date: Tue, 10 Oct 2023 12:38:29 -0700
-Subject: [PATCH 02/40] input: Fix .device_probe failing if SDP record is not
- found
-
-Due to changes introduced by 67a26abe53bf
-("profile: Add probe_on_discover flag") profiles may get probed when
-their profile UUID are discovered, rather than resolved, which means
-the SDP record may not be available.
-
-Fixes: https://github.com/bluez/bluez/issues/614
-
-Upstream-Status: Backport [https://github.com/bluez/bluez/commit/3a9c637010f8dc1ba3e8382abe01065761d4f5bb]
----
- profiles/input/device.c | 182 +++++++++++++++++++---------------------
- 1 file changed, 84 insertions(+), 98 deletions(-)
-
-diff --git a/profiles/input/device.c b/profiles/input/device.c
-index e2ac6ea60..4a50ea992 100644
---- a/profiles/input/device.c
-+++ b/profiles/input/device.c
-@@ -60,7 +60,7 @@ struct input_device {
- 	char			*path;
- 	bdaddr_t		src;
- 	bdaddr_t		dst;
--	uint32_t		handle;
-+	const sdp_record_t	*rec;
- 	GIOChannel		*ctrl_io;
- 	GIOChannel		*intr_io;
- 	guint			ctrl_watch;
-@@ -754,7 +754,8 @@ static void epox_endian_quirk(unsigned char *data, int size)
- 	}
- }
- 
--static int create_hid_dev_name(sdp_record_t *rec, struct hidp_connadd_req *req)
-+static int create_hid_dev_name(const sdp_record_t *rec,
-+					struct hidp_connadd_req *req)
- {
- 	char sdesc[sizeof(req->name) / 2];
- 
-@@ -776,7 +777,7 @@ static int create_hid_dev_name(sdp_record_t *rec, struct hidp_connadd_req *req)
- 
- /* See HID profile specification v1.0, "7.11.6 HIDDescriptorList" for details
-  * on the attribute format. */
--static int extract_hid_desc_data(sdp_record_t *rec,
-+static int extract_hid_desc_data(const sdp_record_t *rec,
- 						struct hidp_connadd_req *req)
- {
- 	sdp_data_t *d;
-@@ -817,36 +818,40 @@ invalid_desc:
- 	return -EINVAL;
- }
- 
--static int extract_hid_record(sdp_record_t *rec, struct hidp_connadd_req *req)
-+static int extract_hid_record(struct input_device *idev,
-+					struct hidp_connadd_req *req)
- {
- 	sdp_data_t *pdlist;
- 	uint8_t attr_val;
- 	int err;
- 
--	err = create_hid_dev_name(rec, req);
-+	if (!idev->rec)
-+		return -ENOENT;
-+
-+	err = create_hid_dev_name(idev->rec, req);
- 	if (err < 0)
- 		DBG("No valid Service Name or Service Description found");
- 
--	pdlist = sdp_data_get(rec, SDP_ATTR_HID_PARSER_VERSION);
-+	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_PARSER_VERSION);
- 	req->parser = pdlist ? pdlist->val.uint16 : 0x0100;
- 
--	pdlist = sdp_data_get(rec, SDP_ATTR_HID_DEVICE_SUBCLASS);
-+	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_DEVICE_SUBCLASS);
- 	req->subclass = pdlist ? pdlist->val.uint8 : 0;
- 
--	pdlist = sdp_data_get(rec, SDP_ATTR_HID_COUNTRY_CODE);
-+	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_COUNTRY_CODE);
- 	req->country = pdlist ? pdlist->val.uint8 : 0;
- 
--	pdlist = sdp_data_get(rec, SDP_ATTR_HID_VIRTUAL_CABLE);
-+	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_VIRTUAL_CABLE);
- 	attr_val = pdlist ? pdlist->val.uint8 : 0;
- 	if (attr_val)
- 		req->flags |= (1 << HIDP_VIRTUAL_CABLE_UNPLUG);
- 
--	pdlist = sdp_data_get(rec, SDP_ATTR_HID_BOOT_DEVICE);
-+	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_BOOT_DEVICE);
- 	attr_val = pdlist ? pdlist->val.uint8 : 0;
- 	if (attr_val)
- 		req->flags |= (1 << HIDP_BOOT_PROTOCOL_MODE);
- 
--	err = extract_hid_desc_data(rec, req);
-+	err = extract_hid_desc_data(idev->rec, req);
- 	if (err < 0)
- 		return err;
- 
-@@ -1035,11 +1040,6 @@ static gboolean encrypt_notify(GIOChannel *io, GIOCondition condition,
- static int hidp_add_connection(struct input_device *idev)
- {
- 	struct hidp_connadd_req *req;
--	sdp_record_t *rec;
--	char src_addr[18], dst_addr[18];
--	char filename[PATH_MAX];
--	GKeyFile *key_file;
--	char handle[11], *str;
- 	GError *gerr = NULL;
- 	int err;
- 
-@@ -1049,33 +1049,7 @@ static int hidp_add_connection(struct input_device *idev)
- 	req->flags     = 0;
- 	req->idle_to   = idle_timeout;
- 
--	ba2str(&idev->src, src_addr);
--	ba2str(&idev->dst, dst_addr);
--
--	snprintf(filename, PATH_MAX, STORAGEDIR "/%s/cache/%s", src_addr,
--								dst_addr);
--	sprintf(handle, "0x%8.8X", idev->handle);
--
--	key_file = g_key_file_new();
--	if (!g_key_file_load_from_file(key_file, filename, 0, &gerr)) {
--		error("Unable to load key file from %s: (%s)", filename,
--								gerr->message);
--		g_clear_error(&gerr);
--	}
--	str = g_key_file_get_string(key_file, "ServiceRecords", handle, NULL);
--	g_key_file_free(key_file);
--
--	if (!str) {
--		error("Rejected connection from unknown device %s", dst_addr);
--		err = -EPERM;
--		goto cleanup;
--	}
--
--	rec = record_from_string(str);
--	g_free(str);
--
--	err = extract_hid_record(rec, req);
--	sdp_record_free(rec);
-+	err = extract_hid_record(idev, req);
- 	if (err < 0) {
- 		error("Could not parse HID SDP record: %s (%d)", strerror(-err),
- 									-err);
-@@ -1091,7 +1065,7 @@ static int hidp_add_connection(struct input_device *idev)
- 
- 	/* Make sure the device is bonded if required */
- 	if (classic_bonded_only && !input_device_bonded(idev)) {
--		error("Rejected connection from !bonded device %s", dst_addr);
-+		error("Rejected connection from !bonded device %s", idev->path);
- 		goto cleanup;
- 	}
- 
-@@ -1161,6 +1135,68 @@ static int connection_disconnect(struct input_device *idev, uint32_t flags)
- 		return ioctl_disconnect(idev, flags);
- }
- 
-+static bool is_device_sdp_disable(const sdp_record_t *rec)
-+{
-+	sdp_data_t *data;
-+
-+	data = sdp_data_get(rec, SDP_ATTR_HID_SDP_DISABLE);
-+
-+	return data && data->val.uint8;
-+}
-+
-+static enum reconnect_mode_t hid_reconnection_mode(bool reconnect_initiate,
-+						bool normally_connectable)
-+{
-+	if (!reconnect_initiate && !normally_connectable)
-+		return RECONNECT_NONE;
-+	else if (!reconnect_initiate && normally_connectable)
-+		return RECONNECT_HOST;
-+	else if (reconnect_initiate && !normally_connectable)
-+		return RECONNECT_DEVICE;
-+	else /* (reconnect_initiate && normally_connectable) */
-+		return RECONNECT_ANY;
-+}
-+
-+static void extract_hid_props(struct input_device *idev,
-+					const sdp_record_t *rec)
-+{
-+	/* Extract HID connectability */
-+	bool reconnect_initiate, normally_connectable;
-+	sdp_data_t *pdlist;
-+
-+	/* HIDNormallyConnectable is optional and assumed FALSE if not
-+	 * present.
-+	 */
-+	pdlist = sdp_data_get(rec, SDP_ATTR_HID_RECONNECT_INITIATE);
-+	reconnect_initiate = pdlist ? pdlist->val.uint8 : TRUE;
-+
-+	pdlist = sdp_data_get(rec, SDP_ATTR_HID_NORMALLY_CONNECTABLE);
-+	normally_connectable = pdlist ? pdlist->val.uint8 : FALSE;
-+
-+	/* Update local values */
-+	idev->reconnect_mode =
-+		hid_reconnection_mode(reconnect_initiate, normally_connectable);
-+}
-+
-+static void input_device_update_rec(struct input_device *idev)
-+{
-+	struct btd_profile *p = btd_service_get_profile(idev->service);
-+	const sdp_record_t *rec;
-+
-+	rec = btd_device_get_record(idev->device, p->remote_uuid);
-+	if (!rec || idev->rec == rec)
-+		return;
-+
-+	idev->rec = rec;
-+	idev->disable_sdp = is_device_sdp_disable(rec);
-+
-+	/* Initialize device properties */
-+	extract_hid_props(idev, rec);
-+
-+	if (idev->disable_sdp)
-+		device_set_refresh_discovery(idev->device, false);
-+}
-+
- static int input_device_connected(struct input_device *idev)
- {
- 	int err;
-@@ -1168,6 +1204,9 @@ static int input_device_connected(struct input_device *idev)
- 	if (idev->intr_io == NULL || idev->ctrl_io == NULL)
- 		return -ENOTCONN;
- 
-+	/* Attempt to update SDP record if it had changed */
-+	input_device_update_rec(idev);
-+
- 	err = hidp_add_connection(idev);
- 	if (err < 0)
- 		return err;
-@@ -1411,74 +1450,21 @@ int input_device_disconnect(struct btd_service *service)
- 	return 0;
- }
- 
--static bool is_device_sdp_disable(const sdp_record_t *rec)
--{
--	sdp_data_t *data;
--
--	data = sdp_data_get(rec, SDP_ATTR_HID_SDP_DISABLE);
--
--	return data && data->val.uint8;
--}
--
--static enum reconnect_mode_t hid_reconnection_mode(bool reconnect_initiate,
--						bool normally_connectable)
--{
--	if (!reconnect_initiate && !normally_connectable)
--		return RECONNECT_NONE;
--	else if (!reconnect_initiate && normally_connectable)
--		return RECONNECT_HOST;
--	else if (reconnect_initiate && !normally_connectable)
--		return RECONNECT_DEVICE;
--	else /* (reconnect_initiate && normally_connectable) */
--		return RECONNECT_ANY;
--}
--
--static void extract_hid_props(struct input_device *idev,
--					const sdp_record_t *rec)
--{
--	/* Extract HID connectability */
--	bool reconnect_initiate, normally_connectable;
--	sdp_data_t *pdlist;
--
--	/* HIDNormallyConnectable is optional and assumed FALSE
--	* if not present. */
--	pdlist = sdp_data_get(rec, SDP_ATTR_HID_RECONNECT_INITIATE);
--	reconnect_initiate = pdlist ? pdlist->val.uint8 : TRUE;
--
--	pdlist = sdp_data_get(rec, SDP_ATTR_HID_NORMALLY_CONNECTABLE);
--	normally_connectable = pdlist ? pdlist->val.uint8 : FALSE;
--
--	/* Update local values */
--	idev->reconnect_mode =
--		hid_reconnection_mode(reconnect_initiate, normally_connectable);
--}
--
- static struct input_device *input_device_new(struct btd_service *service)
- {
- 	struct btd_device *device = btd_service_get_device(service);
--	struct btd_profile *p = btd_service_get_profile(service);
- 	const char *path = device_get_path(device);
--	const sdp_record_t *rec = btd_device_get_record(device, p->remote_uuid);
- 	struct btd_adapter *adapter = device_get_adapter(device);
- 	struct input_device *idev;
- 
--	if (!rec)
--		return NULL;
--
- 	idev = g_new0(struct input_device, 1);
- 	bacpy(&idev->src, btd_adapter_get_address(adapter));
- 	bacpy(&idev->dst, device_get_address(device));
- 	idev->service = btd_service_ref(service);
- 	idev->device = btd_device_ref(device);
- 	idev->path = g_strdup(path);
--	idev->handle = rec->handle;
--	idev->disable_sdp = is_device_sdp_disable(rec);
--
--	/* Initialize device properties */
--	extract_hid_props(idev, rec);
- 
--	if (idev->disable_sdp)
--		device_set_refresh_discovery(device, false);
-+	input_device_update_rec(idev);
- 
- 	return idev;
- }
--- 
-2.42.0
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
index f954f6dab2..6ef135327d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
@@ -1,4 +1,4 @@
-From 51584158b9a2e58f3790f8a7387b5cf167eca88b Mon Sep 17 00:00:00 2001
+From ad069fadfcce2cf70f45b1c4a42665448675297e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 12 Dec 2022 13:10:19 +0100
 Subject: [PATCH] src/shared/util.c: include linux/limits.h
@@ -8,15 +8,16 @@ systems such as those using musl.
 
 Upstream-Status: Submitted [to linux-bluetooth@vger.kernel.org,luiz.von.dentz@intel.com,frederic.danis@collabora.com]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  src/shared/util.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/shared/util.c b/src/shared/util.c
-index 0a0308c..1f61314 100644
+index 34491f4..412f3ad 100644
 --- a/src/shared/util.c
 +++ b/src/shared/util.c
-@@ -22,6 +22,7 @@
+@@ -23,6 +23,7 @@
  #include <unistd.h>
  #include <dirent.h>
  #include <limits.h>
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch
deleted file mode 100644
index 5bb31d866a..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 25a471a83e02e1effb15d5a488b3f0085eaeb675 Mon Sep 17 00:00:00 2001
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-Date: Tue, 10 Oct 2023 13:03:12 -0700
-Subject: [PATCH] input.conf: Change default of ClassicBondedOnly
-
-This changes the default of ClassicBondedOnly since defaulting to false
-is not inline with HID specification which mandates the of Security Mode
-4:
-
-BLUETOOTH SPECIFICATION Page 84 of 123
-Human Interface Device (HID) Profile:
-
-  5.4.3.4.2 Security Modes
-  Bluetooth HID Hosts shall use Security Mode 4 when interoperating with
-  Bluetooth HID devices that are compliant to the Bluetooth Core
-  Specification v2.1+EDR[6].
-
-Upstream-Status: Backport
-[https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/profiles/input?id=25a471a83e02e1effb15d5a488b3f0085eaeb675]
-
-CVE: CVE-2023-45866
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- profiles/input/device.c   | 2 +-
- profiles/input/input.conf | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/profiles/input/device.c b/profiles/input/device.c
-index 4a50ea9..4310dd1 100644
---- a/profiles/input/device.c
-+++ b/profiles/input/device.c
-@@ -81,7 +81,7 @@ struct input_device {
-
- static int idle_timeout = 0;
- static bool uhid_enabled = false;
--static bool classic_bonded_only = false;
-+static bool classic_bonded_only = true;
-
- void input_set_idle_timeout(int timeout)
- {
-diff --git a/profiles/input/input.conf b/profiles/input/input.conf
-index 4c70bc5..d8645f3 100644
---- a/profiles/input/input.conf
-+++ b/profiles/input/input.conf
-@@ -17,7 +17,7 @@
- # platforms may want to make sure that input connections only come from bonded
- # device connections. Several older mice have been known for not supporting
- # pairing/encryption.
--# Defaults to false to maximize device compatibility.
-+# Defaults to true for security.
- #ClassicBondedOnly=true
-
- # LE upgrade security
---
-2.40.0
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.70.bb b/meta/recipes-connectivity/bluez5/bluez5_5.71.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.70.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.71.bb
index 2e3b782e6e..b9bc3dd1b6 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.70.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.71.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "37e372e916955e144cb882f888e4be40898f10ae3b7c213ddcdd55ee9c009278"
+SRC_URI[sha256sum] = "b828d418c93ced1f55b616fb5482cf01537440bfb34fbda1a564f3ece94735d8"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.42.0


--===============9108349123591876496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bluez5/bluez5-dbg: PKGSIZE changed from 31877112 to 33496200 (+5%)
packages/core2-64-poky-linux/bluez5/bluez5-dbg: PV changed from "5.70" to "5.71"
packages/core2-64-poky-linux/bluez5/bluez5-dbg: FILELIST: removed "/usr/lib/.debug/libbluetooth.so.3.19.10", added "/usr/lib/.debug/libbluetooth.so.3.19.11 /usr/lib/bluez5/ptest/unit/.debug/test-micp /usr/lib/bluez5/ptest/unit/.debug/test-vcp"
packages/core2-64-poky-linux/bluez5/bluez5-dbg: PKGV changed from 5.70 [default] to 5.71 [default]
packages/core2-64-poky-linux/bluez5/bluez5-dev: PKGSIZE changed from 137083 to 137157 (+0%)
packages/core2-64-poky-linux/bluez5/bluez5-dev: PV changed from "5.70" to "5.71"
packages/core2-64-poky-linux/bluez5/bluez5-dev: PKGV changed from 5.70 [default] to 5.71 [default]
packages/core2-64-poky-linux/bluez5/bluez5-doc: PV changed from "5.70" to "5.71"
packages/core2-64-poky-linux/bluez5/bluez5-doc: PKGV changed from 5.70 [default] to 5.71 [default]
packages/core2-64-poky-linux/bluez5/bluez5-locale: PV changed from "5.70" to "5.71"
packages/core2-64-poky-linux/bluez5/bluez5-locale: PKGV changed from 5.70 [default] to 5.71 [default]
packages/core2-64-poky-linux/bluez5/bluez5-noinst-tools: PKGSIZE changed from 5207896 to 5237016 (+1%)
packages/core2-64-poky-linux/bluez5/bluez5-noinst-tools: PV changed from "5.70" to "5.71"
packages/core2-64-poky-linux/bluez5/bluez5-noinst-tools: PKGV changed from 5.70 [default] to 5.71 [default]
packages/core2-64-poky-linux/bluez5/bluez5-obex: PKGSIZE changed from 618841 to 618873 (+0%)
packages/core2-64-poky-linux/bluez5/bluez5-obex: PV changed from "5.70" to "5.71"
packages/core2-64-poky-linux/bluez5/bluez5-obex: PKGV changed from 5.70 [default] to 5.71 [default]
packages/core2-64-poky-linux/bluez5/bluez5-ptest: PKGSIZE changed from 5366419 to 6198771 (+16%)
packages/core2-64-poky-linux/bluez5/bluez5-ptest: PV changed from "5.70" to "5.71"
packages/core2-64-poky-linux/bluez5/bluez5-ptest: FILELIST: added "/usr/lib/bluez5/ptest/unit/test-vcp /usr/lib/bluez5/ptest/unit/test-micp"
packages/core2-64-poky-linux/bluez5/bluez5-ptest: PKGV changed from 5.70 [default] to 5.71 [default]
packages/core2-64-poky-linux/bluez5/bluez5-src: PKGSIZE changed from 8139875 to 8313398 (+2%)
packages/core2-64-poky-linux/bluez5/bluez5-src: PV changed from "5.70" to "5.71"
packages/core2-64-poky-linux/bluez5/bluez5-src: FILELIST: directory renamed /usr/src/debug/bluez5/5.70/src -> /usr/src/debug/bluez5/5.71/src, directory renamed /usr/src/debug/bluez5/5.70/tools/parser -> /usr/src/debug/bluez5/5.71/tools/parser, directory renamed /usr/src/debug/bluez5/5.70/profiles/scanparam -> /usr/src/debug/bluez5/5.71/profiles/scanparam, directory renamed /usr/src/debug/bluez5/5.70/obexd/plugins -> /usr/src/debug/bluez5/5.71/obexd/plugins, directory renamed /usr/src/debug/bluez5/5.70/profiles/gap -> /usr/src/debug/bluez5/5.71/profiles/gap, directory renamed /usr/src/debug/bluez5/5.70/profiles/audio -> /usr/src/debug/bluez5/5.71/profiles/audio, directory renamed /usr/src/debug/bluez5/5.70/btio -> /usr/src/debug/bluez5/5.71/btio, directory renamed /usr/src/debug/bluez5/5.70/tools -> /usr/src/debug/bluez5/5.71/tools, directory renamed /usr/src/debug/bluez5/5.70/obexd/src -> /usr/src/debug/bluez5/5.71/obexd/src, directory renamed /usr/src/debug/bluez5/5.70/profiles/iap 
 -> /usr/src/debug/bluez5/5.71/profiles/iap, directory renamed /usr/src/debug/bluez5/5.70/profiles/deviceinfo -> /usr/src/debug/bluez5/5.71/profiles/deviceinfo, directory renamed /usr/src/debug/bluez5/5.70/obexd/client -> /usr/src/debug/bluez5/5.71/obexd/client, directory renamed /usr/src/debug/bluez5/5.70/plugins -> /usr/src/debug/bluez5/5.71/plugins, directory renamed /usr/src/debug/bluez5/5.70/profiles/input -> /usr/src/debug/bluez5/5.71/profiles/input, directory renamed /usr/src/debug/bluez5/5.70/lib -> /usr/src/debug/bluez5/5.71/lib, directory renamed /usr/src/debug/bluez5/5.70/gobex -> /usr/src/debug/bluez5/5.71/gobex, directory renamed /usr/src/debug/bluez5/5.70/attrib -> /usr/src/debug/bluez5/5.71/attrib, directory renamed /usr/src/debug/bluez5/5.70/client -> /usr/src/debug/bluez5/5.71/client, directory renamed /usr/src/debug/bluez5/5.70/gdbus -> /usr/src/debug/bluez5/5.71/gdbus, directory renamed /usr/src/debug/bluez5/5.70/profiles/battery -> /usr/src/debug/bluez5/5.71/profi
 les/battery, directory renamed /usr/src/debug/bluez5/5.70/profiles/health -> /usr/src/debug/bluez5/5.71/profiles/health, directory renamed /usr/src/debug/bluez5/5.70/profiles/network -> /usr/src/debug/bluez5/5.71/profiles/network, directory renamed /usr/src/debug/bluez5/5.70/monitor -> /usr/src/debug/bluez5/5.71/monitor, directory renamed /usr/src/debug/bluez5/5.70/android -> /usr/src/debug/bluez5/5.71/android, removed "/usr/src/debug/bluez5/5.70/src/shared/log.h /usr/src/debug/bluez5/5.70/src/shared/ringbuf.h /usr/src/debug/bluez5/5.70/src/shared/ringbuf.c /usr/src/debug/bluez5/5.70/unit/test-textfile.c /usr/src/debug/bluez5/5.70/src/shared/log.c /usr/src/debug/bluez5/5.70/src/shared/ad.c /usr/src/debug/bluez5/5.70/unit/test-gattrib.c /usr/src/debug/bluez5/5.70/unit/test-crypto.c /usr/src/debug/bluez5/5.70/src/shared/ad.h /usr/src/debug/bluez5/5.70/src/shared/io.h /usr/src/debug/bluez5/5.70/unit/test-gobex.c /usr/src/debug/bluez5/5.70/unit/test-uhid.c /usr/src/debug/bluez5/5.70/uni
 t/test-uuid.c /usr/src/debug/bluez5/5.70/src/shared/mainloop.c /usr/src/debug/bluez5/5.70/src/shared/mainloop.h /usr/src/debug/bluez5/5.70/src/shared/tty.h /usr/src/debug/bluez5/5.70/unit/test-gobex-header.c /usr/src/debug/bluez5/5.70/src/shared/timeout-mainloop.c /usr/src/debug/bluez5/5.70/unit/test-avrcp.c /usr/src/debug/bluez5/5.70/src/shared/gatt-client.h /usr/src/debug/bluez5/5.70/src/shared/ascs.h /usr/src/debug/bluez5/5.70/src/shared/gatt-client.c /usr/src/debug/bluez5/5.70/unit/test-bass.c /usr/src/debug/bluez5/5.70/src/shared/mgmt.h /usr/src/debug/bluez5/5.70/src/shared/csip.c /usr/src/debug/bluez5/5.70/src/shared/csip.h /usr/src/debug/bluez5/5.70/src/shared/io-mainloop.c /usr/src/debug/bluez5/5.70/src/shared/mgmt.c /usr/src/debug/bluez5/5.70/src/shared/att-types.h /usr/src/debug/bluez5/5.70/src/shared/shell.c /usr/src/debug/bluez5/5.70/src/shared/shell.h /usr/src/debug/bluez5/5.70/src/shared/crypto.c /usr/src/debug/bluez5/5.70/unit/test-ringbuf.c /usr/src/debug/bluez5/5.70
 /src/shared/crypto.h /usr/src/debug/bluez5/5.70/src/shared/io-glib.c /usr/src/debug/bluez5/5.70/src/shared/micp.h /usr/src/debug/bluez5/5.70/src/shared/tester.c /usr/src/debug/bluez5/5.70/src/shared/micp.c /usr/src/debug/bluez5/5.70/src/shared/tester.h /usr/src/debug/bluez5/5.70/src/shared/mainloop-notify.h /usr/src/debug/bluez5/5.70/src/shared/mainloop-notify.c /usr/src/debug/bluez5/5.70/src/shared/ecc.c /usr/src/debug/bluez5/5.70/src/shared/timeout.h /usr/src/debug/bluez5/5.70/src/shared/ecc.h /usr/src/debug/bluez5/5.70/unit/test-tester.c /usr/src/debug/bluez5/5.70/unit/test-gobex-apparam.c /usr/src/debug/bluez5/5.70/unit/util.c /usr/src/debug/bluez5/5.70/src/shared/hci.h /usr/src/debug/bluez5/5.70/unit/util.h /usr/src/debug/bluez5/5.70/src/shared/hci.c /usr/src/debug/bluez5/5.70/src/shared/gatt-helpers.c /usr/src/debug/bluez5/5.70/unit/test-queue.c /usr/src/debug/bluez5/5.70/src/shared/gatt-helpers.h /usr/src/debug/bluez5/5.70/src/shared/att.c /usr/src/debug/bluez5/5.70/src/share
 d/att.h /usr/src/debug/bluez5/5.70/unit/test-sdp.c /usr/src/debug/bluez5/5.70/unit/test-bap.c /usr/src/debug/bluez5/5.70/unit/test-crc.c /usr/src/debug/bluez5/5.70/unit/test-ecc.c /usr/src/debug/bluez5/5.70/unit/test-eir.c /usr/src/debug/bluez5/5.70/src/shared/bass.c /usr/src/debug/bluez5/5.70/unit/test-hfp.c /usr/src/debug/bluez5/5.70/unit/test-hog.c /usr/src/debug/bluez5/5.70/unit/test-lib.c /usr/src/debug/bluez5/5.70/src/shared/bass.h /usr/src/debug/bluez5/5.70/src/shared/queue.c /usr/src/debug/bluez5/5.70/src/shared/uhid.h /usr/src/debug/bluez5/5.70/unit/test-gobex-transfer.c /usr/src/debug/bluez5/5.70/src/shared/mainloop-glib.c /usr/src/debug/bluez5/5.70/src/shared/queue.h /usr/src/debug/bluez5/5.70/src/shared/uhid.c /usr/src/debug/bluez5/5.70/src/shared/timeout-glib.c /usr/src/debug/bluez5/5.70/src/shared/bap.c /usr/src/debug/bluez5/5.70/src/shared/hfp.c /usr/src/debug/bluez5/5.70/src/shared/mcp.c /usr/src/debug/bluez5/5.70/src/shared/vcp.c /usr/src/debug/bluez5/5.70/src/share
 d/bap.h /usr/src/debug/bluez5/5.70/src/shared/hfp.h /usr/src/debug/bluez5/5.70/src/shared/mcp.h /usr/src/debug/bluez5/5.70/src/shared/vcp.h /usr/src/debug/bluez5/5.70/unit/test-avctp.c /usr/src/debug/bluez5/5.70/unit/test-avdtp.c /usr/src/debug/bluez5/5.70/src/shared/gatt-db.c /usr/src/debug/bluez5/5.70/src/shared/gatt-db.h /usr/src/debug/bluez5/5.70/unit/test-gdbus-client.c /usr/src/debug/bluez5/5.70/src/shared/util.c /usr/src/debug/bluez5/5.70/src/shared/btsnoop.c /usr/src/debug/bluez5/5.70/src/shared/btsnoop.h /usr/src/debug/bluez5/5.70/src/shared/util.h /usr/src/debug/bluez5/5.70/unit/test-gatt.c /usr/src/debug/bluez5/5.70/unit/test-mgmt.c /usr/src/debug/bluez5/5.70/src/shared/gatt-server.h /usr/src/debug/bluez5/5.70/src/shared/gatt-server.c /usr/src/debug/bluez5/5.70/unit/test-gobex-packet.c", added "/usr/src/debug/bluez5/5.71/src/shared/ecc.c /usr/src/debug/bluez5/5.71/src/shared/timeout.h /usr/src/debug/bluez5/5.71/src/shared/ecc.h /usr/src/debug/bluez5/5.71/unit/test-tester.
 c /usr/src/debug/bluez5/5.71/unit/test-gobex-apparam.c /usr/src/debug/bluez5/5.71/unit/util.c /usr/src/debug/bluez5/5.71/src/shared/hci.h /usr/src/debug/bluez5/5.71/unit/util.h /usr/src/debug/bluez5/5.71/src/shared/hci.c /usr/src/debug/bluez5/5.71/src/shared/gatt-helpers.c /usr/src/debug/bluez5/5.71/unit/test-queue.c /usr/src/debug/bluez5/5.71/src/shared/gatt-helpers.h /usr/src/debug/bluez5/5.71/src/shared/att.c /usr/src/debug/bluez5/5.71/src/shared/att.h /usr/src/debug/bluez5/5.71/unit/test-vcp.c /usr/src/debug/bluez5/5.71/unit/test-crc.c /usr/src/debug/bluez5/5.71/unit/test-ecc.c /usr/src/debug/bluez5/5.71/unit/test-eir.c /usr/src/debug/bluez5/5.71/unit/test-bap.c /usr/src/debug/bluez5/5.71/src/shared/bass.c /usr/src/debug/bluez5/5.71/unit/test-hfp.c /usr/src/debug/bluez5/5.71/unit/test-hog.c /usr/src/debug/bluez5/5.71/unit/test-lib.c /usr/src/debug/bluez5/5.71/unit/test-sdp.c /usr/src/debug/bluez5/5.71/src/shared/bass.h /usr/src/debug/bluez5/5.71/src/shared/queue.c /usr/src/debug
 /bluez5/5.71/src/shared/uhid.h /usr/src/debug/bluez5/5.71/unit/test-gobex-transfer.c /usr/src/debug/bluez5/5.71/src/shared/mainloop-glib.c /usr/src/debug/bluez5/5.71/src/shared/queue.h /usr/src/debug/bluez5/5.71/src/shared/uhid.c /usr/src/debug/bluez5/5.71/unit/test-micp.c /usr/src/debug/bluez5/5.71/src/shared/bap-debug.c /usr/src/debug/bluez5/5.71/src/shared/timeout-glib.c /usr/src/debug/bluez5/5.71/src/shared/bap-debug.h /usr/src/debug/bluez5/5.71/src/shared/bap.c /usr/src/debug/bluez5/5.71/src/shared/hfp.c /usr/src/debug/bluez5/5.71/src/shared/mcp.c /usr/src/debug/bluez5/5.71/src/shared/vcp.c /usr/src/debug/bluez5/5.71/src/shared/bap.h /usr/src/debug/bluez5/5.71/src/shared/hfp.h /usr/src/debug/bluez5/5.71/src/shared/mcp.h /usr/src/debug/bluez5/5.71/src/shared/vcp.h /usr/src/debug/bluez5/5.71/unit/test-avctp.c /usr/src/debug/bluez5/5.71/unit/test-avdtp.c /usr/src/debug/bluez5/5.71/src/shared/gatt-db.c /usr/src/debug/bluez5/5.71/src/shared/gatt-db.h /usr/src/debug/bluez5/5.71/unit/
 test-gdbus-client.c /usr/src/debug/bluez5/5.71/src/shared/util.c /usr/src/debug/bluez5/5.71/src/shared/btsnoop.c /usr/src/debug/bluez5/5.71/src/shared/btsnoop.h /usr/src/debug/bluez5/5.71/src/shared/util.h /usr/src/debug/bluez5/5.71/unit/test-mgmt.c /usr/src/debug/bluez5/5.71/unit/test-gatt.c /usr/src/debug/bluez5/5.71/src/shared/gatt-server.h /usr/src/debug/bluez5/5.71/src/shared/gatt-server.c /usr/src/debug/bluez5/5.71/unit/test-gobex-packet.c /usr/src/debug/bluez5/5.71/src/shared/log.h /usr/src/debug/bluez5/5.71/src/shared/ringbuf.h /usr/src/debug/bluez5/5.71/src/shared/ringbuf.c /usr/src/debug/bluez5/5.71/unit/test-textfile.c /usr/src/debug/bluez5/5.71/src/shared/log.c /usr/src/debug/bluez5/5.71/src/shared/ad.c /usr/src/debug/bluez5/5.71/unit/test-gattrib.c /usr/src/debug/bluez5/5.71/unit/test-crypto.c /usr/src/debug/bluez5/5.71/src/shared/ad.h /usr/src/debug/bluez5/5.71/src/shared/io.h /usr/src/debug/bluez5/5.71/unit/test-gobex.c /usr/src/debug/bluez5/5.71/unit/test-uhid.c /usr
 /src/debug/bluez5/5.71/unit/test-uuid.c /usr/src/debug/bluez5/5.71/src/shared/mainloop.c /usr/src/debug/bluez5/5.71/src/shared/mainloop.h /usr/src/debug/bluez5/5.71/src/shared/tty.h /usr/src/debug/bluez5/5.71/unit/test-gobex-header.c /usr/src/debug/bluez5/5.71/src/shared/timeout-mainloop.c /usr/src/debug/bluez5/5.71/unit/test-avrcp.c /usr/src/debug/bluez5/5.71/src/shared/gatt-client.h /usr/src/debug/bluez5/5.71/src/shared/ascs.h /usr/src/debug/bluez5/5.71/src/shared/gatt-client.c /usr/src/debug/bluez5/5.71/unit/test-bass.c /usr/src/debug/bluez5/5.71/src/shared/mgmt.h /usr/src/debug/bluez5/5.71/src/shared/csip.c /usr/src/debug/bluez5/5.71/src/shared/csip.h /usr/src/debug/bluez5/5.71/src/shared/io-mainloop.c /usr/src/debug/bluez5/5.71/src/shared/mgmt.c /usr/src/debug/bluez5/5.71/src/shared/att-types.h /usr/src/debug/bluez5/5.71/src/shared/shell.c /usr/src/debug/bluez5/5.71/src/shared/shell.h /usr/src/debug/bluez5/5.71/src/shared/crypto.c /usr/src/debug/bluez5/5.71/unit/test-ringbuf.c 
 /usr/src/debug/bluez5/5.71/src/shared/crypto.h /usr/src/debug/bluez5/5.71/src/shared/io-glib.c /usr/src/debug/bluez5/5.71/src/shared/micp.h /usr/src/debug/bluez5/5.71/src/shared/tester.c /usr/src/debug/bluez5/5.71/src/shared/micp.c /usr/src/debug/bluez5/5.71/src/shared/tester.h /usr/src/debug/bluez5/5.71/src/shared/mainloop-notify.h /usr/src/debug/bluez5/5.71/src/shared/mainloop-notify.c"
packages/core2-64-poky-linux/bluez5/bluez5-src: PKGV changed from 5.70 [default] to 5.71 [default]
packages/core2-64-poky-linux/bluez5/bluez5-staticdev: PV changed from "5.70" to "5.71"
packages/core2-64-poky-linux/bluez5/bluez5-staticdev: PKGV changed from 5.70 [default] to 5.71 [default]
packages/core2-64-poky-linux/bluez5/bluez5-testtools: PV changed from "5.70" to "5.71"
packages/core2-64-poky-linux/bluez5/bluez5-testtools: PKGV changed from 5.70 [default] to 5.71 [default]
packages/core2-64-poky-linux/bluez5/bluez5: PKGSIZE changed from 6057380 to 6115668 (+1%)
packages/core2-64-poky-linux/bluez5/bluez5: PV changed from "5.70" to "5.71"
packages/core2-64-poky-linux/bluez5/bluez5: FILELIST: removed "/usr/lib/libbluetooth.so.3.19.10", added "/usr/lib/libbluetooth.so.3.19.11"
packages/core2-64-poky-linux/bluez5/bluez5: PKGV changed from 5.70 [default] to 5.71 [default]
packages/core2-64-poky-linux/bluez5: PV changed from "5.70" to "5.71"
packages/core2-64-poky-linux/bluez5: SRC_URI changed from "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.70.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch file://0004-src-shared-util.c-include-linux-limits.h.patch file://0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch file://CVE-2023-45866.patch" to "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.71.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch file://0004-src-shared-util.c-include-linux-limits.h.patch"
packages/core2-64-poky-linux/bluez5: PKGV changed from 5.70 [default] to 5.71 [default]
Changes to packages/core2-64-poky-linux/bluez5 (sysroot):
  /usr/lib/libbluetooth.so.3 changed symlink target from libbluetooth.so.3.19.10 to libbluetooth.so.3.19.11
  /usr/lib/libbluetooth.so changed symlink target from libbluetooth.so.3.19.10 to libbluetooth.so.3.19.11
  /usr/lib/libbluetooth.so.3.19.10 moved to /usr/lib/libbluetooth.so.3.19.11

--===============9108349123591876496==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.70-5.71.patch"

RnJvbSA2MjVlZDY0MDNlYWFlMTcwNjVmN2E3YTEzNmVjODA2ZTAwYjk2MWQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMDU6MTQ6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
bHVlejU6IHVwZ3JhZGUgNS43MCAtPiA1LjcxCgotLS0KIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmx1ZXo1L2JsdWV6NS5pbmMgICB8ICAgMiAtCiAuLi4vMDAwMS10ZXN0LWdhdHQtRml4LWh1
bmctaXNzdWUucGF0Y2ggICAgICAgfCAgIDIgKy0KIC4uLmV0LWZvci1idWlsZGluZy10ZXN0cy13
aXRob3V0LXJ1bm5pbi5wYXRjaCB8ICAgNiArLQogLi4uZV9wcm9iZS1mYWlsaW5nLWlmLVNEUC1y
ZWNvcmQtaXMtbm90LnBhdGNoIHwgMzEzIC0tLS0tLS0tLS0tLS0tLS0tLQogLi4uc2hhcmVkLXV0
aWwuYy1pbmNsdWRlLWxpbnV4LWxpbWl0cy5oLnBhdGNoIHwgICA3ICstCiAuLi4vYmx1ZXo1L2Js
dWV6NS9DVkUtMjAyMy00NTg2Ni5wYXRjaCAgICAgICAgfCAgNTYgLS0tLQogLi4uL2JsdWV6NS97
Ymx1ZXo1XzUuNzAuYmIgPT4gYmx1ZXo1XzUuNzEuYmJ9IHwgICAyICstCiA3IGZpbGVzIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgMzc5IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0
IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAyLWlucHV0LUZpeC0u
ZGV2aWNlX3Byb2JlLWZhaWxpbmctaWYtU0RQLXJlY29yZC1pcy1ub3QucGF0Y2gKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvQ1ZFLTIw
MjMtNDU4NjYucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS97
Ymx1ZXo1XzUuNzAuYmIgPT4gYmx1ZXo1XzUuNzEuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LmluYyBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS5pbmMKaW5kZXggMGJiMTU3ZTIwMi4uZTEwMTU4YTZl
NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1Lmlu
YworKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUuaW5jCkBAIC01
NSw4ICs1NSw2IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC9ibHVldG9v
dGgvYmx1ZXotJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtdGVzdHMtYWRk
LWEtdGFyZ2V0LWZvci1idWlsZGluZy10ZXN0cy13aXRob3V0LXJ1bm5pbi5wYXRjaCBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLXRlc3QtZ2F0dC1GaXgtaHVuZy1pc3N1ZS5wYXRjaCBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDA0LXNyYy1zaGFyZWQtdXRpbC5jLWluY2x1ZGUtbGludXgtbGltaXRz
LmgucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMi1pbnB1dC1GaXgtLmRldmljZV9wcm9i
ZS1mYWlsaW5nLWlmLVNEUC1yZWNvcmQtaXMtbm90LnBhdGNoIFwKLQkgICBmaWxlOi8vQ1ZFLTIw
MjMtNDU4NjYucGF0Y2ggXAogICAgICAgICAgICAiCiBTID0gIiR7V09SS0RJUn0vYmx1ZXotJHtQ
Vn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6
NS8wMDAxLXRlc3QtZ2F0dC1GaXgtaHVuZy1pc3N1ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLXRlc3QtZ2F0dC1GaXgtaHVuZy1pc3N1ZS5wYXRj
aAppbmRleCAwNmViZjFjZGU2Li4zNTQ2YzdjMzA1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMS10ZXN0LWdhdHQtRml4LWh1bmctaXNzdWUu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDEt
dGVzdC1nYXR0LUZpeC1odW5nLWlzc3VlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3ZGNj
NWY0NmEzMWFjNGVhYTY3YzBhYjNhYWFlMzgwMDVkYjc0NThmIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBlODgwOGEyZjVlMTdkMzc1NDExYzc0MDllYWZmYjE3ZTcyZjY1MDIyIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWluZ2xpIFl1IDxNaW5nbGkuWXVAd2luZHJpdmVy
LmNvbT4KIERhdGU6IEZyaSwgMjQgQXVnIDIwMTggMTI6MDQ6MDMgKzA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gdGVzdC1nYXR0OiBGaXggaHVuZyBpc3N1ZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDEtdGVzdHMtYWRkLWEtdGFyZ2V0LWZvci1i
dWlsZGluZy10ZXN0cy13aXRob3V0LXJ1bm5pbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLXRlc3RzLWFkZC1hLXRhcmdldC1mb3ItYnVpbGRpbmct
dGVzdHMtd2l0aG91dC1ydW5uaW4ucGF0Y2gKaW5kZXggN2M0N2NjMWExZS4uYmUwNTA5MzU1MSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDEt
dGVzdHMtYWRkLWEtdGFyZ2V0LWZvci1idWlsZGluZy10ZXN0cy13aXRob3V0LXJ1bm5pbi5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwMS10ZXN0
cy1hZGQtYS10YXJnZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdpdGhvdXQtcnVubmluLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBhNjU3ZmRkZDEzYTJlNzU2YjBhZjMxNTMwMWYxYzQ0MDgxZTJm
NjY4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzNzI0OTU4ODU4YjBlZTQzMGYzN2Zi
ODMzODhjMzczN2QyMDM5YTNhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDEgQXByIDIw
MTYgMTc6MDc6MzQgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IGFkZCBhIHRhcmdldCBm
b3IgYnVpbGRpbmcgdGVzdHMgd2l0aG91dCBydW5uaW5nIHRoZW0KQEAgLTExLDEwICsxMSwxMCBA
QCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9NYWtl
ZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCA3MDQxZjhlLi4yNTk2NmNkIDEwMDY0NAoraW5k
ZXggZTcyMjFiZC4uOTU5NWZkMSAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLmFtCiArKysgYi9NYWtl
ZmlsZS5hbQotQEAgLTU5NCw2ICs1OTQsOSBAQCBlbmRpZgorQEAgLTcxMCw2ICs3MTAsOSBAQCBl
bmRpZgogIFRFU1RTID0gJCh1bml0X3Rlc3RzKQogIEFNX1RFU1RTX0VOVklST05NRU5UID0gTUFM
TE9DX0NIRUNLXz0zIE1BTExPQ19QRVJUVVJCXz02OQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDItaW5wdXQtRml4LS5kZXZpY2VfcHJv
YmUtZmFpbGluZy1pZi1TRFAtcmVjb3JkLWlzLW5vdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAyLWlucHV0LUZpeC0uZGV2aWNlX3Byb2JlLWZhaWxp
bmctaWYtU0RQLXJlY29yZC1pcy1ub3QucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IGQwODg0MzM4ZGIuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9ibHVlejUvYmx1ZXo1LzAwMDItaW5wdXQtRml4LS5kZXZpY2VfcHJvYmUtZmFpbGluZy1pZi1T
RFAtcmVjb3JkLWlzLW5vdC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDMxMyArMCwwIEBACi1G
cm9tIDNhOWM2MzcwMTBmOGRjMWJhM2U4MzgyYWJlMDEwNjU3NjFkNGY1YmIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCi1Gcm9tOiBMdWl6IEF1Z3VzdG8gdm9uIERlbnR6IDxsdWl6LnZvbi5kZW50
ekBpbnRlbC5jb20+Ci1EYXRlOiBUdWUsIDEwIE9jdCAyMDIzIDEyOjM4OjI5IC0wNzAwCi1TdWJq
ZWN0OiBbUEFUQ0ggMDIvNDBdIGlucHV0OiBGaXggLmRldmljZV9wcm9iZSBmYWlsaW5nIGlmIFNE
UCByZWNvcmQgaXMgbm90Ci0gZm91bmQKLQotRHVlIHRvIGNoYW5nZXMgaW50cm9kdWNlZCBieSA2
N2EyNmFiZTUzYmYKLSgicHJvZmlsZTogQWRkIHByb2JlX29uX2Rpc2NvdmVyIGZsYWciKSBwcm9m
aWxlcyBtYXkgZ2V0IHByb2JlZCB3aGVuCi10aGVpciBwcm9maWxlIFVVSUQgYXJlIGRpc2NvdmVy
ZWQsIHJhdGhlciB0aGFuIHJlc29sdmVkLCB3aGljaCBtZWFucwotdGhlIFNEUCByZWNvcmQgbWF5
IG5vdCBiZSBhdmFpbGFibGUuCi0KLUZpeGVzOiBodHRwczovL2dpdGh1Yi5jb20vYmx1ZXovYmx1
ZXovaXNzdWVzLzYxNAotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1
Yi5jb20vYmx1ZXovYmx1ZXovY29tbWl0LzNhOWM2MzcwMTBmOGRjMWJhM2U4MzgyYWJlMDEwNjU3
NjFkNGY1YmJdCi0tLS0KLSBwcm9maWxlcy9pbnB1dC9kZXZpY2UuYyB8IDE4MiArKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDg0IGluc2Vy
dGlvbnMoKyksIDk4IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvcHJvZmlsZXMvaW5wdXQv
ZGV2aWNlLmMgYi9wcm9maWxlcy9pbnB1dC9kZXZpY2UuYwotaW5kZXggZTJhYzZlYTYwLi40YTUw
ZWE5OTIgMTAwNjQ0Ci0tLS0gYS9wcm9maWxlcy9pbnB1dC9kZXZpY2UuYwotKysrIGIvcHJvZmls
ZXMvaW5wdXQvZGV2aWNlLmMKLUBAIC02MCw3ICs2MCw3IEBAIHN0cnVjdCBpbnB1dF9kZXZpY2Ug
ewotIAljaGFyCQkJKnBhdGg7Ci0gCWJkYWRkcl90CQlzcmM7Ci0gCWJkYWRkcl90CQlkc3Q7Ci0t
CXVpbnQzMl90CQloYW5kbGU7Ci0rCWNvbnN0IHNkcF9yZWNvcmRfdAkqcmVjOwotIAlHSU9DaGFu
bmVsCQkqY3RybF9pbzsKLSAJR0lPQ2hhbm5lbAkJKmludHJfaW87Ci0gCWd1aW50CQkJY3RybF93
YXRjaDsKLUBAIC03NTQsNyArNzU0LDggQEAgc3RhdGljIHZvaWQgZXBveF9lbmRpYW5fcXVpcmso
dW5zaWduZWQgY2hhciAqZGF0YSwgaW50IHNpemUpCi0gCX0KLSB9Ci0gCi0tc3RhdGljIGludCBj
cmVhdGVfaGlkX2Rldl9uYW1lKHNkcF9yZWNvcmRfdCAqcmVjLCBzdHJ1Y3QgaGlkcF9jb25uYWRk
X3JlcSAqcmVxKQotK3N0YXRpYyBpbnQgY3JlYXRlX2hpZF9kZXZfbmFtZShjb25zdCBzZHBfcmVj
b3JkX3QgKnJlYywKLSsJCQkJCXN0cnVjdCBoaWRwX2Nvbm5hZGRfcmVxICpyZXEpCi0gewotIAlj
aGFyIHNkZXNjW3NpemVvZihyZXEtPm5hbWUpIC8gMl07Ci0gCi1AQCAtNzc2LDcgKzc3Nyw3IEBA
IHN0YXRpYyBpbnQgY3JlYXRlX2hpZF9kZXZfbmFtZShzZHBfcmVjb3JkX3QgKnJlYywgc3RydWN0
IGhpZHBfY29ubmFkZF9yZXEgKnJlcSkKLSAKLSAvKiBTZWUgSElEIHByb2ZpbGUgc3BlY2lmaWNh
dGlvbiB2MS4wLCAiNy4xMS42IEhJRERlc2NyaXB0b3JMaXN0IiBmb3IgZGV0YWlscwotICAqIG9u
IHRoZSBhdHRyaWJ1dGUgZm9ybWF0LiAqLwotLXN0YXRpYyBpbnQgZXh0cmFjdF9oaWRfZGVzY19k
YXRhKHNkcF9yZWNvcmRfdCAqcmVjLAotK3N0YXRpYyBpbnQgZXh0cmFjdF9oaWRfZGVzY19kYXRh
KGNvbnN0IHNkcF9yZWNvcmRfdCAqcmVjLAotIAkJCQkJCXN0cnVjdCBoaWRwX2Nvbm5hZGRfcmVx
ICpyZXEpCi0gewotIAlzZHBfZGF0YV90ICpkOwotQEAgLTgxNywzNiArODE4LDQwIEBAIGludmFs
aWRfZGVzYzoKLSAJcmV0dXJuIC1FSU5WQUw7Ci0gfQotIAotLXN0YXRpYyBpbnQgZXh0cmFjdF9o
aWRfcmVjb3JkKHNkcF9yZWNvcmRfdCAqcmVjLCBzdHJ1Y3QgaGlkcF9jb25uYWRkX3JlcSAqcmVx
KQotK3N0YXRpYyBpbnQgZXh0cmFjdF9oaWRfcmVjb3JkKHN0cnVjdCBpbnB1dF9kZXZpY2UgKmlk
ZXYsCi0rCQkJCQlzdHJ1Y3QgaGlkcF9jb25uYWRkX3JlcSAqcmVxKQotIHsKLSAJc2RwX2RhdGFf
dCAqcGRsaXN0OwotIAl1aW50OF90IGF0dHJfdmFsOwotIAlpbnQgZXJyOwotIAotLQllcnIgPSBj
cmVhdGVfaGlkX2Rldl9uYW1lKHJlYywgcmVxKTsKLSsJaWYgKCFpZGV2LT5yZWMpCi0rCQlyZXR1
cm4gLUVOT0VOVDsKLSsKLSsJZXJyID0gY3JlYXRlX2hpZF9kZXZfbmFtZShpZGV2LT5yZWMsIHJl
cSk7Ci0gCWlmIChlcnIgPCAwKQotIAkJREJHKCJObyB2YWxpZCBTZXJ2aWNlIE5hbWUgb3IgU2Vy
dmljZSBEZXNjcmlwdGlvbiBmb3VuZCIpOwotIAotLQlwZGxpc3QgPSBzZHBfZGF0YV9nZXQocmVj
LCBTRFBfQVRUUl9ISURfUEFSU0VSX1ZFUlNJT04pOwotKwlwZGxpc3QgPSBzZHBfZGF0YV9nZXQo
aWRldi0+cmVjLCBTRFBfQVRUUl9ISURfUEFSU0VSX1ZFUlNJT04pOwotIAlyZXEtPnBhcnNlciA9
IHBkbGlzdCA/IHBkbGlzdC0+dmFsLnVpbnQxNiA6IDB4MDEwMDsKLSAKLS0JcGRsaXN0ID0gc2Rw
X2RhdGFfZ2V0KHJlYywgU0RQX0FUVFJfSElEX0RFVklDRV9TVUJDTEFTUyk7Ci0rCXBkbGlzdCA9
IHNkcF9kYXRhX2dldChpZGV2LT5yZWMsIFNEUF9BVFRSX0hJRF9ERVZJQ0VfU1VCQ0xBU1MpOwot
IAlyZXEtPnN1YmNsYXNzID0gcGRsaXN0ID8gcGRsaXN0LT52YWwudWludDggOiAwOwotIAotLQlw
ZGxpc3QgPSBzZHBfZGF0YV9nZXQocmVjLCBTRFBfQVRUUl9ISURfQ09VTlRSWV9DT0RFKTsKLSsJ
cGRsaXN0ID0gc2RwX2RhdGFfZ2V0KGlkZXYtPnJlYywgU0RQX0FUVFJfSElEX0NPVU5UUllfQ09E
RSk7Ci0gCXJlcS0+Y291bnRyeSA9IHBkbGlzdCA/IHBkbGlzdC0+dmFsLnVpbnQ4IDogMDsKLSAK
LS0JcGRsaXN0ID0gc2RwX2RhdGFfZ2V0KHJlYywgU0RQX0FUVFJfSElEX1ZJUlRVQUxfQ0FCTEUp
OwotKwlwZGxpc3QgPSBzZHBfZGF0YV9nZXQoaWRldi0+cmVjLCBTRFBfQVRUUl9ISURfVklSVFVB
TF9DQUJMRSk7Ci0gCWF0dHJfdmFsID0gcGRsaXN0ID8gcGRsaXN0LT52YWwudWludDggOiAwOwot
IAlpZiAoYXR0cl92YWwpCi0gCQlyZXEtPmZsYWdzIHw9ICgxIDw8IEhJRFBfVklSVFVBTF9DQUJM
RV9VTlBMVUcpOwotIAotLQlwZGxpc3QgPSBzZHBfZGF0YV9nZXQocmVjLCBTRFBfQVRUUl9ISURf
Qk9PVF9ERVZJQ0UpOwotKwlwZGxpc3QgPSBzZHBfZGF0YV9nZXQoaWRldi0+cmVjLCBTRFBfQVRU
Ul9ISURfQk9PVF9ERVZJQ0UpOwotIAlhdHRyX3ZhbCA9IHBkbGlzdCA/IHBkbGlzdC0+dmFsLnVp
bnQ4IDogMDsKLSAJaWYgKGF0dHJfdmFsKQotIAkJcmVxLT5mbGFncyB8PSAoMSA8PCBISURQX0JP
T1RfUFJPVE9DT0xfTU9ERSk7Ci0gCi0tCWVyciA9IGV4dHJhY3RfaGlkX2Rlc2NfZGF0YShyZWMs
IHJlcSk7Ci0rCWVyciA9IGV4dHJhY3RfaGlkX2Rlc2NfZGF0YShpZGV2LT5yZWMsIHJlcSk7Ci0g
CWlmIChlcnIgPCAwKQotIAkJcmV0dXJuIGVycjsKLSAKLUBAIC0xMDM1LDExICsxMDQwLDYgQEAg
c3RhdGljIGdib29sZWFuIGVuY3J5cHRfbm90aWZ5KEdJT0NoYW5uZWwgKmlvLCBHSU9Db25kaXRp
b24gY29uZGl0aW9uLAotIHN0YXRpYyBpbnQgaGlkcF9hZGRfY29ubmVjdGlvbihzdHJ1Y3QgaW5w
dXRfZGV2aWNlICppZGV2KQotIHsKLSAJc3RydWN0IGhpZHBfY29ubmFkZF9yZXEgKnJlcTsKLS0J
c2RwX3JlY29yZF90ICpyZWM7Ci0tCWNoYXIgc3JjX2FkZHJbMThdLCBkc3RfYWRkclsxOF07Ci0t
CWNoYXIgZmlsZW5hbWVbUEFUSF9NQVhdOwotLQlHS2V5RmlsZSAqa2V5X2ZpbGU7Ci0tCWNoYXIg
aGFuZGxlWzExXSwgKnN0cjsKLSAJR0Vycm9yICpnZXJyID0gTlVMTDsKLSAJaW50IGVycjsKLSAK
LUBAIC0xMDQ5LDMzICsxMDQ5LDcgQEAgc3RhdGljIGludCBoaWRwX2FkZF9jb25uZWN0aW9uKHN0
cnVjdCBpbnB1dF9kZXZpY2UgKmlkZXYpCi0gCXJlcS0+ZmxhZ3MgICAgID0gMDsKLSAJcmVxLT5p
ZGxlX3RvICAgPSBpZGxlX3RpbWVvdXQ7Ci0gCi0tCWJhMnN0cigmaWRldi0+c3JjLCBzcmNfYWRk
cik7Ci0tCWJhMnN0cigmaWRldi0+ZHN0LCBkc3RfYWRkcik7Ci0tCi0tCXNucHJpbnRmKGZpbGVu
YW1lLCBQQVRIX01BWCwgU1RPUkFHRURJUiAiLyVzL2NhY2hlLyVzIiwgc3JjX2FkZHIsCi0tCQkJ
CQkJCQlkc3RfYWRkcik7Ci0tCXNwcmludGYoaGFuZGxlLCAiMHglOC44WCIsIGlkZXYtPmhhbmRs
ZSk7Ci0tCi0tCWtleV9maWxlID0gZ19rZXlfZmlsZV9uZXcoKTsKLS0JaWYgKCFnX2tleV9maWxl
X2xvYWRfZnJvbV9maWxlKGtleV9maWxlLCBmaWxlbmFtZSwgMCwgJmdlcnIpKSB7Ci0tCQllcnJv
cigiVW5hYmxlIHRvIGxvYWQga2V5IGZpbGUgZnJvbSAlczogKCVzKSIsIGZpbGVuYW1lLAotLQkJ
CQkJCQkJZ2Vyci0+bWVzc2FnZSk7Ci0tCQlnX2NsZWFyX2Vycm9yKCZnZXJyKTsKLS0JfQotLQlz
dHIgPSBnX2tleV9maWxlX2dldF9zdHJpbmcoa2V5X2ZpbGUsICJTZXJ2aWNlUmVjb3JkcyIsIGhh
bmRsZSwgTlVMTCk7Ci0tCWdfa2V5X2ZpbGVfZnJlZShrZXlfZmlsZSk7Ci0tCi0tCWlmICghc3Ry
KSB7Ci0tCQllcnJvcigiUmVqZWN0ZWQgY29ubmVjdGlvbiBmcm9tIHVua25vd24gZGV2aWNlICVz
IiwgZHN0X2FkZHIpOwotLQkJZXJyID0gLUVQRVJNOwotLQkJZ290byBjbGVhbnVwOwotLQl9Ci0t
Ci0tCXJlYyA9IHJlY29yZF9mcm9tX3N0cmluZyhzdHIpOwotLQlnX2ZyZWUoc3RyKTsKLS0KLS0J
ZXJyID0gZXh0cmFjdF9oaWRfcmVjb3JkKHJlYywgcmVxKTsKLS0Jc2RwX3JlY29yZF9mcmVlKHJl
Yyk7Ci0rCWVyciA9IGV4dHJhY3RfaGlkX3JlY29yZChpZGV2LCByZXEpOwotIAlpZiAoZXJyIDwg
MCkgewotIAkJZXJyb3IoIkNvdWxkIG5vdCBwYXJzZSBISUQgU0RQIHJlY29yZDogJXMgKCVkKSIs
IHN0cmVycm9yKC1lcnIpLAotIAkJCQkJCQkJCS1lcnIpOwotQEAgLTEwOTEsNyArMTA2NSw3IEBA
IHN0YXRpYyBpbnQgaGlkcF9hZGRfY29ubmVjdGlvbihzdHJ1Y3QgaW5wdXRfZGV2aWNlICppZGV2
KQotIAotIAkvKiBNYWtlIHN1cmUgdGhlIGRldmljZSBpcyBib25kZWQgaWYgcmVxdWlyZWQgKi8K
LSAJaWYgKGNsYXNzaWNfYm9uZGVkX29ubHkgJiYgIWlucHV0X2RldmljZV9ib25kZWQoaWRldikp
IHsKLS0JCWVycm9yKCJSZWplY3RlZCBjb25uZWN0aW9uIGZyb20gIWJvbmRlZCBkZXZpY2UgJXMi
LCBkc3RfYWRkcik7Ci0rCQllcnJvcigiUmVqZWN0ZWQgY29ubmVjdGlvbiBmcm9tICFib25kZWQg
ZGV2aWNlICVzIiwgaWRldi0+cGF0aCk7Ci0gCQlnb3RvIGNsZWFudXA7Ci0gCX0KLSAKLUBAIC0x
MTYxLDYgKzExMzUsNjggQEAgc3RhdGljIGludCBjb25uZWN0aW9uX2Rpc2Nvbm5lY3Qoc3RydWN0
IGlucHV0X2RldmljZSAqaWRldiwgdWludDMyX3QgZmxhZ3MpCi0gCQlyZXR1cm4gaW9jdGxfZGlz
Y29ubmVjdChpZGV2LCBmbGFncyk7Ci0gfQotIAotK3N0YXRpYyBib29sIGlzX2RldmljZV9zZHBf
ZGlzYWJsZShjb25zdCBzZHBfcmVjb3JkX3QgKnJlYykKLSt7Ci0rCXNkcF9kYXRhX3QgKmRhdGE7
Ci0rCi0rCWRhdGEgPSBzZHBfZGF0YV9nZXQocmVjLCBTRFBfQVRUUl9ISURfU0RQX0RJU0FCTEUp
OwotKwotKwlyZXR1cm4gZGF0YSAmJiBkYXRhLT52YWwudWludDg7Ci0rfQotKwotK3N0YXRpYyBl
bnVtIHJlY29ubmVjdF9tb2RlX3QgaGlkX3JlY29ubmVjdGlvbl9tb2RlKGJvb2wgcmVjb25uZWN0
X2luaXRpYXRlLAotKwkJCQkJCWJvb2wgbm9ybWFsbHlfY29ubmVjdGFibGUpCi0rewotKwlpZiAo
IXJlY29ubmVjdF9pbml0aWF0ZSAmJiAhbm9ybWFsbHlfY29ubmVjdGFibGUpCi0rCQlyZXR1cm4g
UkVDT05ORUNUX05PTkU7Ci0rCWVsc2UgaWYgKCFyZWNvbm5lY3RfaW5pdGlhdGUgJiYgbm9ybWFs
bHlfY29ubmVjdGFibGUpCi0rCQlyZXR1cm4gUkVDT05ORUNUX0hPU1Q7Ci0rCWVsc2UgaWYgKHJl
Y29ubmVjdF9pbml0aWF0ZSAmJiAhbm9ybWFsbHlfY29ubmVjdGFibGUpCi0rCQlyZXR1cm4gUkVD
T05ORUNUX0RFVklDRTsKLSsJZWxzZSAvKiAocmVjb25uZWN0X2luaXRpYXRlICYmIG5vcm1hbGx5
X2Nvbm5lY3RhYmxlKSAqLwotKwkJcmV0dXJuIFJFQ09OTkVDVF9BTlk7Ci0rfQotKwotK3N0YXRp
YyB2b2lkIGV4dHJhY3RfaGlkX3Byb3BzKHN0cnVjdCBpbnB1dF9kZXZpY2UgKmlkZXYsCi0rCQkJ
CQljb25zdCBzZHBfcmVjb3JkX3QgKnJlYykKLSt7Ci0rCS8qIEV4dHJhY3QgSElEIGNvbm5lY3Rh
YmlsaXR5ICovCi0rCWJvb2wgcmVjb25uZWN0X2luaXRpYXRlLCBub3JtYWxseV9jb25uZWN0YWJs
ZTsKLSsJc2RwX2RhdGFfdCAqcGRsaXN0OwotKwotKwkvKiBISUROb3JtYWxseUNvbm5lY3RhYmxl
IGlzIG9wdGlvbmFsIGFuZCBhc3N1bWVkIEZBTFNFIGlmIG5vdAotKwkgKiBwcmVzZW50LgotKwkg
Ki8KLSsJcGRsaXN0ID0gc2RwX2RhdGFfZ2V0KHJlYywgU0RQX0FUVFJfSElEX1JFQ09OTkVDVF9J
TklUSUFURSk7Ci0rCXJlY29ubmVjdF9pbml0aWF0ZSA9IHBkbGlzdCA/IHBkbGlzdC0+dmFsLnVp
bnQ4IDogVFJVRTsKLSsKLSsJcGRsaXN0ID0gc2RwX2RhdGFfZ2V0KHJlYywgU0RQX0FUVFJfSElE
X05PUk1BTExZX0NPTk5FQ1RBQkxFKTsKLSsJbm9ybWFsbHlfY29ubmVjdGFibGUgPSBwZGxpc3Qg
PyBwZGxpc3QtPnZhbC51aW50OCA6IEZBTFNFOwotKwotKwkvKiBVcGRhdGUgbG9jYWwgdmFsdWVz
ICovCi0rCWlkZXYtPnJlY29ubmVjdF9tb2RlID0KLSsJCWhpZF9yZWNvbm5lY3Rpb25fbW9kZShy
ZWNvbm5lY3RfaW5pdGlhdGUsIG5vcm1hbGx5X2Nvbm5lY3RhYmxlKTsKLSt9Ci0rCi0rc3RhdGlj
IHZvaWQgaW5wdXRfZGV2aWNlX3VwZGF0ZV9yZWMoc3RydWN0IGlucHV0X2RldmljZSAqaWRldikK
LSt7Ci0rCXN0cnVjdCBidGRfcHJvZmlsZSAqcCA9IGJ0ZF9zZXJ2aWNlX2dldF9wcm9maWxlKGlk
ZXYtPnNlcnZpY2UpOwotKwljb25zdCBzZHBfcmVjb3JkX3QgKnJlYzsKLSsKLSsJcmVjID0gYnRk
X2RldmljZV9nZXRfcmVjb3JkKGlkZXYtPmRldmljZSwgcC0+cmVtb3RlX3V1aWQpOwotKwlpZiAo
IXJlYyB8fCBpZGV2LT5yZWMgPT0gcmVjKQotKwkJcmV0dXJuOwotKwotKwlpZGV2LT5yZWMgPSBy
ZWM7Ci0rCWlkZXYtPmRpc2FibGVfc2RwID0gaXNfZGV2aWNlX3NkcF9kaXNhYmxlKHJlYyk7Ci0r
Ci0rCS8qIEluaXRpYWxpemUgZGV2aWNlIHByb3BlcnRpZXMgKi8KLSsJZXh0cmFjdF9oaWRfcHJv
cHMoaWRldiwgcmVjKTsKLSsKLSsJaWYgKGlkZXYtPmRpc2FibGVfc2RwKQotKwkJZGV2aWNlX3Nl
dF9yZWZyZXNoX2Rpc2NvdmVyeShpZGV2LT5kZXZpY2UsIGZhbHNlKTsKLSt9Ci0rCi0gc3RhdGlj
IGludCBpbnB1dF9kZXZpY2VfY29ubmVjdGVkKHN0cnVjdCBpbnB1dF9kZXZpY2UgKmlkZXYpCi0g
ewotIAlpbnQgZXJyOwotQEAgLTExNjgsNiArMTIwNCw5IEBAIHN0YXRpYyBpbnQgaW5wdXRfZGV2
aWNlX2Nvbm5lY3RlZChzdHJ1Y3QgaW5wdXRfZGV2aWNlICppZGV2KQotIAlpZiAoaWRldi0+aW50
cl9pbyA9PSBOVUxMIHx8IGlkZXYtPmN0cmxfaW8gPT0gTlVMTCkKLSAJCXJldHVybiAtRU5PVENP
Tk47Ci0gCi0rCS8qIEF0dGVtcHQgdG8gdXBkYXRlIFNEUCByZWNvcmQgaWYgaXQgaGFkIGNoYW5n
ZWQgKi8KLSsJaW5wdXRfZGV2aWNlX3VwZGF0ZV9yZWMoaWRldik7Ci0rCi0gCWVyciA9IGhpZHBf
YWRkX2Nvbm5lY3Rpb24oaWRldik7Ci0gCWlmIChlcnIgPCAwKQotIAkJcmV0dXJuIGVycjsKLUBA
IC0xNDExLDc0ICsxNDUwLDIxIEBAIGludCBpbnB1dF9kZXZpY2VfZGlzY29ubmVjdChzdHJ1Y3Qg
YnRkX3NlcnZpY2UgKnNlcnZpY2UpCi0gCXJldHVybiAwOwotIH0KLSAKLS1zdGF0aWMgYm9vbCBp
c19kZXZpY2Vfc2RwX2Rpc2FibGUoY29uc3Qgc2RwX3JlY29yZF90ICpyZWMpCi0tewotLQlzZHBf
ZGF0YV90ICpkYXRhOwotLQotLQlkYXRhID0gc2RwX2RhdGFfZ2V0KHJlYywgU0RQX0FUVFJfSElE
X1NEUF9ESVNBQkxFKTsKLS0KLS0JcmV0dXJuIGRhdGEgJiYgZGF0YS0+dmFsLnVpbnQ4OwotLX0K
LS0KLS1zdGF0aWMgZW51bSByZWNvbm5lY3RfbW9kZV90IGhpZF9yZWNvbm5lY3Rpb25fbW9kZShi
b29sIHJlY29ubmVjdF9pbml0aWF0ZSwKLS0JCQkJCQlib29sIG5vcm1hbGx5X2Nvbm5lY3RhYmxl
KQotLXsKLS0JaWYgKCFyZWNvbm5lY3RfaW5pdGlhdGUgJiYgIW5vcm1hbGx5X2Nvbm5lY3RhYmxl
KQotLQkJcmV0dXJuIFJFQ09OTkVDVF9OT05FOwotLQllbHNlIGlmICghcmVjb25uZWN0X2luaXRp
YXRlICYmIG5vcm1hbGx5X2Nvbm5lY3RhYmxlKQotLQkJcmV0dXJuIFJFQ09OTkVDVF9IT1NUOwot
LQllbHNlIGlmIChyZWNvbm5lY3RfaW5pdGlhdGUgJiYgIW5vcm1hbGx5X2Nvbm5lY3RhYmxlKQot
LQkJcmV0dXJuIFJFQ09OTkVDVF9ERVZJQ0U7Ci0tCWVsc2UgLyogKHJlY29ubmVjdF9pbml0aWF0
ZSAmJiBub3JtYWxseV9jb25uZWN0YWJsZSkgKi8KLS0JCXJldHVybiBSRUNPTk5FQ1RfQU5ZOwot
LX0KLS0KLS1zdGF0aWMgdm9pZCBleHRyYWN0X2hpZF9wcm9wcyhzdHJ1Y3QgaW5wdXRfZGV2aWNl
ICppZGV2LAotLQkJCQkJY29uc3Qgc2RwX3JlY29yZF90ICpyZWMpCi0tewotLQkvKiBFeHRyYWN0
IEhJRCBjb25uZWN0YWJpbGl0eSAqLwotLQlib29sIHJlY29ubmVjdF9pbml0aWF0ZSwgbm9ybWFs
bHlfY29ubmVjdGFibGU7Ci0tCXNkcF9kYXRhX3QgKnBkbGlzdDsKLS0KLS0JLyogSElETm9ybWFs
bHlDb25uZWN0YWJsZSBpcyBvcHRpb25hbCBhbmQgYXNzdW1lZCBGQUxTRQotLQkqIGlmIG5vdCBw
cmVzZW50LiAqLwotLQlwZGxpc3QgPSBzZHBfZGF0YV9nZXQocmVjLCBTRFBfQVRUUl9ISURfUkVD
T05ORUNUX0lOSVRJQVRFKTsKLS0JcmVjb25uZWN0X2luaXRpYXRlID0gcGRsaXN0ID8gcGRsaXN0
LT52YWwudWludDggOiBUUlVFOwotLQotLQlwZGxpc3QgPSBzZHBfZGF0YV9nZXQocmVjLCBTRFBf
QVRUUl9ISURfTk9STUFMTFlfQ09OTkVDVEFCTEUpOwotLQlub3JtYWxseV9jb25uZWN0YWJsZSA9
IHBkbGlzdCA/IHBkbGlzdC0+dmFsLnVpbnQ4IDogRkFMU0U7Ci0tCi0tCS8qIFVwZGF0ZSBsb2Nh
bCB2YWx1ZXMgKi8KLS0JaWRldi0+cmVjb25uZWN0X21vZGUgPQotLQkJaGlkX3JlY29ubmVjdGlv
bl9tb2RlKHJlY29ubmVjdF9pbml0aWF0ZSwgbm9ybWFsbHlfY29ubmVjdGFibGUpOwotLX0KLS0K
LSBzdGF0aWMgc3RydWN0IGlucHV0X2RldmljZSAqaW5wdXRfZGV2aWNlX25ldyhzdHJ1Y3QgYnRk
X3NlcnZpY2UgKnNlcnZpY2UpCi0gewotIAlzdHJ1Y3QgYnRkX2RldmljZSAqZGV2aWNlID0gYnRk
X3NlcnZpY2VfZ2V0X2RldmljZShzZXJ2aWNlKTsKLS0Jc3RydWN0IGJ0ZF9wcm9maWxlICpwID0g
YnRkX3NlcnZpY2VfZ2V0X3Byb2ZpbGUoc2VydmljZSk7Ci0gCWNvbnN0IGNoYXIgKnBhdGggPSBk
ZXZpY2VfZ2V0X3BhdGgoZGV2aWNlKTsKLS0JY29uc3Qgc2RwX3JlY29yZF90ICpyZWMgPSBidGRf
ZGV2aWNlX2dldF9yZWNvcmQoZGV2aWNlLCBwLT5yZW1vdGVfdXVpZCk7Ci0gCXN0cnVjdCBidGRf
YWRhcHRlciAqYWRhcHRlciA9IGRldmljZV9nZXRfYWRhcHRlcihkZXZpY2UpOwotIAlzdHJ1Y3Qg
aW5wdXRfZGV2aWNlICppZGV2OwotIAotLQlpZiAoIXJlYykKLS0JCXJldHVybiBOVUxMOwotLQot
IAlpZGV2ID0gZ19uZXcwKHN0cnVjdCBpbnB1dF9kZXZpY2UsIDEpOwotIAliYWNweSgmaWRldi0+
c3JjLCBidGRfYWRhcHRlcl9nZXRfYWRkcmVzcyhhZGFwdGVyKSk7Ci0gCWJhY3B5KCZpZGV2LT5k
c3QsIGRldmljZV9nZXRfYWRkcmVzcyhkZXZpY2UpKTsKLSAJaWRldi0+c2VydmljZSA9IGJ0ZF9z
ZXJ2aWNlX3JlZihzZXJ2aWNlKTsKLSAJaWRldi0+ZGV2aWNlID0gYnRkX2RldmljZV9yZWYoZGV2
aWNlKTsKLSAJaWRldi0+cGF0aCA9IGdfc3RyZHVwKHBhdGgpOwotLQlpZGV2LT5oYW5kbGUgPSBy
ZWMtPmhhbmRsZTsKLS0JaWRldi0+ZGlzYWJsZV9zZHAgPSBpc19kZXZpY2Vfc2RwX2Rpc2FibGUo
cmVjKTsKLS0KLS0JLyogSW5pdGlhbGl6ZSBkZXZpY2UgcHJvcGVydGllcyAqLwotLQlleHRyYWN0
X2hpZF9wcm9wcyhpZGV2LCByZWMpOwotIAotLQlpZiAoaWRldi0+ZGlzYWJsZV9zZHApCi0tCQlk
ZXZpY2Vfc2V0X3JlZnJlc2hfZGlzY292ZXJ5KGRldmljZSwgZmFsc2UpOwotKwlpbnB1dF9kZXZp
Y2VfdXBkYXRlX3JlYyhpZGV2KTsKLSAKLSAJcmV0dXJuIGlkZXY7Ci0gfQotLS0gCi0yLjQyLjAK
LQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAw
MDQtc3JjLXNoYXJlZC11dGlsLmMtaW5jbHVkZS1saW51eC1saW1pdHMuaC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDA0LXNyYy1zaGFyZWQtdXRpbC5j
LWluY2x1ZGUtbGludXgtbGltaXRzLmgucGF0Y2gKaW5kZXggZjk1NGY2ZGFiMi4uNmVmMTM1MzI3
ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAw
MDQtc3JjLXNoYXJlZC11dGlsLmMtaW5jbHVkZS1saW51eC1saW1pdHMuaC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvMDAwNC1zcmMtc2hhcmVkLXV0
aWwuYy1pbmNsdWRlLWxpbnV4LWxpbWl0cy5oLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1
MTU4NDE1OGI5YTJlNThmMzc5MGY4YTczODdiNWNmMTY3ZWNhODhiIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBhZDA2OWZhZGZjY2UyY2Y3MGY0NWIxYzRhNDI2NjU0NDg2NzUyOTdlIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGlu
dXRyb25peC5kZT4KIERhdGU6IE1vbiwgMTIgRGVjIDIwMjIgMTM6MTA6MTkgKzAxMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gc3JjL3NoYXJlZC91dGlsLmM6IGluY2x1ZGUgbGludXgvbGltaXRzLmgKQEAg
LTgsMTUgKzgsMTYgQEAgc3lzdGVtcyBzdWNoIGFzIHRob3NlIHVzaW5nIG11c2wuCiAKIFVwc3Ry
ZWFtLVN0YXR1czogU3VibWl0dGVkIFt0byBsaW51eC1ibHVldG9vdGhAdmdlci5rZXJuZWwub3Jn
LGx1aXoudm9uLmRlbnR6QGludGVsLmNvbSxmcmVkZXJpYy5kYW5pc0Bjb2xsYWJvcmEuY29tXQog
U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KKwog
LS0tCiAgc3JjL3NoYXJlZC91dGlsLmMgfCAxICsKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKIAogZGlmZiAtLWdpdCBhL3NyYy9zaGFyZWQvdXRpbC5jIGIvc3JjL3NoYXJlZC91dGls
LmMKLWluZGV4IDBhMDMwOGMuLjFmNjEzMTQgMTAwNjQ0CitpbmRleCAzNDQ5MWY0Li40MTJmM2Fk
IDEwMDY0NAogLS0tIGEvc3JjL3NoYXJlZC91dGlsLmMKICsrKyBiL3NyYy9zaGFyZWQvdXRpbC5j
Ci1AQCAtMjIsNiArMjIsNyBAQAorQEAgLTIzLDYgKzIzLDcgQEAKICAjaW5jbHVkZSA8dW5pc3Rk
Lmg+CiAgI2luY2x1ZGUgPGRpcmVudC5oPgogICNpbmNsdWRlIDxsaW1pdHMuaD4KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS9DVkUtMjAyMy00NTg2
Ni5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS9DVkUtMjAy
My00NTg2Ni5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNWJiMzFkODY2YS4u
MDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUv
Q1ZFLTIwMjMtNDU4NjYucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw1NiArMCwwIEBACi1Gcm9t
IDI1YTQ3MWE4M2UwMmUxZWZmYjE1ZDVhNDg4YjNmMDA4NWVhZWI2NzUgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiBMdWl6IEF1Z3VzdG8gdm9uIERlbnR6IDxsdWl6LnZvbi5kZW50ekBp
bnRlbC5jb20+Ci1EYXRlOiBUdWUsIDEwIE9jdCAyMDIzIDEzOjAzOjEyIC0wNzAwCi1TdWJqZWN0
OiBbUEFUQ0hdIGlucHV0LmNvbmY6IENoYW5nZSBkZWZhdWx0IG9mIENsYXNzaWNCb25kZWRPbmx5
Ci0KLVRoaXMgY2hhbmdlcyB0aGUgZGVmYXVsdCBvZiBDbGFzc2ljQm9uZGVkT25seSBzaW5jZSBk
ZWZhdWx0aW5nIHRvIGZhbHNlCi1pcyBub3QgaW5saW5lIHdpdGggSElEIHNwZWNpZmljYXRpb24g
d2hpY2ggbWFuZGF0ZXMgdGhlIG9mIFNlY3VyaXR5IE1vZGUKLTQ6Ci0KLUJMVUVUT09USCBTUEVD
SUZJQ0FUSU9OIFBhZ2UgODQgb2YgMTIzCi1IdW1hbiBJbnRlcmZhY2UgRGV2aWNlIChISUQpIFBy
b2ZpbGU6Ci0KLSAgNS40LjMuNC4yIFNlY3VyaXR5IE1vZGVzCi0gIEJsdWV0b290aCBISUQgSG9z
dHMgc2hhbGwgdXNlIFNlY3VyaXR5IE1vZGUgNCB3aGVuIGludGVyb3BlcmF0aW5nIHdpdGgKLSAg
Qmx1ZXRvb3RoIEhJRCBkZXZpY2VzIHRoYXQgYXJlIGNvbXBsaWFudCB0byB0aGUgQmx1ZXRvb3Ro
IENvcmUKLSAgU3BlY2lmaWNhdGlvbiB2Mi4xK0VEUls2XS4KLQotVXBzdHJlYW0tU3RhdHVzOiBC
YWNrcG9ydAotW2h0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9ibHVldG9vdGgvYmx1ZXou
Z2l0L2NvbW1pdC9wcm9maWxlcy9pbnB1dD9pZD0yNWE0NzFhODNlMDJlMWVmZmIxNWQ1YTQ4OGIz
ZjAwODVlYWViNjc1XQotCi1DVkU6IENWRS0yMDIzLTQ1ODY2Ci0KLVNpZ25lZC1vZmYtYnk6IEFy
Y2hhbmEgUG9sYW1wYWxsaSA8YXJjaGFuYS5wb2xhbXBhbGxpQHdpbmRyaXZlci5jb20+Ci0tLS0K
LSBwcm9maWxlcy9pbnB1dC9kZXZpY2UuYyAgIHwgMiArLQotIHByb2ZpbGVzL2lucHV0L2lucHV0
LmNvbmYgfCAyICstCi0gMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCi0KLWRpZmYgLS1naXQgYS9wcm9maWxlcy9pbnB1dC9kZXZpY2UuYyBiL3Byb2ZpbGVz
L2lucHV0L2RldmljZS5jCi1pbmRleCA0YTUwZWE5Li40MzEwZGQxIDEwMDY0NAotLS0tIGEvcHJv
ZmlsZXMvaW5wdXQvZGV2aWNlLmMKLSsrKyBiL3Byb2ZpbGVzL2lucHV0L2RldmljZS5jCi1AQCAt
ODEsNyArODEsNyBAQCBzdHJ1Y3QgaW5wdXRfZGV2aWNlIHsKLQotIHN0YXRpYyBpbnQgaWRsZV90
aW1lb3V0ID0gMDsKLSBzdGF0aWMgYm9vbCB1aGlkX2VuYWJsZWQgPSBmYWxzZTsKLS1zdGF0aWMg
Ym9vbCBjbGFzc2ljX2JvbmRlZF9vbmx5ID0gZmFsc2U7Ci0rc3RhdGljIGJvb2wgY2xhc3NpY19i
b25kZWRfb25seSA9IHRydWU7Ci0KLSB2b2lkIGlucHV0X3NldF9pZGxlX3RpbWVvdXQoaW50IHRp
bWVvdXQpCi0gewotZGlmZiAtLWdpdCBhL3Byb2ZpbGVzL2lucHV0L2lucHV0LmNvbmYgYi9wcm9m
aWxlcy9pbnB1dC9pbnB1dC5jb25mCi1pbmRleCA0YzcwYmM1Li5kODY0NWYzIDEwMDY0NAotLS0t
IGEvcHJvZmlsZXMvaW5wdXQvaW5wdXQuY29uZgotKysrIGIvcHJvZmlsZXMvaW5wdXQvaW5wdXQu
Y29uZgotQEAgLTE3LDcgKzE3LDcgQEAKLSAjIHBsYXRmb3JtcyBtYXkgd2FudCB0byBtYWtlIHN1
cmUgdGhhdCBpbnB1dCBjb25uZWN0aW9ucyBvbmx5IGNvbWUgZnJvbSBib25kZWQKLSAjIGRldmlj
ZSBjb25uZWN0aW9ucy4gU2V2ZXJhbCBvbGRlciBtaWNlIGhhdmUgYmVlbiBrbm93biBmb3Igbm90
IHN1cHBvcnRpbmcKLSAjIHBhaXJpbmcvZW5jcnlwdGlvbi4KLS0jIERlZmF1bHRzIHRvIGZhbHNl
IHRvIG1heGltaXplIGRldmljZSBjb21wYXRpYmlsaXR5LgotKyMgRGVmYXVsdHMgdG8gdHJ1ZSBm
b3Igc2VjdXJpdHkuCi0gI0NsYXNzaWNCb25kZWRPbmx5PXRydWUKLQotICMgTEUgdXBncmFkZSBz
ZWN1cml0eQotLS0KLTIuNDAuMApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9ibHVlejUvYmx1ZXo1XzUuNzAuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6
NS9ibHVlejVfNS43MS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejVfNS43MC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1XzUuNzEuYmIKaW5kZXggMmUzYjc4MmU2
ZS4uYjliYzNkZDFiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVl
ejUvYmx1ZXo1XzUuNzAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUv
Ymx1ZXo1XzUuNzEuYmIKQEAgLTEsNiArMSw2IEBACiByZXF1aXJlIGJsdWV6NS5pbmMKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjM3ZTM3MmU5MTY5NTVlMTQ0Y2I4ODJmODg4ZTRiZTQwODk4ZjEw
YWUzYjdjMjEzZGRjZGQ1NWVlOWMwMDkyNzgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjgyOGQ0
MThjOTNjZWQxZjU1YjYxNmZiNTQ4MmNmMDE1Mzc0NDBiZmIzNGZiZGExYTU2NGYzZWNlOTQ3MzVk
OCIKIAogQ1ZFX1NUQVRVU1tDVkUtMjAyMC0yNDQ5MF0gPSAiY3BlLWluY29ycmVjdDogVGhpcyBp
c3N1ZSBoYXMga2VybmVsIGZpeGVzIHJhdGhlciB0aGFuIGJsdWV6IGZpeGVzIgogCi0tIAoyLjQy
LjAKCg==

--===============9108349123591876496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/bluez5/bluez5-ptest: FILELIST: added "/usr/lib/bluez5/ptest/unit/test-vcp /usr/lib/bluez5/ptest/unit/test-micp"
packages/core2-64-poky-linux/bluez5/bluez5-ptest: PKGSIZE changed from 5366419 to 6198771 (+16%)
packages/core2-64-poky-linux/bluez5/bluez5: FILELIST: removed "/usr/lib/libbluetooth.so.3.19.10", added "/usr/lib/libbluetooth.so.3.19.11"
Changes to packages/core2-64-poky-linux/bluez5 (sysroot):
  /usr/lib/libbluetooth.so.3 changed symlink target from libbluetooth.so.3.19.10 to libbluetooth.so.3.19.11
  /usr/lib/libbluetooth.so changed symlink target from libbluetooth.so.3.19.10 to libbluetooth.so.3.19.11
  /usr/lib/libbluetooth.so.3.19.10 moved to /usr/lib/libbluetooth.so.3.19.11

--===============9108349123591876496==--

