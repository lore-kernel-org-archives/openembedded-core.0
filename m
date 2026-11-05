Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29100.1793863899339740674
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DfvvFejK;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=30082; q=dns/txt;
  s=iport01; t=1793863899; x=1795073499;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=BDe/PT0+Z9kF9VnzgMgSc8ovkHT1DqoL6Guw4Uom0i8=;
  b=DfvvFejKGl7ZSLUG1Si20Zm1ZKOzD5ipvQfT3YlQT+zRaLF8tGx9BmIo
   fhE3QtmBGscH9WzU+eF4u7JfnUNvH21OWH5cXwvNz7XPNgFt1Xv4EZomJ
   G5QB9modIiizYw5LAX6ZQm2yAUImuYbr/CgSP81IXiCZyZCgZ4vosrldA
   thvYD2t4VAFs9PW64/A5dGjim41hoo491p2fq+8SnJwKjXpNpUgrSw03T
   3FOOqGnOomqWLR27wtVZzKegFastLqJiVKGD6DBEexDtohb3VGkDxJkyH
   d8Je/0gAcDBJgCYygt6cIoXPI19pzidBzRjmNn//7pKy9mwBkRHPYg0hc
   A==;
X-CSE-ConnectionGUID: ScEn2t45R2GMGYUf71BxsA==
X-CSE-MsgGUID: D3vCTTnbTNyardrZ4pVUqw==
X-IPAS-Result: =?us-ascii?q?A0ADAABUL+xq/5D/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBTIEwBQEBAQELAYJWdWBDSQOMb4c4gTVsA4tlhWeMVYF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgJPFY05AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAxoNCwEYAT0cAwECLyALIwgZgwIBgjoDNwMRvGWBe?=
 =?us-ascii?q?TOBAYMpAT8CQ1DYTA0Ha4FoAQsUAYE4AYU/gn+FJF0YAUSEOScbgUlEhAh2g?=
 =?us-ascii?q?QVLAU4YKgKBSIZeBIMcEoFajRgCgVKGcUiBHgNZLAFVEw0KCwcFgWgDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJ?=
 =?us-ascii?q?UMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKG?=
 =?us-ascii?q?BgNSBEsNxUZBD5uB5IvgwoFAnsTASoBVEQDShgIJ5M3AZI+oCBxhCqMJI8+h?=
 =?us-ascii?q?XwaM4VbpRYLmH2JAYI2glOECoFMglaNPQsNGTeEaYFoPIFZMxoIGxWDIglKG?=
 =?us-ascii?q?Q+OLwoLg2CCNoJdUchxJjICCQMvAQEHAgcOAwuBaIRjix8tgU8BAQ?=
IronPort-Data: A9a23:JBArwqtwtz4OY5kXHFzRYZjiGefnVAFfMUV32f8akzHdYApBsoF/q
 tZmKWuAMvuMMTH1L950a9+xpxgE6pWHyt9nGVRkrnwyRHlAgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Es11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwwe1aBztSq
 aEich8oQSG+ib3v6qKgY7w57igjBJGD0II3oHpsy3TdSP0hW52GG/qM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtLYH49tL/Aan3XYiBCoV6YjaE2+GPUigd21dABNfKIJoDRHJsNxB/wS
 mTu0z/nKS0mMtaj7yuM6H62tLPXox7iR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:zNES8a7KM5xkEjrDNQPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:IA2kKG/mb8HT4rFfyv+Vv3UfN8Z/biGA9i3/BmCJNGg2EZeFUnbFrQ==
X-Talos-MUID: 9a23:Vq8FsQYjmYxvF+BTm2Tyrw1eMs1UxbWnEkwXo8kehfSdKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544316021"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:31:38 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 22A36180003C5
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 07:31:38 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id BCE1DCBF201; Wed,  4 Nov 2026 23:31:37 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 2/3] python3-urllib3: Fix CVE-2026-97687
Date: Wed,  4 Nov 2026 23:31:36 -0800
Message-Id: <20261105073137.381446-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105073137.381446-1-yurade@cisco.com>
References: <20261105073137.381446-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 07:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249451
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [3],
using the commit shown in [1] and [2].

[1] https://github.com/urllib3/urllib3/commit/b6447295fff7b38fdffc67e0df9712d60cef3cc3
[2] https://github.com/urllib3/urllib3/commit/07408cec79d1856d81bb42c74a904a24fdb9e465
[3] https://security-tracker.debian.org/tracker/CVE-2026-97687

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python3-urllib3/CVE-2026-97687_p1.patch   | 277 +++++++++++
 .../python3-urllib3/CVE-2026-97687_p2.patch   | 450 ++++++++++++++++++
 .../python/python3-urllib3_2.6.3.bb           |   2 +
 3 files changed, 729 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p2.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p1.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p1.patch
