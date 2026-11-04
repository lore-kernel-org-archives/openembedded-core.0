Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3448.1793750800506511943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 16:06:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DaTZcysU;
 spf=pass (domain: konsulko.com, ip: 209.85.214.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e940d5d2beso445665ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 16:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793750800; x=1794355600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yAHB4GIVxjNZ5stHTKb9MFJwvhhlYoaQFdQnyKY3K2Y=;
        b=DaTZcysU09zgdMTUsExJYCmP1dObAynQ5ZHcB/oCl+59MwqV0SNJkI9JHKxd+vkq2Z
         r9DBoKIilm8U/kX8Cvxeq7sV/WaNIVpoH7KocI06RQqSu21Z6x3OWCm71PWDO8JQeexk
         C5AEh7nk7XOra7r7NTM13Y95kOKMKQm0U28nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793750800; x=1794355600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yAHB4GIVxjNZ5stHTKb9MFJwvhhlYoaQFdQnyKY3K2Y=;
        b=rzx8WoOLz1pXRr9SJCvhOccXDJiolfyoRx0pgmkPYnkJQgNdqQ88Lf2ECbhcW7JtRc
         lJCWL9xNHOYhWA9W5BieCdfVQx8keX6xXH9BZ9c20TTh+sN182bCU0SmMJYBePRGnTon
         oJDLzKJnI1a97Ew8MSp44vi7/JkuvB7XuSPzNV86askXH5BLnOn8UAU+hWxp21k0Ru8P
         DWEUuScKN47o11cx+mvPvIrHI0OsyeM6sBB50DD1SA2H+BB2GIC5r3x1jrCwSc4gPB8d
         OMZBUKoZpOEd6M3Zb1APu4ycOf6Cm8/sIbTUHSUij8EXedbiAxAO6uYhvuQHv5j8M9sM
         7uNA==
X-Gm-Message-State: APuU4Z96V6pyjCTkwAubxcEAmzb6otzXlQbF9aPVR1cSAAmikkitembZ
	tl68yNMftSS3oPTcX+CBmyLQAWP08NW+Q25WafHlVBHCuoD3QrTIj+PDwNpXGy2DZO+SvOjl98Q
	AXM9s
X-Gm-Gg: AYBFou360/LAP7o3jioQM3PiR//iLw8LoJwhSjogGvO+3LIRGzV65MYRkAb/eSybzw7
	qNgNCUT0zQShLtXQPeG0nHgBGXMQ2ju4mxTNIDHaiT0OsQwNDHy5QoyxBxkBY+M8AKrNa9FoCeV
	zVfjW+1xZZT1O5L/jivn8AlNfQovxciBANHrYgZ3d2hkISCupl0jyNHLzEJtJVvWZCXoiqFvQhg
	zdP+xmABXykF6cI80IXlwrjXZQJIz9f28+oZjhjAoOlPFqrWY13RwGPya2Gw3tkulWFaAdOxdLV
	CJob/BZaMbqQz6dVMyuOIj4t9tdwIkDYJm8tKVvPpadLPm/uxxzYiDku+H7VvKDqDqvEtVVwhA3
	HYxRs7Ffer5QgHKj6IYdpS7a/W+/O0MudGnsr/2YR1fvrJ12NYQR+npYGAxUsUu1NI5pXDkwQrx
	4PHPPd3H2j0pb/fkXkebZFZ98nTTXMaKd2ifJMjMrQGp489FF6GMjJApD+kVXN6i0y0T/RVQ1iB
	UJ3OjJkjNJFd9R+dfGq7kRde7L+XofmbILDhWATglx9df/7u33YqcTuMc8vd3QQR0ENrlad1LJz
	lITwyghrL1qu0MuzV4uTircP0Nu2ScvRE8eHiNGcbjDhBhw7+BkmoY+WJ7MEzRMWJUeHq+/P7nN
	PcD5PDQcxZYykrNgoqWOjH+36y2U=
X-Received: by 2002:a17:902:ebd1:b0:2e2:d834:a40f with SMTP id d9443c01a7336-2eb363965d7mr133505515ad.9.1793750799764;
        Tue, 03 Nov 2026 16:06:39 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:d453:884b:8607:3eb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed088a624esm588985ad.0.2026.11.03.16.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:06:39 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: tgamblin@baylibre.com,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v3 2/5] python3-uvloop: enable ptest
Date: Tue,  3 Nov 2026 16:06:26 -0800
Message-ID: <20261104000629.3345377-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104000629.3345377-1-tim.orling@konsulko.com>
References: <20261103193829.1806542-2-tim.orling@konsulko.com>
 <20261104000629.3345377-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 00:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249310
Content-Type: text/plain; charset="utf-8"

From: Tim Orling <tim.orling@konsulko.com>

The sdist ships the test suite. As in the python3 recipe, the recipe
lists the tests to skip in SKIPPED_TESTS and writes them into run-ptest:
* tests that conflict with pytest's output capture;
* tests broken by libuv 1.53.0 spawning with posix_spawn() on Linux,
  which bypasses uvloop's preexec_fn fork hook;
* DNS tests that wait for resolver timeouts without network access,
  which took the suite from 1 to 10 minutes over tap without NAT;
* on riscv64 only (an override), TLS stress tests, the issue39 deadlock check and a
  socket cancellation test, whose fixed timeouts are too short for qemu
  without KVM.

.flake8 and mypy.ini let test_sourcecode skip cleanly when flake8 and
mypy are missing.

Tested with core-image-ptest-python3-uvloop on qemux86-64 and
qemuriscv64. It takes over 30 seconds, so add it to PTESTS_SLOW.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v3:
- Keep the skip list in the recipe as SKIPPED_TESTS, as python3 does, with
  the riscv64 tests in an override instead of a uname check
