Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5726AC04E69
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:48 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.7611.1690875703392394475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126613466"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126613466"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:41 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 37C90DB3C3
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:38 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 728BCD5EA3
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7EF9B2FC8177;
	Tue,  1 Aug 2023 16:41:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] curl: upgrade 8.2.0 -> 8.2.1
Date: Tue,  1 Aug 2023 15:41:12 +0800
Message-Id: <1690875687-21573-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10--0.439300-10.000000
X-TMASE-MatchedRID: bwTBD8UNLVWjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytLs3EPhItRHXMW
	fmr8UEU8K6mJ1bFKQYh1cNojtxjF/JGn23PcNkGP7JZ3QlP4MJZITEcvqjcF4P/uIR54p90ylYg
	d7qVekM2qs+ZzDEtspYCcexxuMQBaTLAgHEsJK4HGL//8mlodA7TrV2IG143XpjlkbDvDJ4dNMJ
	gQuMz4JRUp+sGMg9y3gNi1q2JU1rx26Yd9CcRa56qHmm/V4M/PG24YVeuZGmNf/JRqlbLSVyXpM
	aLIcZ1YUiEU3JYRoo4GUU12KG6Vpt7Rfb2Mc0ONEhGH3CRdKUU3l2plwgrtWCD1HdXyqDnEvwUe
	vDt+uW5/XjpbSJS7a53ou/2ojzAfwUGgKARXgvKHZXNSWjgdUxZk8qaH+Gu9gW6bY8SOq3WjxYy
	RBa/qJcFwgTvxipFajoczmuoPCq1Uxdaw10lXS0Dwzgpnt8HV4WvYcgcq1ot08bZ85ID87t4Gln
	Pu43ukAoKlebrgpswRVe67IB0tF2+Gv+Pgd+eyYtv/CSOM06wdJuEZuYbKVcUkrvIudlEZl07dD
	rsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185195

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
   amigaos: fix sys/mbuf.h m_len macro clash
   amissl: add missing signal.h include
   amissl: fix AmiSSL v5 detection
   cfilters: rename close/connect functions to avoid clashes
   ciphers.d: put URL in first column
   cmake: add `libcurlu`/`libcurltool` for unit tests
   cmake: update ngtcp2 detection
   configure: check for nghttp2_session_get_stream_local_window_size
   CONTRIBUTE: drop mention of copyright year ranges
   CONTRIBUTE: fix syntax in commit message description
   curl_multi_wait.3: fix arg quoting to doc macro .BR
   docs: mark two TLS options for TLS, not SSL
   docs: provide more see also for cipher options
   hostip: return IPv6 first for localhost resolves
   http2: fix regression on upload EOF handling
   http: VLH, very large header test and fixes
   libcurl-errors.3: add CURLUE_OK
   os400: correct EXPECTED_STRING_LASTZEROTERMINATED
   quiche: fix lookup of transfer at multi
   quiche: fix segfault and other things
   rustls: update rustls-ffi 0.10.0
   socks: print ipv6 address within brackets
   src/mkhelp: strip off escape sequences
   tool: fix tool_seek_cb build when SIZEOF_CURL_OFF_T > SIZEOF_OFF_T
   transfer: do not clear the credentials on redirect to absolute URL
   unittest: remove unneeded *_LDADD
   websocket: rename arguments/variables to match docs 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/curl/{curl_8.2.0.bb => curl_8.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_8.2.0.bb => curl_8.2.1.bb} (98%)

diff --git a/meta/recipes-support/curl/curl_8.2.0.bb b/meta/recipes-support/curl/curl_8.2.1.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.2.0.bb
rename to meta/recipes-support/curl/curl_8.2.1.bb
index 9c16d3d515..068486a352 100644
--- a/meta/recipes-support/curl/curl_8.2.0.bb
+++ b/meta/recipes-support/curl/curl_8.2.1.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "2859ec79e2cd96e976a99493547359b8001af1d1e21f3a3a3b846544ef54500f"
+SRC_URI[sha256sum] = "dd322f6bd0a20e6cebdfd388f69e98c3d183bed792cf4713c8a7ef498cba4894"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.34.1


