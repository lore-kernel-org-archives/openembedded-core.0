Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id F2C107D537
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 06:37:46 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id a184so5447528wma.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 23:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=d3HRMfdMHmBT3sG6Hj/imzR4oFCtuD1zAnv4uUkE98c=;
	b=Pehzr8/ZNoWskYHXQIb7sHK7lWF+n/ZlDxtD/Q2G3v9nIXogGQVlNPVAim33A31mk2
	6xfyVjsPPFUmy2oBJgS1UwaG6E6FbMNzsm91w7nJlVP++pUF+rT5KyHw96oXO4ngOlDC
	SN7hRzfqBqlyC5jhov3bFG3TzH+PO+qGWxS9d5RU7tWweVszjPcd7RQGRpaZHSXI9voG
	+/MWNYxE4sz+8oEAS0UGYcbuf1XJShGza4DKZrhZJuSN2qXBJiPfikBjmoEd/hdKVni2
	0iVhBPApo4yQRH4CAlEhZ0Hd5zseVW7S3QfylCQDVlE///+slTLgvfRC2Ros56kd7IEU
	APwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=d3HRMfdMHmBT3sG6Hj/imzR4oFCtuD1zAnv4uUkE98c=;
	b=VvtJPIGEjs9vsQtMQJyK9sRQQHXyv8NDysh6Y938Ue0Rqp2CbOyMp+TSqntBOQ2muM
	IDfAZjw43F/VwsTckzfv3FuYiK2xnXtZUzpZYHI1yngHKWpxgWnYV1cv2ZZmvTc/0kxB
	C6lI+EuxDkxiiGU0dOFC7+qly7P2oCEh3mUL5AlGQtp/wXGO6T1s6xMqB4dpQMzBamba
	fgpH1kmfiW1y3x8xUBom5Ed1QsALSQ8uNQq26Zyd5vAtvqcGQPSOzyL22O3iCBn14gCg
	OcmD+jmsIAlD43siwiyID9q71eliJscDI3VF+HmD/kaDhMLQ4q34DMo4MObzev8H38C0
	gAhw==
X-Gm-Message-State: APjAAAWawXzj9tG5YQ0YoSCBHIMPX2N8b/fP5NVYIUtA06teseZpJrbk
	qa9dJty3cVNiBatdooH1JmXHz4FI
X-Google-Smtp-Source: APXvYqz5ujJGgakTk7OEGAd8XlpfyV5LaXbUg/g2qFMieRzapYrdDT22S/ulkFfe8VRZBEX0BO80+A==
X-Received: by 2002:a1c:9609:: with SMTP id y9mr6883868wmd.27.1554446267389;
	Thu, 04 Apr 2019 23:37:47 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	g132sm1185443wme.3.2019.04.04.23.37.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Apr 2019 23:37:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 08:37:24 +0200
Message-Id: <20190405063736.29750-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405063736.29750-1-schnitzeltony@gmail.com>
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/13] insane.bbclass: Trigger unrecognzed configure option for meson
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
X-List-Received-Date: Fri, 05 Apr 2019 06:37:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested with 'unknown-configure-option' in ERROR_QA:

For meson (glib-2.0-native):
1. add 'EXTRA_OEMESON_append = "-Dschnitzel=true -Dwurst=true"'
   | ERROR: glib-2.0-native-1_2.58.3-r0 do_configure: QA Issue: glib-2.0-native: configure was passed unrecognised options: schnitzel wurst [unknown-configure-option]
2. add 'UNKNOWN_CONFIGURE_WHITELIST_append=" schnitzel"'
   | ERROR: glib-2.0-native-1_2.58.3-r0 do_configure: QA Issue: glib-2.0-native: configure was passed unrecognised options: wurst [unknown-configure-option]
3. change to 'UNKNOWN_CONFIGURE_WHITELIST_append=" schnitzel wurst"'
   => builds without issues

For autotools (readline-native):
1. add 'EXTRA_OECONF = "--with-schnitzel --with-wurst"'
   | ERROR: readline-native-8.0-r0 do_configure: QA Issue: readline-native: configure was passed unrecognised options: --with-wurst --with-schnitzel [unknown-configure-option]
2. add 'UNKNOWN_CONFIGURE_WHITELIST_append=" --with-schnitzel"'
   | ERROR: readline-native-8.0-r0 do_configure: QA Issue: readline-native: configure was passed unrecognised options: --with-wurst [unknown-configure-option]
3. add 'UNKNOWN_CONFIGURE_WHITELIST_append=" --with-schnitzel --with-wurst"'
   => builds without issues

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---

This is a resend

 meta/classes/insane.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 37b8bb0032..c8d18c07f5 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1093,12 +1093,16 @@ Rerun configure task after fixing this."""
     ###########################################################################
     # Check unrecognised configure options (with a white list)
     ###########################################################################
-    if bb.data.inherits_class("autotools", d):
+    if bb.data.inherits_class("autotools", d) or bb.data.inherits_class("meson", d):
         bb.note("Checking configure output for unrecognised options")
         try:
-            flag = "WARNING: unrecognized options:"
-            log = os.path.join(d.getVar('B'), 'config.log')
-            output = subprocess.check_output(['grep', '-F', flag, log]).decode("utf-8").replace(', ', ' ')
+            if bb.data.inherits_class("autotools", d):
+                flag = "WARNING: unrecognized options:"
+                log = os.path.join(d.getVar('B'), 'config.log')
+            if bb.data.inherits_class("meson", d):
+                flag = "WARNING: Unknown options:"
+                log = os.path.join(d.getVar('T'), 'log.do_configure')
+            output = subprocess.check_output(['grep', '-F', flag, log]).decode("utf-8").replace(', ', ' ').replace('"', '')
             options = set()
             for line in output.splitlines():
                 options |= set(line.partition(flag)[2].split())
-- 
2.20.1


