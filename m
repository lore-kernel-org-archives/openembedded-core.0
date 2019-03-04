Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 827B37C930
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 17:31:50 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id d17so6475774wre.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 09:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=M/w9NBjeBYdwv6wN2cMtXOZGTnkyoT6MD4rQ6mRoMyI=;
	b=QeAJey+/n+DWZ+vgzl8c+ntFXC7+4wkW3oPMi/au3GeFOAR2Ytv4TdoZwrQM+3ta9/
	XzqradQNMVpdsMr966wIvnNfFU4RoLKMkRaitSQaklg5da+BQVVhHn7WOCqtWV5H9DKV
	fWsxS3UdJPS4uCQn0xq8TzEMbF6bvknF+5qSa6bg6r5F1cfOk2G9Kc9T9/xshABZbtpm
	aGw7fWmCELd5bgdo3xAuGCNH5AAaOW2UJv1hpkHT0sg4iUgNCSFtZ7kG7CxOs4wKMceE
	CXDz5y5waxhP7lCV6DN+Sq91eLSQKbdZHhebGzC2fMD6/yBdWOTOhcFBflF1sPTpA7nj
	hTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=M/w9NBjeBYdwv6wN2cMtXOZGTnkyoT6MD4rQ6mRoMyI=;
	b=bvJhvcvOZNvthuSJmLB40PLLE4KsLcauKo9TUph45YPMG7J7hQSamyaa9aCb/g6ofU
	5K0ZuMmfiLIOXmPngFWFoGshiFRwXPtiQ3AotJxvXs0QgZk0EXr3S9MPyQkCK/Mn4wXq
	IzxteStRlArTXLBM/A2w6+IDwCyOauoKy9Z87xbjTbaAwxSn7IQv6n9XEWi/ZDdbPzIC
	tHPC7c+EL7SJRazJSxdwmZLARrDrf+b5cEoJ27oV/Ys6CMioL/ejwKcw/luRaYFOYzXb
	78YjP4H/Rkqn5Sm4sjBGtKGdCUBSwU1/4Ru3IYf80VX4HFpGB+dINP+BWi68KJFW3u+a
	2c/A==
X-Gm-Message-State: APjAAAXPVZ1X6tpTPq/KsmSv4s95ZOzVrhGDYjYOyH6VJo6nLeTHGIRk
	QNzTOLWyuaLXW07MmpgtGgVcc3iBzd8=
X-Google-Smtp-Source: APXvYqwEsKj6cMXeCOIsVcH8vKNTAyj8YO8RjPkuy8VJg451+siqyakC/PT6vZwlZTEV5g0OqC2jGg==
X-Received: by 2002:adf:a49c:: with SMTP id g28mr5298594wrb.147.1551720710863; 
	Mon, 04 Mar 2019 09:31:50 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v67sm10137991wmb.9.2019.03.04.09.31.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 09:31:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 17:31:40 +0000
Message-Id: <20190304173144.25675-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190304173144.25675-1-ross.burton@intel.com>
References: <20190304173144.25675-1-ross.burton@intel.com>
Subject: [PATCH 2/6] packagegroup-self-hosted: remove lrzsz
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
X-List-Received-Date: Mon, 04 Mar 2019 17:31:50 -0000

A X/Y/ZMODEM transfer tool is not a required package for self-hosted builds.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 9a6721ce031..b296db5457e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -128,7 +128,6 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     libaio \
     libusb1 \
     libxml2 \
-    lrzsz \
     lsof \
     lzo \
     man \
-- 
2.11.0


