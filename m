Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.101.1795101870481421266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=BHcDJ+5F;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so26105625e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101869; x=1795706669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XmgzPb0x/41ZzIeyDm3r3dNiF1fbaoRypFKsTRINjHc=;
        b=BHcDJ+5Fv2CwLUWBD7TAKeaEJyAv/F9IhH7XXSQKk5BbezrVRJJni/shQSLkeG6/fK
         c2BxMkuOITXbnBiwbEBTch54E6W58eyljopsTZ1dbbGvS9zUYMwO2SWBqAOhJMyXMuJn
         /G9oW11T7V8sea1cRROqK5v2+6ujNxZT4lJ6YsR1gkgFyQqzYRkGGJsyLFPB8AUG7yit
         QrJxsPNN7XhFPFYvzxaTUHqiB6vBoqRQw3SqPZSD5nMfqZbpTsmxCKX02izNjmCqA3F/
         6S86VQMcyKxLIB/mvRLASae6H/YMCDa4XtxxnRzKEguRgftpdMafzXzToHYaxp/E7az4
         ANsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101869; x=1795706669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XmgzPb0x/41ZzIeyDm3r3dNiF1fbaoRypFKsTRINjHc=;
        b=nrkkVltwopsa8WVGGdUGbRo1drQGgPJn7XYZhefA8S12NrpVdIvfCu6XA1BnA7FOoh
         gsQRnT5nfV5vua1qBYmdrJXp1koStuv40J46v8wODebMMqjzGyP5gquE7LlAocsAxOxg
         gLZl7ZhhOdR/d0t0a0iteWdHU3MYa+WfMovJyFrmMt3xau1QwpyxjZ6kro/DE7EgGhup
         f7CLEB03VBs8OoO+3/WEd0ItnW1jGEeBuq7pE0RiG9eyd8znXpqHhfA5gnPrHrN+rt9G
         1veRjZPJzCAS58QU4G0WN0ZWN1MeoNO7lSZy3v0xqHA9gIEAJHyr4wTVmREOEvM4gt41
         Sl9Q==
X-Gm-Message-State: APuU4Z8uOJ9E9/w5rCLy8IAlme44biZ6mYWLAcGQfqpwc1rTs4QiScOi
	kmH3/ZlofcDihZizAa/YaowJwpIQXtoOBEAc6pTygtxZeZLCK+M+AxlJIfqePR70tofBzRs7/zB
	2v7tc5aw=
X-Gm-Gg: AYBFou17B2dxABKcsDSxRIPhtQT1PY1EosXRNsGVthdy7mgAAW9JuPQxzj4n3q4Ukf7
	5X2JHSOEvq64vYzRsUvo+/MckZ/ipR/dOs+hm7RDyijJfjQiGIk8/hZtY0T6WbaqNQdn3Cfybze
	JUKy8OwBRDwOGfr7U4jCek2pBbpDzxyQ7row8Z93UVTJVNkK5w/Wy7iBT3tIekczv4XRnERcnf6
	V8jd3+A9JdhHy3HAPdpID8hJ/5uN5BypotGO9cyKDGKVibuN6g9HU3Ai1RpSzzCOVAh/pe12wX9
	dzuDaEbKK7Wo+wXK6bH9I5Awq0Fq2qmthmeoVbzTjdUqx3uygOUIQnF79vvM/kmIbrW9DvKWw3P
	64TFplufNDElfUXrFD9F2DbgN4gTTZlZZIMIULZ5Cq0ec2RzJsqm5s3kTubpnMWkHipJGEh9WXx
	4zygFRBgVLAQMNupSIv08DA3l5VzPTyFs8pFudn7Q5TmJVfTRoNeh/c1J6hGqKCHzU2oeJijHli
	IeiBCdqhQHhrLrqPv13wvaWykKBT65SH7nOx63xD6zAldHsXKLmR5Oz9XYydSg3j8Ts/uf5OSd9
	psa2c2gmdTh/yvEGYLtJ+xINGmCNS7A2kEoVKdqXJSRFSNKYoPiNQa2u3xRhVf4Kpi2L+l7m/Yu
	1nrLXvEeu19c+fZSg2NmrJ1p2zfv0JnnnFrxgNpgeJX0akxqN+RkkhHY=
