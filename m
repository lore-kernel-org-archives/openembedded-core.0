Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29837.1793868248906802464
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=d4R9lE6C;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e00eee27dso852234f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868247; x=1794473047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vj70tRKmO8NVet+TM6nwZKrb2Jh0YQEi/Q66aU7p0Bc=;
        b=d4R9lE6CACjBoSPZHN8fcKUSm9TV1xaq4kxRvh6Rr7iSxEDSMdwL1eYA6R7p0KNeP4
         rLYuDXo+8jIKXe/DUEtqfNZ8W1rXApJMUk4QlrRUvLdORhLqpprxnaWJqlXmgLHSpRbL
         ouO0RiZrjYNHz2gRnWt8jfnAPuuBVvg2U9cJRGcfQxwrRAcwkS6ax44VYw9buEf1jJww
         98ML+rAQPfAWg2VMm5yOk8JFNUyOM4xY8qUwFbs9bTqtglsYZaAZ6u5z837HrC9FyTkh
         W0GgW2KzoPulPtE7/fjG7oMpsPmz7Oj3dMtqmG7itQUOmkgarVfVbyWbcDiRlNsHXORb
         N1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868247; x=1794473047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vj70tRKmO8NVet+TM6nwZKrb2Jh0YQEi/Q66aU7p0Bc=;
        b=KPIY+Q94rQGySY7x79KD16JYiF5oqlL6IoG1hiV2GibVNh5Jjvr1FWxeLwS+pXIpZK
         as98Aiy/+bT6jZXUTup83Y/QWJuoYC8TBRMJiY407dRmE5EI1vG40u1hXkOUF05BNZp8
         mGts0qw1jhI+gTfASYxRBhxPvNIpucZzWcHMqj1S4yscxAKM4XMeTqn48ajL5x9WgkdV
         AdD2rHOmvPDZp0tSlV+jNxgzdJkek3xKmBIlOq93nUW0JewM7WDToBfMliI/SOHbTCbO
         Y06c0ybh0S8qY+7/eyLMGJ3cjWfHOm3OCc3QEdUUWwmDEDdV/B9/zZdCs4RP66D3yjyW
         SfNg==
X-Gm-Message-State: APuU4Z+3aHTkC5TbBz9bCDcJmlmCWijZx1le14+TKaDTMBFw9cC+D+tX
	c9LC+9NpwoTnHyPhldd+ZPFleTS0HBDILxmnKNcZ6Z4diBIrgOHCTM/f8xKKCb5KWIVwM4xmQrC
	WSS12DE0=
X-Gm-Gg: AYBFou0/3cyUoGG1GlYH/jwl5nhT42gByvrFakVN5+wwkYHOgu8E/qTNC3AKD2lxMd4
	pq3OLQGcDCRZWIttBjm9JBVHO25eN6aZGwb7/5JiPDcwxn6Kk1nMKLK2EktyYDkpgYBg6FhRsdi
	zU4S7V6VP1LSc4fUIatRqnMYCaEjC5isNggvgaEOqxlxOWXS3odmZNxFfbuglWvSTSElYZ6wSP0
	+HR68g+QU1G9PaE/KUJIkTJpuvTD+xdVpxpbvjwLJ01WDFLGtx6gWkcQ2lTncGMni3xqP1BvwC8
	YYnnONzvo5T7qKTyokP4dliBmcVL9oBIzS6Yn2t+QaAr6gxOCVXNvPvEs5cyl1skCcOI0c2xB6g
	Yyta2Jkl4BdnocdigHgoEHaGzEiIG7S3BTNW26tnk1mFxSntwtAtNJNPLxgsY4fejVrWocxnnm8
	j2WOdJMtrxQiQqUXV3yzqbsTm0g85JoHnqNlQLvTKKjmiMLUBlEoD+BqWUKspz34zjTfkjQ1ktL
	4quDhAYD6G//U9J1YP5KejBcKFTKdkmpL4bqJULLHkU1iMZeUZqG5veMKXWb7r5ugSaYr0V17el
	CYmzI3z7d+GYUUnUSDYfHn8uMRFBpKU6PdCiIi0PKejJYuMYK8gTcMUCSxDtr98a3eASHdKhr5K
	ujCedeqPfWGKV9PLPlanI4uPGuSMk
X-Received: by 2002:a05:6000:2410:b0:48e:6674:3b2f with SMTP id ffacd0b85a97d-48e6e5005c5mr42407199f8f.51.1793868247075;
        Thu, 05 Nov 2026 00:44:07 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:06 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 55/60] devtool: ide-sdk: honor XDG_DATA_HOME for the CMake kits
Date: Thu,  5 Nov 2026 09:43:14 +0100
Message-ID: <d72d5f801d70ad427a7dff61e7cb942ff6f5f5ef.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249514
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

CMake Tools reads its user kits from XDG_DATA_HOME/CMakeTools if
XDG_DATA_HOME is set and only falls back to ~/.local/share/CMakeTools.
The shared sysroot mode always wrote to the fallback location, so the
kit was not found by CMake Tools if XDG_DATA_HOME is set. Use the same
location as CMake Tools.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e4aa8d098a2a3487a47e9d74db56a4c8854783fb)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 081dc08657b..39356dcfb11 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -77,6 +77,7 @@ class IdeVSCode(IdeBase):
     A workspace cannot be created because there is no recipe that defines how a workspace could
     be set up.
     - cmake: adds a cmake-kit to .local/share/CMakeTools/cmake-tools-kits.json
+             (below XDG_DATA_HOME instead of .local/share if it is set)
              The cmake-kit uses the environment script and the tool-chain file
              generated by meta-ide-support.
     - meson: Meson needs manual workspace configuration.
@@ -95,8 +96,10 @@ class IdeVSCode(IdeBase):
         deploy_dir_image = shared_env.ide_support.deploy_dir_image
         real_multimach_target_sys = shared_env.ide_support.real_multimach_target_sys
         standalone_sysroot_native = shared_env.build_sysroots.standalone_sysroot_native
-        vscode_ws_path = os.path.join(
-            os.environ['HOME'], '.local', 'share', 'CMakeTools')
+        # CMake Tools stores its user data in XDG_DATA_HOME, if it is set
+        data_home = os.environ.get('XDG_DATA_HOME') or os.path.join(
+            os.environ['HOME'], '.local', 'share')
+        vscode_ws_path = os.path.join(data_home, 'CMakeTools')
         cmake_kits_path = os.path.join(vscode_ws_path, 'cmake-tools-kits.json')
         oecmake_generator = "Ninja"
         env_script = os.path.join(
