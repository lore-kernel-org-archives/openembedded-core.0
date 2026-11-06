Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1068.1793980450574989010
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 07:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=A0c3Hj2T;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so6844995e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 07:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793980449; x=1794585249; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clfm+/U19sZg9sywKiv6kk40P1zx/j97s1BGI85iRFs=;
        b=A0c3Hj2TRZFQdC0dVRCogIaeJ/fi4276WgEnSXX0EWlrdC9mZSA0eY+L+4+Hj7lQjp
         Tn9lDHqMefARPGVlgzOwp1EsgZ7GrDWA9T/rm2qMmXx/wUEKynDmA3Jir/WeAdOrTvH4
         eV0M95RzcXxNpMwsfjMBGSe0VTpqoOOXbq+ONYnNZc6BJY8d17J9q05UxPloaPjkzlAH
         DkXDinAKsfcQDqiaDT3FWYfzPb/XU2GdkYPiE9A/Gk4mJ8+12P2QxLfWcZ7vjtuNjNs7
         uYEZ6miq2C32R4DvTDWqz1uUpJzs8VIKCMUzdCfkXfJni/+Xbvgu+rA8UIukaqxDD1q2
         jAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980449; x=1794585249;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=clfm+/U19sZg9sywKiv6kk40P1zx/j97s1BGI85iRFs=;
        b=FwhZvyMShow619XLYPGgBzYX4IswKiCOhbopC0tBw3QM21sb+hfFgT4dXGyb+D+Ftk
         k58GmGSoCamNzVuUf5eGpmygh225N30/74npcR76k5qx5Vdl5rEQAWtV6n7uguvrvoXy
         VqL7tF7PmV2Bh1XpMTPDmhoLrY3hDTZLnnyhtkV8/MYhRnTG+Sdonmv18bcnbMTGdxVo
         KeDAQ5tZB93/9G7ID2Tova2a2zN3u5O/Di/WbVx/RW4fvZ4n7Y+g21cCfI+DTGb67s0h
         ZEmXamlPIwjqCTIvd6a3GhYoIp37nAPghui3bf/lsrW2zAgNlLh1C9lAPEEC+X8Bq6at
         m77Q==
X-Gm-Message-State: APuU4Z+rgzFQMHVHGh8hRVHxA0nBhkPRIHo/BXrSBvM9RkpqNX8GY1bs
	XJZvSdHdJHYrUiVL9Ze/zTwbTRvf9WVarBACCjlfN8vW1TWbxd6fOXPzliRbRBe83Y2po5RTYVH
	Qf1kczDM=
X-Gm-Gg: AYBFou3FGx1mCxSgwXTbgjB5JBB6T7pS4UWBLw0ma3vJK50HBYOfQpw01KarnUsUvsC
	z3GcOlxGVaBz/DeWfObBfV5JZTuckSd05HaAp/gZN3zMca2TicmhuKPJKiqyRqoHX4UOX0W8+LG
	oi2FYw69eX8WCOZro9JYTQJG9CuiTie7lBg/+14xQwwufKXzDjewAsx2/AbrR/LCbMn8tS6gN7z
	NCKasawIaU3n2Oe5dti3Dy/QS9wLtpksBq4Q94S10OQqvFjBreuZGFJiZFInYuCkOLRvIyIOpkX
	mjfo8oK7JVaQ6pX8WDVgoVhqsSaexKg+II6ikf29mjKFv4G8OGMYzqqtDpV70JsNM4jUYB5ANj4
	K017OztUkMDXfWd2w1CVxXVVqxr/qYyTilleM2MOiF96Qg4VTp9EbbtwbO3AcWWccNeV/FQsWpH
	DtuLnQR7HFaPq0vdcHGRJYhz9NqZ3w75y/2urilt7LNMcISW4T1BtSQFnjaBdN7LPuR3dz5ynQ9
	sqwju+GzzNWXG9SEl7L4WdUcflGPshEWDbVMjcTAXwHlhIqDFL5ztgHISj45mKCu3t/xf3LVAFR
	wIe5CtaS7c7iQyMGrduv4i3ZkHyPlj8iF6bSPTNYX+mgZFTCDRhhB3pR2wSfjXcxJYvaApF6vqA
	Q6hkyInRisWUkez2J81Sv1VqVsfJ5
X-Received: by 2002:a05:600c:4e43:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4b6de0cd91dmr49744805e9.15.1793980448435;
        Fri, 06 Nov 2026 07:54:08 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm128429425e9.4.2026.11.06.07.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:54:07 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][blacksail 0/1] Pull request for CVE-2026-123158
Date: Fri,  6 Nov 2026 16:53:37 +0100
Message-ID: <cover.1793980180.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 15:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249697
Content-Type: text/plain; charset="utf-8"

This is an expedited Pull request to fix CVE-2026-123158 (aka
"sshhole").

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/5069
* qemuarm64 failed due to 16487 – runqemu/oeqa leaks per-instance rootfs
  copies (<image>.<ext4|wic>.<PID>) in /srv/pokybuild/tmp, filling the
  tmpfs mount and breaking ptest builds.
  Retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/36/builds/4964

The following changes since commit d3494922ad3e10a8880fa349366eb22e1f9f24ca:

  python3-certifi: upgrade 2026.7.22 -> 2026.10.19 (2026-10-22 11:33:09 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/blacksail-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/blacksail-next

for you to fetch changes up to 3bbd2a4f81f368ae7eac580949e4717f7aeb4f06:

  openssh: fix CVE-2026-123158 (aka "sshhole") (2026-11-06 12:50:38 +0100)

----------------------------------------------------------------

Yoann Congal (1):
  openssh: fix CVE-2026-123158 (aka "sshhole")

 .../openssh/openssh/CVE-2026-123158.patch     | 191 ++++++++++++++++++
 .../openssh/openssh_10.5p1.bb                 |   1 +
 2 files changed, 192 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-123158.patch

