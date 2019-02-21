Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 11A487CB40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:41:39 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id v13so29854949wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 04:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yX0zxMUFmX1RVkgDc7tM8p7bqpKWSx2Fg/iyo9W5TeE=;
	b=Ag8DemI+rQt1BPzyTFoZSye/T93XwJrZ5L6P0/VsrRXICDovk3O7ES5h22cP7U6qGp
	d3tAvPZmaTvrnbLFju6lr80OdSBxmGywF4jOSGubE3HkT1YnHA12MMEonDtggMwNlNwc
	cwOdvcZugoriVYujDt1J1asaUgC90r7lvvBnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yX0zxMUFmX1RVkgDc7tM8p7bqpKWSx2Fg/iyo9W5TeE=;
	b=nszBUH3k5Pk7c/a2unpqLQcmRArUUWZFC8nH13hA928SEfaS3ShpN7L0lG5UqqMDW+
	VZKXipuqsgM6/VTbNqUzGo8lLCcVF/SsngYnpfyXxGOy9HAVPRNaR02VtwOOZAeAT9uo
	3ylZC8476Tk4d2rEva0EKcdILLm9eSOw9hpETFT6OWQtL3C/6tGg+chQiANO/58767C5
	/5wmzyG42crT38xYQrLDm4MmyfIFrMDrGGegt5ebkbzX7R4250HYAtf+z0JpAp5BEc99
	ay4mNRZ+En2rTaPxrOiJsLkeytdaxGw75ibVbKJx99YmDzFSZnkMcwVVGtrFy6Wsy79n
	Rn1A==
X-Gm-Message-State: AHQUAubbIKf+1abiutoeHquIgNZKNpmLNyZeRbRTmqpNTIy4k8IhCNWn
	dCHi5QpLX9qch1GODW5g2/mGBTd70ek=
X-Google-Smtp-Source: AHgI3IafG8dcV3kdImrwd4KMkjKrApGHsvv8Nq+bwZeaWOzL12Wo/fdm0cgP9A/DeiFIPm42e/G6/g==
X-Received: by 2002:adf:ec10:: with SMTP id x16mr28864276wrn.171.1550752900248;
	Thu, 21 Feb 2019 04:41:40 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20787379wru.52.2019.02.21.04.41.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 04:41:39 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 12:41:24 +0000
Message-Id: <20190221124130.25733-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
References: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 08/14] netbase: upgrade 5.5 -> 5.6
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
X-List-Received-Date: Thu, 21 Feb 2019 12:41:40 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...netbase-add-rpcbind-as-an-alias-to-sunrpc.patch | 14 ++++++--------
 .../netbase/{netbase_5.5.bb => netbase_5.6.bb}     |  4 ++--
 2 files changed, 8 insertions(+), 10 deletions(-)
 rename meta/recipes-core/netbase/{netbase_5.5.bb => netbase_5.6.bb} (83%)

diff --git a/meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch b/meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch
index 56c8d5b5c21..27ba2f68a26 100644
--- a/meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch
+++ b/meta/recipes-core/netbase/netbase/netbase-add-rpcbind-as-an-alias-to-sunrpc.patch
@@ -1,4 +1,4 @@
-From 76989205a1411f16d7ab09ff9d279539a73dc259 Mon Sep 17 00:00:00 2001
+From 52d46c4d1fbd4c88d69c2fcf7837b2f2ba7ef6f2 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Thu, 12 Jan 2017 16:50:58 +0200
 Subject: [PATCH] netbase: add rpcbind as an alias to sunrpc
@@ -10,6 +10,7 @@ Upstream-Status: Pending
 
 Signed-off-by: Li Wang <li.wang@windriver.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
+
 ---
  etc-rpc      | 2 +-
  etc-services | 4 ++--
@@ -29,12 +30,12 @@ index 1b30625..9a9a81a 100644
  rusersd		100002	rusers
  nfs		100003	nfsprog
 diff --git a/etc-services b/etc-services
-index e3202ec..a039d7e 100644
+index fa7ae24..10ba2bc 100644
 --- a/etc-services
 +++ b/etc-services
-@@ -64,8 +64,8 @@ csnet-ns	105/udp		cso-ns
- rtelnet		107/tcp				# Remote Telnet
- rtelnet		107/udp
+@@ -51,8 +51,8 @@ kerberos	88/udp		kerberos5 krb5 kerberos-sec	# Kerberos v5
+ iso-tsap	102/tcp		tsap		# part of ISODE
+ acr-nema	104/tcp		dicom		# Digital Imag. & Comm. 300
  pop3		110/tcp		pop-3		# POP version 3
 -sunrpc		111/tcp		portmapper	# RPC 4.0 portmapper
 -sunrpc		111/udp		portmapper
@@ -43,6 +44,3 @@ index e3202ec..a039d7e 100644
  auth		113/tcp		authentication tap ident
  sftp		115/tcp
  nntp		119/tcp		readnews untp	# USENET News Transfer Protocol
--- 
-2.4.0
-
diff --git a/meta/recipes-core/netbase/netbase_5.5.bb b/meta/recipes-core/netbase/netbase_5.6.bb
similarity index 83%
rename from meta/recipes-core/netbase/netbase_5.5.bb
rename to meta/recipes-core/netbase/netbase_5.6.bb
index eb53adda8d9..2aa49711cca 100644
--- a/meta/recipes-core/netbase/netbase_5.5.bb
+++ b/meta/recipes-core/netbase/netbase_5.6.bb
@@ -9,8 +9,8 @@ PE = "1"
 SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz \
            file://netbase-add-rpcbind-as-an-alias-to-sunrpc.patch"
 
-SRC_URI[md5sum] = "15f2d9b3783802f7f48f6734b6540ac4"
-SRC_URI[sha256sum] = "309bddc69a43b98e5a450992b70cdfc0e3d1afb9107bc631d04b0714be98f88b"
+SRC_URI[md5sum] = "7ad156272c5a42f49c73386ff39c8624"
+SRC_URI[sha256sum] = "5d93a099deb28869b7306e914700fafbd293b55bdb5df05a5aa6effd0af5930c"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 do_install () {
-- 
2.20.1


