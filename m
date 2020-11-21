Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.2644.1605917658123464198
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 16:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DDyA3Sv5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id q28so8727156pgk.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 16:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8rghWCaLsg9e06J3LlfPvgyEipBhyATOb9QBwIv2HCc=;
        b=DDyA3Sv5Mm5PlbTWiGObeOxQFykM1fhwtknN180iv9O4c/Bp2j65lsEZsCDzEE6KiA
         35WDTsFLv5Ehbi6UoRjY+gL6Jt9AJUCY47RUpn2xe9bKpjzqfiYqTYLjH3lDRLO4MXkx
         l6Olarle+cI5F4D2amz+VTNW9NjMUXBBPv4KCr+VCH4HysstGm6PMivgwkjUfZFM0thk
         sfuqbiFQsTrnr5ezc6h5z9JjTjG9WhlTL3QTZJDEK1YbG7zTdNzc6jqgPCG4BB8lCLJ3
         QezKOZnFdLiazZGnnd3shzzKEbAZ4pd8MIQQXkSFtsKH5e1Jlsqe+83hWkeYSaswspfl
         ttBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8rghWCaLsg9e06J3LlfPvgyEipBhyATOb9QBwIv2HCc=;
        b=QcCOAVWGKl/eIlg+FZ1DX3hZ+nNiU/OvICpiMvTNgx63IdP1aVoVwzEqzq1S3AnVoY
         Jzo2+9Y3+g3iBARhT9qAWutU63x4kDy6Ph8xTKXZmM6TTvUyQ+l0zuLhImohL1VcrP11
         j5pcOMDJ/lqnEouH96Phwk8l3mZgwO9ij7EcRBN+vkOOTGUc+B5LOIvwmeMqwWgbTclg
         byJByvkV0yq8w3cnZD9z7iVpwHiwI2GfFyb2dW4pOSlFaxr+VaTf1WioPtF3Hm8h3HTl
         3Cae6yUpY25H1ZZ/Bjifid2AGKfl8X5v56ihvpFx6TaV5FUtWHM2/F9rBsqlr3RDn5Zg
         +22Q==
X-Gm-Message-State: AOAM531QVCjFlznpPC5YWhdLFtVW9kRSnTs3PNrkOp3SNsooIDuXArAX
	flDhbFskBclQivwhgEBs/EEbj+A2+KWA5eBk
X-Google-Smtp-Source: ABdhPJwyDi1jMwpUpY1dpSuc0iecTnyEWmaMqwzUAiXpAfsi3yDJxPCF2yF4f9ti2te1XcVViQxHNw==
X-Received: by 2002:a17:90a:4410:: with SMTP id s16mr13664664pjg.173.1605917657316;
        Fri, 20 Nov 2020 16:14:17 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d10sm5302419pjj.38.2020.11.20.16.14.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 16:14:16 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/5] libproxy: fix CVE-2020-26154
Date: Fri, 20 Nov 2020 14:14:00 -1000
Message-Id: <9b5ae61015637c1bf790a0700069da9e65bafefc.1605917505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605917505.git.steve@sakoman.com>
References: <cover.1605917505.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libproxy/libproxy/CVE-2020-26154.patch    | 98 +++++++++++++++++++
 .../libproxy/libproxy_0.4.15.bb               |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch

