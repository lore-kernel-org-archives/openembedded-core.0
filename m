Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id F37E172F62
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 02:57:01 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y206so4195713wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Aug 2017 19:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eMd0sE+DVbxgp5HNO08ePQ+1YnX/CARXEcAq9wSUY1U=;
	b=mNK6HCTXdnHQRQManEhasv45BUnlYn8LtjjDgg2VMJQib0J7w5mSjZjRFJv08MnaS0
	kg0yaUiPdUrxHSzEoDbX69SRoTpXbHVpJRj6cXScSdvrWPzRafXy5p9voOsavpWlNxw7
	tBM5gF4elQt7QBuBA1PEy1dj2F4jaj5ucsnfcaZFM/epiHQhvfxS6voWWI0hanXuWEzy
	0ePmjSc9eiOUurnQf2zUXYbZv+je7woLm0FmXkYg1zztKpt8CeWv6B5pkaE6QF8HM6NR
	xXFLNrx7s6C5MqGDaff3AvSMt0Kzl8sZGdpcO0aLY4WK/fQClkEH7jIU2lebu8/Y+rTr
	Ps8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eMd0sE+DVbxgp5HNO08ePQ+1YnX/CARXEcAq9wSUY1U=;
	b=EGESCB9u2wdqTfgbyS5vMuKo2M0RNx5nUeU8lXJ2nKUsrUk5clf5mSP9NI2eG574t0
	7pkQm6un5TkwiPWl0X2p5KS2csklzZYUmXuzArlq5o/NulYW5pzYDp9RvjuP9uQIwYsn
	oakLbOFSOXA5w8xKZWo16271ucMvHhmNkeZHEffLJ9xhG7ANgyNA01O18PenOOb3uoAC
	azHdG2sh17uSc6k8kAqnt7XHYGUuVFqKBvIde8GRCBSwRZ6mPmZI30IGThkMWgp85sho
	Qz5g02laCReGNoZhSQTAe3cvX67OohZPFA+3gKdneCkj6dE78xNkWpeg6D75ONo7m1B2
	QohA==
X-Gm-Message-State: AIVw112wb4txK0s/qVdalRJr9/ps78C7rQOiuSe8MsNTHtbkqwLX6WnU
	DWGN4FOaXidmt5kZ
X-Received: by 10.80.165.45 with SMTP id y42mr1005059edb.64.1501815422705;
	Thu, 03 Aug 2017 19:57:02 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.186]) by smtp.gmail.com with ESMTPSA id
	b10sm1984131edl.74.2017.08.03.19.56.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Aug 2017 19:57:01 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Aug 2017 04:56:31 +0200
Message-Id: <1501815391-8192-5-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501815391-8192-1-git-send-email-liu.ming50@gmail.com>
References: <1501815391-8192-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V2 4/4] qemux86.conf: set WKS_FILE_DEPENDS
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
X-List-Received-Date: Fri, 04 Aug 2017 02:57:02 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

To involve in a minimal set of dependencies required by directdisk.wks.

Drop do_image_wic depends varflags, it's not needed any more.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/conf/machine/qemux86.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index c26dda2..01490b7 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -29,4 +29,4 @@ MACHINE_FEATURES += "x86"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
 WKS_FILE ?= "directdisk.wks"
-do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+WKS_FILE_DEPENDS ?= "syslinux syslinux-native mtools-native dosfstools-native e2fsprogs-native parted-native"
-- 
2.7.4


