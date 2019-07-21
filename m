Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6697ED91
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:38 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id i2so17905770plt.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+0PDOZz2cAqj8sQOlHdRED2kxYT0anLKsKIWmX95thM=;
	b=becWE044Vw7cS9aldaJFhMmsRO+J556ubz348bolygBUQCOV+obRpX4vt0vDc5APGk
	bamem2HxSI5FZTVwc0QXqCB1YC3xNUl3q+UDH76whP9p5TTGVJ4+cpa8/i++dmSpnSdr
	aZO0VmdeGz3ZXCHT87enTzCUUZvALWKocfoOqb24hbdtOOfHaZaPRVkQhmlnBJddtDqe
	jrnOCeCH7AC0MIj4Im2/xBsiWyMhRR9KuCghq45uQLpgJLCVPRi2XgSyngZhmkBmw3Z8
	34KahmRoGrGNVgtuCxo2s1KI/ViIAV6N09g2acFfMHaW7oQj1/FGIrr027xwQ5MSljmj
	O8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+0PDOZz2cAqj8sQOlHdRED2kxYT0anLKsKIWmX95thM=;
	b=gjadMGQhIRtoUXdqQKbVB0+AYM7TV1KDj3v1sWuEqh8VMqiclGGmGy2lcDMSvBy4HO
	jR6jHRSdSX9FT55fjdeC6wkejGe+REYgIhvoUMAPBpik4bW9PzpHBnUJGFGxchXq9ZFN
	bMelwhjhJKp4+9ruErvkS79Mg4YbAdqU2r2enUS2WEFWE9hJvGpXyJXf2tek3EhxujhO
	S465GXO7GGf7gRoO6hiYS+f7ibThddms/a5crG3gIFjWVfU3mliy+V/OYm589tgYhAKK
	2xR9IVWFkrLm3r68XybmjYX8SRjKZiWrMoqdqNj0aWwogrOa/ulcuhkTz8pMmWnUarrj
	hvxA==
X-Gm-Message-State: APjAAAU0emFPHryfNFPO//TIQWN2fuEGsokgA3qodbffLvAsMHboq/g8
	tLEzAyc2gHYCVn6e8J0TM7xp6s9B
X-Google-Smtp-Source: APXvYqwU4ba/veB5DiuLHD9HqCJPoL5nK18aFFjsWINbE38QYpFoBd6/1DxbKXSckYwfA+JgXlEXiw==
X-Received: by 2002:a17:902:704c:: with SMTP id
	h12mr67217285plt.318.1563719140067; 
	Sun, 21 Jul 2019 07:25:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:05 -0700
Message-Id: <d05e98cdccbe36be8906c31249adeb0f0bc13ac5.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 16/30] wpa_supplicant: Changed systemd template units
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:39 -0000

From: Joshua DeWeese <jdeweese@hennypenny.com>

I goofed up the scissor line on the last attempt. Not sure how much it matters,
but here it is correct this time.

Here it is, updated to work with wpa-supplicant_2.6.bb.

-- >8 --
https://www.freedesktop.org/software/systemd/man/systemd.unit.html#WantedBy=

When building root filesystems with any of the wpa_supplicant systemd
template service files enabled (current default is to have them disabled) the
systemd-native-fake script would not process the line:

Alias=multi-user.target.wants/wpa_supplicant@%i.service

appropriately due the the use of "%i."

According to the systemd documentation "WantedBy=foo.service in a service
bar.service is mostly equivalent to Alias=foo.service.wants/bar.service in
the same file." However, this is not really the intended purpose of install
Aliases.

All lines of the form:

Alias=multi-user.target.wants/*%i.service

Were replaced with the following lines:

WantedBy=multi-user.target

Signed-off-by: Joshua DeWeese <jdeweese@hennypenny.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...place-systemd-install-Alias-with-WantedBy.patch | 52 ++++++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.6.bb           |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch
new file mode 100644
index 0000000..a476cf0
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch
@@ -0,0 +1,52 @@
+From 94c401733a5a3d294cc412671166e6adfb409f53 Mon Sep 17 00:00:00 2001
+From: Joshua DeWeese <jdeweese@hennypenny.com>
+Date: Wed, 30 Jan 2019 16:19:47 -0500
+Subject: [PATCH] replace systemd install Alias with WantedBy
+
+According to the systemd documentation "WantedBy=foo.service in a
+service bar.service is mostly equivalent to
+Alias=foo.service.wants/bar.service in the same file." However,
+this is not really the intended purpose of install Aliases.
+
+Upstream-Status: Submitted [hostap@lists.infradead.org]
+
+Signed-off-by: Joshua DeWeese <jdeweese@hennypenny.com>
+---
+ wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in | 2 +-
+ wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in   | 2 +-
+ wpa_supplicant/systemd/wpa_supplicant.service.arg.in         | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in b/wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in
+index 03ac507..da69a87 100644
+--- a/wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in
++++ b/wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in
+@@ -12,4 +12,4 @@ Type=simple
+ ExecStart=@BINDIR@/wpa_supplicant -c/etc/wpa_supplicant/wpa_supplicant-nl80211-%I.conf -Dnl80211 -i%I
+ 
+ [Install]
+-Alias=multi-user.target.wants/wpa_supplicant-nl80211@%i.service
++WantedBy=multi-user.target
+diff --git a/wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in b/wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in
+index c8a744d..ca3054b 100644
+--- a/wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in
++++ b/wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in
+@@ -12,4 +12,4 @@ Type=simple
+ ExecStart=@BINDIR@/wpa_supplicant -c/etc/wpa_supplicant/wpa_supplicant-wired-%I.conf -Dwired -i%I
+ 
+ [Install]
+-Alias=multi-user.target.wants/wpa_supplicant-wired@%i.service
++WantedBy=multi-user.target
+diff --git a/wpa_supplicant/systemd/wpa_supplicant.service.arg.in b/wpa_supplicant/systemd/wpa_supplicant.service.arg.in
+index 7788b38..55d2b9c 100644
+--- a/wpa_supplicant/systemd/wpa_supplicant.service.arg.in
++++ b/wpa_supplicant/systemd/wpa_supplicant.service.arg.in
+@@ -12,4 +12,4 @@ Type=simple
+ ExecStart=@BINDIR@/wpa_supplicant -c/etc/wpa_supplicant/wpa_supplicant-%I.conf -i%I
+ 
+ [Install]
+-Alias=multi-user.target.wants/wpa_supplicant@%i.service
++WantedBy=multi-user.target
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
index aa4c4c2..c92ed4a 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://key-replay-cve-multiple7.patch \
            file://key-replay-cve-multiple8.patch \
            file://wpa_supplicant-CVE-2018-14526.patch \
+           file://0001-replace-systemd-install-Alias-with-WantedBy.patch \
           "
 SRC_URI[md5sum] = "091569eb4440b7d7f2b4276dbfc03c3c"
 SRC_URI[sha256sum] = "b4936d34c4e6cdd44954beba74296d964bc2c9668ecaa5255e499636fe2b1450"
-- 
2.7.4