X-Received: by 2002:a05:600c:1c0f:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb7da229f4mr145763205e9.10.1795101868210;
        Thu, 19 Nov 2026 07:24:28 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:27 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/19] python3-urllib3: Fix CVE-2026-97687
Date: Thu, 19 Nov 2026 16:22:39 +0100
Message-ID: <f250b3aeca9c8b04db2bc16c9bcc26edaba36885.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250696
Content-Type: text/plain; charset="utf-8"

From: Yogita Urade <yurade@cisco.com>

This patch applies the upstream fix as referenced in [3],
using the commit shown in [1] and [2].

[1]
https://github.com/urllib3/urllib3/commit/b6447295fff7b38fdffc67e0df9712d60cef3cc3
[2]
https://github.com/urllib3/urllib3/commit/07408cec79d1856d81bb42c74a904a24fdb9e465
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-97687

Signed-off-by: Yogita Urade <yurade@cisco.com>
[bajau: fixed SRC_URI indentation in the recipe file]
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
---
 .../python3-urllib3/CVE-2026-97687_p1.patch   | 285 +++++++++++
 .../python3-urllib3/CVE-2026-97687_p2.patch   | 482 ++++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |   2 +
 3 files changed, 769 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p2.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p1.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p1.patch
new file mode 100644
index 0000000000..241be4adaa
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p1.patch
@@ -0,0 +1,285 @@
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
+- Shifted the upstream policy-selection block to the target method's
+  indentation so this intermediate patch applies and compiles.
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ changelog/2577.bugfix.rst                     |   2 +
+ src/urllib3/connection.py                     |  16 +-
+ src/urllib3/poolmanager.py                    |  15 ++
+ .../test_proxy_poolmanager.py                 | 149 ++++++++++++++++--
+ 4 files changed, 165 insertions(+), 17 deletions(-)
+ create mode 100644 changelog/2577.bugfix.rst
+
+diff --git a/changelog/2577.bugfix.rst b/changelog/2577.bugfix.rst
+new file mode 100644
+index 0000000..57d7f1f
+--- /dev/null
++++ b/changelog/2577.bugfix.rst
+@@ -0,0 +1,2 @@
++Fixed usage of ``proxy_ssl_context`` with ``ProxyManager`` when ``use_forwarding_for_https=True``.
++Passing ``ssl_context`` instead of ``proxy_ssl_context`` for HTTPS proxies in this configuration now emits a ``FutureWarning`` and will raise an error in v3.0.
+diff --git a/src/urllib3/connection.py b/src/urllib3/connection.py
+index 1b16279..b9760c6 100644
+--- a/src/urllib3/connection.py
++++ b/src/urllib3/connection.py
+@@ -649,6 +649,20 @@ class HTTPSConnection(HTTPConnection):
+         # Remove trailing '.' from fqdn hostnames to allow certificate validation
+         server_hostname_rm_dot = server_hostname.rstrip(".")
+ 
++        # Forwarding proxies should use proxy SSL context for
++        # wrapping since that's the connection being established,
++        # whereas tunneling proxies should use the connection's SSL
++        # context.
++        # However, for backwards compatibility reasons, if the proxy
++        # is forwarding but no proxy SSL context is provided, we
++        # fall back to using the connection's SSL context until
++        # urllib3 v3.0. Appropriate warning is emitted in
++        # ``ProxyManager.__init__``.
++        if self.proxy_is_forwarding and self.proxy_config is not None:
++            ssl_context = self.proxy_config.ssl_context
++        else:
++            ssl_context = self.ssl_context
++
+         sock_and_verified = _ssl_wrap_socket_and_match_hostname(
+             sock=sock,
+             cert_reqs=self.cert_reqs,
+@@ -662,7 +676,7 @@ class HTTPSConnection(HTTPConnection):
+             key_file=self.key_file,
+             key_password=self.key_password,
+             server_hostname=server_hostname_rm_dot,
+-            ssl_context=self.ssl_context,
++            ssl_context=ssl_context,
+             tls_in_tls=tls_in_tls,
+             assert_hostname=self.assert_hostname,
+             assert_fingerprint=self.assert_fingerprint,
+diff --git a/src/urllib3/poolmanager.py b/src/urllib3/poolmanager.py
+index 5763fea..290cfe1 100644
+--- a/src/urllib3/poolmanager.py
++++ b/src/urllib3/poolmanager.py
+@@ -581,6 +581,21 @@ class ProxyManager(PoolManager):
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
+diff --git a/test/with_dummyserver/test_proxy_poolmanager.py b/test/with_dummyserver/test_proxy_poolmanager.py
+index a0b1172..f116b41 100644
+--- a/test/with_dummyserver/test_proxy_poolmanager.py
++++ b/test/with_dummyserver/test_proxy_poolmanager.py
+@@ -10,6 +10,7 @@ import shutil
+ import socket
+ import ssl
+ import tempfile
++import typing
+ from test import LONG_TIMEOUT, SHORT_TIMEOUT, resolvesLocalhostFQDN, withPyOpenSSL
+ from test.conftest import ServerConfig
+ 
+@@ -24,7 +25,7 @@ from dummyserver.testcase import (
+ )
+ from urllib3 import HTTPResponse
+ from urllib3._collections import HTTPHeaderDict
+-from urllib3.connection import VerifiedHTTPSConnection
++from urllib3.connection import HTTPSConnection, VerifiedHTTPSConnection
+ from urllib3.connectionpool import connection_from_url
+ from urllib3.exceptions import (
+     ConnectTimeoutError,
+@@ -165,6 +166,43 @@ class TestHTTPProxyManager(HypercornDummyProxyTestCase):
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
+@@ -708,20 +746,8 @@ class TestHTTPProxyManager(HypercornDummyProxyTestCase):
+     # see https://github.com/python/cpython/issues/103472
+     @pytest.mark.filterwarnings("default::ResourceWarning")
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
+@@ -731,12 +757,103 @@ class TestHTTPProxyManager(HypercornDummyProxyTestCase):
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
+     # stdlib http.client.HTTPConnection._tunnel() causes a ResourceWarning
+     # see https://github.com/python/cpython/issues/103472
+     @pytest.mark.filterwarnings("default::ResourceWarning")
diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p2.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p2.patch
new file mode 100644
index 0000000000..5824a5664b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p2.patch
@@ -0,0 +1,482 @@
+From 07408cec79d1856d81bb42c74a904a24fdb9e465 Mon Sep 17 00:00:00 2001
+From: Andrey Petrov <andrey.petrov@shazow.net>
+Date: Wed, 29 Jul 2026 18:20:36 -0400
+Subject: [PATCH] Isolate HTTPS proxy TLS settings from target TLS (#5093)
+
+CVE: CVE-2026-97687
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/07408cec79d1856d81bb42c74a904a24fdb9e465]
+
+Backport Changes:
+- The upstream connection.py hunk conflicted because Scarthgap's
+  urllib3 2.2.2 lacks the newer HTTP/2 connection-probe structure.
+  Ported the proxy-only TLS policy through the existing
+  HTTPSConnection.connect() and _connect_tls_proxy() paths.
+- Adapted proxy-context tests for Scarthgap's API: create_urllib3_context()
+  has no verify_flags keyword, so tests set verify_flags on the returned
+  SSLContext. Tests distinguish target CERT_REQUIRED and proxy CERT_NONE,
+  assert that the proxy context is unchanged, and check the fallback policy
+  with pool cert_reqs/ca_certs.
+
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ changelog/5093.bugfix.rst                     |   7 +
+ src/urllib3/connection.py                     | 102 +++++++-----
+ src/urllib3/poolmanager.py                    |   8 +-
+ .../test_proxy_poolmanager.py                 | 159 +++++++++++++++++-
+ 4 files changed, 222 insertions(+), 54 deletions(-)
+ create mode 100644 changelog/5093.bugfix.rst
+
+diff --git a/changelog/5093.bugfix.rst b/changelog/5093.bugfix.rst
+new file mode 100644
+index 0000000..f64ad4a
+--- /dev/null
++++ b/changelog/5093.bugfix.rst
+@@ -0,0 +1,7 @@
++Fixed ``HTTPSConnection.connect()`` overriding
++``ProxyConfig.ssl_context``'s certificate policy and proxy identity checks with
++the target connection's TLS settings when forwarding through an HTTPS proxy.
++
++``HTTPSConnection`` no longer applies target SNI, assertions, or client
++credentials to forwarding proxy handshakes and continues to use its
++``ssl_context`` as a fallback when an HTTPS proxy forwards an HTTP target.
+diff --git a/src/urllib3/connection.py b/src/urllib3/connection.py
+index b9760c6..e69bfb1 100644
+--- a/src/urllib3/connection.py
++++ b/src/urllib3/connection.py
+@@ -649,39 +649,34 @@ class HTTPSConnection(HTTPConnection):
+         # Remove trailing '.' from fqdn hostnames to allow certificate validation
+         server_hostname_rm_dot = server_hostname.rstrip(".")
+ 
+-        # Forwarding proxies should use proxy SSL context for
+-        # wrapping since that's the connection being established,
+-        # whereas tunneling proxies should use the connection's SSL
+-        # context.
+-        # However, for backwards compatibility reasons, if the proxy
+-        # is forwarding but no proxy SSL context is provided, we
+-        # fall back to using the connection's SSL context until
+-        # urllib3 v3.0. Appropriate warning is emitted in
+-        # ``ProxyManager.__init__``.
++        # Forwarding proxies should establish TLS using proxy-specific policy.
++        # For tunneling proxies, the target connection uses its own TLS policy.
++        wrapped_socket: ssl.SSLSocket | SSLTransport
+         if self.proxy_is_forwarding and self.proxy_config is not None:
+-            ssl_context = self.proxy_config.ssl_context
++            wrapped_socket = self._connect_tls_proxy(self.host, sock)
++            is_verified = self.proxy_is_verified is True
+         else:
+-            ssl_context = self.ssl_context
+-
+-        sock_and_verified = _ssl_wrap_socket_and_match_hostname(
+-            sock=sock,
+-            cert_reqs=self.cert_reqs,
+-            ssl_version=self.ssl_version,
+-            ssl_minimum_version=self.ssl_minimum_version,
+-            ssl_maximum_version=self.ssl_maximum_version,
+-            ca_certs=self.ca_certs,
+-            ca_cert_dir=self.ca_cert_dir,
+-            ca_cert_data=self.ca_cert_data,
+-            cert_file=self.cert_file,
+-            key_file=self.key_file,
+-            key_password=self.key_password,
+-            server_hostname=server_hostname_rm_dot,
+-            ssl_context=ssl_context,
+-            tls_in_tls=tls_in_tls,
+-            assert_hostname=self.assert_hostname,
+-            assert_fingerprint=self.assert_fingerprint,
+-        )
+-        self.sock = sock_and_verified.socket
++            sock_and_verified = _ssl_wrap_socket_and_match_hostname(
++                sock=sock,
++                cert_reqs=self.cert_reqs,
++                ssl_version=self.ssl_version,
++                ssl_minimum_version=self.ssl_minimum_version,
++                ssl_maximum_version=self.ssl_maximum_version,
++                ca_certs=self.ca_certs,
++                ca_cert_dir=self.ca_cert_dir,
++                ca_cert_data=self.ca_cert_data,
++                cert_file=self.cert_file,
++                key_file=self.key_file,
++                key_password=self.key_password,
++                server_hostname=server_hostname_rm_dot,
++                ssl_context=self.ssl_context,
++                tls_in_tls=tls_in_tls,
++                assert_hostname=self.assert_hostname,
++                assert_fingerprint=self.assert_fingerprint,
++            )
++            wrapped_socket = sock_and_verified.socket
++            is_verified = sock_and_verified.is_verified
++        self.sock = wrapped_socket
+ 
+         # Forwarding proxies can never have a verified target since
+         # the proxy is the one doing the verification. Should instead
+@@ -690,7 +685,7 @@ class HTTPSConnection(HTTPConnection):
+         if self.proxy_is_forwarding:
+             self.is_verified = False
+         else:
+-            self.is_verified = sock_and_verified.is_verified
++            self.is_verified = is_verified
+ 
+         # If there's a proxy to be connected to we are fully connected.
+         # This is set twice (once above and here) due to forwarding proxies
+@@ -700,24 +695,47 @@ class HTTPSConnection(HTTPConnection):
+         # Set `self.proxy_is_verified` unless it's already set while
+         # establishing a tunnel.
+         if self._has_connected_to_proxy and self.proxy_is_verified is None:
+-            self.proxy_is_verified = sock_and_verified.is_verified
++            self.proxy_is_verified = is_verified
+ 
+     def _connect_tls_proxy(self, hostname: str, sock: socket.socket) -> ssl.SSLSocket:
+         """
+         Establish a TLS connection to the proxy using the provided SSL context.
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
+diff --git a/src/urllib3/poolmanager.py b/src/urllib3/poolmanager.py
+index 290cfe1..1cf0167 100644
+--- a/src/urllib3/poolmanager.py
++++ b/src/urllib3/poolmanager.py
+@@ -581,6 +581,9 @@ class ProxyManager(PoolManager):
+         if proxy.scheme not in ("http", "https"):
+             raise ProxySchemeUnknown(proxy.scheme)
+ 
++        # Keep the deprecated ssl_context fallback on the manager for
++        # compatibility, while passing only explicit proxy policy to connections.
++        self.proxy_ssl_context = proxy_ssl_context
+         if (
+             use_forwarding_for_https
+             and proxy.scheme == "https"
+@@ -593,8 +596,8 @@ class ProxyManager(PoolManager):
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
+@@ -602,7 +605,6 @@ class ProxyManager(PoolManager):
+ 
+         self.proxy = proxy
+         self.proxy_headers = proxy_headers or {}
+-        self.proxy_ssl_context = proxy_ssl_context
+         self.proxy_config = ProxyConfig(
+             proxy_ssl_context,
+             use_forwarding_for_https,
+diff --git a/test/with_dummyserver/test_proxy_poolmanager.py b/test/with_dummyserver/test_proxy_poolmanager.py
+index f116b41..6dbae5f 100644
+--- a/test/with_dummyserver/test_proxy_poolmanager.py
++++ b/test/with_dummyserver/test_proxy_poolmanager.py
+@@ -113,6 +113,13 @@ class TestHTTPProxyManager(HypercornDummyProxyTestCase):
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
+@@ -143,6 +150,18 @@ class TestHTTPProxyManager(HypercornDummyProxyTestCase):
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
+@@ -793,8 +812,8 @@ class TestHTTPProxyManager(HypercornDummyProxyTestCase):
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
+@@ -811,6 +830,7 @@ class TestHTTPProxyManager(HypercornDummyProxyTestCase):
+                 conn.connect()
+                 assert isinstance(conn.sock, ssl.SSLSocket)
+                 assert conn.sock.context is proxy_ssl_context
++                assert proxy_ssl_context.verify_mode == ssl.CERT_NONE
+ 
+     @requires_network()
+     def test_forwarding_proxy_ssl_context_fallback(self) -> None:
+@@ -819,15 +839,21 @@ class TestHTTPProxyManager(HypercornDummyProxyTestCase):
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
+@@ -835,6 +861,23 @@ class TestHTTPProxyManager(HypercornDummyProxyTestCase):
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
+@@ -946,10 +989,14 @@ class TestHTTPSProxyVerification:
+         proxy_url = f"https://{proxy.host}:{proxy.port}"
+         destination_url = f"https://{server.host}:{server.port}"
+ 
++        proxy_ctx = urllib3.util.ssl_.create_urllib3_context()
++        proxy_ctx.verify_flags = 0
++        proxy_ctx.load_verify_locations(proxy.ca_certs)
+         proxy_fingerprint = self._get_proxy_fingerprint_md5(proxy.ca_certs)
+         with proxy_from_url(
+             proxy_url,
+-            ca_certs=proxy.ca_certs,
++            ca_certs=server.ca_certs,
++            proxy_ssl_context=proxy_ctx,
+             proxy_assert_fingerprint=proxy_fingerprint,
+         ) as https:
+             https.request("GET", destination_url)
+@@ -957,21 +1004,29 @@ class TestHTTPSProxyVerification:
+     # stdlib http.client.HTTPConnection._tunnel() causes a ResourceWarning
+     # see https://github.com/python/cpython/issues/103472
+     @pytest.mark.filterwarnings("default::ResourceWarning")
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
++        proxy_ctx = urllib3.util.ssl_.create_urllib3_context()
++        proxy_ctx.verify_flags = 0
++        proxy_ctx.load_verify_locations(proxy.ca_certs)
+         proxy_fingerprint = self._get_proxy_fingerprint_md5(proxy.ca_certs)
+         new_char = "b" if proxy_fingerprint[5] == "a" else "a"
+         proxy_fingerprint = proxy_fingerprint[:5] + new_char + proxy_fingerprint[6:]
+ 
+         with proxy_from_url(
+             proxy_url,
+-            ca_certs=proxy.ca_certs,
++            ca_certs=server.ca_certs,
++            proxy_ssl_context=proxy_ctx,
+             proxy_assert_fingerprint=proxy_fingerprint,
++            use_forwarding_for_https=use_forwarding_for_https,
+         ) as https:
+             with pytest.raises(MaxRetryError) as e:
+                 https.request("GET", destination_url)
+@@ -995,8 +1050,11 @@ class TestHTTPSProxyVerification:
+     # stdlib http.client.HTTPConnection._tunnel() causes a ResourceWarning
+     # see https://github.com/python/cpython/issues/103472
+     @pytest.mark.filterwarnings("default::ResourceWarning")
++    @pytest.mark.parametrize("use_forwarding_for_https", [False, True])
+     def test_https_proxy_assert_hostname_non_matching(
+-        self, san_proxy_with_server: tuple[ServerConfig, ServerConfig]
++        self,
++        san_proxy_with_server: tuple[ServerConfig, ServerConfig],
++        use_forwarding_for_https: bool,
+     ) -> None:
+         proxy, server = san_proxy_with_server
+         destination_url = f"https://{server.host}:{server.port}"
+@@ -1006,6 +1065,7 @@ class TestHTTPSProxyVerification:
+             proxy.base_url,
+             ca_certs=proxy.ca_certs,
+             proxy_assert_hostname=proxy_hostname,
++            use_forwarding_for_https=use_forwarding_for_https,
+         ) as https:
+             with pytest.raises(MaxRetryError) as e:
+                 https.request("GET", destination_url)
+@@ -1099,7 +1159,9 @@ class TestHTTPSProxyVerification:
+         proxy_url = f"https://{proxy.host}:{proxy.port}"
+         destination_url = f"https://{server.host}:{server.port}"
+ 
+-        proxy_ctx = urllib3.util.ssl_.create_urllib3_context()
++        proxy_ctx = urllib3.util.ssl_.create_urllib3_context()
++        proxy_ctx.verify_flags = 0
++        proxy_ctx.load_verify_locations(proxy.ca_certs)
+         try:
+             proxy_ctx.hostname_checks_common_name = True
+         # PyPy doesn't like us setting 'hostname_checks_common_name'
+@@ -1110,6 +1172,86 @@ class TestHTTPSProxyVerification:
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
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
index 7ca210429b..95667d3fd8 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
@@ -13,6 +13,8 @@ SRC_URI += "file://CVE-2025-50181.patch \
            file://CVE-2026-21441.patch \
            file://CVE-2026-44431.patch \
            file://CVE-2026-97689.patch \
+           file://CVE-2026-97687_p1.patch \
+           file://CVE-2026-97687_p2.patch \
            "
 
 RDEPENDS:${PN} += "\
