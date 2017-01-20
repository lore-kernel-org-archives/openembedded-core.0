Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id ADB94731BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:38:38 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id c7so20052122itd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 05:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=+9zMEsE5lMbjRtint+V5dj5mPist4rtVwGFCvaYG07I=;
	b=GDUiIxwFRjqVwmMB/SixWDKzJEk0FaacYi9YtonXQV9wEUxWO79jQcGkJsHnBe7+XK
	gjbRpBcbn1GWP/oBP8+3SBGhY7rBmQDXDXbX4w9OOQx7Wgp9f6EV4cYnoEBtXYQPhdTi
	CudsQdH6/r3pW1YkIj+rct0l2tnDIRShy0cBkUbr8W12CtpnUQTtjbHJWqcrsUttNmtT
	gKsiAb8iSUtiTD8zbpvVQnHOwel1iPqyLzmi6IgiPHUjmBX/jtpCeJnBpSDNMXUFCsi8
	iyk7ZosAMJB4pGAv2H4rrj0k2gsVHwudHmWjt5RXtROj/n65ZmZrJCQjr/3RyCFOksZ6
	6Tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=+9zMEsE5lMbjRtint+V5dj5mPist4rtVwGFCvaYG07I=;
	b=X33iZGCsyae06fisrwc3ZfxKLWVK9yuUbcYFbYO4jTNXcVbMnK96CTBLjFyrVS2Xuq
	tGiQfJQkhbdIXgflmwFWYmBG5jNNyGcN+ZBq0jMrSlkhd//XToKcqN9G9JlAOt6QVtUK
	M6wCt5CW0/EKtdjwOD0qS0wkrRVI3pLC0fLL5j6v9Ba8e7S0lmspr1a+WUyno/xt5ghh
	RU9JgT8z0muRTJ7BOyn0Lv08uwE/jiSWw5e2AdFw/DQHaZ6Feq1qrEDse6whE69eRtIf
	oduzID4f/YKRnW0NLgkOxqbTmNLAUR7bs66XteqAnGEIAqSGRLaAUd6CgbAyMAtQrj8V
	mE+g==
X-Gm-Message-State: AIkVDXIdygs5MvlHU6tBfgsZXGMqElqsg1qSlsSw9PfYcJPrOFwQCbcD0KhKGuYQMFibkCHO
X-Received: by 10.36.133.133 with SMTP id r127mr3367012itd.37.1484919519304;
	Fri, 20 Jan 2017 05:38:39 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id e24sm1362361itd.6.2017.01.20.05.38.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 05:38:38 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 14:38:04 +0100
Message-Id: <0076ca4139ff571d1c4e31279258ce1ab1903db1.1484919259.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
References: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
References: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 07/12] runqemu: also accept -image suffix for rootfs parameter
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
X-List-Received-Date: Fri, 20 Jan 2017 13:38:38 -0000

The magic detection of the rootfs parameter only worked for image
recipes which embedd the "image" string in the middle, as in
"core-image-minimal".

Sometimes it is more natural to call an image "something-image". To
get such an image detected by runqemu, "-image" at the end of a
parameter must also cause that parameter to be treated as the rootfs
parameter.

Inside the image directory, "something-image" has an -<arch> suffix
and thus no change is needed for those usages of
re.search('-image-'). However, while at it also enhance those string
searches a bit (no need for re; any()+map() a bit closer to the
intended logic).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/runqemu | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 83ec337..45cad90 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -218,7 +218,7 @@ class BaseConfig(object):
             if not re.search('.qemuboot.conf$', '\n'.join(os.listdir(p)), re.M):
                 logger.info("Can't find required *.qemuboot.conf in %s" % p)
                 return False
-            if not re.search('-image-', '\n'.join(os.listdir(p))):
+            if not any(map(lambda name: '-image-' in name, os.listdir(p))):
                 logger.info("Can't find *-image-* in %s" % p)
                 return False
             return True
@@ -267,7 +267,7 @@ class BaseConfig(object):
              re.search('zImage', p) or re.search('vmlinux', p) or \
              re.search('fitImage', p) or re.search('uImage', p):
             self.kernel =  p
-        elif os.path.exists(p) and (not os.path.isdir(p)) and re.search('-image-', os.path.basename(p)):
+        elif os.path.exists(p) and (not os.path.isdir(p)) and '-image-' in os.path.basename(p):
             self.rootfs = p
             dirpath = os.path.dirname(p)
             m = re.search('(.*)\.(.*)$', p)
@@ -371,7 +371,7 @@ class BaseConfig(object):
                 self.kernel_cmdline_script += ' %s' % arg[len('bootparams='):]
             elif os.path.exists(arg) or (re.search(':', arg) and re.search('/', arg)):
                 self.check_arg_path(os.path.abspath(arg))
-            elif re.search('-image-', arg):
+            elif re.search(r'-image-|-image$', arg):
                 # Lazy rootfs
                 self.rootfs = arg
             else:
-- 
git-series 0.9.1

