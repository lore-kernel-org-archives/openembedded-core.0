Return-Path: <Arturo.Buzarra@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.198])
	by mail.openembedded.org (Postfix) with ESMTP id B2DD17843F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 13:39:25 +0000 (UTC)
Received: from [216.82.241.196] by server-6.bemta-8.messagelabs.com id
	99/80-02223-D87B10A5; Tue, 07 Nov 2017 13:39:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsXi5LtOQLdnO2O
	UQd8KM4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP+3vPMBe9FK2bt7GBuYOwR7mLk4hASWMUo
	8XHrQzYIZzWjxL6f/9khnA2MEjPX/mLuYuTkYBPQk/j2ZRaQzcEhAmRf/ScKEhYWSJK40/+EB
	STMIqAi0dRtBhLmFbCRePPzGQuILSEgL7H4+042iLigxMmZT8DizAISEgdfvACbKATU+vyJLU
	S5gsS194vZJzDyzkLSMQtJxwJGplWMGsWpRWWpRbpGJnpJRZnpGSW5iZk5uoYGFnq5qcXFiem
	pOYlJxXrJ+bmbGIHBU8/AwLiD8ezryEOMkhxMSqK8G0IYooT4kvJTKjMSizPii0pzUosPMcpw
	cChJ8JZsY4wSEixKTU+tSMvMAYYxTFqCg0dJhLcNJM1bXJCYW5yZDpE6xWjM8Wzm6wZmjmlXW
	5uYhVjy8vNSpcR560BKBUBKM0rz4AbB4usSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeKS
	BTeDLzSuD2vQI6hQnolP0gX/AWlyQipKQaGMXe/n/V3+uZyXTq4Okw67bHp7MeHzMM+bKkNrn
	zkJySxnMnp/aDz6aL2u7OPauk+nt7Z+z2nMPt3ddUNKI/GhhtUPTLddwux9/+U/2ud5Cui+2z
	fw3H54t/OSZTqP92fo7Tjkm/tniqaFdOv5Rv5zft9LtFse8fPvScZrNLmodVP7LhuluoiBJLc
	UaioRZzUXEiAMK549SqAgAA
X-Env-Sender: Arturo.Buzarra@digi.com
X-Msg-Ref: server-2.tower-46.messagelabs.com!1510061963!77916431!4
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12313 invoked from network); 7 Nov 2017 13:39:24 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-2.tower-46.messagelabs.com with SMTP;
	7 Nov 2017 13:39:24 -0000
Received: from MTK-SMS-XCH02.digi.com (10.10.8.196) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 7 Nov 2017 07:39:22 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH02.digi.com
	(10.10.8.196) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 7 Nov 2017 07:39:22 -0600
Received: from LOG-CLN-ABUZARRA2.digi.com (10.101.2.112) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.361.1; Tue, 7 Nov 2017 14:39:20 +0100
From: Arturo Buzarra <arturo.buzarra@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Nov 2017 14:36:51 +0100
Message-ID: <20171107133651.24070-1-arturo.buzarra@digi.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.101.2.112]
Subject: [PATCH][daisy] bluez4: fix out-of-bounds access in SDP server (CVE-2017-1000250)
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
X-List-Received-Date: Tue, 07 Nov 2017 13:39:25 -0000
Content-Type: text/plain

Backport patch from bluez5 to bluez4

(From OE-Core rev: 8878d599cbc48b700f393d94657fe39db06fd533)

Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
---
 .../bluez/bluez4-4.101/cve-2017-1000250.patch      | 34 ++++++++++++++++++++++
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/cve-2017-1000250.patch

diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/cve-2017-1000250.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/cve-2017-1000250.patch
new file mode 100644
index 0000000000..4e1f02d588
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/bluez4-4.101/cve-2017-1000250.patch
@@ -0,0 +1,34 @@
+All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable to an
+information disclosure vulnerability which allows remote attackers to obtain
+sensitive information from the bluetoothd process memory. This vulnerability
+lies in the processing of SDP search attribute requests.
+
+CVE: CVE-2017-1000250
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 9e009647b14e810e06626dde7f1bb9ea3c375d09 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Wed, 13 Sep 2017 10:01:40 +0300
+Subject: sdp: Fix Out-of-bounds heap read in service_search_attr_req function
+
+Check if there is enough data to continue otherwise return an error.
+---
+ src/sdpd-request.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sdpd-request.c b/src/sdpd-request.c
+index 6a903c6..b2f9fbb 100644
+--- a/src/sdpd-request.c
++++ b/src/sdpd-request.c
+@@ -907,7 +907,7 @@ static int service_search_attr_req(sdp_req_t *req, sdp_buf_t *buf)
+ 	} else {
+ 		/* continuation State exists -> get from cache */
+ 		sdp_buf_t *pCache = sdp_get_cached_rsp(cstate);
+-		if (pCache) {
++		if (pCache && cstate->cStateValue.maxBytesSent < pCache->data_size) {
+ 			uint16_t sent = MIN(max, pCache->data_size - cstate->cStateValue.maxBytesSent);
+ 			pResponse = pCache->data;
+ 			memcpy(buf->data, pResponse + cstate->cStateValue.maxBytesSent, sent);
+-- 
+cgit v1.1
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index ccd230df8a..fc3c130fb7 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://bluetooth.conf \
             file://network-fix-network-Connect-method-parameters.patch \
             file://install-test-script.patch \
             file://use-legacy-pygobject-instead-ofgobject-introspection.patch \
+            file://cve-2017-1000250.patch \
 "
 
 SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
-- 
2.15.0


