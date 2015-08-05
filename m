Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym03.jp.fujitsu.com (mgwym03.jp.fujitsu.com [211.128.242.42])
	by mail.openembedded.org (Postfix) with ESMTP id 882686E5D0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 02:38:59 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym03.jp.fujitsu.com with smtp
	id 5f43_30d0_7e1393bd_9e12_41ea_b812_7dfc454f3526;
	Wed, 05 Aug 2015 11:38:58 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B7A9AC00DD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 11:38:57 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id 48E85EA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 11:38:57 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 318661E0087
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 11:38:57 +0900 (JST)
Message-ID: <55C177DC.8090606@jp.fujitsu.com>
Date: Wed, 05 Aug 2015 11:41:32 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
X-TM-AS-MML: disable
Subject: [PATCH] wpa-supplicant: Fix CVE-2015-4141, CVE-2015-4143, CVE-2015-4144, CVE-2015-4145, CVE-2015-4146
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
X-List-Received-Date: Wed, 05 Aug 2015 02:39:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

wpa-supplicant: backport patch to fix CVE-2015-4141,
 CVE-2015-4143, CVE-2015-4144, CVE-2015-4145, CVE-2015-4146

Backport patch to fix CVE-2015-4141, CVE-2015-4143, CVE-2015-4144, CVE-2015-4145, CVE-2015-4146.
This patch is originally from:

For CVE-2015-4141:
http://w1.fi/security/2015-2/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch

For CVE-2015-4143:
http://w1.fi/security/2015-4/0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch
http://w1.fi/security/2015-4/0002-EAP-pwd-server-Fix-payload-length-validation-for-Com.patch

For CVE-2015-4144 and CVE-2015-4145:
http://w1.fi/security/2015-4/0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch
http://w1.fi/security/2015-4/0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch

For CVE-2015-4146:
http://w1.fi/security/2015-4/0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch

Signed-off-by: Fan Xin <fan.xin at jp.fujitsu.com>
---
 ...r-Fix-payload-length-validation-for-Commi.patch | 77 ++++++++++++++++++++++
 ...Fix-HTTP-chunked-transfer-encoding-parser.patch | 53 +++++++++++++++
 ...ver-Fix-payload-length-validation-for-Com.patch | 70 ++++++++++++++++++++
 ...r-Fix-Total-Length-parsing-for-fragment-r.patch | 56 ++++++++++++++++
 ...ver-Fix-Total-Length-parsing-for-fragment.patch | 54 +++++++++++++++
 ...eer-Fix-asymmetric-fragmentation-behavior.patch | 36 ++++++++++
 .../wpa-supplicant/wpa-supplicant_2.4.bb           |  6 ++
 7 files changed, 352 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-EAP-pwd-server-Fix-payload-length-validation-for-Com.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch
