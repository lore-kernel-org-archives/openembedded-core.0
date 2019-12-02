Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC157EC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 17:55:19 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id w15so255398wru.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 09:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q6BkYd+COG689iAftSd57KiAAQcLi6umK822nfZ5tnA=;
	b=tOYb4iD1j6tadfgtbW/WH6G21C282crQ6ryHV66WgFeKnkIujkdICiCvW7a+mOsRmu
	heRRazk7hg6eY6GLBS/o5fbOWtcrV1UMAt9dEhKkxZpUsk+JDtizCEAMGWBNOXfmcZA+
	9QjtVzdstFt1eg/CE0gdnJaYmhplGLUgKCxLwqujJV8f8ff73fsbthCK6ExL3U3jdtpe
	MkECvnio1RrBBejWKM9h5HKpP7pJpDzpNYVfxDnVBGJ3S/QRbSsj8bFCEuw41tcopXcm
	/xhUbxLB+hJrqd4dS8jBoZdo19DSG4k8cBQBTgk+vwWDWcQs0ISURK2DbWQ1ZR5OzujP
	bs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Q6BkYd+COG689iAftSd57KiAAQcLi6umK822nfZ5tnA=;
	b=tynA4ecmc7G2MuRjJf82nsrFgeT2zjChFH3TdOh6QxAIVfCwdgY+mdOcMVuK20cr9s
	Bf8M9FnhfpAIJ0JP4QhPPoNFplRAHdaBAYDMFMYP7C+/YtGwNcXqrF1XS3bJ9VS/tmHk
	eVBMkSqypyO3MUt4ziGeFORIXiX4oXsWblpmffFGZnCMl9F1gnbbdAc5/t9Yl4tR9ItJ
	M2mOt0DIR7Ztd5nR9id71ZQ0aXN6tJnS3jXyohgPHgLWVfxfL0wlxQNM2CRPHjJR0XyM
	wZPcC7oI7rt4SBiVfyI85v4ozHEJy/tczVI9u/3WZLuOy6pM4LKnfL6uppQKtMhdsDKa
	+0dg==
X-Gm-Message-State: APjAAAX6OnlzzpiE3PxRA0aNRpjEQl7hcvMN+kbrgYMELZumWYayTyMG
	k+IGuRnd7F/3F8eHXCDEWeVU6VgW
X-Google-Smtp-Source: APXvYqxdAyGzv3ra5AmMcJfdpwi3eSbFczJCCSzDfpmtBHgxAUb3OwpS65RjEO3paW0PrB1XL8znDQ==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr79591wrv.259.1575309319822;
	Mon, 02 Dec 2019 09:55:19 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id y8sm144069wru.59.2019.12.02.09.55.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 09:55:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2019 18:54:57 +0100
Message-Id: <20191202175459.112655-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202175459.112655-1-alex.kanavin@gmail.com>
References: <20191202175459.112655-1-alex.kanavin@gmail.com>
Subject: [PATCH 16/18] selftest: skip virgl gtk/sdl test on opensuse 15.0
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
X-List-Received-Date: Mon, 02 Dec 2019 17:55:20 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index ccd2c40aa3f..7aa9fb25da2 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -181,6 +181,8 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Debian 8')
         if distro and distro == 'centos-7':
             self.skipTest('virgl isn\'t working with Centos 7')
+        if distro and distro == 'opensuseleap-15.0':
+            self.skipTest('virgl isn\'t working with Opensuse 15.0')
 
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
         sdl_packageconfig = get_bb_var('PACKAGECONFIG', 'libsdl2-native')
-- 
2.17.1


