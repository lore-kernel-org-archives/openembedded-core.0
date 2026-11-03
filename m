Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2993.1793734852854892454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 11:40:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dqK8wR43;
 spf=pass (domain: konsulko.com, ip: 209.85.214.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9995ce866so37740125ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 11:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793734852; x=1794339652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtbbSptT+zCiqAXhP0MJOLn9NZK4yRlaW+TGY9Ero5Y=;
        b=dqK8wR43+0+XNMi/VwNy1uMuxOiG2oIDYb7/hze543pTYkQGocK8IEIWqiqLKZkFxq
         +4bLNU9ciKmM6WfhceNAVtM80T1dCKZqNON1lMUnl1n9jZkEHJNvgNlbB3i+I5YCrQw6
         +qa3ezbOiWQf1tLU+VK9/vWkDCiVRXTSdkLtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734852; x=1794339652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UtbbSptT+zCiqAXhP0MJOLn9NZK4yRlaW+TGY9Ero5Y=;
        b=jNj9+xFXVFelqVjPvFx55aIdG9kJOq6LrAZ0ShM0OmSrlqbZPFSunqc1I7vKPUUpbg
         xzazkNNG3DtUbReSMa+UQAwrPshtk2Hd/CrUp75n5I5gwyVJVWegj2/OeuygsAzghCsW
         7bqmMv3yNAafCr8ex4cOWTD0Zp2jvuGev6gG72nWKIwOG5D6W6JKFVkDk8ULxefL4PvR
         3HFg/TLdgKxqrdZkIr+5vLDLYTPIsAh0B41V4V8XfezQVpSE8sgPto2LIzvk3sm0/6QW
         VqI7Vpw7WNIoIFKYwtjMdbSjTqafQynP7sguemWx7N3i4oiCzVIgQHLAqVgvjOBzmX7J
         /F8w==
X-Gm-Message-State: APuU4Z+Ol6DvOm0OLpyzsSgoTDzGbqXsfEm2lnc815i8PgwyiLBYnbzU
	BzQ+E9veud9fBN5zFLnyvnJX8P0YJCHHZsm/vOF+zoB2QiVv7lID72er7LjRqnHEHwOhX/4k6RL
	Zp6FK
X-Gm-Gg: AYBFou3nCeWhGE3oJZwL/Lx8JH0ruk8cyZTXDZ4IcAfZKxa3h1T/RYlHEp4gym68gPo
	fNl8B9W7ctlGMBD4DfyMtLKX0OddQ502AVRE8Tv46Ol/5m8C8CxJxxZt/gO19wgGgdLrlA/w/BF
	nGgf9e+U5GTaxFFcVhoNOXLY4fCKGEO8oRvB7eaqjmBOtwhPbaoxggA1H1xA2Lu4juShnyShUNP
	qaqk/bpLEkw00m9hgXD4CaVcg6LbvMtpMiRFtH7diUktT75kZ5TYVtu3OiEy09iVdvtznVIJ6mQ
	vbcGn5vf2EKFof74hI49K8S/DxEZEVDbfNqukcjaOR2M80RN4+H3KHqc1KXX2hF48YQaB3rxg1S
	gl/g+IYiwKlmqtoyA1C1gNtKREm+EdrSAXOjxJAQcVyW1kAZNLhXJCBK2dxkbX3lrXshbLk7BPh
	k8H6vAb+VA+0VprxV5VKS/puqw1zE9WK/KWrAchy4YAF7z8BP9869ifUX/hXQmrUD2LkGvEKsYc
	HKYTIOAtLEOytPsPIvv6DP6QtabKz/16VvE3mI3HH6KwzxAKOWCMhwFDTVOT4MrxirOkR7zDlZj
	0EqwI1hur6XB4vY6fw9v3BfD5tsprFybDfqPohS1aPzoT/GDaYZ5IVdxk+nSHZiMkriYezLOnjB
	H7zijdokD/91sKqXdF8BIrBzsDs8=
X-Received: by 2002:a17:903:2352:b0:2e8:1d5c:f6f2 with SMTP id d9443c01a7336-2eb364b06c3mr130360565ad.24.1793734852148;
        Tue, 03 Nov 2026 11:40:52 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:d453:884b:8607:3eb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm44562375ad.6.2026.11.03.11.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:40:49 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 2/5] python3-uvloop: enable ptest
