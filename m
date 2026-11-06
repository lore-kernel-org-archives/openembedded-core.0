Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1219.1793949576440671950
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:19:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MqHp1PtJ;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=18339; q=dns/txt;
  s=iport01; t=1793949577; x=1795159177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uLAxnj4Uu1kg9Jv2FS4k3WvjZcsdNzBcCPZMdWnD6pk=;
  b=MqHp1PtJFufIKx7O8cYnj1r/i0Jj8rCkPcAloP2aN6YXA7VyCPVMCBdk
   ghvIQAmwiZg09kzvjXC7C63vehp3QFITe//KBXAey/YCzSgkFE5blZPEs
   A14LVNQTIRv3xWYa4dkcGBJ5j7wO4vFBUpZV8FlWFBu8gdX5czdLinL9q
   uGFHOJ6xNSGOd28DYtvr22ACjGoWvlYrjZL4TeCmSNXD83/bZhKmaiDZG
   polPBYKnBM2JTWh1oWuQAKlNAwlZvDAja+vN4y2suX4UKr3AtBRKB0+pO
   I+KvczBeVuPFJznR3SfKU4wBDeKmbYhpIvvisuDEQJVYEnzUu23y3Ktn8
   Q==;
X-CSE-ConnectionGUID: sRiS9lFMRuC6EYIUPoP28g==
X-CSE-MsgGUID: 1k8vO5CyTHC3ioA2fv6f3Q==
X-IPAS-Result: =?us-ascii?q?A0AnAADtfu1q/4z/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKJWQOBE5A5jFUUgWoPAQEBD0QNBAEBhQUCjh0CJjQJDgECBAMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDA?=
 =?us-ascii?q?QIWGSsjCBAJgwIBgnQDEQa7OBs3gXkzgQGDKQE/AgJAAVDbMwELFAGBOAGFP?=
 =?us-ascii?q?4gjXRgBhH0nGxuBcoEVgnN2gQWBXAIBgRiBBoYHBIIigQyBWh6MegKBUYZ5S?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESgQddgSsoX?=
 =?us-ascii?q?QEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkC?=
 =?us-ascii?q?xoFYQgCDQx0ORAwHiQvBRwmPhsKLxgNSBEsNxUZBD5uB5I9giBgCwUBAQEVS?=
 =?us-ascii?q?xoJCgETFgEBL1YbRRgGBTURkwMQAggTkAOCIZ9TgT4KKIN4jCSVOhozqnELm?=
 =?us-ascii?q?H2OCpVbDgsNAU+EaYFoPIFZcBWDIgkWNBkPi0mCZQsLg2CGQMYFJjICCTIBA?=
 =?us-ascii?q?QcCBw4DC4FokAAsgVIBAQ?=
IronPort-Data: A9a23:tYf/Y6ACz+IRHRVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApG4m02QOz
 TceWWzQMv3cazOkeIggb4ji/UsGvZ6Bm4dhOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2M9vNxAyE6gi580pLFBvy
 MQfEGpdYUXW7w626OrTpuhEnM8vKozveYgYoHwllWqfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY3BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FEtjOOyb4qJJbRmQ+0MnRaGg
 T/t7ljZKUobM/XFxyTb/CmV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KPpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:yVbPYq7BhQYdTp48pQPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AjYEh+mjGIP2bDENI6KxlIBKBSDJuaUfc9ybUDWq?=
 =?us-ascii?q?CFE03ZYy0dGeXwPk0nJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A3L/Nng1j3gFJrhhhIWxpLy0ZhjUjuqf+FmdQuoQ?=
 =?us-ascii?q?6m+LfNCtZYTmD0jrse9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544377847"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:19:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id AA0AD18000597;
	Fri,  6 Nov 2026 07:19:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 0E57ACBEF98; Thu,  5 Nov 2026 23:19:35 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 8/9] curl: fix CVE-2026-107929
Date: Thu,  5 Nov 2026 23:19:31 -0800
Message-Id: <20261106071932.490299-9-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106071932.490299-1-dkelaiya@cisco.com>
References: <20261106071932.490299-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 07:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249606
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Keep the complete CURLOPT_INTERFACE option in the connection and
compare it when choosing a connection to reuse. This includes if!,
host! and ifhost! prefixes, so a transfer cannot silently inherit an
older source binding. Parse that owned option again when binding the
socket and release temporary strings on success and failure.

