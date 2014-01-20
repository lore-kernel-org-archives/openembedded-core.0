Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF186DCFF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 11:40:28 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id b8so5413619lan.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 03:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nNWgmdVrajBbmsd9x38ojwhapw4U+YRKaHDCyJ9zJTA=;
	b=gFMf4H/kuFH7JYX+f1gcmPp7OFHrMqdGTuprbRhfpkzDnI7eTkv7DoY1z9k42ciF4Y
	gShSXb9sLUIGvbIcCI42bPWGzqthyAqttwtTDyOC0Tun0U17qNdubGZjgnY8/fcRCMYs
	uLJ5QQ9YT/yt/Rio4tIa9F5TSeo09evqI5ofa9J6ObDl7VmNraX59nWiN6MBt2pLXeDJ
	Du3GehHc/VG5an7ILyHgrwVg2OZ3E0564xqvyCpCUz03x+7MmB5aBH1e0cj3t221VeFK
	cxw2VtxB35TRwR/gp7wVsd6iGfdgUVJJBmLmebSEFyLeb4BqYvACXnHe7Yv474kBXw/p
	vIGw==
X-Gm-Message-State: ALoCoQnJeC3q9yg0z2YKoczANfll4veisyh1srW3freYXMgkBtiSUHPRFUEX6VduhdP3EV2ufAky
X-Received: by 10.112.130.35 with SMTP id ob3mr11288971lbb.2.1390218028607;
	Mon, 20 Jan 2014 03:40:28 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id gi5sm609509lbc.4.2014.01.20.03.40.27
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 Jan 2014 03:40:28 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 13:40:14 +0200
Message-Id: <1390218017-10423-5-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1390218017-10423-1-git-send-email-fathi.boudra@linaro.org>
References: <1390218017-10423-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCHv2 4/7] ltp: update SRC_REV to LTP 20140115 release
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
X-List-Received-Date: Mon, 20 Jan 2014 11:40:29 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-extended/ltp/ltp_20140115.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140115.bb
index 73bd808..287f73d 100644
--- a/meta/recipes-extended/ltp/ltp_20140115.bb
+++ b/meta/recipes-extended/ltp/ltp_20140115.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "attr libaio libcap acl openssl"
-SRCREV = "a8c42db5f9314211811c36275a21f83902830dc5"
+SRCREV = "c8b3e28097e7d3208df9daceaf92c25eae87ebf0"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
-- 
1.8.1.2


