Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5BAFE7838F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:23:44 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v14so478137pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rE2/zVRkkOgYolNmJl3JpUrDHVhFy24/kunJzoF1Ks8=;
	b=TDRTznFwFJy79NDkJojGEnA2e/Yqj/b7wNuZOu9hnmDYYN3X1djEc1tm2+8k51i49S
	V0XvWfF4xQ52c8svpnEzNdbz02Fac6SvkIyMxWhrGfH4gBug+zhkuKCt7j54iWds3c/b
	3pTXXBzd4AxYGNH2wyE7VO1pdhYbX0F8BEaaUkbHsFaI2xcJmkLmL/0P7xaQ9GXg+a4s
	1OFwWKle2w6n9zjOTsLMV1L3J/EuEZveSpFi8iBRi/pY9Fmu+eF7YjzUorbAH1w0uZl2
	3isRF1ZPkSQN06phxJ+E40bDpGMkl1V7kUGQmlg02Tww6s+e411QM7ozy02X0ztZIST5
	8pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rE2/zVRkkOgYolNmJl3JpUrDHVhFy24/kunJzoF1Ks8=;
	b=o36rWxaU8XpB4S0FsHw/RlvuImL572KISEW5OhDzcbknTxMZ5i36Z10sUV1lBO0qv2
	6pDS+AxPv0Dln1+6EYQwZAiEPwXl0DmqVv7/AZ/NqX/mmdPTB26LZsiL5ffHtMnSvhQn
	XEfOOnes8D/PxvMvS4WObTnfSPArT3f4AM182Vab6nxMzErhdJ4OvU8RvqN3QHZDkgPK
	EektDTTR9yBTi7EcGhW892O9mYHNGN1AGCTBnoy5FZ09zoVmaDk+SYL3DZiUSN9+/4gN
	ZsVMXvfTS2fymBIdy2aNz1kaBUEP2u+M7ypIzOCOHGdo7rpMNC0KgIcNAH7b6hASm1+D
	UVyQ==
X-Gm-Message-State: AKS2vOz1x6XaynCClyCEmfqMQqoKHAl5Y+7O1KW3coesZIxaJmhnLt5Y
	A97OuXT4STYLC+2P
X-Received: by 10.84.217.141 with SMTP id p13mr635048pli.271.1497453825920;
	Wed, 14 Jun 2017 08:23:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id i2sm502948pfe.89.2017.06.14.08.23.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jun 2017 08:23:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 08:23:24 -0700
Message-Id: <1fcd2f1adf3506cc8d22cbbc538ffb7e1eebbf8f.1497453168.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497453168.git.raj.khem@gmail.com>
References: <cover.1497453168.git.raj.khem@gmail.com>
Subject: [PATCH 05/10] gobject-introspection: Disable generating static lbraries
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
X-List-Received-Date: Wed, 14 Jun 2017 15:23:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb
index 509fc5fa59..ce31097da6 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb
@@ -99,6 +99,7 @@ EOF
 # Configure target build to use native tools of itself and to use a qemu wrapper
 # and optionally to generate introspection data
 EXTRA_OECONF_class-target += "--enable-host-gi \
+                              --disable-static \
                               --enable-gi-cross-wrapper=${B}/g-ir-scanner-qemuwrapper \
                               --enable-gi-ldd-wrapper=${B}/g-ir-scanner-lddwrapper \
                               ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection-data', '--disable-introspection-data', d)} \
-- 
2.13.1