Date: Tue,  3 Nov 2026 11:38:28 -0800
Message-ID: <20261103193829.1806542-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102011816.3710992-1-tim.orling@konsulko.com>
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 19:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249293
Content-Type: text/plain; charset="utf-8"

From: Tim Orling <tim.orling@konsulko.com>

The sdist ships the test suite. run-ptest deselects:
* tests that conflict with pytest's output capture;
* tests broken by libuv 1.53.0 spawning with posix_spawn() on Linux,
  which bypasses uvloop's preexec_fn fork hook;
* DNS tests that wait for resolver timeouts without network access,
  which took the suite from 1 to 10 minutes over tap without NAT;
* on riscv64 only, TLS stress tests, the issue39 deadlock check and a
  socket cancellation test, whose fixed timeouts are too short for qemu
  without KVM.

.flake8 and mypy.ini let test_sourcecode skip cleanly when flake8 and
mypy are missing.

Tested with core-image-ptest-python3-uvloop on qemux86-64. It takes
over 30 seconds, so add it to PTESTS_SLOW.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
- Skip 13 timing sensitive tests on riscv64 only, covering the
  qemuriscv64 AutoBuilder failures plus their counterparts in the other
  event loop class and test_socket_cancel_sock_sendall, found in 10 runs
  under load (stress-ng)
