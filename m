Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4FCAC916B2
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:04 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9so2848068plo.11
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/HB6zniz5DAdVMakJ2rwSBNXvqYgF4PNJMVPG2uA81I=;
	b=m+9HOc7CO8VHKMJ/V8yKRm4+QLu0bYhHS1vsEZ1jQW96VLCzFANvUeTJV2RfWlCt31
	GJ/9AL3hmjjXQw7Hp5AXHS95/mvmPwlPX4QMM1UDdCdXZ7tU3PtFTwxu+i+oytGvsR1F
	477F53lhao0Wy9NqmF/2BXtcA5jJBNb4SZZm7HLDn9vUIWM0WylS35T2Q9oOJMWOLmXq
	Kh6PWiYEwiuJf1vq3Fz+uIo/9KPCofijf3i7IoehScpxYp7Ha5hyyvMgMBKKUdG/LmXF
	KUqY7Al1F0HHZmiZfSXkBO7lQOqtMNcLHUh9AVp4sobAj0F2Ad3rIkJffpSS22XsZ7pT
	4chA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/HB6zniz5DAdVMakJ2rwSBNXvqYgF4PNJMVPG2uA81I=;
	b=e3mpJtk+8IwTDzYpeJ1xt62aPLyB5cPa2QucsVwT13D0VIQWwfJWfKY0vx3Sdcnq/E
	tpOf+5sgJCnISCqOpO5Q0OLAq+mM/KkyOMYHnffQrMCd7AGMfa13r2dBP+pk0dajaaC9
	U7Az941lOApuig5PjkD2HiiFYmVFYdixkGW72xiv2QVt28K2gL5bH8Mf30jKBu5rLYEi
	0npClwRFB6mVPfpn551opUzVrn3TfrkmxvEGXP9k9iKmQJcIjuuLwePF1gPADOijmpfV
	QoYhqEftpx1CKc+bqPI5FF7zHVm+TfbiBTM7zDBAhPmSQn2mI9UIeJ66kfES4rlFBkb3
	tYzw==
X-Gm-Message-State: APjAAAXkQOOYEkV7GopNir3WhPV7+9EwdN4IOWKJ24XXfDeDIJ9hiceA
	d+aeEctI3DoEionkNxp8dshBFBrw
X-Google-Smtp-Source: APXvYqwyN2AVCWCHDyvSnsm0hyoLmo7CMyQaWDpYZ7Z7i/XCFQ6cjotip03/jsvp5gAy3GZJ6MD10Q==
X-Received: by 2002:a17:90a:23a3:: with SMTP id
	g32mr6515276pje.134.1580055905058; 
	Sun, 26 Jan 2020 08:25:05 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.04
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:35 -0800
Message-Id: <b4628dd1ef9d50e8778cadae09e6d31886bd47d2.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 10/29] libarchive: fix CVE-2019-19221
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:04 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Also see:
https://github.com/libarchive/libarchive/issues/1276

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libarchive/CVE-2019-19221.patch           | 101 ++++++++++++++++++
 .../libarchive/libarchive_3.3.3.bb            |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2019-19221.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2019-19221.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2019-19221.patch
