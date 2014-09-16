Return-Path: <iwamatsu@nigauri.org>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id B0C687147E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 01:01:12 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lj1so7676738pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 18:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=hIsaOG/Y5fWm+MIHG15yZBAJ2YUuCBoi9cbIUF1bwbI=;
	b=EbSujmB1PkIAm+Yo1Ci6C626JxwoObtmf5TlSdzMyxRbuX591Ie3wFMRz/QWijOjyU
	wLI3mugGii+ISTscqnaH45HC++GgOz4N6HAlep05gAfgl46DNLdfG7aVwznesK+7Lxp1
	mXQQlSheJVrIcngie+SFyKRyeYfm50HJZcV6epycMxX9glZK1ZMne+cFqw/SONfdS/Wc
	dSPTuij6mCtJFWkKxf0BxGeaPJ58sDumNEKBMmtYcMwfHl32tmw3bu09gGazcfln+1oP
	C2SYVTG8Bd1XOj+ZjNamMHgUuvI/9AyiECr7GTr2FI7Wvdl8GMfkRBJXfi+AK4kEcLqO
	ddzA==
X-Gm-Message-State: ALoCoQm9q2I/PSzMhAVV970hU4txc/MMmWVm/H49XAgDWLsbjllubU22ALePfj2I2MDG77ETS3pG
X-Received: by 10.66.157.231 with SMTP id wp7mr9543616pab.151.1410829271822;
	Mon, 15 Sep 2014 18:01:11 -0700 (PDT)
Received: from xps-iwamatsu.renesas.com (49.14.32.202.bf.2iij.net.
	[202.32.14.49]) by mx.google.com with ESMTPSA id
	hz4sm12509998pbc.22.2014.09.15.18.01.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Sep 2014 18:01:10 -0700 (PDT)
Sender: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 10:01:01 +0900
Message-Id: <1410829261-4715-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
X-Mailer: git-send-email 2.0.0
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Subject: [PATCH] packagegroup-core-standalone-sdk-target: Add libgcov-dev to on device SDK
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
X-List-Received-Date: Tue, 16 Sep 2014 01:01:14 -0000

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
---
 V2: Update commit message. 

 .../packagegroup-core-standalone-sdk-target.bb     |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 5d1ce97..154a55c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -7,6 +7,7 @@ inherit packagegroup
 RDEPENDS_${PN} = "\
     libgcc \
     libgcc-dev \
+    libgcov-dev \
     libstdc++ \
     libstdc++-dev \
     ${LIBC_DEPENDENCIES} \
-- 
1.7.9.5