diff --git a/meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch b/meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch
new file mode 100644
index 0000000000..0ccb99da81
--- /dev/null
+++ b/meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch
@@ -0,0 +1,98 @@
+From 4411b523545b22022b4be7d0cac25aa170ae1d3e Mon Sep 17 00:00:00 2001
+From: Fei Li <lifeibiren@gmail.com>
+Date: Fri, 17 Jul 2020 02:18:37 +0800
+Subject: [PATCH] Fix buffer overflow when PAC is enabled
+
+The bug was found on Windows 10 (MINGW64) when PAC is enabled. It turned
+out to be the large PAC file (more than 102400 bytes) returned by a
+local proxy program with no content-length present.
+
+Upstream-Status: Backport [https://github.com/libproxy/libproxy/commit/6d342b50366a048d3d543952e2be271b5742c5f8]
+CVE: CVE-2020-26154
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ libproxy/url.cpp | 44 +++++++++++++++++++++++++++++++-------------
+ 1 file changed, 31 insertions(+), 13 deletions(-)
+
+diff --git a/libproxy/url.cpp b/libproxy/url.cpp
+index ee776b2..8684086 100644
+--- a/libproxy/url.cpp
++++ b/libproxy/url.cpp
+@@ -54,7 +54,7 @@ using namespace std;
+ #define PAC_MIME_TYPE_FB "text/plain"
+ 
+ // This is the maximum pac size (to avoid memory attacks)
+-#define PAC_MAX_SIZE 102400
++#define PAC_MAX_SIZE 0x800000
+ // This is the default block size to use when receiving via HTTP
+ #define PAC_HTTP_BLOCK_SIZE 512
+ 
+@@ -478,15 +478,13 @@ char* url::get_pac() {
+ 		}
+ 
+ 		// Get content
+-		unsigned int recvd = 0;
+-		buffer = new char[PAC_MAX_SIZE];
+-		memset(buffer, 0, PAC_MAX_SIZE);
++		std::vector<char> dynamic_buffer;
+ 		do {
+ 			unsigned int chunk_length;
+ 
+ 			if (chunked) {
+ 				// Discard the empty line if we received a previous chunk
+-				if (recvd > 0) recvline(sock);
++				if (!dynamic_buffer.empty()) recvline(sock);
+ 
+ 				// Get the chunk-length line as an integer
+ 				if (sscanf(recvline(sock).c_str(), "%x", &chunk_length) != 1 || chunk_length == 0) break;
+@@ -498,21 +496,41 @@ char* url::get_pac() {
+ 
+ 			if (content_length >= PAC_MAX_SIZE) break;
+ 
+-			while (content_length == 0 || recvd != content_length) {
+-				int r = recv(sock, buffer + recvd,
+-				             content_length == 0 ? PAC_HTTP_BLOCK_SIZE
+-				                                 : content_length - recvd, 0);
++			while (content_length == 0 || dynamic_buffer.size() != content_length) {
++				// Calculate length to recv
++				unsigned int length_to_read = PAC_HTTP_BLOCK_SIZE;
++				if (content_length > 0)
++					length_to_read = content_length - dynamic_buffer.size();
++
++				// Prepare buffer
++				dynamic_buffer.resize(dynamic_buffer.size() + length_to_read);
++
++				int r = recv(sock, dynamic_buffer.data() + dynamic_buffer.size() - length_to_read, length_to_read, 0);
++
++				// Shrink buffer to fit
++				if (r >= 0)
++					dynamic_buffer.resize(dynamic_buffer.size() - length_to_read + r);
++
++				// PAC size too large, discard
++				if (dynamic_buffer.size() >= PAC_MAX_SIZE) {
++					chunked = false;
++					dynamic_buffer.clear();
++					break;
++				}
++
+ 				if (r <= 0) {
+ 					chunked = false;
+ 					break;
+ 				}
+-				recvd += r;
+ 			}
+ 		} while (chunked);
+ 
+-		if (content_length != 0 && string(buffer).size() != content_length) {
+-			delete[] buffer;
+-			buffer = NULL;
++		if (content_length == 0 || content_length == dynamic_buffer.size()) {
++			buffer = new char[dynamic_buffer.size() + 1];
++			if (!dynamic_buffer.empty()) {
++				memcpy(buffer, dynamic_buffer.data(), dynamic_buffer.size());
++			}
++			buffer[dynamic_buffer.size()] = '\0';
+ 		}
+ 	}
+ 
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.15.bb b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
index a14c358cc2..6f704d7a91 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.15.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
@@ -11,6 +11,7 @@ DEPENDS = "glib-2.0"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://0001-get-pac-test-Fix-build-with-clang-libc.patch \
            file://CVE-2020-25219.patch \
+           file://CVE-2020-26154.patch \
           "
 SRC_URI[md5sum] = "f6b1d2a1e17a99cd3debaae6d04ab152"
 SRC_URI[sha256sum] = "654db464120c9534654590b6683c7fa3887b3dad0ca1c4cd412af24fbfca6d4f"
-- 
2.17.1

