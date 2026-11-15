Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4381.1794732561580860825
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LXfCO2WQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso935923f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732560; x=1795337360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hnTf5gsiNkhySTDX7hzhuZoxS9jhuH1OtoOVVJgWxeI=;
        b=LXfCO2WQMTq/P2S2thMaytCac0vAkRFVXdzDIwTY+mznyv0rUmg0mzli2PhwNb9y0/
         FV5boMeggsWv8PzIAQoe39xA94p53fXS1y77Q8AQplC2YcPJlaQDEcRtTksvoGa2EPUu
         MdnhyvGulhsI8hhAJMhWFNuW5dbtwCbxZAYkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732560; x=1795337360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hnTf5gsiNkhySTDX7hzhuZoxS9jhuH1OtoOVVJgWxeI=;
        b=p89XsMKBVMtAICk1A8DTyv9FHZy+xPmrQ1p1Q9jbr8FFOssu9oB0VgulDxxMHG7uvO
         RFcvURHJBNXmoVz8G6dwbmocuUE/ybZ1hyGhuGmjSqQ0HDvmSLtlnZvqCFfEwbWUMNWl
         Qm3QY/fT0Tme4ED6Zb4eTtiWVBvR/3PFHoRPG7JO11vIWZv9+GHI1WEomDC3shBBTri2
         r3+4rVjhn88lgdu9EYMbk2dS1eLSuDxuX5GgeFd9cYB0X9BTxQvqO8ilmhLy+Vq3fCle
         zMu0imjrtOE34m/sGR6wh5OqbqioJFPXdn/NdS/013ivnfHfijxvFbJpcqOjDI2dkIzp
         8t7Q==
X-Gm-Message-State: APuU4Z9hcGhPoC7jkKOVhYmX5S1BTdd6gkkokFu8MtSB/7m0ILdNai+s
	0gzlBFNPy8hGaEgppHq6KAIW/NPWNq0HxI/6xXl+MG/GqR55aYCzGP5bAbmsZff0cpwNlrxwd5d
	j4bBfiJ8=
X-Gm-Gg: AYBFou2sTYCjCFE8tBM4Y5DuGef/CM3aZdP2VH+MZVBBXAprIEcennOwstYRvY0zdGN
	xxGxR/q1YYzVt1Z0Y14CvthbKrZhSm1+mzPvuUjMHGlESXMC7ONCWAHgJfhVE5hsxg9qoWGpe58
	5dlXJ+ofo9+oTSFWED7MAqHSYoVidq4JLBQ9o6MY7nXx2wYQo3CoQaC5Bv/3b2+AUMGhjj1xdyH
	pcEfoVZWHK8aJvmlk/WsDsaxpSfktfaMDHDUtBsl0eUL4i/7DAQVEi8hWUWvzmD+gT28dYz3WX0
	tbH58Q/XeIYOp3kcxnkMZnRAl2eN34jXbbj4C4lu/yoModUQBZ7lCIClBxcorbnqEqWO3SlTpkp
	8lhyafEoxrGSKKNtND6yOv1lrb49zGQyi8sqN5MnCs5yn601Of7WG8sAji/cXN/wYXDa5uvVWAI
	Jiu57JNTiSVa2W8CjLyYn18JmBCuLxe3RAzfmVsZxCC5vO7Z3Ahc+bvEGRahVAy/V6UAlQSpki0
	9Ux8S9lAXMbudpiVZgYeyZkp4DzKib9l0EthQNKgLupk7WXZBSEJHNv+gk/9BhCyng0MOsR1eVY
	bVoKyS8JdOqBSFCeEBaZVGoMkvsaEmDtjFx004qyOH9TR0hzStfsp6AWsQ==
X-Received: by 2002:a05:6000:2dc5:b0:48d:e5c9:39a4 with SMTP id ffacd0b85a97d-49c73ce4e17mr16379558f8f.33.1794732559784;
        Sun, 15 Nov 2026 00:49:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/41] oeqa/targetcontrol: Drop SimpleRemoteTarget
Date: Sun, 15 Nov 2026 08:48:23 +0000
Message-ID: <20261115084845.701136-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250251
Content-Type: text/plain; charset="utf-8"

This code is unused. The "simpleremote" type connects directly over ssh
and doesn't need this code so we can remove it as obsolete.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/targetcontrol.py | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 283290cd227..233c9c40c5a 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -223,35 +223,3 @@ class QemuTarget(BaseTarget):
 
     def run_serial(self, command, timeout=60):
         return self.runner.run_serial(command, timeout=timeout)
-
-
-class SimpleRemoteTarget(BaseTarget):
-
-    def __init__(self, d):
-        super().__init__(d)
-        addr = d.getVar("TEST_TARGET_IP") or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
-        self.ip = addr.split(":")[0]
-        try:
-            self.port = addr.split(":")[1]
-        except IndexError:
-            self.port = None
-        self.logger.info("Target IP: %s" % self.ip)
-        self.server_ip = d.getVar("TEST_SERVER_IP")
-        if not self.server_ip:
-            try:
-                self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip ]).split("\n")[0].split()[-1]
-            except Exception as e:
-                bb.fatal("Failed to determine the host IP address (alternatively you can set TEST_SERVER_IP with the IP address of this machine): %s" % e)
-        self.logger.info("Server IP: %s" % self.server_ip)
-
-    def deploy(self):
-        super().deploy()
-
-    def start(self, params=None, ssh=True, extra_bootparams=None):
-        if ssh:
-            self.connection = SSHControl(self.ip, logfile=self.sshlog, port=self.port)
-
-    def stop(self):
-        self.connection = None
-        self.ip = None
-        self.server_ip = None
