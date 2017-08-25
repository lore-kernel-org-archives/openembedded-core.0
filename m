Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id B0FE5784A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 20:36:47 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id t3so1154659pgt.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j2wxrXGbf/fX4FCtLAVECyZUu4QjRRLF8qzqH4M6CDI=;
	b=ujl2GZ6SuaQwcFbTsONoGkELpipnTUBJMzBh/pIAZcllWTUzVMK8moUJBY3KVSpvO0
	KHEVPBAkrNpAg+glBpaVwLmiPoJzM07umUpnx1DPCss26pJxmMzhhfjboiZLCBMRAsW+
	3pencyOroOMigtuMpIjywZWsqUwIkbKwbxnNQ7j66f7MGP9pwdWffmaQHI6uIRtk7vU5
	0C92oER0gv16W3DCIPYrDGyuuTyjHDcxM01cBntIOczUYdwM9RtLrqHvWVRK0gdVkj+X
	VJdRQrEABFJgjgczR9lLO7heh5cSTdrlrzEzQr5nVYyDWiWjyhv+0OTfW/rAewc4HRUc
	5ZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j2wxrXGbf/fX4FCtLAVECyZUu4QjRRLF8qzqH4M6CDI=;
	b=HQHCfrsKWvBnUnKr1O0e6gJd2uGNsdkf3DkSNU4zkJo54c9wi08t5W1ftc5NMvweRE
	uV/7Ku3HfrAJM2ai6lGn55U+FP1MbJb5f9q3CHnB8jGTusZ60jhJV4RgQr7RaVjo/XAA
	WChiHkvdAzu8PXEcTtckndkBNlYkNK4i/OfUTPmVRX45qtZRvByYmEikLak+ZiX2JjHS
	eA3EqStanI79zDKu2BeQEmekjKHvxNkhOov77IAIUWzN8Y/33+mf4VPqhI5K/VPwigVx
	bWYHfZkY3X0/xQlXayw5TTRUXr/yOfXSx4gKUh88xqbz/bjoC2Nxn9Rt8eknk9z6+NJF
	hV9A==
X-Gm-Message-State: AHYfb5hxMKNPsRhqBGSGHEAot5xPevPUSotVnWbw5kkjcc6wVLCej9OV
	Gm8lV+yglIMdj6sC
X-Received: by 10.99.160.106 with SMTP id u42mr10703978pgn.26.1503693409031;
	Fri, 25 Aug 2017 13:36:49 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id v3sm1290104pgc.7.2017.08.25.13.36.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Aug 2017 13:36:48 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 13:36:32 -0700
Message-Id: <1503693392-7893-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1503693392-7893-1-git-send-email-armccurdy@gmail.com>
References: <1503693392-7893-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] terminal.py: add support for mate-terminal in check_terminal_version()
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
X-List-Received-Date: Fri, 25 Aug 2017 20:36:47 -0000

Not currently used, but include for completeness.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/lib/oe/terminal.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 89ddb46..9eb19a2 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -292,6 +292,8 @@ def check_terminal_version(terminalName):
             vernum = ver.split(' ')[-1]
         if ver.startswith('GNOME Terminal'):
             vernum = ver.split(' ')[-1]
+        if ver.startswith('MATE Terminal'):
+            vernum = ver.split(' ')[-1]
         if ver.startswith('tmux'):
             vernum = ver.split()[-1]
     return vernum
-- 
1.9.1


