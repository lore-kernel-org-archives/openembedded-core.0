Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6D4C96C135
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 17:27:37 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id h3so8630026pfg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 09:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dJXVp/Q5T20pw6hbKZwu9n8bACmE5AQhKPP/uDeyQmc=;
	b=fbL1zcA8ITFoIRqiRin3N2UZmRboRyhE0LAUfMVx389zxuzfh0fKsNj5t9WIrgblVv
	wZ94EeZetQ59v+RfdHfBTpt4ACFPKQAt8A61tBHZpCCqzneV7HSgNtUdRSNX5tzVY378
	Q9VIonHPky4Qo4yEc2G4w3AX3tvrO93+S+Y4WBteqyJmMsk9DLbFTPd6n/uH3vPQbFFW
	3CqSzQz9c9ozISIgBGSBMMhyGVMrsgb+eaz6L01p/J2DnUU9iMfRo4RyPYflGkDomIf8
	2tmTgP4gfhHRh6OchJs/hrQFlXjVnxbdFetCvl/ViZa+WbQs8LhVeSnYfuNmPSZXtMgk
	07QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dJXVp/Q5T20pw6hbKZwu9n8bACmE5AQhKPP/uDeyQmc=;
	b=esDbons6+frCg0KFZUg1Y2DaqEBnxc3vF4Ba4VGOK0JeUhSV0sdGA1ZuQd2cpdz7em
	bkVroYtDWeE/MGPD3hSFcY2CSCpiD9glV6kY1taVG9pV2UPaSYkQXLzOSa5h9oVAs8b8
	ecZHDNiKN3JikZNExQrNG941tWNRpKCCBkY6g0SMD8Gbuft6cvQT3sNJHmyM9CXwvTPk
	AdAvk0iufJk4NZDZPHkvfZCiQUFv6eUtBFXX876QFrJyzYDnR9YQ8VbAmJcMjSnCxjs5
	NH43KBl8F2lvU8JJrth+HAxDXetL0fIzp/D7J1dyF4M+6mvmbh7qzf/Dp07rsSlZBuBM
	bidw==
X-Gm-Message-State: AGRZ1gJIy0rsM9AOjtMJZ1mjEXy13oIpysLWKZ2c/1rlCh7YdvDkGEQN
	g8AZ8mL7VGPDpDrZPYPNgVpOllJDWS8=
X-Google-Smtp-Source: AJdET5f/1b8sUl1C2wS+MtV2nFQmXeGWXZ80wuQYE7YMNEAjtwjA9oIiAGOv7Pon97uru1CV1rdGdA==
X-Received: by 2002:a63:2c82:: with SMTP id s124mr20434756pgs.73.1542648458064;
	Mon, 19 Nov 2018 09:27:38 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	g123-v6sm58598710pfc.155.2018.11.19.09.27.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 09:27:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 09:27:26 -0800
Message-Id: <20181119172726.23571-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] musl: Update to latest trunk
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
X-List-Received-Date: Mon, 19 Nov 2018 17:27:37 -0000
Content-Transfer-Encoding: 8bit

Complete changelogs are here
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=c50985d5c8e316c5c464f352e79eeebfed1121a9..79f653c6bc2881dd6855299c908a442f56cb7c2b

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 0d8f8eb2a4..f2b6361446 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "c50985d5c8e316c5c464f352e79eeebfed1121a9"
+SRCREV = "79f653c6bc2881dd6855299c908a442f56cb7c2b"
 
 PV = "1.1.20+git${SRCPV}"
 
-- 
2.19.1