new file mode 100644
index 0000000..a2bafc8
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch
@@ -0,0 +1,77 @@
+Upstream-Status: Backport
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+
+From dd2f043c9c43d156494e33d7ce22db96e6ef42c7 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Fri, 1 May 2015 16:37:45 +0300
+Subject: [PATCH 1/5] EAP-pwd peer: Fix payload length validation for Commit
+ and Confirm
+
+The length of the received Commit and Confirm message payloads was not
+checked before reading them. This could result in a buffer read
+overflow when processing an invalid message.
+
+Fix this by verifying that the payload is of expected length before
+processing it. In addition, enforce correct state transition sequence to
+make sure there is no unexpected behavior if receiving a Commit/Confirm
+message before the previous exchanges have been completed.
+
+Thanks to Kostya Kortchinsky of Google security team for discovering and
+reporting this issue.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+---
+ src/eap_peer/eap_pwd.c | 29 +++++++++++++++++++++++++++++
+ 1 file changed, 29 insertions(+)
+
+diff --git a/src/eap_peer/eap_pwd.c b/src/eap_peer/eap_pwd.c
+index f2b0926..a629437 100644
+--- a/src/eap_peer/eap_pwd.c
++++ b/src/eap_peer/eap_pwd.c
+@@ -355,6 +355,23 @@ eap_pwd_perform_commit_exchange(struct eap_sm *sm, struct eap_pwd_data *data,
+ 	BIGNUM *mask = NULL, *x = NULL, *y = NULL, *cofactor = NULL;
+ 	u16 offset;
+ 	u8 *ptr, *scalar = NULL, *element = NULL;
++	size_t prime_len, order_len;
++
++	if (data->state != PWD_Commit_Req) {
++		ret->ignore = TRUE;
++		goto fin;
++	}
++
++	prime_len = BN_num_bytes(data->grp->prime);
++	order_len = BN_num_bytes(data->grp->order);
++
++	if (payload_len != 2 * prime_len + order_len) {
++		wpa_printf(MSG_INFO,
++			   "EAP-pwd: Unexpected Commit payload length %u (expected %u)",
++			   (unsigned int) payload_len,
++			   (unsigned int) (2 * prime_len + order_len));
++		goto fin;
++	}
+ 
+ 	if (((data->private_value = BN_new()) == NULL) ||
+ 	    ((data->my_element = EC_POINT_new(data->grp->group)) == NULL) ||
+@@ -554,6 +571,18 @@ eap_pwd_perform_confirm_exchange(struct eap_sm *sm, struct eap_pwd_data *data,
+ 	u8 conf[SHA256_MAC_LEN], *cruft = NULL, *ptr;
+ 	int offset;
+ 
++	if (data->state != PWD_Confirm_Req) {
++		ret->ignore = TRUE;
++		goto fin;
++	}
++
++	if (payload_len != SHA256_MAC_LEN) {
++		wpa_printf(MSG_INFO,
++			   "EAP-pwd: Unexpected Confirm payload length %u (expected %u)",
++			   (unsigned int) payload_len, SHA256_MAC_LEN);
++		goto fin;
++	}
++
+ 	/*
+ 	 * first build up the ciphersuite which is group | random_function |
+ 	 *	prf
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch
new file mode 100644
index 0000000..2568ea1
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch
@@ -0,0 +1,53 @@
+Upstream-Status: Backport
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+
+From 5acd23f4581da58683f3cf5e36cb71bbe4070bd7 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Tue, 28 Apr 2015 17:08:33 +0300
+Subject: [PATCH] WPS: Fix HTTP chunked transfer encoding parser
+
+strtoul() return value may end up overflowing the int h->chunk_size and
+resulting in a negative value to be stored as the chunk_size. This could
+result in the following memcpy operation using a very large length
+argument which would result in a buffer overflow and segmentation fault.
+
+This could have been used to cause a denial service by any device that
+has been authorized for network access (either wireless or wired). This
+would affect both the WPS UPnP functionality in a WPS AP (hostapd with
+upnp_iface parameter set in the configuration) and WPS ER
+(wpa_supplicant with WPS_ER_START control interface command used).
+
+Validate the parsed chunk length value to avoid this. In addition to
+rejecting negative values, we can also reject chunk size that would be
+larger than the maximum configured body length.
+
+Thanks to Kostya Kortchinsky of Google security team for discovering and
+reporting this issue.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+---
+ src/wps/httpread.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/wps/httpread.c b/src/wps/httpread.c
+index 2f08f37..d2855e3 100644
+--- a/src/wps/httpread.c
++++ b/src/wps/httpread.c
+@@ -533,6 +533,13 @@ static void httpread_read_handler(int sd, void *eloop_ctx, void *sock_ctx)
+ 					if (!isxdigit(*cbp))
+ 						goto bad;
+ 					h->chunk_size = strtoul(cbp, NULL, 16);
++					if (h->chunk_size < 0 ||
++					    h->chunk_size > h->max_bytes) {
++						wpa_printf(MSG_DEBUG,
++							   "httpread: Invalid chunk size %d",
++							   h->chunk_size);
++						goto bad;
++					}
+ 					/* throw away chunk header
+ 					 * so we have only real data
+ 					 */
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-EAP-pwd-server-Fix-payload-length-validation-for-Com.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-EAP-pwd-server-Fix-payload-length-validation-for-Com.patch
new file mode 100644
index 0000000..c477c2f
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-EAP-pwd-server-Fix-payload-length-validation-for-Com.patch
@@ -0,0 +1,70 @@
+Upstream-Status: Backport
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+
+From e28a58be26184c2a23f80b410e0997ef1bd5d578 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Fri, 1 May 2015 16:40:44 +0300
+Subject: [PATCH 2/5] EAP-pwd server: Fix payload length validation for Commit
+ and Confirm
+
+The length of the received Commit and Confirm message payloads was not
+checked before reading them. This could result in a buffer read
+overflow when processing an invalid message.
+
+Fix this by verifying that the payload is of expected length before
+processing it. In addition, enforce correct state transition sequence to
+make sure there is no unexpected behavior if receiving a Commit/Confirm
+message before the previous exchanges have been completed.
+
+Thanks to Kostya Kortchinsky of Google security team for discovering and
+reporting this issue.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+---
+ src/eap_server/eap_server_pwd.c | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/src/eap_server/eap_server_pwd.c b/src/eap_server/eap_server_pwd.c
+index 66bd5d2..3189105 100644
+--- a/src/eap_server/eap_server_pwd.c
++++ b/src/eap_server/eap_server_pwd.c
+@@ -656,9 +656,21 @@ eap_pwd_process_commit_resp(struct eap_sm *sm, struct eap_pwd_data *data,
+ 	BIGNUM *x = NULL, *y = NULL, *cofactor = NULL;
+ 	EC_POINT *K = NULL, *point = NULL;
+ 	int res = 0;
++	size_t prime_len, order_len;
+ 
+ 	wpa_printf(MSG_DEBUG, "EAP-pwd: Received commit response");
+ 
++	prime_len = BN_num_bytes(data->grp->prime);
++	order_len = BN_num_bytes(data->grp->order);
++
++	if (payload_len != 2 * prime_len + order_len) {
++		wpa_printf(MSG_INFO,
++			   "EAP-pwd: Unexpected Commit payload length %u (expected %u)",
++			   (unsigned int) payload_len,
++			   (unsigned int) (2 * prime_len + order_len));
++		goto fin;
++	}
++
+ 	if (((data->peer_scalar = BN_new()) == NULL) ||
+ 	    ((data->k = BN_new()) == NULL) ||
+ 	    ((cofactor = BN_new()) == NULL) ||
+@@ -774,6 +786,13 @@ eap_pwd_process_confirm_resp(struct eap_sm *sm, struct eap_pwd_data *data,
+ 	u8 conf[SHA256_MAC_LEN], *cruft = NULL, *ptr;
+ 	int offset;
+ 
++	if (payload_len != SHA256_MAC_LEN) {
++		wpa_printf(MSG_INFO,
++			   "EAP-pwd: Unexpected Confirm payload length %u (expected %u)",
++			   (unsigned int) payload_len, SHA256_MAC_LEN);
++		goto fin;
++	}
++
+ 	/* build up the ciphersuite: group | random_function | prf */
+ 	grp = htons(data->group_num);
+ 	ptr = (u8 *) &cs;
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch
new file mode 100644
index 0000000..e46ce43
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Backport
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+
+From 477c74395acd0123340457ba6f15ab345d42016e Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 2 May 2015 19:23:04 +0300
+Subject: [PATCH 3/5] EAP-pwd peer: Fix Total-Length parsing for fragment
+ reassembly
+
+The remaining number of bytes in the message could be smaller than the
+Total-Length field size, so the length needs to be explicitly checked
+prior to reading the field and decrementing the len variable. This could
+have resulted in the remaining length becoming negative and interpreted
+as a huge positive integer.
+
+In addition, check that there is no already started fragment in progress
+before allocating a new buffer for reassembling fragments. This avoid a
+potential memory leak when processing invalid message.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+---
+ src/eap_peer/eap_pwd.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/eap_peer/eap_pwd.c b/src/eap_peer/eap_pwd.c
+index a629437..1d2079b 100644
+--- a/src/eap_peer/eap_pwd.c
++++ b/src/eap_peer/eap_pwd.c
+@@ -866,11 +866,23 @@ eap_pwd_process(struct eap_sm *sm, void *priv, struct eap_method_ret *ret,
+ 	 * if it's the first fragment there'll be a length field
+ 	 */
+ 	if (EAP_PWD_GET_LENGTH_BIT(lm_exch)) {
++		if (len < 2) {
++			wpa_printf(MSG_DEBUG,
++				   "EAP-pwd: Frame too short to contain Total-Length field");
++			ret->ignore = TRUE;
++			return NULL;
++		}
+ 		tot_len = WPA_GET_BE16(pos);
+ 		wpa_printf(MSG_DEBUG, "EAP-pwd: Incoming fragments whose "
+ 			   "total length = %d", tot_len);
+ 		if (tot_len > 15000)
+ 			return NULL;
++		if (data->inbuf) {
++			wpa_printf(MSG_DEBUG,
++				   "EAP-pwd: Unexpected new fragment start when previous fragment is still in use");
++			ret->ignore = TRUE;
++			return NULL;
++		}
+ 		data->inbuf = wpabuf_alloc(tot_len);
+ 		if (data->inbuf == NULL) {
+ 			wpa_printf(MSG_INFO, "Out of memory to buffer "
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch
new file mode 100644
index 0000000..a4c02b4
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Backport
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+
+From 3035cc2894e08319b905bd6561e8bddc8c2db9fa Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 2 May 2015 19:26:06 +0300
+Subject: [PATCH 4/5] EAP-pwd server: Fix Total-Length parsing for fragment
+ reassembly
+
+The remaining number of bytes in the message could be smaller than the
+Total-Length field size, so the length needs to be explicitly checked
+prior to reading the field and decrementing the len variable. This could
+have resulted in the remaining length becoming negative and interpreted
+as a huge positive integer.
+
+In addition, check that there is no already started fragment in progress
+before allocating a new buffer for reassembling fragments. This avoid a
+potential memory leak when processing invalid message.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+---
+ src/eap_server/eap_server_pwd.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/eap_server/eap_server_pwd.c b/src/eap_server/eap_server_pwd.c
+index 3189105..2bfc3c2 100644
+--- a/src/eap_server/eap_server_pwd.c
++++ b/src/eap_server/eap_server_pwd.c
+@@ -942,11 +942,21 @@ static void eap_pwd_process(struct eap_sm *sm, void *priv,
+ 	 * the first fragment has a total length
+ 	 */
+ 	if (EAP_PWD_GET_LENGTH_BIT(lm_exch)) {
++		if (len < 2) {
++			wpa_printf(MSG_DEBUG,
++				   "EAP-pwd: Frame too short to contain Total-Length field");
++			return;
++		}
+ 		tot_len = WPA_GET_BE16(pos);
+ 		wpa_printf(MSG_DEBUG, "EAP-pwd: Incoming fragments, total "
+ 			   "length = %d", tot_len);
+ 		if (tot_len > 15000)
+ 			return;
++		if (data->inbuf) {
++			wpa_printf(MSG_DEBUG,
++				   "EAP-pwd: Unexpected new fragment start when previous fragment is still in use");
++			return;
++		}
+ 		data->inbuf = wpabuf_alloc(tot_len);
+ 		if (data->inbuf == NULL) {
+ 			wpa_printf(MSG_INFO, "EAP-pwd: Out of memory to "
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch
new file mode 100644
index 0000000..4073600
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Backport
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+
+From 28a069a545b06b99eb55ad53f63f2c99e65a98f6 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 2 May 2015 19:26:28 +0300
+Subject: [PATCH 5/5] EAP-pwd peer: Fix asymmetric fragmentation behavior
+
+The L (Length) and M (More) flags needs to be cleared before deciding
+whether the locally generated response requires fragmentation. This
+fixes an issue where these flags from the server could have been invalid
+for the following message. In some cases, this could have resulted in
+triggering the wpabuf security check that would terminate the process
+due to invalid buffer allocation.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+---
+ src/eap_peer/eap_pwd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/eap_peer/eap_pwd.c b/src/eap_peer/eap_pwd.c
+index 1d2079b..e58b13a 100644
+--- a/src/eap_peer/eap_pwd.c
++++ b/src/eap_peer/eap_pwd.c
+@@ -968,6 +968,7 @@ eap_pwd_process(struct eap_sm *sm, void *priv, struct eap_method_ret *ret,
+ 	/*
+ 	 * we have output! Do we need to fragment it?
+ 	 */
++	lm_exch = EAP_PWD_GET_EXCHANGE(lm_exch);
+ 	len = wpabuf_len(data->outbuf);
+ 	if ((len + EAP_PWD_HDR_SIZE) > data->mtu) {
+ 		resp = eap_msg_alloc(EAP_VENDOR_IETF, EAP_TYPE_PWD, data->mtu,
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
index ebae239..0186c2b 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
@@ -25,6 +25,12 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
            file://0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch \
+           file://0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch \
+           file://0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch \
+           file://0002-EAP-pwd-server-Fix-payload-length-validation-for-Com.patch \
+           file://0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch \
+           file://0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch \
+           file://0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch \
           "
 SRC_URI[md5sum] = "f0037dbe03897dcaf2ad2722e659095d"
 SRC_URI[sha256sum] = "058dc832c096139a059e6df814080f50251a8d313c21b13364c54a1e70109122"
-- 
1.8.4.2