Adapt the old string helpers, setopt parameters and nested device-bind
check while preserving the complete upstream matching and cleanup.

[1] https://github.com/curl/curl/commit/d37d79df1e01066417aff0a9e6bc675edad3edba
[2] https://curl.se/docs/CVE-2026-107929.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-107929.patch           | 470 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 471 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-107929.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-107929.patch b/meta/recipes-support/curl/curl/CVE-2026-107929.patch
new file mode 100644
index 0000000000..873b03fd5b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-107929.patch
@@ -0,0 +1,470 @@
+From d37d79df1e01066417aff0a9e6bc675edad3edba Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 9 Oct 2026 09:51:12 +0200
+Subject: [PATCH] url: CURLOPT_INTERFACE fix connection reuse match
+
+Remember the full option string at the connection for use in reuse
+matching and cf-socket binding.
+
+Parse the string when set for syntax check, but remember the unparsed
+version and use that in connection matching.
+
+Parse that string again when the socket is set up.
+
+Closes #23326
+
+CVE: CVE-2026-107929
+Upstream-Status: Backport [https://github.com/curl/curl/commit/d37d79df1e01066417aff0a9e6bc675edad3edba]
+
+Backport Changes:
+- Use curl 8.19.0's data->set.str[], Curl_setstropt() and
+  Curl_safefree() instead of the newer string and free helpers.
+- Change the older setstropt_interface() parameters and its caller
+  to pass the easy handle; remove the obsolete output assertions.
+- Keep bindlocal()'s older nested SO_BINDTODEVICE test. Route its
+  success path through cleanup and keep two blank separators around
+  the new option parsing and binding checks.
+- Replace the older braced local-bind comparison and its split
+  comment ending with upstream's new matching expression.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/cf-socket.c | 135 +++++++++++++++++++++++++++++++-----------------
+ lib/setopt.c    |  34 +++---------
+ lib/url.c       |  48 +++++++++--------
+ lib/urldata.h   |   6 +--
+ 4 files changed, 126 insertions(+), 97 deletions(-)
+
+diff --git a/lib/cf-socket.c b/lib/cf-socket.c
+index 2ebbe4d..f3978e2 100644
+--- a/lib/cf-socket.c
++++ b/lib/cf-socket.c
+@@ -464,11 +464,13 @@ int Curl_socket_close(struct Curl_easy *data, struct connectdata *conn,
+  * len    [in]     - length of the input string.
+  * dev    [in/out] - address where a pointer to newly allocated memory
+  *                   holding the interface-or-host will be stored upon
+- *                   completion.
++ *                   completion or NULL if the caller is not interested.
+  * iface  [in/out] - address where a pointer to newly allocated memory
+- *                   holding the interface will be stored upon completion.
++ *                   holding the interface will be stored upon completion
++ *                   or NULL if the caller is not interested.
+  * host   [in/out] - address where a pointer to newly allocated memory
+- *                   holding the host will be stored upon completion.
++ *                   holding the host will be stored upon completion
++ *                   or NULL if the caller is not interested.
+  *
+  * Returns CURLE_OK on success.
+  */
+@@ -480,27 +482,36 @@ CURLcode Curl_parse_interface(const char *input,
+   static const char if_host_prefix[] = "ifhost!";
+   size_t len;
+ 
+-  DEBUGASSERT(dev);
+-  DEBUGASSERT(iface);
+-  DEBUGASSERT(host);
+-
+   len = strlen(input);
+   if(len > 512)
+     return CURLE_BAD_FUNCTION_ARGUMENT;
+ 
++  if(dev)
++    *dev = NULL;
++  if(iface)
++    *iface = NULL;
++  if(host)
++    *host = NULL;
++
+   if(!strncmp(if_prefix, input, strlen(if_prefix))) {
+     input += strlen(if_prefix);
+     if(!*input)
+       return CURLE_BAD_FUNCTION_ARGUMENT;
+-    *iface = curlx_memdup0(input, len - strlen(if_prefix));
+-    return *iface ? CURLE_OK : CURLE_OUT_OF_MEMORY;
++    if(iface) {
++      *iface = curlx_memdup0(input, len - strlen(if_prefix));
++      return *iface ? CURLE_OK : CURLE_OUT_OF_MEMORY;
++    }
++    return CURLE_OK;
+   }
+   else if(!strncmp(host_prefix, input, strlen(host_prefix))) {
+     input += strlen(host_prefix);
+     if(!*input)
+       return CURLE_BAD_FUNCTION_ARGUMENT;
+-    *host = curlx_memdup0(input, len - strlen(host_prefix));
+-    return *host ? CURLE_OK : CURLE_OUT_OF_MEMORY;
++    if(host) {
++      *host = curlx_memdup0(input, len - strlen(host_prefix));
++      return *host ? CURLE_OK : CURLE_OUT_OF_MEMORY;
++    }
++    return CURLE_OK;
+   }
+   else if(!strncmp(if_host_prefix, input, strlen(if_host_prefix))) {
+     const char *host_part;
+@@ -509,23 +520,30 @@ CURLcode Curl_parse_interface(const char *input,
+     host_part = memchr(input, '!', len);
+     if(!host_part || !*(host_part + 1))
+       return CURLE_BAD_FUNCTION_ARGUMENT;
+-    *iface = curlx_memdup0(input, host_part - input);
+-    if(!*iface)
+-      return CURLE_OUT_OF_MEMORY;
++    if(iface) {
++      *iface = curlx_memdup0(input, host_part - input);
++      if(!*iface)
++        return CURLE_OUT_OF_MEMORY;
++    }
+     ++host_part;
+-    *host = curlx_memdup0(host_part, len - (host_part - input));
+-    if(!*host) {
+-      curlx_free(*iface);
+-      *iface = NULL;
+-      return CURLE_OUT_OF_MEMORY;
++    if(host) {
++      *host = curlx_memdup0(host_part, len - (host_part - input));
++      if(!*host) {
++        if(iface)
++          Curl_safefree(*iface);
++        return CURLE_OUT_OF_MEMORY;
++      }
+     }
+     return CURLE_OK;
+   }
+ 
+   if(!*input)
+     return CURLE_BAD_FUNCTION_ARGUMENT;
+-  *dev = curlx_memdup0(input, len);
+-  return *dev ? CURLE_OK : CURLE_OUT_OF_MEMORY;
++  if(dev) {
++    *dev = curlx_memdup0(input, len);
++    return *dev ? CURLE_OK : CURLE_OUT_OF_MEMORY;
++  }
++  return CURLE_OK;
+ }
+ 
+ #ifndef CURL_DISABLE_BINDLOCAL
+@@ -545,27 +563,38 @@ static CURLcode bindlocal(struct Curl_easy *data, struct connectdata *conn,
+                                                 "random" */
+   /* how many port numbers to try to bind to, increasing one at a time */
+   int portnum = data->set.localportrange;
+-  const char *dev = data->set.str[STRING_DEVICE];
+-  const char *iface_input = data->set.str[STRING_INTERFACE];
+-  const char *host_input = data->set.str[STRING_BINDHOST];
+-  const char *iface = iface_input ? iface_input : dev;
+-  const char *host = host_input ? host_input : dev;
++  char *dev_in = NULL, *iface_in = NULL, *host_in = NULL;
++  const char *iface = NULL, *host = NULL;
+   int error;
+ #ifdef IP_BIND_ADDRESS_NO_PORT
+   int on = 1;
+ #endif
++  CURLcode result = CURLE_OK;
++
+ #ifndef USE_IPV6
+   (void)scope;
+ #endif
+ 
+-  /*************************************************************
+-   * Select device to bind socket to
+-   *************************************************************/
++  if(conn->interface_opts) {
++    /*************************************************************
++     * Select device to bind socket to
++     *************************************************************/
++    result = Curl_parse_interface(conn->interface_opts,
++                                  &dev_in, &iface_in, &host_in);
++    if(result)
++      goto out;
++    /* This is how we use the values */
++    iface = iface_in ? iface_in : dev_in;
++    host = host_in ? host_in : dev_in;
++  }
++
+   if(!iface && !host && !port)
+-    /* no local kind of binding was requested */
+-    return CURLE_OK;
+-  else if(iface && (strlen(iface) >= 255))
+-    return CURLE_BAD_FUNCTION_ARGUMENT;
++    goto out;
++
++  if(iface && (strlen(iface) >= 255)) {
++    result = CURLE_BAD_FUNCTION_ARGUMENT;
++    goto out;
++  }
+ 
+   memset(&sa, 0, sizeof(struct Curl_sockaddr_storage));
+ 
+@@ -593,14 +622,15 @@ static CURLcode bindlocal(struct Curl_easy *data, struct connectdata *conn,
+          * succeeds it means the parameter was a valid interface and not an IP
+          * address. Return immediately.
+          */
+-        if(!host_input) {
++        if(!host_in) {
+           infof(data, "socket successfully bound to interface '%s'", iface);
+-          return CURLE_OK;
++          result = CURLE_OK;
++          goto out;
+         }
+       }
+     }
+ #endif
+-    if(!host_input) {
++    if(!host_in) {
+       /* Discover IP from input device, then bind to it */
+       if2ip_result = Curl_if2ip(af,
+ #ifdef USE_IPV6
+@@ -610,18 +640,20 @@ static CURLcode bindlocal(struct Curl_easy *data, struct connectdata *conn,
+     }
+     switch(if2ip_result) {
+     case IF2IP_NOT_FOUND:
+-      if(iface_input && !host_input) {
++      if(iface_in && !host_in) {
+         /* Do not fall back to treating it as a hostname */
+         char buffer[STRERROR_LEN];
+         data->state.os_errno = error = SOCKERRNO;
+         failf(data, "Could not bind to interface '%s' with errno %d: %s",
+               iface, error, curlx_strerror(error, buffer, sizeof(buffer)));
+-        return CURLE_INTERFACE_FAILED;
++        result = CURLE_INTERFACE_FAILED;
++        goto out;
+       }
+       break;
+     case IF2IP_AF_NOT_SUPPORTED:
+       /* Signal the caller to try another address family if available */
+-      return CURLE_UNSUPPORTED_PROTOCOL;
++      result = CURLE_UNSUPPORTED_PROTOCOL;
++      goto out;
+     case IF2IP_FOUND:
+       /*
+        * We now have the numerical IP address in the 'myhost' buffer
+@@ -632,7 +664,7 @@ static CURLcode bindlocal(struct Curl_easy *data, struct connectdata *conn,
+       done = 1;
+       break;
+     }
+-    if(!iface_input || host_input) {
++    if(!iface_in || host_in) {
+       /*
+        * This was not an interface, resolve the name as a hostname
+        * or IP number
+@@ -659,7 +691,8 @@ static CURLcode bindlocal(struct Curl_easy *data, struct connectdata *conn,
+         if(af != h_af) {
+           /* bad IP version combo, signal the caller to try another address
+              family if available */
+-          return CURLE_UNSUPPORTED_PROTOCOL;
++          result = CURLE_UNSUPPORTED_PROTOCOL;
++          goto out;
+         }
+         done = 1;
+       }
+@@ -692,8 +725,10 @@ static CURLcode bindlocal(struct Curl_easy *data, struct connectdata *conn,
+                present, is known to be numeric */
+             curl_off_t scope_id;
+             if(curlx_str_number((const char **)CURL_UNCONST(&scope_ptr),
+-                                &scope_id, UINT_MAX))
+-              return CURLE_UNSUPPORTED_PROTOCOL;
++                                &scope_id, UINT_MAX)) {
++              result = CURLE_UNSUPPORTED_PROTOCOL;
++              goto out;
++            }
+             si6->sin6_scope_id = (unsigned int)scope_id;
+           }
+ #endif
+@@ -720,7 +755,8 @@ static CURLcode bindlocal(struct Curl_easy *data, struct connectdata *conn,
+       data->state.os_errno = error = SOCKERRNO;
+       failf(data, "Could not bind to '%s' with errno %d: %s", host,
+             error, curlx_strerror(error, buffer, sizeof(buffer)));
+-      return CURLE_INTERFACE_FAILED;
++      result = CURLE_INTERFACE_FAILED;
++      goto out;
+     }
+   }
+   else {
+@@ -747,7 +783,8 @@ static CURLcode bindlocal(struct Curl_easy *data, struct connectdata *conn,
+       /* we succeeded to bind */
+       infof(data, "Local port: %hu", port);
+       conn->bits.bound = TRUE;
+-      return CURLE_OK;
++      result = CURLE_OK;
++      goto out;
+     }
+ 
+     if(--portnum > 0) {
+@@ -773,7 +810,13 @@ static CURLcode bindlocal(struct Curl_easy *data, struct connectdata *conn,
+           error, curlx_strerror(error, buffer, sizeof(buffer)));
+   }
+ 
+-  return CURLE_INTERFACE_FAILED;
++  result = CURLE_INTERFACE_FAILED;
++
++out:
++  curlx_free(dev_in);
++  curlx_free(iface_in);
++  curlx_free(host_in);
++  return result;
+ }
+ #endif
+ 
+diff --git a/lib/setopt.c b/lib/setopt.c
+index ae77ae8..4c634a8 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -160,33 +160,18 @@ static CURLcode setstropt_userpwd(const char *option, char **userp,
+   return CURLE_OK;
+ }
+ 
+-static CURLcode setstropt_interface(char *option, char **devp,
+-                                    char **ifacep, char **hostp)
++static CURLcode setstropt_interface(struct Curl_easy *data, char *option)
+ {
+-  char *dev = NULL;
+-  char *iface = NULL;
+-  char *host = NULL;
+-  CURLcode result;
+-
+-  DEBUGASSERT(devp);
+-  DEBUGASSERT(ifacep);
+-  DEBUGASSERT(hostp);
+-
++  if(option && !option[0])
++    option = NULL;
+   if(option) {
+-    /* Parse the interface details if set, otherwise clear them all */
+-    result = Curl_parse_interface(option, &dev, &iface, &host);
++    /* Parse for checking syntax */
++    CURLcode result = Curl_parse_interface(option, NULL, NULL, NULL);
+     if(result)
+       return result;
++    return Curl_setstropt(&data->set.str[STRING_INTERFACE_OPT], option);
+   }
+-  curlx_free(*devp);
+-  *devp = dev;
+-
+-  curlx_free(*ifacep);
+-  *ifacep = iface;
+-
+-  curlx_free(*hostp);
+-  *hostp = host;
+-
++  Curl_safefree(data->set.str[STRING_INTERFACE_OPT]);
+   return CURLE_OK;
+ }
+ 
+@@ -2267,10 +2252,7 @@ static CURLcode setopt_cptr(struct Curl_easy *data, CURLoption option,
+      * Set what interface or address/hostname to bind the socket to when
+      * performing an operation and thus what from-IP your connection will use.
+      */
+-    return setstropt_interface(ptr,
+-                               &s->str[STRING_DEVICE],
+-                               &s->str[STRING_INTERFACE],
+-                               &s->str[STRING_BINDHOST]);
++    return setstropt_interface(data, ptr);
+   case CURLOPT_ISSUERCERT:
+     /*
+      * Set Issuer certificate file
+diff --git a/lib/url.c b/lib/url.c
+index 4a01baf..1b6e9e3 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -550,7 +550,7 @@ void Curl_conn_free(struct Curl_easy *data, struct connectdata *conn)
+   Curl_safefree(conn->host.rawalloc); /* hostname buffer */
+   Curl_safefree(conn->conn_to_host.rawalloc); /* hostname buffer */
+   Curl_safefree(conn->secondaryhostname);
+-  Curl_safefree(conn->localdev);
++  Curl_safefree(conn->interface_opts);
+   Curl_ssl_conn_config_cleanup(conn);
+ 
+ #ifdef USE_UNIX_SOCKETS
+@@ -773,24 +773,29 @@ static bool url_match_connect_config(struct connectdata *conn,
+      m->data->set.ipver != conn->ip_version)
+     return FALSE;
+ 
+-  if(m->needle->localdev || m->needle->localport) {
++  /* When needle has specific local bind settings, those have to match.
++   * If it does not, any other connection might do when it comes to ports. */
++  if(m->needle->localport &&
++     ((conn->localport != m->needle->localport) ||
++      (conn->localportrange != m->needle->localportrange)))
++    return FALSE;
++  /* For interface related bind options, we require a full match
++   * as connection might go totally different ways (VPNs, for example). */
++  if((m->needle->interface_opts != conn->interface_opts) &&
++     (!m->needle->interface_opts || !conn->interface_opts ||
++      strcmp(conn->interface_opts, m->needle->interface_opts)))
++    return FALSE;
++
++  if((m->needle->interface_opts || m->needle->localport) &&
+     /* If we are bound to a specific local end (IP+port), we must not reuse a
+        random other one, although if we did not ask for a particular one we
+-       can reuse one that was bound.
+-
+-       This comparison is a bit rough and too strict. Since the input
+-       parameters can be specified in numerous ways and still end up the same
+-       it would take a lot of processing to make it really accurate. Instead,
+-       this matching will assume that reuses of bound connections will most
+-       likely also reuse the exact same binding parameters and missing out a
+-       few edge cases should not hurt anyone much.
+-    */
+-    if((conn->localport != m->needle->localport) ||
+-       (conn->localportrange != m->needle->localportrange) ||
+-       (m->needle->localdev &&
+-        (!conn->localdev || strcmp(conn->localdev, m->needle->localdev))))
+-      return FALSE;
+-  }
++       can reuse one that was bound. */
++    ((conn->localport != m->needle->localport) ||
++     (conn->localportrange != m->needle->localportrange) ||
++     (m->needle->interface_opts &&
++      (!conn->interface_opts ||
++       strcmp(conn->interface_opts, m->needle->interface_opts)))))
++    return FALSE;
+ 
+   if(m->needle->bits.conn_to_host != conn->bits.conn_to_host)
+     /* do not mix connections that use the "connect to host" feature and
+@@ -1443,9 +1448,10 @@ static struct connectdata *allocate_conn(struct Curl_easy *data)
+   conn->transport_wanted = TRNSPRT_TCP; /* most of them are TCP streams */
+ 
+   /* Store the local bind parameters that will be used for this connection */
+-  if(data->set.str[STRING_DEVICE]) {
+-    conn->localdev = curlx_strdup(data->set.str[STRING_DEVICE]);
+-    if(!conn->localdev)
++  if(data->set.str[STRING_INTERFACE_OPT]) {
++    conn->interface_opts =
++      curlx_strdup(data->set.str[STRING_INTERFACE_OPT]);
++    if(!conn->interface_opts)
+       goto error;
+   }
+ #ifndef CURL_DISABLE_BINDLOCAL
+@@ -1465,7 +1471,7 @@ static struct connectdata *allocate_conn(struct Curl_easy *data)
+   return conn;
+ error:
+ 
+-  curlx_free(conn->localdev);
++  curlx_free(conn->interface_opts);
+   curlx_free(conn);
+   return NULL;
+ }
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 0bc9ade..327c9f4 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -694,7 +694,7 @@ struct connectdata {
+      made and will serve the purpose of being used for comparison reasons so
+      that subsequent bound-requested connections are not accidentally reusing
+      wrong connections. */
+-  char *localdev;
++  char *interface_opts;
+   uint16_t localportrange;
+ #if defined(HAVE_GSSAPI) || defined(USE_WINDOWS_SSPI)
+   int socks5_gssapi_enctype;
+@@ -1167,9 +1167,7 @@ enum dupstring {
+ #endif
+   STRING_CUSTOMREQUEST,   /* HTTP/FTP/RTSP request/method to use */
+   STRING_DEFAULT_PROTOCOL, /* Protocol to use when the URL does not specify */
+-  STRING_DEVICE,          /* local network interface/address to use */
+-  STRING_INTERFACE,       /* local network interface to use */
+-  STRING_BINDHOST,        /* local address to use */
++  STRING_INTERFACE_OPT,   /* CURLOPT_INTERFACE config */
+   STRING_ENCODING,        /* Accept-Encoding string */
+ #ifndef CURL_DISABLE_FTP
+   STRING_FTP_ACCOUNT,     /* ftp account data */
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index a4f7b466c3..026b5a3638 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -70,6 +70,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92392.patch \
            file://CVE-2026-94266_p1.patch \
            file://CVE-2026-94266_p2.patch \
+           file://CVE-2026-107929.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
