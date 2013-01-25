Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TytFc-00010Z-5c
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 01:04:04 +0100
Received: by mail-pb0-f45.google.com with SMTP id rq13so489624pbb.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 15:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer;
	bh=8NR3JS34WpAGu8IJLerexm7BZwnXNYvUJbRQ3f9KYeM=;
	b=H4/LA/jbdOCredEDo3yU2gbbHtdExK2OrGjohWuM5thWAPkBHvpxZ635D77v/SJL0k
	gPxLmWEvAxCxay147uZkhAUqQ8Sux6mf6vcd0Ww8x45+jawa1VEtBYC4Ox24NVUdi7Ud
	srxSCySIEf+wWjgrdVvcmlWMl8uu5JTLncATw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=8NR3JS34WpAGu8IJLerexm7BZwnXNYvUJbRQ3f9KYeM=;
	b=pDzvycGZEmpu3eV48AyM7Ow9m2ZENEb15Aj0orMLSzHSYVRLIPuQksy/3v7U+Sa+dR
	oR+y4gd/pxRPD2wQWFnaHk3RiPDn7yUa7y4hA7hJQBSuHr/XIi7xmNh0GlRffMIvR9xb
	7yhZEK+PzGLVyCkLlzJpPt0ke0iTRWz/ApbuQDGkVPAUJxLN+tU29TOqV+DKy+rIh7U1
	R9dTrVVEN3G9/t9eOpAiGfyfPRkZxyuoT6nBya8+5Prh34YJl0HtAGYaKzMM9dEq1CeO
	WV9UsFbZv3eoGC8DuuVXLMi3PdhswB7hAeTJsZgGvoL8bVPyRU0pnoAHDUws+pmSbaZK
	qj5Q==
X-Received: by 10.66.85.101 with SMTP id g5mr17409663paz.17.1359157708638;
	Fri, 25 Jan 2013 15:48:28 -0800 (PST)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id nj1sm1485071pbc.13.2013.01.25.15.48.26
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 15:48:27 -0800 (PST)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Fri, 25 Jan 2013 15:47:15 -0800
Message-Id: <1359157635-2082-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQnnjxfByBclxRlb9nyJfxaJib8stjjgZBG2OsEyf5cn33vk+2z75tmxiEa+tCLcAoZJrHjn
Subject: [PATCH v2] poky-tiny: Update for DISTRO_FEATURES_INITMAN
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Jan 2013 00:04:04 -0000

This patch accounts for the addition of DISTRO_FEATURES_INITMAN which
sets the VIRTUAL_RUNTIME_init_manager, so that does not need to be set.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta-yocto/conf/distro/poky-tiny.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
index 347280a..1ae8242 100644
--- a/meta-yocto/conf/distro/poky-tiny.conf
+++ b/meta-yocto/conf/distro/poky-tiny.conf
@@ -84,6 +84,7 @@ DISTRO_FEATURES_NET = "ipv4"
 DISTRO_FEATURES_USB = "usbhost"
 #DISTRO_FEATURES_USBGADGET = "usbgadget"
 #DISTRO_FEATURES_WIFI = "wifi"
+DISTRO_FEATURES_INITMAN = "tiny-init"
 
 DISTRO_FEATURES = "${DISTRO_FEATURES_TINY} \
                    ${DISTRO_FEATURES_NET} \
@@ -96,7 +97,6 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_TINY} \
 # Use tmpdevfs and the busybox runtime services
 VIRTUAL-RUNTIME_dev_manager = ""
 VIRTUAL-RUNTIME_login_manager = ""
-VIRTUAL-RUNTIME_init_manager = "tiny-init"
 VIRTUAL-RUNTIME_keymaps = ""
 
 # FIXME: Consider adding "modules" to MACHINE_FEATURES and using that in
-- 
1.7.9.5



