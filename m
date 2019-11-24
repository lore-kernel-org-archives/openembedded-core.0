Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id EDD347FBF9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:44 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id s10so5611990plp.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fpjJ1oG4eLQ/WQlT/fCoQGFzfHyNGL4y7EoLl7wFyD8=;
	b=troxKw9cF+cqgrQEPb4jlmLPW+7riR4IGlCApABqoAtyjWrIlVIT3ZReKX9RLIu5d9
	ycbeFti2ISMW9w7eFQ1S4mP4Rh6cT3fiCTKTfQYSJsh0CWS/9lQheXPQTNuQ7esFlTFp
	AuWv8eTuGhxgXxJT0vRbmxncPZNdOMV+WPQhSESwAj9DBaLe/I8/fIOtTv224R9E1QFm
	JCKJqNRHgGba+Ejdzfp64jymdBBwDiSrYSpcWuYedaXzsjGbU9UZX6g5KpuDMymmKewg
	5ywVLb5ZPdTSAEGulwO6+uGrU7+qheFPG5ETH+4VBrOxy1J2WPUXviELiU3usapRpKAc
	noCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fpjJ1oG4eLQ/WQlT/fCoQGFzfHyNGL4y7EoLl7wFyD8=;
	b=Bc8YMjEHzHOkTZLRb+MyCm3fM/K/Y4c5xNxg4dUKnqrL3Tcmt+l5QXrCGy48/nK2k8
	o+1Uo8/AFHJe5ZFB9vrxREkfHWJLqE/f9+3HVC0+CJkMbdoW4NFI862rCHsK6/FfApaV
	P2AraGUR7fih0cSktPsh5PDlbqjR4n22uXlMmHhyT7tcfBmyl+hs+gKw72SRtsGNTzhw
	PCHLnMS+12iwbFw2LXNxzb95nVyBn4qJlw0tMIWiX/r9cmWtA3UF4aLXr6p3na5QVHyq
	9hp1NupiOQBIONPHWWW3jnrGqeNLjKsuIkoYVSBHupQ4ej3O1pRSPL0Plmxnf94K9Fey
	23pQ==
X-Gm-Message-State: APjAAAXqgbyYbW1DD5i9CQw3O5kPwvv6QMXD53g5EA5NuznBm7Du8G7b
	9F6Q7aoYtnLMzSat37xGhaMfBFmq
X-Google-Smtp-Source: APXvYqwpwQw9WRMRW/eoycsw1GJM83xXQQxJUQdIN6Zjpg5Au0BrKUsyl92cSxFcmsFA/8/HpL3KmA==
X-Received: by 2002:a17:90a:bc41:: with SMTP id
	t1mr35831378pjv.89.1574639445903; 
	Sun, 24 Nov 2019 15:50:45 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:07 -0800
Message-Id: <91948de716d5eb03c1c3bdaca7bc95d9159ab1f4.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 02/35] libsoup: set CVE_PRODUCT
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:45 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
index 357f2fd..3a735cf 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
@@ -15,6 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
 SRC_URI[md5sum] = "66c2ae89d6031b01337d78a2c57c75d5"
 SRC_URI[sha256sum] = "bd2ea602eba642509672812f3c99b77cbec2f3de02ba1cc8cb7206bf7de0ae2a"
 
+CVE_PRODUCT = "libsoup"
+
 S = "${WORKDIR}/libsoup-${PV}"
 
 inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
-- 
2.7.4


