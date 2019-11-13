Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id A19FA7F7D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:37 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id a18so1209988plm.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Xpw+6a7b+ZWsOQ4dSSMnGDtZIuvfEaSDqkxaL1fT29o=;
	b=MsmS0MMF+36wjmm09N/RNg2omEGykyjGfwddgWhyHMKBMZ8nXnshigN9q0tgKNofDP
	/ecEFrB/26UmefHRPz4hmupWOKgt+ACCclX39cWWVQF7jmkfnfaX/uZDHSoTZATaai2M
	DdCQHIGRDCZ/oDW+gCa0Cu32Hc8QgUR/maqIqaO5ZmFC4Cxvfs0eS0+9nKxLA+piPJ0b
	GHmWtoNynvpwaDokwaZL41ssYZpsXM01fiEeEVibrqeW7DAjHUJZ748myq1r++NUs/dc
	P5Sl7x0z7dFCEqP/k4aENUagDDyB41As9J/zcLrj8nxKL7hop/6aKJCcQpA7FwoR0023
	X81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Xpw+6a7b+ZWsOQ4dSSMnGDtZIuvfEaSDqkxaL1fT29o=;
	b=eRSLeqevWkdrDQATcDY8mea5VOG9c3AXjJml+/gPj8y0PClsC8/1xhkobZ9fZUWoOG
	Ze8tJn5Li8L8PlzbONma1c0EB0cGEo0r1Un5sL2uSVGEmHMh8ZOdAqfvCwMHwr0I8AO8
	PFC5JugN7XwJ1fNxBA5b3RFo6oWf1/MIvFverZ4sv579nUWHIgEqw/3HbObTDxvxK1DT
	JMFsRApXjsbVp7J0CdzM+X4wxF2orRYX7AnGkwXZcgLWWMsZr6R0tiJuJJggKFyWfM4m
	r36VtZ3kiI5006EUPjmCrUD1WVEXncUYl11Tw/PQ5ejawWPKOqZ5VX2XJHZ36/3INz6y
	f+/g==
X-Gm-Message-State: APjAAAUy1iPHS+zp0zgRggJe2n1thdavxlz9CcXvH0NrZJ5D6IaxAI4i
	923iVXrNS8CWwfAdINJuEZ0pM5VT
X-Google-Smtp-Source: APXvYqxXu8nEBM1Q9FaZ7xxjxwrKTdX7Pxf3D32EPKlPAe47gVN9RGoR+5EVC7jmHR4UE6iEDC+6xA==
X-Received: by 2002:a17:902:b482:: with SMTP id
	y2mr4529946plr.128.1573659158449; 
	Wed, 13 Nov 2019 07:32:38 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:55 -0800
Message-Id: <4668ac8c2600fe5698f030ed1e8cba69c0989a2c.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 13/31] file: run test suite when building natively
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:38 -0000

From: Ross Burton <ross.burton@intel.com>

As we apply the same patches to native and target builds of file, we can verify
that the patches are not breaking by executing the test suite during the build
of file-native.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/file/file_5.37.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/file/file_5.37.bb b/meta/recipes-devtools/file/file_5.37.bb
index 509b6ce..60fc661 100644
--- a/meta/recipes-devtools/file/file_5.37.bb
+++ b/meta/recipes-devtools/file/file_5.37.bb
@@ -32,6 +32,10 @@ EXTRA_OEMAKE_append_class-nativesdk = "-e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/
 
 FILES_${PN} += "${datadir}/misc/*.mgc"
 
+do_compile_append_class-native() {
+	oe_runmake check
+}
+
 do_install_append_class-native() {
 	create_cmdline_wrapper ${D}/${bindir}/file \
 		--magic-file ${datadir}/misc/magic.mgc
-- 
2.7.4