new file mode 100644
index 0000000000..b57e87874f
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2019-19221.patch
@@ -0,0 +1,101 @@
+From 22b1db9d46654afc6f0c28f90af8cdc84a199f41 Mon Sep 17 00:00:00 2001
+From: Martin Matuska <martin@matuska.org>
+Date: Thu, 21 Nov 2019 03:08:40 +0100
+Subject: [PATCH] Bugfix and optimize archive_wstring_append_from_mbs()
+
+The cal to mbrtowc() or mbtowc() should read up to mbs_length
+bytes and not wcs_length. This avoids out-of-bounds reads.
+
+mbrtowc() and mbtowc() return (size_t)-1 wit errno EILSEQ when
+they encounter an invalid multibyte character and (size_t)-2 when
+they they encounter an incomplete multibyte character. As we return
+failure and all our callers error out it makes no sense to continue
+parsing mbs.
+
+As we allocate `len` wchars at the beginning and each wchar has
+at least one byte, there will never be need to grow the buffer,
+so the code can be left out. On the other hand, we are always
+allocatng more memory than we need.
+
+As long as wcs_length == mbs_length == len we can omit wcs_length.
+We keep the old code commented if we decide to save memory and
+use autoexpanding wcs_length in the future.
+
+Fixes #1276
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/22b1db9d46654afc6f0c28f90af8cdc84a199f41]
+CVE: CVE-2019-19221
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ libarchive/archive_string.c | 28 +++++++++++++++++-----------
+ 1 file changed, 17 insertions(+), 11 deletions(-)
+
+diff --git a/libarchive/archive_string.c b/libarchive/archive_string.c
+index 979a418b6..bd39c96f1 100644
+--- a/libarchive/archive_string.c
++++ b/libarchive/archive_string.c
+@@ -591,7 +591,7 @@ archive_wstring_append_from_mbs(struct archive_wstring *dest,
+ 	 * No single byte will be more than one wide character,
+ 	 * so this length estimate will always be big enough.
+ 	 */
+-	size_t wcs_length = len;
++	// size_t wcs_length = len;
+ 	size_t mbs_length = len;
+ 	const char *mbs = p;
+ 	wchar_t *wcs;
+@@ -600,7 +600,11 @@ archive_wstring_append_from_mbs(struct archive_wstring *dest,
+ 
+ 	memset(&shift_state, 0, sizeof(shift_state));
+ #endif
+-	if (NULL == archive_wstring_ensure(dest, dest->length + wcs_length + 1))
++	/*
++	 * As we decided to have wcs_length == mbs_length == len
++	 * we can use len here instead of wcs_length
++	 */
++	if (NULL == archive_wstring_ensure(dest, dest->length + len + 1))
+ 		return (-1);
+ 	wcs = dest->s + dest->length;
+ 	/*
+@@ -609,6 +613,12 @@ archive_wstring_append_from_mbs(struct archive_wstring *dest,
+ 	 * multi bytes.
+ 	 */
+ 	while (*mbs && mbs_length > 0) {
++		/*
++		 * The buffer we allocated is always big enough.
++		 * Keep this code path in a comment if we decide to choose
++		 * smaller wcs_length in the future
++		 */
++/*
+ 		if (wcs_length == 0) {
+ 			dest->length = wcs - dest->s;
+ 			dest->s[dest->length] = L'\0';
+@@ -618,24 +628,20 @@ archive_wstring_append_from_mbs(struct archive_wstring *dest,
+ 				return (-1);
+ 			wcs = dest->s + dest->length;
+ 		}
++*/
+ #if HAVE_MBRTOWC
+-		r = mbrtowc(wcs, mbs, wcs_length, &shift_state);
++		r = mbrtowc(wcs, mbs, mbs_length, &shift_state);
+ #else
+-		r = mbtowc(wcs, mbs, wcs_length);
++		r = mbtowc(wcs, mbs, mbs_length);
+ #endif
+ 		if (r == (size_t)-1 || r == (size_t)-2) {
+ 			ret_val = -1;
+-			if (errno == EILSEQ) {
+-				++mbs;
+-				--mbs_length;
+-				continue;
+-			} else
+-				break;
++			break;
+ 		}
+ 		if (r == 0 || r > mbs_length)
+ 			break;
+ 		wcs++;
+-		wcs_length--;
++		// wcs_length--;
+ 		mbs += r;
+ 		mbs_length -= r;
+ 	}
diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.3.bb b/meta/recipes-extended/libarchive/libarchive_3.3.3.bb
index af5ca65297..36d5bffe09 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.3.3.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.3.3.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2018-1000880.patch \
            file://CVE-2019-1000019.patch \
            file://CVE-2019-1000020.patch \
+           file://CVE-2019-19221.patch \
 "
 
 SRC_URI[md5sum] = "4038e366ca5b659dae3efcc744e72120"
-- 
2.17.1


