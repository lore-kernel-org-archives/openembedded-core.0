Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6378260118
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:12:39 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id b14so13785259qge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=kdndQO3db5mc8HZP5OFt8MZELGTxGFJbtkmvvspeqdU=;
	b=lsol+bBYgYoUp/pn1LlQCYTSNPMkP2kzNfzl5CzRsHmKn+NiXD94Wtqo87uGdwalUw
	Ta2rDWfVl+mcEM3U/fUIQknroTvcTBkIe/n2KTKcrsO1oeVkwF8JRfPOwWqE6EqDTznm
	nzsU2zHfvzsF9s8TNie8If2lgpb+5DDz3+dm4hN1itf0izi23KI/g60vBpzeD2x0zlAx
	OsDp+IEE/jQbNQJd9YwM1uvtAXIBxtlHyynagmYjUEiJn+HqVefEpD37+ZXR9RYTyuMF
	5VHcmvyA+nYZGSW52qKh3IH8/phFrI8H3PMy51D2wdz9lvPjykSL4tVLDS3VkIMh0/XI
	FK0w==
X-Gm-Message-State: AOPr4FW4vR0PfSnCJxqBq/o3eQM2EZZWq4B/dWBC8MqhViYu9KfuVpoHpagQmazM+iGGlw==
X-Received: by 10.140.91.194 with SMTP id z60mr30524733qgd.70.1463425960640;
	Mon, 16 May 2016 12:12:40 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	m129sm15587673qkb.22.2016.05.16.12.12.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:12:39 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 May 2016 16:12:31 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:11:59 -0300
Message-Id: <1463425932-10080-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
References: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v6 01/14] weston: Use HTTPS for tarball download
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
X-List-Received-Date: Mon, 16 May 2016 19:12:40 -0000

The tarball now is served just on the HTTPS URI, thus update the
SRC_URI.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6:
- New patch.

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston_1.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
index ac9c405..fec1e9f 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     file://src/compositor.c;endline=23;md5=1d535fed266cf39f6d8c0647f52ac331"
 
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://make-libwebp-explicitly-configurable.patch \
-- 
2.8.2


