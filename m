Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 37BDF6142B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 22:13:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t3so2372539wru.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 14:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2Trkz0mW9fRiTkzSGSq68pZPzi2/AyNCuRMY+Eh92JQ=;
	b=ZLgzIpURfBVKt+m/WgzTHMJre2zktDFe4ZG4aBY1srRWRrP6w4QQVOKoynf9QnUs3f
	32O9kPgMQt4lSbREeMqjaRzDX4zvaL/eZAhE5r/rlhTdh1aYJk+chmrVkhUkEJ8cejlh
	nGQbgnNyEPtZlUH3E0pRZqQKkbvfrvBAKkTQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2Trkz0mW9fRiTkzSGSq68pZPzi2/AyNCuRMY+Eh92JQ=;
	b=Y7piw5qUe3GBxHzGcqZ2g6mC6lXQX7uTrp5ay0WmubPnLEIXtiD0rRPj0m+RNzauUO
	evoc2H4gRt1xrDJeOtgFbOB6vWaJGK6PH/5bJ7Ox37LgYQ9Bc1un/pIrUBKKJ/htrrUY
	O0/V79IcJGxsU0DCNG2uE9TrBbNwpYhyHkL/q3CqxiJmqhku4cn04673fuhCtxWg6M8K
	Ny/CdjiL3nbzJmqHP/fYifqc8MBFo4HIRV63YYJ4RHUiaysRUQ2vNCSJoCtwf2dwR6Ga
	boDCeNw82J9fIS6enmpHVdKNB1MlYUgGUgYPEqngYHcmCo/ZI2R3t0cKsIbVMTmaBbc2
	paSw==
X-Gm-Message-State: APjAAAWfE1iwz8M0N8v4KNGBgrcVkfqBtPgYvbnfO/l9po0pXhSqjM3u
	XoEQ1lAWlBqdLewWTHXlGNWCLHNeA+Y=
X-Google-Smtp-Source: APXvYqz2gcwT3Omvqxhy+R4oqo5VxPjerZbVDb4lT7rQkPxg6Q+1MGKgS1cyKiRYsMtdYZkisSScLw==
X-Received: by 2002:a5d:4447:: with SMTP id x7mr37921224wrr.393.1582150437465; 
	Wed, 19 Feb 2020 14:13:57 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q10sm1621832wme.16.2020.02.19.14.13.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 14:13:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 22:13:56 +0000
Message-Id: <20200219221356.139495-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] distro_alias: Fix typos
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
X-List-Received-Date: Wed, 19 Feb 2020 22:13:57 -0000
Content-Transfer-Encoding: 8bit

[YOCTO #13433]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/distro_alias.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index e314642b9c3..79ebcaee299 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -15,7 +15,7 @@ DISTRO_PN_ALIAS_pn-alsa-utils-scripts = "OE-Core"
 DISTRO_PN_ALIAS_pn-atk = "Fedora=atk OpenSuSE=atk"
 DISTRO_PN_ALIAS_pn-avahi-ui = "Ubuntu=avahi-discover Debian=avahi-discover"
 DISTRO_PN_ALIAS_pn-babeltrace = "OSPDT"
-DISTRO_PN_ALIAS_pn-bjam = "OpenSuSE=boost-jam Debina=bjam"
+DISTRO_PN_ALIAS_pn-bjam = "OpenSuSE=boost-jam Debian=bjam"
 DISTRO_PN_ALIAS_pn-blktool = "Debian=blktool Mandriva=blktool"
 DISTRO_PN_ALIAS_pn-bluez5 = "Fedora=bluez  Opensuse=bluez"
 DISTRO_PN_ALIAS_pn-bootchart2 = "Fedora=bootchart2 Opensuse=bootchart"
@@ -130,7 +130,7 @@ DISTRO_PN_ALIAS_pn-initramfs-live-install = "OE-Core"
 DISTRO_PN_ALIAS_pn-initramfs-live-install-efi = "OE-Core"
 DISTRO_PN_ALIAS_pn-initramfs-live-install-efi-testfs = "OE-Core"
 DISTRO_PN_ALIAS_pn-initramfs-live-install-testfs = "OE-Core"
-DISTRO_PN_ALIAS_pn-initscripts = "Fedora=initscripts Mandravia=initscripts"
+DISTRO_PN_ALIAS_pn-initscripts = "Fedora=initscripts Mandriva=initscripts"
 DISTRO_PN_ALIAS_pn-iproute2 = "OSPDT"
 DISTRO_PN_ALIAS_pn-jpeg = "OpenSuSE=libjpeg Ubuntu=libjpeg62"
 DISTRO_PN_ALIAS_pn-kernel-devsrc = "Debian=linux-base Ubuntu=linux"
-- 
2.25.0


