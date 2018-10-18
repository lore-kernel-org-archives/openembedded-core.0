Return-Path: <danismostlikely@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id DD35479C3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 15:24:26 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id b4-v6so34649741qtc.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 08:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zxIz00ou9ptzaNXUmEJZQ9s54X3V1lgFiTQ+L5sKQg4=;
	b=jfOS2JhguyZGFGlj5WuUisKmgljN0/0uf/Qt6Ta8RUI/axt/AacjKB8RK/+Y9fHlMi
	H0WLh48NqRfCG0v6girvob7v56csZs3iPGo+ZGdWAV2f1CImIlSFvB9EdF9ewJSFkkjZ
	1egtr41Foy1K5OW4HijtiJgyDW3toJmaoLburNNInFxGdjlRZFlgKRGjF2Sfr2R1l0CJ
	WQzQ6aS7YLY3EMGbXHqQFuQ/dlt4nxNkscerU8E3b1EEV3iKKtrAbkxM9T05OaBSOZzK
	8dB3gPVgDWL/YhEa+rGlQHvE/3YZpwvxuSm868/Urno6zMoz+0iKXzgNDe6Wu7FUGHp6
	NoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zxIz00ou9ptzaNXUmEJZQ9s54X3V1lgFiTQ+L5sKQg4=;
	b=ffD+onx2oZecuq/H29j8fISo5aHZv0KfzvNbzXX/g+dAcj1A/WR3QL+6Ig3rmvPBsi
	aD1Wr35mVAF3iq/mfqP36Zy0H6zoI902QQ+nmmIy/nFVcw4S5h5DXfD1YStnmox6knoX
	U4dCwvZzqmurF58abrMMMrhgv+/eYGbxEybaJnfVjm06yRt8SujlZOrC5k6Bur5XdHFJ
	EvcjcT+pvxgJvIDCE+/4KIu0SPFrcqAaLcZfJEHGS51tODm/DlxDydZ5qLHd2X5GEbal
	BkpAq+Qd1OrnChLxEjz8LaYlHueMePo/cDLMBBM8r6xMihc4g/xnfk4OV08BNOn1+UR+
	BuGw==
X-Gm-Message-State: ABuFfoiKB29XjtsT3MJq+NF/zylOcY79GgTNKmi913e17KMCatm6bSjP
	ZOMUBGsO/8E5qLy+v1POSZl14MFw
X-Google-Smtp-Source: ACcGV60ntrM4OyUjnetzjaMIvZkvSsbwUqWefy4oslnWpMsU4OQhCEK4pFPE/zJW8LHOUeYsOuf7UQ==
X-Received: by 2002:ad4:40cb:: with SMTP id x11mr10476447qvp.52.1539876267396; 
	Thu, 18 Oct 2018 08:24:27 -0700 (PDT)
Received: from mediabox.local (204-83-204-143.prna.hsdb.sasknet.sk.ca.
	[204.83.204.143]) by smtp.gmail.com with ESMTPSA id
	d43-v6sm16523555qtd.69.2018.10.18.08.24.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Oct 2018 08:24:26 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2018 09:24:23 -0600
Message-Id: <20181018152423.24962-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.19.0-dev
MIME-Version: 1.0
Subject: [PATCH] os-release: move to nonarch_libdir
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
X-List-Received-Date: Thu, 18 Oct 2018 15:24:27 -0000
Content-Transfer-Encoding: 8bit

From: Dan McGregor <dan.mcgregor@usask.ca>

Even on multilib systems, /usr/lib is where systemd expects the
os-release file to live.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/os-release/os-release.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index bf4f815a10d..7f3d9cba00c 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -42,9 +42,9 @@ python do_compile () {
 do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
 
 do_install () {
-    install -d ${D}${libdir} ${D}${sysconfdir}
-    install -m 0644 os-release ${D}${libdir}/
-    lnr ${D}${libdir}/os-release ${D}${sysconfdir}/os-release
+    install -d ${D}${nonarch_libdir} ${D}${sysconfdir}
+    install -m 0644 os-release ${D}${nonarch_libdir}/
+    lnr ${D}${nonarch_libdir}/os-release ${D}${sysconfdir}/os-release
 }
 
-FILES_${PN} += "${libdir}/os-release"
+FILES_${PN} += "${nonarch_libdir}/os-release"
-- 
2.19.0-dev


