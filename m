Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8547FDC7
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:35:01 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id a33so27755334pgm.5
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FGdQ06L+8AO2jYEi6Yk2DLFJAG/84Bb46vaODV8E2mc=;
	b=f19owfhUJOD+nD75oQYy37i6087bOoNiaRInk8mUYXli5LKGLwMvlkXuLkz1zDSaIu
	/0E5xTRrEjdQwc3c/kIgqI/T32vbn2UAHLx+oOHEpBKQ7RpYIEt4o1EH0lPLnkAf/E2f
	PrOUJLrwawJeCItzUQWKbU8rAdcM9cL74eR8H2uiMlQjD4yqiGYkZ4dQSw6zcMjCVnMt
	rSTjKpftO4cT6IA6c+FUHa+6y85SIJbPcC1Rvx3ju2sIqDG6Nr6hQdwA4IOVQyZsbc/A
	DbD6/9sd6liKZFAyRwYWT2tqard3n+aANEwkisv6RBuTD/u2kF3j4dnxeE+wUZ/Yqsx0
	QYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FGdQ06L+8AO2jYEi6Yk2DLFJAG/84Bb46vaODV8E2mc=;
	b=VX1XdkKztyfUE2sgE3siPisil15Jb1/I031lD+PTd/+mlbSY2F3jU/j7qNRVvLtZru
	veI3JJzMO9Xe8DJJVaNbx9EDcRyx9MJ88IpMSWfiViwUfQ4Nyil9VTIvcSnjy1NzJV83
	YM7dTf3dTA+xQv/GpaGUIcHqgThU9Z52Ah7aVOR82geuEf93kcs99eEW4poIaX2InC7H
	YRY6k1wmsfwSOJnH4GdcyOdq8cN3MWTjTS0ulztgndk0Da0qG7oiLMGnTeX2h62BknP6
	MxtlOUTUd1D+3VBPAOK16/qZkPFRET7uIoP4mSf0TDemDLU9n1HMODYJX3RjyKcFuPvg
	3+gA==
X-Gm-Message-State: APjAAAXkXBkF7X6qi/Dk2CiDyt7qblnfpI0CYoA1wpQ5WJ6cAXw0hzGQ
	c6w2bEuBF8T+eTV7nVPDD2Wlm5bw
X-Google-Smtp-Source: APXvYqyJnjT9da7pHZ590wc6FZAUEQmQJLYICPUO+I2SCh0SFJpVLNfMsKlWQC6wdaf9TVmNFhiQhg==
X-Received: by 2002:a62:e40e:: with SMTP id
	r14mr111457942pfh.115.1578364502622; 
	Mon, 06 Jan 2020 18:35:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.35.01
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:35:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:30 -0800
Message-Id: <537b6578673f39deebd69ad1d171546bef967cee.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 25/28] python3: Update to apply libgcc fix to libpython, glibc only
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
X-List-Received-Date: Tue, 07 Jan 2020 02:35:01 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to account for review feedback on list.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec788594f3f6a47687c6eb321437f2d2b58b1518)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python3_3.7.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.7.6.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
index 407c5a2bd9..b33b7028d4 100644
--- a/meta/recipes-devtools/python/python3_3.7.6.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -323,7 +323,7 @@ PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
-RDEPENDS_${PN} = "libgcc"
+RDEPENDS_libpython3_append_libc-glibc = " libgcc"
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
-- 
2.17.1


