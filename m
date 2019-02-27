Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4A15F7BFD0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 17:47:40 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id i16so18930680wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 09:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lwKQw1BstoF/+L78VfAlwJAtsZsU6D0R6DkLhadBQlI=;
	b=UG63pPALMUD1cK4oDy1Y8mRSZnIJRVHE7Wy4gs/o8p2/zSh5B6gWP7Cbs2zjryB7g9
	2kGAxnWVSxXuYuYCVsI70KqFmfDpN7AkAliBRglZknGNUfvlJEi6JlAEc9uqMvdcctJN
	NQrp/VXey0NCTnDtL5OeD4kh5qTpoi71GE7lC7lnkKkH2+9hobrkfWz4s8s33zYt7y5x
	IfUy0GR5Agl/F6H7BbZNBoLUDjsoG91RAsC3aNZHWQfmLQF/sG9vb92F/nMfZ9X2SLhB
	qY2TBcrjZRSUyhFyggwEN6840XpNJS37CihhHN31m0oQguAqG11wv7vK0lhen2cG5it5
	kBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lwKQw1BstoF/+L78VfAlwJAtsZsU6D0R6DkLhadBQlI=;
	b=df6pgB+//4PF/DAx8uP3yFRVdtSUAT0bRel7Ww9qGyCPlusrPlOzpfJU0nxZ4Zwk2a
	Mq45SJt95/QLJ6D+52xIUxBrhQHcJk7vKCtS2nMova//hES3pSbHT64gse397IKVccum
	SU8ls2d849sxeLCiWPM/awyOk7G7e12BDPzEsSxc8AqgpEROl0+hjAV0mXtNsIc3rcbR
	9DLDp+IF0tud+H0mx27Im2YhHiWDVq3yCp/7Jurhdhz2f+SdJSWyjrYk7ESlrexLbnHO
	WLuvfkjKgRUw/SYh9/xEx1KL+OeRVsjflo481FWD4YrIJ8ZdCm5Suk5qLIzY97XjbgJc
	hAUw==
X-Gm-Message-State: APjAAAVmYWOeXC4JZzbbA9aEGn+fh8JbnpHBWAytCKjQbxB0ZAyvc2yI
	rGbiszoNLgcTVlyMOp/M3QAow/Xl
X-Google-Smtp-Source: APXvYqwjyOeEe5fYNz7tL6jXve2K0UefwgL01kJ3hIn7vUrjMCBI1NcXBoRQrKYJCp23ywAfiXnRMw==
X-Received: by 2002:a5d:4841:: with SMTP id n1mr3340746wrs.85.1551289660773;
	Wed, 27 Feb 2019 09:47:40 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id g3sm2056294wmk.32.2019.02.27.09.47.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 09:47:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 18:47:33 +0100
Message-Id: <20190227174733.107911-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190227174733.107911-1-alex.kanavin@gmail.com>
References: <20190227174733.107911-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] local.conf.sample: adjust the qemu configuration to refer to qemu-system-native
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
X-List-Received-Date: Wed, 27 Feb 2019 17:47:40 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/local.conf.sample | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
index 267108d6850..9068e567dcd 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -241,7 +241,7 @@ BB_DISKMON_DIRS ??= "\
 # seen. The two lines below enable the SDL backend too. By default libsdl2-native will
 # be built, if you want to use your host's libSDL instead of the minimal libsdl built
 # by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
-PACKAGECONFIG_append_pn-qemu-native = " sdl"
+PACKAGECONFIG_append_pn-qemu-system-native = " sdl"
 PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
 #ASSUME_PROVIDED += "libsdl2-native"
 
-- 
2.17.1