new file mode 100644
index 0000000000..5bd1b8f2d7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p1.patch
@@ -0,0 +1,277 @@
+From b6447295fff7b38fdffc67e0df9712d60cef3cc3 Mon Sep 17 00:00:00 2001
+From: Dustin Hoeppner <dhoepp@me.com>
+Date: Fri, 12 Jun 2026 08:27:08 -0500
+Subject: [PATCH] Fix `proxy_ssl_context` ignored for HTTPS forwarding proxies
+ (#3786)
+
+Co-authored-by: Illia Volochii <illia.volochii@gmail.com>
+
+CVE: CVE-2026-97687
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/b6447295fff7b38fdffc67e0df9712d60cef3cc3]
+
+Backport Changes:
+- Omitted changelog/2577.bugfix.rst because the OE recipe backport applies
+  the runtime fix and tests; the package does not ship it.
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/urllib3/connection.py                       |  16 ++
+ src/urllib3/poolmanager.py                      |  15 ++
+ test/with_dummyserver/test_proxy_poolmanager.py | 149 +++++++++++++++++++++--
+ 3 files changed, 163 insertions(+), 17 deletions(-)
+
+diff --git a/src/urllib3/connection.py b/src/urllib3/connection.py
+index 84e1dab945..49d1c11ea7 100644
+--- a/src/urllib3/connection.py
++++ b/src/urllib3/connection.py
+@@ -793,6 +793,20 @@ def connect(self) -> None:
+             # Remove trailing '.' from fqdn hostnames to allow certificate validation
+             server_hostname_rm_dot = server_hostname.rstrip(".")
+ 
++            # Forwarding proxies should use proxy SSL context for
++            # wrapping since that's the connection being established,
++            # whereas tunneling proxies should use the connection's SSL
++            # context.
++            # However, for backwards compatibility reasons, if the proxy
++            # is forwarding but no proxy SSL context is provided, we
++            # fall back to using the connection's SSL context until
++            # urllib3 v3.0. Appropriate warning is emitted in
++            # ``ProxyManager.__init__``.
++            if self.proxy_is_forwarding and self.proxy_config is not None:
++                ssl_context = self.proxy_config.ssl_context
++            else:
++                ssl_context = self.ssl_context
++
+             sock_and_verified = _ssl_wrap_socket_and_match_hostname(
+                 sock=sock,
+                 cert_reqs=self.cert_reqs,
+@@ -806,7 +820,7 @@ def connect(self) -> None:
+                 key_file=self.key_file,
+                 key_password=self.key_password,
+                 server_hostname=server_hostname_rm_dot,
+-                ssl_context=self.ssl_context,
++                ssl_context=ssl_context,
+                 tls_in_tls=tls_in_tls,
+                 assert_hostname=self.assert_hostname,
+                 assert_fingerprint=self.assert_fingerprint,
+
+diff --git a/src/urllib3/poolmanager.py b/src/urllib3/poolmanager.py
+index 3914dec268..b7248d210d 100644
+--- a/src/urllib3/poolmanager.py
++++ b/src/urllib3/poolmanager.py
+@@ -581,6 +581,21 @@ def __init__(
+         if proxy.scheme not in ("http", "https"):
+             raise ProxySchemeUnknown(proxy.scheme)
+ 
++        if (
++            use_forwarding_for_https
++            and proxy.scheme == "https"
++            and connection_pool_kw.get("ssl_context") is not None
++        ):
++            warnings.warn(
++                "Passing ssl_context when use_forwarding_for_https=True is deprecated "
++                "and will raise an error in urllib3 v3.0. "
++                "Use proxy_ssl_context to configure the TLS connection to the proxy.",
++                FutureWarning,
++                stacklevel=2,
++            )
++            if proxy_ssl_context is None:
++                proxy_ssl_context = connection_pool_kw.get("ssl_context")
++
+         if not proxy.port:
+             port = port_by_scheme.get(proxy.scheme, 80)
+             proxy = proxy._replace(port=port)
+
+diff --git a/test/with_dummyserver/test_proxy_poolmanager.py b/test/with_dummyserver/test_proxy_poolmanager.py
+index 6921bc6d22..48f9704b9a 100644
+--- a/test/with_dummyserver/test_proxy_poolmanager.py
++++ b/test/with_dummyserver/test_proxy_poolmanager.py
+@@ -10,6 +10,7 @@
+ import socket
+ import ssl
+ import tempfile
++import typing
+ from test import LONG_TIMEOUT, SHORT_TIMEOUT, resolvesLocalhostFQDN, withPyOpenSSL
+ from test.conftest import ServerConfig
+ 
+@@ -24,7 +25,7 @@
+ )
+ from urllib3 import HTTPResponse
+ from urllib3._collections import HTTPHeaderDict
+-from urllib3.connection import VerifiedHTTPSConnection
++from urllib3.connection import HTTPSConnection, VerifiedHTTPSConnection
+ from urllib3.connectionpool import connection_from_url
+ from urllib3.exceptions import (
+     ConnectTimeoutError,
+@@ -166,6 +167,43 @@ def test_https_proxy_forwarding_for_https(self) -> None:
+             r = https.request("GET", f"{self.https_url}/")
+             assert r.status == 200
+ 
++    @requires_network()
++    @pytest.mark.parametrize(
++        "proxy_ssl_context_kw",
++        [
++            ("ssl_context",),
++            ("proxy_ssl_context",),
++            ("ssl_context", "proxy_ssl_context"),
++        ],
++    )
++    def test_https_proxy_forwarding_for_https_with_custom_context(
++        self, proxy_ssl_context_kw: tuple[str, ...]
++    ) -> None:
++        """
++        Test that an HTTP request succeeds when using a forwarding HTTPS
++        proxy with an SSL context provided via either
++        ``proxy_ssl_context``, ``ssl_context`` (fallback), or both.
++        """
++
++        proxy_ctx = ssl.create_default_context()
++        proxy_ctx.load_verify_locations(DEFAULT_CA)
++
++        warning_checker: contextlib.AbstractContextManager[typing.Any]
++        if "ssl_context" in proxy_ssl_context_kw:
++            warning_checker = pytest.warns(FutureWarning, match="ssl_context")
++        else:
++            warning_checker = contextlib.nullcontext()
++        with warning_checker:
++            proxy = proxy_from_url(
++                self.https_proxy_url,
++                **{kw: proxy_ctx for kw in proxy_ssl_context_kw},
++                use_forwarding_for_https=True,
++            )
++
++        with proxy:
++            resp = proxy.request("GET", self.https_url)
++            assert resp.status == 200
++
+     def test_nagle_proxy(self) -> None:
+         """Test that proxy connections do not have TCP_NODELAY turned on"""
+         with ProxyManager(self.proxy_url) as http:
+@@ -694,20 +732,8 @@ def test_https_proxy_tls_error(
+             assert isinstance(e.value.reason.original_error, SSLError)
+ 
+     @requires_network()
+-    @pytest.mark.parametrize(
+-        ["proxy_scheme", "use_forwarding_for_https"],
+-        [
+-            ("http", False),
+-            ("https", False),
+-            ("https", True),
+-        ],
+-    )
+-    def test_proxy_https_target_tls_error(
+-        self, proxy_scheme: str, use_forwarding_for_https: str
+-    ) -> None:
+-        if proxy_scheme == "https" and use_forwarding_for_https:
+-            pytest.skip("Test is expected to fail due to urllib3/urllib3#2577")
+-
++    @pytest.mark.parametrize("proxy_scheme", ["http", "https"])
++    def test_proxy_https_target_tls_error(self, proxy_scheme: str) -> None:
+         proxy_url = self.https_proxy_url if proxy_scheme == "https" else self.proxy_url
+         proxy_ctx = ssl.create_default_context()
+         proxy_ctx.load_verify_locations(DEFAULT_CA)
+@@ -717,12 +743,103 @@ def test_proxy_https_target_tls_error(
+             proxy_url,
+             proxy_ssl_context=proxy_ctx,
+             ssl_context=ctx,
+-            use_forwarding_for_https=use_forwarding_for_https,
+         ) as proxy:
+             with pytest.raises(MaxRetryError) as e:
+                 proxy.request("GET", self.https_url)
+             assert isinstance(e.value.reason, SSLError)
+ 
++    @requires_network()
++    def test_forwarding_proxy_tls_error_with_fallback(self) -> None:
++        """
++        Test that when only ``ssl_context`` is passed to a forwarding
++        HTTPS proxy, a ``FutureWarning`` is emitted and if the TLS
++        handshake with the proxy fails using that context, the error is
++        a ``ProxyError`` wrapping the original TLS error.
++        """
++        ctx = ssl.create_default_context()
++
++        with pytest.warns(FutureWarning, match="ssl_context"):
++            proxy = proxy_from_url(
++                self.https_proxy_url,
++                ssl_context=ctx,
++                use_forwarding_for_https=True,
++            )
++
++        with proxy:
++            with pytest.raises(MaxRetryError) as e:
++                proxy.request("GET", self.https_url)
++            assert isinstance(e.value.reason, ProxyError)
++            assert isinstance(e.value.reason.original_error, SSLError)
++
++    @requires_network()
++    def test_forwarding_proxy_ssl_context_precedence(self) -> None:
++        """
++        Test that when both ``ssl_context`` and ``proxy_ssl_context``
++        are passed to a forwarding HTTPS proxy, ``proxy_ssl_context`` is
++        used for the proxy connection and ``ssl_context`` is ignored
++        (with a warning).
++        """
++        ssl_context = ssl.create_default_context(cafile=DEFAULT_CA)
++        proxy_ssl_context = ssl.create_default_context(cafile=DEFAULT_CA)
++
++        with pytest.warns(FutureWarning, match="ssl_context"):
++            proxy = proxy_from_url(
++                self.https_proxy_url,
++                proxy_ssl_context=proxy_ssl_context,
++                ssl_context=ssl_context,
++                use_forwarding_for_https=True,
++            )
++
++        with proxy:
++            pool = proxy.connection_from_url(self.https_url)
++            with contextlib.closing(pool._new_conn()) as conn:
++                conn = typing.cast(HTTPSConnection, conn)
++                conn.connect()
++                assert isinstance(conn.sock, ssl.SSLSocket)
++                assert conn.sock.context is proxy_ssl_context
++
++    @requires_network()
++    def test_forwarding_proxy_ssl_context_fallback(self) -> None:
++        """
++        Test that when only ``ssl_context`` is passed to a forwarding
++        HTTPS proxy, a ``FutureWarning`` is emitted and ``ssl_context``
++        is used as the proxy TLS context (fallback).
++        """
++        ssl_context = ssl.create_default_context(cafile=DEFAULT_CA)
++
++        with pytest.warns(FutureWarning, match="ssl_context"):
++            proxy = proxy_from_url(
++                self.https_proxy_url,
++                ssl_context=ssl_context,
++                use_forwarding_for_https=True,
++            )
++
++        with proxy:
++            pool = proxy.connection_from_url(self.https_url)
++            with contextlib.closing(pool._new_conn()) as conn:
++                conn = typing.cast(HTTPSConnection, conn)
++                conn.connect()
++                assert isinstance(conn.sock, ssl.SSLSocket)
++                assert conn.sock.context is ssl_context
++
++    @requires_network()
++    def test_forwarding_non_https_proxy_ssl_context_fallback(self) -> None:
++        """
++        Test that when only ``ssl_context`` is passed to a forwarding
++        non-HTTPS proxy, no warning or error is emitted.
++        """
++        ssl_context = ssl.create_default_context(cafile=DEFAULT_CA)
++        # No warning/error should be emitted even when ``ssl_context``
++        # is provided to a non-HTTPS proxy for some reason.
++        proxy = proxy_from_url(
++            self.proxy_url,
++            ssl_context=ssl_context,
++            use_forwarding_for_https=True,
++        )
++        with proxy:
++            resp = proxy.request("GET", self.https_url)
++            assert resp.status == 200
++
+     def test_scheme_host_case_insensitive(self) -> None:
+         """Assert that upper-case schemes and hosts are normalized."""
+         with proxy_from_url(self.proxy_url.upper(), ca_certs=DEFAULT_CA) as http:
diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p2.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p2.patch
new file mode 100644
index 0000000000..8c2b26e89e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p2.patch
@@ -0,0 +1,450 @@
+From 07408cec79d1856d81bb42c74a904a24fdb9e465 Mon Sep 17 00:00:00 2001
+From: Andrey Petrov <andrey.petrov@shazow.net>
+Date: Wed, 29 Jul 2026 18:20:36 -0400
+Subject: [PATCH] Isolate HTTPS proxy TLS settings from target TLS (#5093)
+
+CVE: CVE-2026-97687
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/07408cec79d1856d81bb42c74a904a24fdb9e465]
+
+Backport Changes:
+- Omitted changelog/5093.bugfix.rst because the OE recipe backport applies
+  the runtime fix and tests; the package does not ship it.
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/urllib3/connection.py                       |  93 +++++++++-----
+ src/urllib3/poolmanager.py                      |   8 +
+ test/with_dummyserver/test_proxy_poolmanager.py | 150 ++++++++++++++++++++++-
+ 3 files changed, 205 insertions(+), 46 deletions(-)
+
+diff --git a/src/urllib3/connection.py b/src/urllib3/connection.py
+index 8a89488d7c..443cb01be1 100644
+--- a/src/urllib3/connection.py
++++ b/src/urllib3/connection.py
+@@ -838,30 +838,30 @@ def connect(self) -> None:
+             # fall back to using the connection's SSL context until
+             # urllib3 v3.0. Appropriate warning is emitted in
+             # ``ProxyManager.__init__``.
++            wrapped_socket: ssl.SSLSocket | SSLTransport
+             if self.proxy_is_forwarding and self.proxy_config is not None:
+-                ssl_context = self.proxy_config.ssl_context
++                wrapped_socket = self._connect_tls_proxy(self.host, sock)
++                is_verified = self.proxy_is_verified is True
+             else:
+-                ssl_context = self.ssl_context
+-
+-            sock_and_verified = _ssl_wrap_socket_and_match_hostname(
+-                sock=sock,
+-                cert_reqs=self.cert_reqs,
+-                ssl_version=self.ssl_version,
+-                ssl_minimum_version=self.ssl_minimum_version,
+-                ssl_maximum_version=self.ssl_maximum_version,
+-                ca_certs=self.ca_certs,
+-                ca_cert_dir=self.ca_cert_dir,
+-                ca_cert_data=self.ca_cert_data,
+-                cert_file=self.cert_file,
+-                key_file=self.key_file,
+-                key_password=self.key_password,
+-                server_hostname=server_hostname_rm_dot,
+-                ssl_context=ssl_context,
+-                tls_in_tls=tls_in_tls,
+-                assert_hostname=self.assert_hostname,
+-                assert_fingerprint=self.assert_fingerprint,
+-            )
+-            self.sock = sock_and_verified.socket
++                wrapped_socket, is_verified = _ssl_wrap_socket_and_match_hostname(
++                    sock=sock,
++                    cert_reqs=self.cert_reqs,
++                    ssl_version=self.ssl_version,
++                    ssl_minimum_version=self.ssl_minimum_version,
++                    ssl_maximum_version=self.ssl_maximum_version,
++                    ca_certs=self.ca_certs,
++                    ca_cert_dir=self.ca_cert_dir,
++                    ca_cert_data=self.ca_cert_data,
++                    cert_file=self.cert_file,
++                    key_file=self.key_file,
++                    key_password=self.key_password,
++                    server_hostname=server_hostname_rm_dot,
++                    ssl_context=self.ssl_context,
++                    tls_in_tls=tls_in_tls,
++                    assert_hostname=self.assert_hostname,
++                    assert_fingerprint=self.assert_fingerprint,
++                )
++            self.sock = wrapped_socket
+ 
+         # If an error occurs during connection/handshake we may need to release
+         # our lock so another connection can probe the origin.
+@@ -882,7 +882,7 @@ def connect(self) -> None:
+         # If this connection doesn't know if the origin supports HTTP/2
+         # we report back to the HTTP/2 probe our result.
+         if target_supports_http2 is None:
+-            supports_http2 = sock_and_verified.socket.selected_alpn_protocol() == "h2"
++            supports_http2 = wrapped_socket.selected_alpn_protocol() == "h2"
+             http2_probe.set_and_release(
+                 host=probe_http2_host,
+                 port=probe_http2_port,
+@@ -896,7 +896,7 @@ def connect(self) -> None:
+         if self.proxy_is_forwarding:
+             self.is_verified = False
+         else:
+-            self.is_verified = sock_and_verified.is_verified
++            self.is_verified = is_verified
+ 
+         # If there's a proxy to be connected to we are fully connected.
+         # This is set twice (once above and here) due to forwarding proxies
+@@ -906,24 +906,47 @@ def connect(self) -> None:
+         # Set `self.proxy_is_verified` unless it's already set while
+         # establishing a tunnel.
+         if self._has_connected_to_proxy and self.proxy_is_verified is None:
+-            self.proxy_is_verified = sock_and_verified.is_verified
++            self.proxy_is_verified = is_verified
+ 
+     def _connect_tls_proxy(self, hostname: str, sock: socket.socket) -> ssl.SSLSocket:
+         """
+-        Establish a TLS connection to the proxy using the provided SSL context.
++        Establish a TLS connection to the proxy using proxy-specific policy.
+         """
+-        # `_connect_tls_proxy` is called when self._tunnel_host is truthy.
+         proxy_config = typing.cast(ProxyConfig, self.proxy_config)
+-        ssl_context = proxy_config.ssl_context
++        proxy_ssl_context = proxy_config.ssl_context
++
++        ssl_context: ssl.SSLContext | None
++        cert_reqs: int | str | None
++        if proxy_ssl_context is not None:
++            # Prefer the proxy's cert policy for the proxy connection
++            ssl_context = proxy_ssl_context
++            cert_reqs = proxy_ssl_context.verify_mode
++            ca_certs = None
++            ca_cert_dir = None
++            ca_cert_data = None
++            ssl_version = None
++            ssl_minimum_version = None
++            ssl_maximum_version = None
++        else:
++            # Otherwise we inherit the pool's cert policies
++            ssl_context = self.ssl_context if self.proxy_is_forwarding else None
++            cert_reqs = self.cert_reqs
++            ca_certs = self.ca_certs
++            ca_cert_dir = self.ca_cert_dir
++            ca_cert_data = self.ca_cert_data
++            ssl_version = self.ssl_version
++            ssl_minimum_version = self.ssl_minimum_version
++            ssl_maximum_version = self.ssl_maximum_version
++
+         sock_and_verified = _ssl_wrap_socket_and_match_hostname(
+             sock,
+-            cert_reqs=self.cert_reqs,
+-            ssl_version=self.ssl_version,
+-            ssl_minimum_version=self.ssl_minimum_version,
+-            ssl_maximum_version=self.ssl_maximum_version,
+-            ca_certs=self.ca_certs,
+-            ca_cert_dir=self.ca_cert_dir,
+-            ca_cert_data=self.ca_cert_data,
++            cert_reqs=cert_reqs,
++            ssl_version=ssl_version,
++            ssl_minimum_version=ssl_minimum_version,
++            ssl_maximum_version=ssl_maximum_version,
++            ca_certs=ca_certs,
++            ca_cert_dir=ca_cert_dir,
++            ca_cert_data=ca_cert_data,
+             server_hostname=hostname,
+             ssl_context=ssl_context,
+             assert_hostname=proxy_config.assert_hostname,
+
+diff --git a/src/urllib3/poolmanager.py b/src/urllib3/poolmanager.py
+index c10e5d53cf..c1eb131290 100644
+--- a/src/urllib3/poolmanager.py
++++ b/src/urllib3/poolmanager.py
+@@ -583,6 +583,9 @@ def __init__(
+         if proxy.scheme not in ("http", "https"):
+             raise ProxySchemeUnknown(proxy.scheme)
+ 
++        # Keep the deprecated ssl_context fallback on the manager for
++        # compatibility, while passing only explicit proxy policy to connections.
++        self.proxy_ssl_context = proxy_ssl_context
+         if (
+             use_forwarding_for_https
+             and proxy.scheme == "https"
+@@ -595,8 +598,8 @@ def __init__(
+                 FutureWarning,
+                 stacklevel=2,
+             )
+-            if proxy_ssl_context is None:
+-                proxy_ssl_context = connection_pool_kw.get("ssl_context")
++            if self.proxy_ssl_context is None:
++                self.proxy_ssl_context = connection_pool_kw.get("ssl_context")
+ 
+         if not proxy.port:
+             port = port_by_scheme.get(proxy.scheme, 80)
+@@ -604,7 +607,6 @@ def __init__(
+ 
+         self.proxy = proxy
+         self.proxy_headers = proxy_headers or {}
+-        self.proxy_ssl_context = proxy_ssl_context
+         self.proxy_config = ProxyConfig(
+             proxy_ssl_context,
+             use_forwarding_for_https,
+
+diff --git a/test/with_dummyserver/test_proxy_poolmanager.py b/test/with_dummyserver/test_proxy_poolmanager.py
+index 48f9704b9a..0991f93a19 100644
+--- a/test/with_dummyserver/test_proxy_poolmanager.py
++++ b/test/with_dummyserver/test_proxy_poolmanager.py
+@@ -114,6 +114,13 @@ def test_is_verified_https_proxy_to_http_target(self) -> None:
+             assert r.status == 200
+             assert_is_verified(https, proxy=True, target=False)
+ 
++    def test_is_verified_https_proxy_to_http_target_without_proxy_config(self) -> None:
++        with proxy_from_url(self.https_proxy_url, ca_certs=DEFAULT_CA) as https:
++            https.connection_pool_kw["_proxy_config"] = None
++            r = https.request("GET", f"{self.http_url}/")
++            assert r.status == 200
++            assert_is_verified(https, proxy=True, target=False)
++
+     def test_is_verified_https_proxy_to_https_target(self) -> None:
+         with proxy_from_url(self.https_proxy_url, ca_certs=DEFAULT_CA) as https:
+             r = https.request("GET", f"{self.https_url}/")
+@@ -144,6 +151,18 @@ def test_https_proxy_with_proxy_ssl_context(self) -> None:
+             r = https.request("GET", f"{self.http_url}/")
+             assert r.status == 200
+ 
++    @withPyOpenSSL
++    def test_https_proxy_with_proxy_ssl_context_pyopenssl(self) -> None:
++        proxy_ssl_context = create_urllib3_context()
++        proxy_ssl_context.load_verify_locations(DEFAULT_CA)
++
++        with proxy_from_url(
++            self.https_proxy_url,
++            proxy_ssl_context=proxy_ssl_context,
++        ) as https:
++            response = https.request("GET", f"{self.http_url}/")
++            assert response.status == 200
++
+     @withPyOpenSSL
+     def test_https_proxy_pyopenssl_not_supported(self) -> None:
+         with proxy_from_url(self.https_proxy_url, ca_certs=DEFAULT_CA) as https:
+@@ -779,8 +798,8 @@ def test_forwarding_proxy_ssl_context_precedence(self) -> None:
+         used for the proxy connection and ``ssl_context`` is ignored
+         (with a warning).
+         """
+-        ssl_context = ssl.create_default_context(cafile=DEFAULT_CA)
+-        proxy_ssl_context = ssl.create_default_context(cafile=DEFAULT_CA)
++        ssl_context = create_urllib3_context(cert_reqs=ssl.CERT_REQUIRED)
++        proxy_ssl_context = create_urllib3_context(cert_reqs=ssl.CERT_NONE)
+ 
+         with pytest.warns(FutureWarning, match="ssl_context"):
+             proxy = proxy_from_url(
+@@ -797,6 +816,7 @@ def test_forwarding_proxy_ssl_context_precedence(self) -> None:
+                 conn.connect()
+                 assert isinstance(conn.sock, ssl.SSLSocket)
+                 assert conn.sock.context is proxy_ssl_context
++                assert proxy_ssl_context.verify_mode == ssl.CERT_NONE
+ 
+     @requires_network()
+     def test_forwarding_proxy_ssl_context_fallback(self) -> None:
+@@ -805,15 +825,21 @@ def test_forwarding_proxy_ssl_context_fallback(self) -> None:
+         HTTPS proxy, a ``FutureWarning`` is emitted and ``ssl_context``
+         is used as the proxy TLS context (fallback).
+         """
+-        ssl_context = ssl.create_default_context(cafile=DEFAULT_CA)
++        ssl_context = create_urllib3_context(cert_reqs=ssl.CERT_NONE)
+ 
+         with pytest.warns(FutureWarning, match="ssl_context"):
+             proxy = proxy_from_url(
+                 self.https_proxy_url,
+                 ssl_context=ssl_context,
++                cert_reqs=ssl.CERT_REQUIRED,
++                ca_certs=DEFAULT_CA,
+                 use_forwarding_for_https=True,
+             )
+ 
++        assert proxy.proxy_ssl_context is ssl_context
++        assert proxy.proxy_config is not None
++        assert proxy.proxy_config.ssl_context is None
++
+         with proxy:
+             pool = proxy.connection_from_url(self.https_url)
+             with contextlib.closing(pool._new_conn()) as conn:
+@@ -821,6 +847,23 @@ def test_forwarding_proxy_ssl_context_fallback(self) -> None:
+                 conn.connect()
+                 assert isinstance(conn.sock, ssl.SSLSocket)
+                 assert conn.sock.context is ssl_context
++                assert ssl_context.verify_mode == ssl.CERT_REQUIRED
++
++    @requires_network()
++    def test_https_proxy_to_http_target_ssl_context_fallback(self) -> None:
++        ssl_context = create_urllib3_context()
++        ssl_context.load_verify_locations(DEFAULT_CA)
++
++        with proxy_from_url(
++            self.https_proxy_url,
++            ssl_context=ssl_context,
++        ) as proxy:
++            pool = proxy.connection_from_url(self.http_url)
++            with contextlib.closing(pool._new_conn()) as conn:
++                conn = typing.cast(HTTPSConnection, conn)
++                conn.connect()
++                assert isinstance(conn.sock, ssl.SSLSocket)
++                assert conn.sock.context is ssl_context
+ 
+     @requires_network()
+     def test_forwarding_non_https_proxy_ssl_context_fallback(self) -> None:
+@@ -921,32 +964,38 @@ def test_https_proxy_assert_fingerprint_md5(
+         destination_url = f"https://{server.host}:{server.port}"
+ 
+         proxy_ctx = urllib3.util.ssl_.create_urllib3_context(verify_flags=0)
++        proxy_ctx.load_verify_locations(proxy.ca_certs)
+         proxy_fingerprint = self._get_proxy_fingerprint_md5(proxy.ca_certs)
+         with proxy_from_url(
+             proxy_url,
+-            ca_certs=proxy.ca_certs,
++            ca_certs=server.ca_certs,
+             proxy_ssl_context=proxy_ctx,
+             proxy_assert_fingerprint=proxy_fingerprint,
+         ) as https:
+             https.request("GET", destination_url)
+ 
++    @pytest.mark.parametrize("use_forwarding_for_https", [False, True])
+     def test_https_proxy_assert_fingerprint_md5_non_matching(
+-        self, no_san_proxy_with_server: tuple[ServerConfig, ServerConfig]
++        self,
++        no_san_proxy_with_server: tuple[ServerConfig, ServerConfig],
++        use_forwarding_for_https: bool,
+     ) -> None:
+         proxy, server = no_san_proxy_with_server
+         proxy_url = f"https://{proxy.host}:{proxy.port}"
+         destination_url = f"https://{server.host}:{server.port}"
+ 
+         proxy_ctx = urllib3.util.ssl_.create_urllib3_context(verify_flags=0)
++        proxy_ctx.load_verify_locations(proxy.ca_certs)
+         proxy_fingerprint = self._get_proxy_fingerprint_md5(proxy.ca_certs)
+         new_char = "b" if proxy_fingerprint[5] == "a" else "a"
+         proxy_fingerprint = proxy_fingerprint[:5] + new_char + proxy_fingerprint[6:]
+ 
+         with proxy_from_url(
+             proxy_url,
+-            ca_certs=proxy.ca_certs,
++            ca_certs=server.ca_certs,
+             proxy_ssl_context=proxy_ctx,
+             proxy_assert_fingerprint=proxy_fingerprint,
++            use_forwarding_for_https=use_forwarding_for_https,
+         ) as https:
+             with pytest.raises(MaxRetryError) as e:
+                 https.request("GET", destination_url)
+@@ -964,8 +1013,11 @@ def test_https_proxy_assert_hostname(
+         ) as https:
+             https.request("GET", destination_url)
+ 
++    @pytest.mark.parametrize("use_forwarding_for_https", [False, True])
+     def test_https_proxy_assert_hostname_non_matching(
+-        self, san_proxy_with_server: tuple[ServerConfig, ServerConfig]
++        self,
++        san_proxy_with_server: tuple[ServerConfig, ServerConfig],
++        use_forwarding_for_https: bool,
+     ) -> None:
+         proxy, server = san_proxy_with_server
+         destination_url = f"https://{server.host}:{server.port}"
+@@ -975,6 +1027,7 @@ def test_https_proxy_assert_hostname_non_matching(
+             proxy.base_url,
+             ca_certs=proxy.ca_certs,
+             proxy_assert_hostname=proxy_hostname,
++            use_forwarding_for_https=use_forwarding_for_https,
+         ) as https:
+             with pytest.raises(MaxRetryError) as e:
+                 https.request("GET", destination_url)
+@@ -1064,6 +1117,7 @@ def test_https_proxy_no_san_hostname_checks_common_name(
+         destination_url = f"https://{server.host}:{server.port}"
+ 
+         proxy_ctx = urllib3.util.ssl_.create_urllib3_context(verify_flags=0)
++        proxy_ctx.load_verify_locations(proxy.ca_certs)
+         try:
+             proxy_ctx.hostname_checks_common_name = True
+         # PyPy doesn't like us setting 'hostname_checks_common_name'
+@@ -1074,6 +1128,86 @@ def test_https_proxy_no_san_hostname_checks_common_name(
+             pytest.skip("Test requires 'SSLContext.hostname_checks_common_name=True'")
+ 
+         with proxy_from_url(
+-            proxy_url, ca_certs=proxy.ca_certs, proxy_ssl_context=proxy_ctx
++            proxy_url, ca_certs=server.ca_certs, proxy_ssl_context=proxy_ctx
+         ) as https:
+             https.request("GET", destination_url)
++
++    @pytest.mark.parametrize(
++        "target_tls_kwargs",
++        [
++            pytest.param({"server_hostname": "example.com"}, id="server-hostname"),
++            pytest.param({"assert_hostname": "example.com"}, id="assert-hostname"),
++            pytest.param({"assert_fingerprint": "00" * 32}, id="assert-fingerprint"),
++        ],
++    )
++    def test_https_proxy_forwarding_ignores_target_identity_settings(
++        self,
++        san_proxy_with_server: tuple[ServerConfig, ServerConfig],
++        target_tls_kwargs: dict[str, typing.Any],
++    ) -> None:
++        proxy, server = san_proxy_with_server
++        proxy_ctx = create_urllib3_context()
++        proxy_ctx.load_verify_locations(proxy.ca_certs)
++
++        with proxy_from_url(
++            proxy.base_url,
++            proxy_ssl_context=proxy_ctx,
++            proxy_assert_hostname=proxy.host,
++            use_forwarding_for_https=True,
++            **target_tls_kwargs,
++        ) as https:
++            pool = https.connection_from_url(server.base_url)
++            with contextlib.closing(pool._new_conn()) as conn:
++                conn = typing.cast(HTTPSConnection, conn)
++                conn.connect()
++                assert isinstance(conn.sock, ssl.SSLSocket)
++                assert conn.sock.context is proxy_ctx
++
++    def test_https_proxy_forwarding_ignores_target_client_certificate(
++        self,
++        san_proxy_with_server: tuple[ServerConfig, ServerConfig],
++    ) -> None:
++        proxy, server = san_proxy_with_server
++        proxy_ctx = create_urllib3_context()
++        proxy_ctx.load_verify_locations(proxy.ca_certs)
++        missing_cert = str(pathlib.Path(proxy.ca_certs).with_name("missing-cert.pem"))
++
++        with proxy_from_url(
++            proxy.base_url,
++            proxy_ssl_context=proxy_ctx,
++            cert_file=missing_cert,
++            use_forwarding_for_https=True,
++        ) as https:
++            pool = https.connection_from_url(server.base_url)
++            with contextlib.closing(pool._new_conn()) as conn:
++                conn = typing.cast(HTTPSConnection, conn)
++                conn.connect()
++                assert isinstance(conn.sock, ssl.SSLSocket)
++                assert conn.sock.context is proxy_ctx
++
++    def test_https_proxy_forwarding_ignores_target_tls_policy(
++        self,
++        san_proxy_with_server: tuple[ServerConfig, ServerConfig],
++    ) -> None:
++        proxy, server = san_proxy_with_server
++        proxy_ctx = create_urllib3_context(cert_reqs=ssl.CERT_REQUIRED)
++        proxy_ctx.load_verify_locations(proxy.ca_certs)
++        proxy_cert_store_stats = proxy_ctx.cert_store_stats()
++
++        with proxy_from_url(
++            proxy.base_url,
++            proxy_ssl_context=proxy_ctx,
++            cert_reqs=ssl.CERT_NONE,
++            ca_certs=DEFAULT_CA,
++            use_forwarding_for_https=True,
++        ) as https:
++            for target_url in (server.base_url, "https://example.com/"):
++                pool = https.connection_from_url(target_url)
++                with contextlib.closing(pool._new_conn()) as conn:
++                    conn = typing.cast(HTTPSConnection, conn)
++                    conn.connect()
++                    assert isinstance(conn.sock, ssl.SSLSocket)
++                    assert conn.sock.context is proxy_ctx
++
++        assert proxy_ctx.verify_mode == ssl.CERT_REQUIRED
++        assert proxy_ctx.cert_store_stats() == proxy_cert_store_stats
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
index b9d9b5671e..ad5dd190d8 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 SRC_URI += "file://CVE-2026-44431.patch \
             file://CVE-2026-97689.patch \
             file://CVE-2026-44432.patch \
+            file://CVE-2026-97687_p1.patch \
+            file://CVE-2026-97687_p2.patch \
            "
 SRC_URI[sha256sum] = "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
 
-- 
2.44.4

