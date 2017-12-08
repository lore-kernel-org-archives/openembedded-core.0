Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 95B9C786CC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 17:18:07 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id v22so11475978wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Dec 2017 09:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=15TtlvApm7OnVS0I7OxxakeOcmKxdJdH5KIvQ7bjmAM=;
	b=XB4QscD6HgsWgybO1kCUtzNeeUFNzhx5a9zoq6ATY4J95gfeogMHj2fK2+E+YgQzeh
	xGcxbBF8q68uTH7hOrHFSv1QnK9s+OFguZXwrZ/mUa4st+B1qkBi5bMP0BPoMP8YpSDq
	jkJjYnuBW/+yFSA5Qu9Ke66cPdGen4mYEGfeRyWj2plrYR9sKJMN3uf3IRcJj6AVrjCb
	r28/qqu0mbD5LFv7gPk9Ui5CEIq16U9dlLPLt8/638GuNx5OrQAahnBF+Px1zmmC9vBL
	GGiT0cQvzchU45zYMt5Olv7DR2EZlhJJvZu4R9x9oWgb2GJrbe6/5L5G0/+5yIAn2NyC
	ek+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=15TtlvApm7OnVS0I7OxxakeOcmKxdJdH5KIvQ7bjmAM=;
	b=T+1MRm1DfiQqsSt5I3D4oWjmMfVzHcHG0ZBXnKlzL/kXH1HBFNEtezrjNDAmn5hZHU
	ri+h0tuOfhDHzMP/Ezay9OwrFxAJtn97h1bKs5ofLBtTwwqBAqqs1cYv+n6xXQX+x5Rd
	BOFvSXQo5KrlOybRV3TUB7Lk2v4Ki1WJqoRELmb7FOMQy5n+2ogaa2EQVF08+Fhfox5d
	d3aBLhmseQ/wRcP6hDPsmUlD65bilAYRlnsLbRBixEMJgoXC8kazNu1a8axOvCamZyeb
	CKEMyWEAOcgDN4gu0uVp9UdcpVGsjX73kC5GRsFcVLow4kAxXvyjL/8uRKQDO9AH3NJw
	dTiw==
X-Gm-Message-State: AJaThX4rUQtBD5Z4pXaof3PeUDOrpLiE6NvwqIsMxBPClPlf6U2ryt1t
	p7p4nQn910FYwbHo+c8CDUp7e3F8
X-Google-Smtp-Source: AGs4zMYvSDeFateVccBhEu+KiwNbjEiaaWI95VC9Rm2nEG5jq075jHEL6RFyZIBWXS/zwv+j+fjg1A==
X-Received: by 10.223.171.13 with SMTP id q13mr27969525wrc.120.1512753488000; 
	Fri, 08 Dec 2017 09:18:08 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	y84sm2019945wmg.39.2017.12.08.09.18.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Dec 2017 09:18:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 17:18:02 +0000
Message-Id: <20171208171803.26848-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] packagegroups: don't mention lrzsz explicity
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
X-List-Received-Date: Fri, 08 Dec 2017 17:18:07 -0000

There's no need to explicitly depend on lrzsz in these core packagegroups when
it's rarely required.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb                | 3 +--
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 1 -
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb         | 1 -
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb        | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 313628e6c79..87f193db06f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -358,8 +358,7 @@ RRECOMMENDS_packagegroup-base-ipv6 = "\
 
 SUMMARY_packagegroup-base-serial = "Serial port support"
 RDEPENDS_packagegroup-base-serial = "\
-    setserial \
-    lrzsz "
+    setserial"
 
 SUMMARY_packagegroup-base-phone = "Cellular telephony (voice) support"
 RDEPENDS_packagegroup-base-phone = "\
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 0d2da866132..1240212fc7e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -36,7 +36,6 @@ X11TOOLS = "\
 
 RDEPENDS_${PN} = "\
     blktool \
-    lrzsz \
     ${KEXECTOOLS} \
     alsa-utils-amixer \
     alsa-utils-aplay \
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index adb0c56c3a5..bfdff3bf22f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -126,7 +126,6 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     libaio \
     libusb1 \
     libxml2 \
-    lrzsz \
     lsof \
     lzo \
     man \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index e1f34d5af11..b37d4035989 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -60,7 +60,6 @@ RDEPENDS_packagegroup-core-sys-extended = "\
     hdparm \
     lighttpd \
     libaio \
-    lrzsz \
     lzo \
     mc \
     mc-fish \
-- 
2.11.0