- Rename KEEP to DNS_FILTER and explain why -k handles
  test_getaddrinfo_{1,2}

Changes in v2:
- Skip 13 timing sensitive tests on riscv64 only, covering the
  qemuriscv64 AutoBuilder failures plus their counterparts in the other
  event loop class and test_socket_cancel_sock_sendall, found in 10 runs
  under load
- Build the -k expression in a loop to fix patchtest's line length check
- Drop the test counts from the commit message

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-uvloop/run-ptest           | 11 +++
 .../python/python3-uvloop_0.22.1.bb           | 78 ++++++++++++++++++-
 3 files changed, 88 insertions(+), 2 deletions(-)
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
index 0000000000..04716fe101
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-uvloop/run-ptest
@@ -0,0 +1,11 @@
+#!/bin/sh
+# The recipe fills in SKIPPED_TESTS.
+SKIPPED_TESTS=
+# test_getaddrinfo_{1,2} wait for the resolver timeout without network access.
+# --deselect and -k would also drop test_getaddrinfo_1x and _2x, so exclude
+# 1 and 2 with -k and add the rest back.
+DNS_FILTER="not (test_getaddrinfo_1 or test_getaddrinfo_2)"
+for n in 10 11 12 13 14 15 16 17 18 19 20 21 22; do
+    DNS_FILTER="$DNS_FILTER or test_getaddrinfo_$n"
+done
+pytest --automake $SKIPPED_TESTS -k "$DNS_FILTER"
diff --git a/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb b/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
index 887c262ae7..e414f2b470 100644
--- a/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
+++ b/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
@@ -7,11 +7,85 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=bb92739ddad0a2811957bd98bdb90474 \
 
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
+# These replace the stdout/stderr fds, which conflicts with pytest's output
+# capture
+SKIPPED_TESTS = "\
+    --deselect=tests/test_process.py::Test_UV_Process::test_process_streams_redirect \
+    --deselect=tests/test_process.py::Test_AIO_Process::test_process_streams_redirect \
+"
+
+# libuv 1.53.0 spawns with posix_spawn(), so preexec_fn never runs, and an
+# empty host gives EAI_NODATA
+SKIPPED_TESTS += "\
+    --deselect=tests/test_process.py::Test_UV_Process::test_process_preexec_fn_1 \
+    --deselect=tests/test_process.py::Test_UV_Process::test_process_preexec_fn_2 \
+    --deselect=tests/test_dns.py::Test_UV_DNS::test_getaddrinfo_8 \
+    --deselect=tests/test_dns.py::Test_UV_DNS::test_getaddrinfo_9 \
+"
+
+# Each DNS lookup waits for the resolver timeout without network access.
+# run-ptest handles test_getaddrinfo_{1,2}.
+SKIPPED_TESTS += "\
+    --deselect=tests/test_dns.py::Test_UV_DNS::test_getaddrinfo_3 \
+    --deselect=tests/test_dns.py::Test_UV_DNS::test_getaddrinfo_5 \
+    --deselect=tests/test_dns.py::Test_UV_DNS::test_getaddrinfo_6 \
+    --deselect=tests/test_dns.py::Test_UV_DNS::test_getaddrinfo_11 \
+    --deselect=tests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_3 \
+    --deselect=tests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_5 \
+    --deselect=tests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_6 \
+    --deselect=tests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_8 \
+    --deselect=tests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_9 \
+    --deselect=tests/test_dns.py::Test_AIO_DNS::test_getaddrinfo_11 \
+"
+
+# qemu runs without KVM on riscv64, too slow for the fixed timeouts in the TLS
+# stress tests, the issue39 deadlock check (signal.alarm(5)) and
+# test_socket_cancel_sock_sendall, which must cancel within 0.2s
+SKIPPED_TESTS:append:riscv64 = " \
+    --deselect=tests/test_tcp.py::Test_UV_TCPSSL::test_create_connection_ssl_1 \
+    --deselect=tests/test_tcp.py::Test_UV_TCPSSL::test_create_server_ssl_over_ssl \
+    --deselect=tests/test_tcp.py::Test_UV_TCPSSL::test_renegotiation \
+    --deselect=tests/test_tcp.py::Test_AIO_TCPSSL::test_create_connection_ssl_1 \
+    --deselect=tests/test_tcp.py::Test_AIO_TCPSSL::test_create_server_ssl_over_ssl \
+    --deselect=tests/test_tcp.py::Test_AIO_TCPSSL::test_renegotiation \
+    --deselect=tests/test_unix.py::Test_UV_UnixSSL::test_create_unix_connection_ssl_1 \
+    --deselect=tests/test_unix.py::Test_UV_UnixSSL::test_create_unix_server_ssl_1 \
+    --deselect=tests/test_unix.py::Test_AIO_UnixSSL::test_create_unix_connection_ssl_1 \
+    --deselect=tests/test_unix.py::Test_AIO_UnixSSL::test_create_unix_server_ssl_1 \
+    --deselect=tests/test_regr1.py::TestIssue39Regr::test_issue39_regression \
+    --deselect=tests/test_sockets.py::TestUVSockets::test_socket_cancel_sock_sendall \
+    --deselect=tests/test_sockets.py::TestAIOSockets::test_socket_cancel_sock_sendall \
+"
+
+do_install_ptest:append() {
+    # test_sourcecode needs these to skip cleanly when flake8 and mypy are missing
+    install -m 0644 ${S}/.flake8 ${S}/mypy.ini ${D}${PTEST_PATH}/
+    sed -i -e "s|^SKIPPED_TESTS=$|SKIPPED_TESTS=\"${SKIPPED_TESTS}\"|" ${D}${PTEST_PATH}/run-ptest
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

