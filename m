Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE8865C5B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Jan 2017 19:53:36 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id j10so66687386wjb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Jan 2017 11:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Z/Hm2A3eqwg29O1Vlh/AuexC2oUefndy3LVD/w26go8=;
	b=ei1ehY3XZq92vwgKg8GcABLbogmV1zU4ky4tyiK5b6AlOzQgZtPz4ki01hadsjZkWs
	Gf7ZmDGkKXzHxN3JT4pw3FmVf+5rcP75xuMMqxXn8a4nmGwJFkkwed2fPzQqD73KvQCM
	Te/fPTyXTp5XcM8yxL060W+O0/R1fIGYt5Raur6BVFywKInsrRPzQgElj7ven0rs7/4O
	yTnJyx4KnChfjcqvbok6VEkdinFMFxOtsQ2c0nE9bp73urJeIT5TPWo0AgXxCke2e131
	hS3Yb1wq9lIVoMs9QE0YoSAu6vBU8qtwjflhlWWMZothADoMMZWxrV00PodZ5bgaduSd
	dH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Z/Hm2A3eqwg29O1Vlh/AuexC2oUefndy3LVD/w26go8=;
	b=bU0sPw9VWBFP+O6kRmpXdSjgi4h3R38MFUFb8jQWR10IneE2t13FktTdsO8ZTZ+1gM
	q483nUDn7l9b0uuNF2doiLHPvJJx3Zgs6gbwP7sBhRbiUkt+UTY3qUSyizls1RS5I2la
	fkVuSR9snkZ35i7g5Cb7WZYGHA3sbV1TXyQNMSJnXuU9Wuaqybg2TmJGwmP9gh0lRGsu
	L8hdpMrPw1HkHZQfbJ4WBG/Avwx4k/onw9b8XCojQtKQh0tPxBzrPhZXHtuQ5Ecv5XN1
	yF6Snt3W/SMACT2KeuyT1zOe3k892pB3o4CWKXXOJLESQNAz/LutWtkDIQVK8/lKgfjD
	mROA==
X-Gm-Message-State: AIkVDXJDbLnjEx3Erpk/F9yE+mYmX3aOaeI4+s7RL3LzhXoBaFMuT0RM73IDuf6S/2PPnA==
X-Received: by 10.194.123.103 with SMTP id lz7mr54464108wjb.100.1483300415880; 
	Sun, 01 Jan 2017 11:53:35 -0800 (PST)
Received: from localhost.localdomain (p579F77E4.dip0.t-ipconnect.de.
	[87.159.119.228]) by smtp.googlemail.com with ESMTPSA id
	t194sm63631951wmd.1.2017.01.01.11.53.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Jan 2017 11:53:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Jan 2017 20:53:12 +0100
Message-Id: <1483300393-10174-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1483300393-10174-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483300393-10174-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] alsa-utils: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Sun, 01 Jan 2017 19:53:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../alsa/{alsa-utils_1.1.2.bb => alsa-utils_1.1.3.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.2.bb => alsa-utils_1.1.3.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.3.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.1.2.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.1.3.bb
index e1651ae..07c25c4 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.3.bb
@@ -23,8 +23,8 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
           "
 
-SRC_URI[md5sum] = "38ac7c781f80c41c02b4664d8cbafa87"
-SRC_URI[sha256sum] = "7af603c0877d1251599d65b4fbc372e63a54371b888f5c26c6a86ac1d0519071"
+SRC_URI[md5sum] = "2bf94d3e3410dcc74bb0dae10d46a979"
+SRC_URI[sha256sum] = "127217a54eea0f9a49700a2f239a2d4f5384aa094d68df04a8eb80132eb6167c"
 
 # lazy hack. needs proper fixing in gettext.m4, see
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
-- 
2.5.5


