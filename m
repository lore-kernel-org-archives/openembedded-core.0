Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 79A8D78EFF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:27 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b85so1741396pfc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Pqu5ziGeVeIf4xEspgt2c+VAsXzyLGEvAG2AuU1ndAA=;
	b=pl8T8gXXi8MDXAI/ZNsuadV+AYkht/4vXEfoOI7WmdzpDpYWol1LxdJOvcsPd0iKbG
	kouD34wDh7CHyc/FVU/cAXAKDamP1X4Btx9JzM4X63SQ9zXty+RxX+KP1Car1nYnZq8p
	4uc45+AL5OZFah5h3ZG1aVZS6W/apOe+l/eEV0GxDC4Rfdbl+695pgeJXFfmvTaUDTwC
	oSv1w2IgomusyhpWykArCD4FeN5TlfK8i8OGOnUitGhGuGCkXHDgqZWVb65ApVCS8CRZ
	wCfJ3bB5rRbkQd4bK4odgTcQKhTQLiJ3DilxMDye1egCNGhQfT+WkJ74Ri+wtbiMC4E3
	aoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Pqu5ziGeVeIf4xEspgt2c+VAsXzyLGEvAG2AuU1ndAA=;
	b=uczYHy6reB+LxnwyvpsAV5nRGKFEeJJv8smFgKeaO52/CqycPu5ww484GlSLMS2u2A
	lOwdxZaQwuQHlzm55E04SADp7n8YBBgiBCH1gqHP0T6W/qUDF2+is2sqC9H2NvjJMGXr
	O58jEpQzvHEk+RepJlRs5Q9psU1ajrIyFBe1DrfCzIzIWORvQ44W3m1c9kO2cBp/rqXh
	8kWsnWEzwmuA5+tka34kQOeCG7IpMjZuWFjbI1xPysXmox5nNcNITazUs0MiHnnPhUFG
	w+tXogfqRQXVDTAoDI7SEFqnSMTE4UaAPMjGBpCWQVAbrB/6Pbqd5HdS0hpP3V9GRSpT
	sSKA==
X-Gm-Message-State: AA+aEWbMhtxu9JZcBcB/FaT4DG0piikxUWs6qSFN4KrrnfVZAw7C1wAd
	k9EAfP8sjrblUzYIEOIoOdOY8C1V
X-Google-Smtp-Source: AFSGD/US4HRfzFAj5HLn3QDq6g1sPSDkuuJOkSE7z+mQlQslrgJ1z6krz+rqc8N6M2PIn42iXQB3fg==
X-Received: by 2002:a63:b543:: with SMTP id u3mr406214pgo.420.1544737168353;
	Thu, 13 Dec 2018 13:39:28 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:31 -0800
Message-Id: <9f0dcf49f9195b9e8e8de40338a595e174282037.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 23/45] oeqa/utils/qemurunner.py: Fix python regex warnings
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:27 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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

(From OE-Core rev: 8e6987735002560fca714f77ea8ece9d4b28f7fa)

(From OE-Core rev: 7eb1f0be82d7ee12f893cdd40384da306fa597a7)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 4f6f1d0..b87d776 100644
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
@@ -444,7 +444,7 @@ class QemuRunner:
                 if answer:
                     data += answer.decode('utf-8')
                     # Search the prompt to stop
-                    if re.search("[a-zA-Z0-9]+@[a-zA-Z0-9\-]+:~#", data):
+                    if re.search(r"[a-zA-Z0-9]+@[a-zA-Z0-9\-]+:~#", data):
                         break
                 else:
                     raise Exception("No data on serial console socket")
-- 
2.7.4


