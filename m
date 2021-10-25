Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B9DC433FE
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:27:35 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web11.32837.1635172054772572847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=D/QdCRoY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635172052; i=@fujitsu.com;
	bh=E+DFU5iZZZCI2Wla6cgxnQ3kC/sl3v3JiMN0BvXXqQQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=D/QdCRoY9OtWXTABYpWnIG8Fk2YyI84dXgGHfWlsgTvBVMFHZfYrfRlSn9YD9eixB
	 k+L+/xeAaiMHzy+wZf6l1mZabcIPXam/SOSTBHQXbtDnHdIJ3am1SqY6X0reoXmsX1
	 B5h1IDk8cJjve83zwx/OS3WmRrtQyqYLR/M0yZyXDuH3pQ9NE7M5sqRyDtCGq/lZde
	 NWKXm1JHdUHd/uPxI9rwVzziKLYbX94wcfnGtQK/5ysPOG7n1I0/m98EHRz7TFXSnr
	 NzPuoccv6caXMxwWfhheBxJvDCt1Yy7sKxFxsLL+exMj3McGO4ucW1O1wj7CnN/Lq9
	 mE4hsVx8cyKWg==
Received: from [100.113.6.252] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id EA/A3-25178-4DEB6716;
 Mon, 25 Oct 2021 14:27:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MxSffKvrJ
  Eg+t/uSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1ozbB16yFzSrVsz4fZi5gfGIQhcjF4eQwGNG
  iaP3jjFBOOeZJE63/2aBcE4wSszbtRzI4eRgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e
  9hBbGEBS4n9Bw+zgtgsAqoSuzd8ZwaxeQWcJJZPngRWIyGgIDHl4XuouKDEyZlPWCDmSEgcfP
  GCGaJGUWL25WYWCLtCYtasNiYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRoukosz0jJLcxMwcXUM
  DA11DQ2NdM10Lc73EKt0kvdRS3eTUvJKiRKCkXmJ5sV5xZW5yTopeXmrJJkZgQKYUsoXvYDzz
  +oPeIUZJDiYlUd4z88sShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwbtsLlBMsSk1PrUjLzAFGB
  0xagoNHSYT31B6gNG9xQWJucWY6ROoUoy7Hu5+LFzELseTl56VKifPGgswQACnKKM2DGwGL1E
  uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmlgXEvxJOZVwK36RXQEUxAR/jploAcUZKIkJJ
  qYGp/e/rZlxW6+3zjQzbM/i7Ql5M956CrjrLcNpuved+YXV8d+lA2RbnWo+mhqMfWSTvdLbht
  J/UqtZZP+/neJSxq57N7h2Xy/jXOdOLvdT6ft/S4QJ/58ZZLvsI+fts+Mkunf/1pwjnBgON34
  /uGk4W37ebKfS5Z8N1Tz+z1xrg5HDU/eqL+rFXoz9mRJ2bjNONsXPXyGGUrod0LDgq7Ta5aWx
  E0cUmZzJXTr12WcJfWN55Vcqis7s8z4Zrvqu89Qy5Wy99st+i9gwEbjj4+c/zCpNfbcrhOnGj
  Z+jtihX/Ogda69PnlqkxbqhdN+6TzVsrhvd/t/0oFEWv9e/rf7C5o6D3HfXQeg8vD3Kgfp5VY
  ijMSDbWYi4oTAfY8BwZPAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-245.messagelabs.com!1635172051!780748!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29558 invoked from network); 25 Oct 2021 14:27:32 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Oct 2021 14:27:32 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 99AB7100457
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:27:31 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8CD27100441
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:27:31 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 25 Oct 2021 15:27:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dhcpcd: upgrade 9.4.0 -> 9.4.1
Date: Mon, 25 Oct 2021 22:26:52 +0800
Message-ID: <1635172017-18309-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 14:27:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157346

0002-src-privsep-linux.c-add-support-for-arc-28.patch
removed since it is included in 9.4.1

-License-Update: Copyright year updated to 2021.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{dhcpcd_9.4.0.bb => dhcpcd_9.4.1.bb}      |  5 +-
 ...ivsep-linux.c-add-support-for-arc-28.patch | 63 -------------------
 2 files changed, 2 insertions(+), 66 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_9.4.0.bb => dhcpcd_9.4.1.bb} (88%)
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
similarity index 88%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index dbad8c8728..4007a4bd2d 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -7,18 +7,17 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
 HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9674cc803c5d71306941e6e8b5c002f2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d148485768fe85b9f1072b186a7e9b4d"
 
 UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 
 SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
-           file://0002-src-privsep-linux.c-add-support-for-arc-28.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
            "
 
-SRC_URI[sha256sum] = "41a69297f380bf15ee8f94f73154f8c2bca7157a087c0d5aca8de000ba1d4513"
+SRC_URI[sha256sum] = "819357634efed1ea5cf44ec01b24d3d3f8852fec8b4249925dcc5667c54e376c"
 
 inherit pkgconfig autotools-brokensep systemd useradd
 
diff --git a/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch b/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
deleted file mode 100644
index 045f06a9aa..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 82386110e67cf75c224e9817fce55e6b0f143266 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 8 Feb 2021 07:23:54 +0100
-Subject: [PATCH] src/privsep-linux.c: add support for arc (#28)
-
-Fix the following build failure:
-
-privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
- #  error "Platform does not support seccomp filter yet"
-    ^~~~~
-In file included from privsep-linux.c:36:
-privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
-  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
-                                      ^~~~~~~~~~~~~~~~~~
-
-It should be noted that AUDIT_ARCH_{ARCOMPACT,ARCV2} is only defined
-since kernel 5.2 and
-https://github.com/torvalds/linux/commit/67f2a8a29311841ba6ab9b0e2d1b8f1e9978cd84
-
-Detection of arc compact and arc v2 have been "copy/pasted" from
-https://github.com/wbx-github/uclibc-ng/commit/afab56958f1cbb47b831ee3ebff231dfbae74af2
-
-Fixes:
- - http://autobuild.buildroot.org/results/d29083700a80dd647621eed06faeeae03f0587d3
-
-Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/82386110e67cf75c224e9817fce55e6b0f143266]
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- src/privsep-linux.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 402667af..21d41a9a 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -149,6 +149,22 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_I386
- #elif defined(__x86_64__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_X86_64
-+#elif defined(__arc__)
-+#  if defined(__A7__)
-+#    if (BYTE_ORDER == LITTLE_ENDIAN)
-+#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCOMPACT
-+#    else
-+#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCOMPACTBE
-+#    endif
-+#  elif defined(__HS__)
-+#    if (BYTE_ORDER == LITTLE_ENDIAN)
-+#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCV2
-+#    else
-+#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCV2BE
-+#    endif
-+#  else
-+#    error "Platform does not support seccomp filter yet"
-+#  endif
- #elif defined(__arm__)
- #  ifndef EM_ARM
- #    define EM_ARM 40
--- 
-2.16.2
-
-- 
2.25.1


