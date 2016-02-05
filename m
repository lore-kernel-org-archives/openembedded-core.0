Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id EC92F77371
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 17:07:40 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 71so415097pfv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 09:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=0YyeFZQcG+krDrD8S+kiDE2XoXpvLV4J+yqbx5kWKvw=;
	b=RT8CInGNzXTtQNgEupB5RAhKnU4Xvo7H2rPc7ddPeUaRYXrmnLPsOnsVMwoqmv11p6
	3mIaeUw9ojYX7ONM92BnfhLdCH3xlxg8YDnVEoFC+YplH23k4Awh4oTkce21d2z0vxev
	bfsJKcIlFe1bTTCSNXt9op4Lhgvv//69Tf2Pp36pCenm0y2WWessOqDpYs9PM5bW5UDb
	/Vrz9+y/zdUqnoqeKAgAhRbYnCKoBx53MRz/Yx2ZM10HKN/V311KLu3JHzceVJxZ3Ycb
	r74xTMfeb5Md6gnetuVyLX3Ddjg7DZNUMdVRqzYaIsxfZYF4L1gSyXT6amas7yObYMgJ
	Q9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=0YyeFZQcG+krDrD8S+kiDE2XoXpvLV4J+yqbx5kWKvw=;
	b=UTbUe2BIBI8SPWlsvAlVh79RtjI5ESjU1MytOHIYzJnp/PNklD/5oI3ZPmU05vnpzQ
	Ae5xwIr5/jtoZx+mWu7e/gSj+KDjvEoVXBTIHgCVV0NHLkDnP733047VzYdtxkEeAyyn
	cCKMa3fB8jB8SOWYROuPlOtCrv46oI2rOvPXQFy/P6ZrZKbwG3AezkABr+dxk76ts6fW
	Iz6Q2DV4XUXJrSNBNgbHCWZ5ydXask7UubBN/RQbfcXQ0c8HdU6U3ShnZUVcF44GYO7d
	VlOvhqcihmFgLhiJc+UaEmx0aNqtrO4Guj+oiLKKQhUdaNC+xfx4np1UPqpzRWmXuXK2
	Wz3A==
X-Gm-Message-State: AG10YOSfACOwoLhZNDe1UK73ipbAnFmWLXBDia0MxyqGMYlWkGuj24YPuNs1hAikcvuX0Q==
X-Received: by 10.98.43.73 with SMTP id r70mr21370979pfr.4.1454692061408;
	Fri, 05 Feb 2016 09:07:41 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	tp3sm25783064pac.16.2016.02.05.09.07.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 09:07:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri,  5 Feb 2016 09:07:18 -0800
Message-Id: <887ee7413fa24a37f20942034b17240f817cbd38.1454691935.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454691935.git.akuster@mvista.com>
References: <cover.1454691935.git.akuster@mvista.com>
In-Reply-To: <cover.1454691935.git.akuster@mvista.com>
References: <cover.1454691935.git.akuster@mvista.com>
Subject: [PATCH 4/4] curl: Secuirty fix CVE-2016-0755
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
X-List-Received-Date: Fri, 05 Feb 2016 17:07:41 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-0755 curl: NTLM credentials not-checked for proxy connection re-use

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/curl/curl/CVE-2016-0755.patch | 138 +++++++++++++++++++++
 meta/recipes-support/curl/curl_7.44.0.bb           |   3 +-
 2 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-0755.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-0755.patch b/meta/recipes-support/curl/curl/CVE-2016-0755.patch