- Build the -k expression in a loop to fix patchtest's line length check
- Drop the test counts from the commit message

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-uvloop/run-ptest           | 50 +++++++++++++++++++
 .../python/python3-uvloop_0.22.1.bb           | 27 +++++++++-
 3 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-devtools/python/python3-uvloop/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index bef45bb4d5..50b971bace 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -154,6 +154,7 @@ PTESTS_SLOW = "\
     python3-click \
     python3-cryptography \
     python3-numpy \
+    python3-uvloop \
     python3-xmltodict \
     strace \
     tar \
diff --git a/meta/recipes-devtools/python/python3-uvloop/run-ptest b/meta/recipes-devtools/python/python3-uvloop/run-ptest
new file mode 100755
index 0000000000..0cb9a26b88
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-uvloop/run-ptest
@@ -0,0 +1,50 @@
+#!/bin/sh
+# test_process_streams_redirect: replaces the stdout/stderr fds, which
+# conflicts with pytest's output capture.
+# test_process_preexec_fn_{1,2}, Test_UV_DNS test_getaddrinfo_{8,9}: libuv
+# 1.53.0 spawns with posix_spawn(), so preexec_fn never runs, and an empty
+# host gives EAI_NODATA.
+# test_getaddrinfo_{1,2,3,5,6,11}, Test_AIO_DNS test_getaddrinfo_{8,9}: each
+# DNS lookup waits for the resolver timeout without network access.
+# --deselect matches a node id prefix, so -k handles 1, 2 and 11.
+# riscv64: qemu runs without KVM there, too slow for the fixed timeouts in
+# the TLS stress tests, the issue39 deadlock check (signal.alarm(5)) and
+# test_socket_cancel_sock_sendall, which must cancel within 0.2s.
+SLOW=""
+if [ "$(uname -m)" = "riscv64" ]; then
+    SLOW="
+        --deselect=tests/test_tcp.py::Test_UV_TCPSSL::test_create_connection_ssl_1
+        --deselect=tests/test_tcp.py::Test_UV_TCPSSL::test_create_server_ssl_over_ssl
+        --deselect=tests/test_tcp.py::Test_UV_TCPSSL::test_renegotiation
+        --deselect=tests/test_tcp.py::Test_AIO_TCPSSL::test_create_connection_ssl_1
+        --deselect=tests/test_tcp.py::Test_AIO_TCPSSL::test_create_server_ssl_over_ssl
+        --deselect=tests/test_tcp.py::Test_AIO_TCPSSL::test_renegotiation
+        --deselect=tests/test_unix.py::Test_UV_UnixSSL::test_create_unix_connection_ssl_1
+        --deselect=tests/test_unix.py::Test_UV_UnixSSL::test_create_unix_server_ssl_1
+        --deselect=tests/test_unix.py::Test_AIO_UnixSSL::test_create_unix_connection_ssl_1
+        --deselect=tests/test_unix.py::Test_AIO_UnixSSL::test_create_unix_server_ssl_1
+        --deselect=tests/test_regr1.py::TestIssue39Regr::test_issue39_regression
+        --deselect=tests/test_sockets.py::TestUVSockets::test_socket_cancel_sock_sendall
+        --deselect=tests/test_sockets.py::TestAIOSockets::test_socket_cancel_sock_sendall
+    "
+fi
+KEEP="not (test_getaddrinfo_1 or test_getaddrinfo_2)"
+for n in 10 12 13 14 15 16 17 18 19 20 21 22; do
+    KEEP="$KEEP or test_getaddrinfo_$n"
+done
+pytest --automake $SLOW \
+    -k "$KEEP" \
+    --deselect=tests/test_process.py::Test_UV_Process::test_process_streams_redirect \
+    --deselect=tests/test_process.py::Test_AIO_Process::test_process_streams_redirect \
+    --deselect=tests/test_process.py::Test_UV_Process::test_process_preexec_fn_1 \
+    --deselect=tests/test_process.py::Test_UV_Process::test_process_preexec_fn_2 \
+    --deselect=tests/test_dns.py::Test_UV_DNS::test_getaddrinfo_3 \
+    --deselect=tests/test_dns.py::Test_UV_DNS::test_getaddrinfo_5 \
+    --deselect=tests/test_dns.py::Test_UV_DNS::test_getaddrinfo_6 \
+    --deselect=tests/test_dns.py::Test_UV_DNS::test_getaddrinfo_8 \
+    --deselect=tests/test_dns.py::Test_UV_DNS::test_getaddrinfo_9 \
+    --deselect=tests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_3 \
+    --deselect=tests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_5 \
+    --deselect=tests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_6 \
+    --deselect=tests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_8 \
+    --deselect=tests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_9
diff --git a/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb b/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
index 887c262ae7..39b6a2602a 100644
--- a/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
+++ b/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
@@ -7,11 +7,34 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=bb92739ddad0a2811957bd98bdb90474 \
 
 DEPENDS += "libuv python3-wheel-native"
 
-SRC_URI += "file://0001-setup.cfg-use-system-libuv.patch"
+SRC_URI += "\
+    file://0001-setup.cfg-use-system-libuv.patch \
+    file://run-ptest \
+"
 SRC_URI[sha256sum] = "6c84bae345b9147082b17371e3dd5d42775bddce91f885499017f4607fdaf39f"
 
-inherit pypi python_setuptools_build_meta cython
+inherit pypi python_setuptools_build_meta cython ptest-python-pytest
 
 RDEPENDS:${PN} = "python3-asyncio"
 
+RDEPENDS:${PN}-ptest += "\
+    python3-ctypes \
+    python3-io \
+    python3-logging \
+    python3-math \
+    python3-multiprocessing \
+    python3-netclient \
+    python3-numbers \
+    python3-pickle \
+    python3-pprint \
+    python3-psutil \
+    python3-pyopenssl \
+    python3-threading \
+"
+
+do_install_ptest:append() {
+    # test_sourcecode needs these to skip cleanly when flake8 and mypy are missing
+    install -m 0644 ${S}/.flake8 ${S}/mypy.ini ${D}${PTEST_PATH}/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

