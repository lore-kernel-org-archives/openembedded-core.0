Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5A72576C9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 00:23:51 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id tr5so12173677obc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 16:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1VCXDEPSx77w7ufPjOcjgC+lzMWm7fMmoRTV+xjkJ8c=;
	b=rANe3oeXcnXd2nvZXYwLFvj/QWVwU74pdGl4D3hr1QZxzNMKqsg8ndxcjX24LwlZsP
	InrZjw3FQ8JxZ7CkHnYfHDr5Ewlsy22Nr5fNXaRRSVCx0igKjmy2KM4Hizbug6aVmVUO
	vN3LSwCekSXqtKPxmM0j4z4zNMZfTQbUs0wUMDZUTgZam6tcyIuTnA1HMxPe3dtZVtas
	ppo1udOjTTj8+EP+Oe4C92edhFyxU2j3g1ee+t4HjOkaHu11HpwZvjV2TU6IKAe9w2CF
	AbTKYVPNARLSqBS1tqAcKOvLU/QLX+/nkuzGjBHm8tb/ZDBef1qOdf38bdANdKGSLUIO
	EElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1VCXDEPSx77w7ufPjOcjgC+lzMWm7fMmoRTV+xjkJ8c=;
	b=iAl8nVYAtYCWIp7dnx6BQqxM79toiqxVNQZSmqUc4CWSfdx8mAnw1bpW4tHduWqcXT
	boyUKX0AUUIN+gk5AqY6smeNnaSU/l6r05VChdquqVzMpNUr5rg1KZJcfKTtJx77lf5p
	lnh8STywMAbkI2g+fzHTNCEFcROF88drFYQbIw6MMoJVYxcbOh6rBxwL03fAeCUdMV5R
	i9TCZhxcx5pz1c0QLVhOxMiRxj/n8b5fPT2D5OQ9olmLMt0T0nKVa7mIU6sJ199wXEO3
	+xn/bMb9LJytyCHpP3LOPOc7fJ3eoGNPbeilQT+BUAE53WYUpQR0+o3INfrUg/DxiuqB
	ztew==
X-Gm-Message-State: AG10YOQl+i/LJSOt1LRogFE360WWgOYxVDHICK35XAdjGUWkFVzOW8UPEXiAGuvx5DGIQA==
X-Received: by 10.60.134.73 with SMTP id pi9mr18179036oeb.4.1453854232268;
	Tue, 26 Jan 2016 16:23:52 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id e4sm1790827oic.1.2016.01.26.16.23.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 16:23:51 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 16:23:32 -0800
Message-Id: <1453854212-8496-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453854212-8496-1-git-send-email-armccurdy@gmail.com>
References: <1453854212-8496-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] gstreamer1.0-plugins-bad: fix compiler warnings with -Os in 1.7.1
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
X-List-Received-Date: Wed, 27 Jan 2016 00:23:51 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...itialized-warnings-when-compiling-with-Os.patch | 28 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch
new file mode 100644
index 0000000..5ce5771
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch
@@ -0,0 +1,28 @@
+From a67781000e82bd9ae3813da29401e8c0c852328a Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 26 Jan 2016 15:16:01 -0800
+Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ gst-libs/gst/codecparsers/gstvc1parser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/codecparsers/gstvc1parser.c b/gst-libs/gst/codecparsers/gstvc1parser.c
+index fd16ee0..ddb890c 100644
+--- a/gst-libs/gst/codecparsers/gstvc1parser.c
++++ b/gst-libs/gst/codecparsers/gstvc1parser.c
+@@ -1729,7 +1729,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, gsize size,
+     GstVC1SeqLayer * seqlayer)
+ {
+   guint32 tmp;
+-  guint8 tmp8;
++  guint8 tmp8 = 0;
+   guint8 structA[8] = { 0, };
+   guint8 structB[12] = { 0, };
+   GstBitReader br;
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index ebf579f..99690a3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
     git://anongit.freedesktop.org/gstreamer/gst-plugins-bad;name=base \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
     file://configure-allow-to-disable-libssh2.patch \
+    file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
 "
 
 PV = "1.7.1+git${SRCPV}"
-- 
1.9.1


