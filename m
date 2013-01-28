Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TzxMX-0004qx-JG
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 23:39:52 +0100
Received: by mail-ea0-f171.google.com with SMTP id c13so1402178eaa.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 14:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=4mOwAyzKBwpVsvTGf7KaEqnN/7O3iiyaudcHvyZpC6E=;
	b=0xNNmIs0bIM6/EahHvs8enutrF8YdQvCG1tdX6sXIErCJPYdQeWkJEUa+YVddRPxO9
	i04iGN8YFoDJRfXUVNZ+yuL6idLeSPMr67ZpGgCJthdjMB1vltpRaq7cGuWhJbaz86aP
	+kNZ89CmD0Hw3V1KDfiwdSMPMxcNGf+w59xwFI9hQTPROdMQmfIhUn7LuIAkieI12uaQ
	CAsqGKN9B2KKv6B5v2mH27rniDlvyygDY9wFSKLWSSLQTiED2b7/CkmyagFgzTh01N5W
	Maj9bBiObLMCDpDprcBxB6q7Y4ESqa5US7C/ciw5MB7uq9DRyTOUoqrNmbD3LT8g2sE8
	cHRw==
X-Received: by 10.14.203.2 with SMTP id e2mr55946488eeo.20.1359411838879;
	Mon, 28 Jan 2013 14:23:58 -0800 (PST)
Received: from localhost.localdomain (p4FDF0BC2.dip.t-dialin.net.
	[79.223.11.194])
	by mx.google.com with ESMTPS id f6sm17785438eeo.7.2013.01.28.14.23.57
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 14:23:58 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 23:23:45 +0100
Message-Id: <1359411826-5264-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1359411826-5264-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359411826-5264-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] systemd: systemd-analyse has moved to base_bindir
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
X-List-Received-Date: Mon, 28 Jan 2013 22:40:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 500c3ec..280fa51 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 PROVIDES = "udev"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 libgcrypt"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -112,7 +112,7 @@ PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock"
 
-FILES_${PN}-analyze = "${bindir}/systemd-analyze"
+FILES_${PN}-analyze = "${base_bindir}/systemd-analyze"
 RDEPENDS_${PN}-analyze = "python-dbus python-argparse python-textutils"
 RRECOMMENDS_${PN}-analyze = "python-pycairo"
 
-- 
1.7.4.4