new file mode 100644
index 0000000..44b9d9a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-0755.patch
@@ -0,0 +1,138 @@
+From d41dcba4e9b69d6b761e3460cc6ae7e8fd8f621f Mon Sep 17 00:00:00 2001
+From: Isaac Boukris <iboukris@gmail.com>
+Date: Wed, 13 Jan 2016 11:05:51 +0200
+Subject: [PATCH] NTLM: Fix ConnectionExists to compare Proxy credentials
+
+Proxy NTLM authentication should compare credentials when
+re-using a connection similar to host authentication, as it
+authenticate the connection.
+
+Example:
+curl -v -x http://proxy:port http://host/ -U good_user:good_pwd
+  --proxy-ntlm --next -x http://proxy:port http://host/
+    [-U fake_user:fake_pwd --proxy-ntlm]
+
+CVE-2016-0755
+
+Bug: http://curl.haxx.se/docs/adv_20160127A.html
+
+Upstream-Status: Backport
+http://curl.haxx.se/CVE-2016-0755.patch
+
+CVE: CVE-2016-0755
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ lib/url.c | 62 ++++++++++++++++++++++++++++++++++++++++----------------------
+ 1 file changed, 40 insertions(+), 22 deletions(-)
+
+Index: curl-7.44.0/lib/url.c
+===================================================================
+--- curl-7.44.0.orig/lib/url.c
++++ curl-7.44.0/lib/url.c
+@@ -3107,12 +3107,17 @@ ConnectionExists(struct SessionHandle *d
+   struct connectdata *check;
+   struct connectdata *chosen = 0;
+   bool canPipeline = IsPipeliningPossible(data, needle);
++  struct connectbundle *bundle;
++
+ #ifdef USE_NTLM
+-  bool wantNTLMhttp = ((data->state.authhost.want & CURLAUTH_NTLM) ||
+-                       (data->state.authhost.want & CURLAUTH_NTLM_WB)) &&
+-    (needle->handler->protocol & PROTO_FAMILY_HTTP) ? TRUE : FALSE;
++  bool wantNTLMhttp = ((data->state.authhost.want &
++                      (CURLAUTH_NTLM | CURLAUTH_NTLM_WB)) &&
++                      (needle->handler->protocol & PROTO_FAMILY_HTTP));
++  bool wantProxyNTLMhttp = (needle->bits.proxy_user_passwd &&
++                           ((data->state.authproxy.want &
++                           (CURLAUTH_NTLM | CURLAUTH_NTLM_WB)) &&
++                           (needle->handler->protocol & PROTO_FAMILY_HTTP)));
+ #endif
+-  struct connectbundle *bundle;
+ 
+   *force_reuse = FALSE;
+   *waitpipe = FALSE;
+@@ -3152,9 +3157,6 @@ ConnectionExists(struct SessionHandle *d
+     curr = bundle->conn_list->head;
+     while(curr) {
+       bool match = FALSE;
+-#if defined(USE_NTLM)
+-      bool credentialsMatch = FALSE;
+-#endif
+       size_t pipeLen;
+ 
+       /*
+@@ -3262,21 +3264,14 @@ ConnectionExists(struct SessionHandle *d
+           continue;
+       }
+ 
+-      if((!(needle->handler->flags & PROTOPT_CREDSPERREQUEST))
+-#ifdef USE_NTLM
+-         || (wantNTLMhttp || check->ntlm.state != NTLMSTATE_NONE)
+-#endif
+-        ) {
+-        /* This protocol requires credentials per connection or is HTTP+NTLM,
++      if(!(needle->handler->flags & PROTOPT_CREDSPERREQUEST)) {
++        /* This protocol requires credentials per connection,
+            so verify that we're using the same name and password as well */
+         if(!strequal(needle->user, check->user) ||
+            !strequal(needle->passwd, check->passwd)) {
+           /* one of them was different */
+           continue;
+         }
+-#if defined(USE_NTLM)
+-        credentialsMatch = TRUE;
+-#endif
+       }
+ 
+       if(!needle->bits.httpproxy || needle->handler->flags&PROTOPT_SSL ||
+@@ -3335,20 +3330,43 @@ ConnectionExists(struct SessionHandle *d
+            possible. (Especially we must not reuse the same connection if
+            partway through a handshake!) */
+         if(wantNTLMhttp) {
+-          if(credentialsMatch && check->ntlm.state != NTLMSTATE_NONE) {
+-            chosen = check;
++          if(!strequal(needle->user, check->user) ||
++             !strequal(needle->passwd, check->passwd))
++            continue;
++        }
++        else if(check->ntlm.state != NTLMSTATE_NONE) {
++          /* Connection is using NTLM auth but we don't want NTLM */
++          continue;
++        }
++
++        /* Same for Proxy NTLM authentication */
++        if(wantProxyNTLMhttp) {
++          if(!strequal(needle->proxyuser, check->proxyuser) ||
++             !strequal(needle->proxypasswd, check->proxypasswd))
++            continue;
++        }
++        else if(check->proxyntlm.state != NTLMSTATE_NONE) {
++          /* Proxy connection is using NTLM auth but we don't want NTLM */
++          continue;
++        }
+ 
++        if(wantNTLMhttp || wantProxyNTLMhttp) {
++          /* Credentials are already checked, we can use this connection */
++          chosen = check;
++
++          if((wantNTLMhttp &&
++             (check->ntlm.state != NTLMSTATE_NONE)) ||
++              (wantProxyNTLMhttp &&
++               (check->proxyntlm.state != NTLMSTATE_NONE))) {
+             /* We must use this connection, no other */
+             *force_reuse = TRUE;
+             break;
+           }
+-          else if(credentialsMatch)
+-            /* this is a backup choice */
+-            chosen = check;
++
++          /* Continue look up for a better connection */
+           continue;
+         }
+ #endif
+-
+         if(canPipeline) {
+           /* We can pipeline if we want to. Let's continue looking for
+              the optimal connection to use, i.e the shortest pipe that is not
diff --git a/meta/recipes-support/curl/curl_7.44.0.bb b/meta/recipes-support/curl/curl_7.44.0.bb
index 852c4dd..419ed83 100644
--- a/meta/recipes-support/curl/curl_7.44.0.bb
+++ b/meta/recipes-support/curl/curl_7.44.0.bb
@@ -13,7 +13,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 # from mucking around with debug options
 #
 SRC_URI += " file://configure_ac.patch \
-             file://CVE-2016-0754.patch"
+             file://CVE-2016-0754.patch \
+             file://CVE-2016-0755.patch"
 
 SRC_URI[md5sum] = "6b952ca00e5473b16a11f05f06aa8dae"
 SRC_URI[sha256sum] = "1e2541bae6582bb697c0fbae49e1d3e6fad5d05d5aa80dbd6f072e0a44341814"
-- 
2.3.5


