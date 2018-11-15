Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id F1C106C152
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 11:50:59 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v18-v6so20885250wrt.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 03:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qdM3qYtXCWiNtYKKVyB4+NXwrH4PtJg0YJWTQxxii6A=;
	b=WbM2kbcFMs77FXLkN9xfDh+oXQDeve25LAaOOTnkIEOMVz6C2xTDNUX/rDVKsgpMVY
	IwwV69Mld3eZYFJa2qnGAjQvpeoN86PS+rWi/fYCBB2nKbsfoL5krkHOcSFytzjX5+uL
	3kn5pRI4BXvZrx99wShvCJNNN916JQDU7IzoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qdM3qYtXCWiNtYKKVyB4+NXwrH4PtJg0YJWTQxxii6A=;
	b=Bri77LxP1XzDWsecvYSVP14J6BSpfiD1ehU5rkhOEfxANWFsU+bgEi25NAU6Kpt2GL
	ajco9kft9feeAdwdzG6cqMYSkXb+hZUbEiM6RJMPOYRcBSXpwbF9Wce3eYAuhpoUNDsx
	JBSD0SUje2tiU/VXNGXpLho6Cr1zZy1dHwAHZ3M2tnh8bLS8wpuCmVuhGpQmpstQUDoT
	s0fFtlSXQ6E1r/nCaSzZtOK4ba+wwzRvnt512rwq4F/GeqJmF7QieWslvqTZtCCmC3sM
	Nj1qVQzWM9yaE9jqCFOjxoqH6l//yJA4Hq6aIBNpwiTQ0TJNFzR2LXbFq7zCuFXjSvEa
	KRsg==
X-Gm-Message-State: AGRZ1gIqZ89zB116ZMmN2BxRNyxK6D7sNCKgMQIE06yUiAdUbVrKjBSw
	6lqWz7zJCbHtbjK0Y5YQfLL8b4x8mXg=
X-Google-Smtp-Source: AJdET5eTzcq9k0ZsxXsRJdLoJqZqXNFkgchraO7O5ekXvU54FhHWksOJFKWFV5mG9SJfEl8LwJjrkw==
X-Received: by 2002:adf:c7d1:: with SMTP id
	y17-v6mr5365263wrg.230.1542282660229; 
	Thu, 15 Nov 2018 03:51:00 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j125-v6sm17622731wmb.12.2018.11.15.03.50.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 03:50:59 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2018 11:50:56 +0000
Message-Id: <20181115115057.12871-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181115115057.12871-1-richard.purdie@linuxfoundation.org>
References: <20181115115057.12871-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] oeqa/utils/qemurunner.py: Fix python regex warnings
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
X-List-Received-Date: Thu, 15 Nov 2018 11:51:00 -0000

Fix the warnings:

meta/lib/oeqa/utils/qemurunner.py:250: DeprecationWarning: invalid escape sequence \.
  ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
meta/lib/oeqa/utils/qemurunner.py:343: DeprecationWarning: invalid escape sequence \-
  if re.search("root@[a-zA-Z0-9\-]+:~#", output):
poky/meta/lib/oeqa/utils/qemurunner.py:350: DeprecationWarning: invalid escape sequence \-
  if re.search("root@[a-zA-Z0-9\-]+:~#", output):
meta/lib/oeqa/utils/qemurunner.py:448: DeprecationWarning: invalid escape sequence \-
  if re.search("[a-zA-Z0-9]+@[a-zA-Z0-9\-]+:~#", data):

by correctly marking the regexs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index dfab1bd5f11..d40b3b808b3 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -238,13 +238,13 @@ class QemuRunner:
                 # because is possible to have control characters
                 cmdline = re_control_char.sub(' ', cmdline)
             try:
-                ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
+                ips = re.findall(r"((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
                 self.ip = ips[0]
                 self.server_ip = ips[1]
                 self.logger.debug("qemu cmdline used:\n{}".format(cmdline))
             except (IndexError, ValueError):
                 # Try to get network configuration from runqemu output
-                match = re.match('.*Network configuration: ([0-9.]+)::([0-9.]+):([0-9.]+)$.*',
+                match = re.match(r'.*Network configuration: ([0-9.]+)::([0-9.]+):([0-9.]+)$.*',
                                  out, re.MULTILINE|re.DOTALL)
                 if match:
                     self.ip, self.server_ip, self.netmask = match.groups()
@@ -331,14 +331,14 @@ class QemuRunner:
         # If we are not able to login the tests can continue
         try:
             (status, output) = self.run_serial("root\n", raw=True)
-            if re.search("root@[a-zA-Z0-9\-]+:~#", output):
+            if re.search(r"root@[a-zA-Z0-9\-]+:~#", output):
                 self.logged = True
                 self.logger.debug("Logged as root in serial console")
                 if netconf:
                     # configure guest networking
                     cmd = "ifconfig eth0 %s netmask %s up\n" % (self.ip, self.netmask)
                     output = self.run_serial(cmd, raw=True)[1]
-                    if re.search("root@[a-zA-Z0-9\-]+:~#", output):
+                    if re.search(r"root@[a-zA-Z0-9\-]+:~#", output):
                         self.logger.debug("configured ip address %s", self.ip)
                     else:
                         self.logger.debug("Couldn't configure guest networking")
@@ -436,7 +436,7 @@ class QemuRunner:
                 if answer:
                     data += answer.decode('utf-8')
                     # Search the prompt to stop
-                    if re.search("[a-zA-Z0-9]+@[a-zA-Z0-9\-]+:~#", data):
+                    if re.search(r"[a-zA-Z0-9]+@[a-zA-Z0-9\-]+:~#", data):
                         break
                 else:
                     raise Exception("No data on serial console socket")
-- 
2.17.1


