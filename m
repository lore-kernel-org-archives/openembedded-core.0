Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXA0g-0002Al-UN
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 14:50:20 +0200
Received: by mail-ea0-f175.google.com with SMTP id f15so220337eak.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 05:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=VRlpAveqdYerDi8rv4HXFT24p+XeMp8KpcI8U/ehisw=;
	b=A4Wy0rolWLfTppZbttttLrgqXrN91tVI3htIX+dtszP4nCX/34erRA3tQh6T9eIopI
	U5ruLsJEpNfdBoXSkB7e4t/kngXzVms28BgbsZuy1qat7jxN86u+LK2Ez2LGFbYG3u+V
	T96f1J5tVkMp7BfkAYZ2hzj42+Kb0ziIB2XZCrVTxw8a70bQV7QwyJErlSKhiBOWSHMF
	DYjUkrF0FGEb1um6ZIvrhyWOtv6Alfa5fFb5QXSpxNw2G4fMk+vuwFa1E0eBGpOc0KSm
	dRMnw4YmrduCq/GPJ6oudsiDXo/zWZJPIYBHlqgaR4Dy0ZCrekAo8XIO8mopkVK/NvWg
	EN6Q==
X-Received: by 10.14.110.198 with SMTP id u46mr135148481eeg.41.1367325148485; 
	Tue, 30 Apr 2013 05:32:28 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id cd3sm38486124eeb.6.2013.04.30.05.32.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 05:32:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 14:30:02 +0200
Message-Id: <1367325004-7740-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH/v2 1/3] systemd: do not recommend udev-extraconf for udev
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
X-List-Received-Date: Tue, 30 Apr 2013 12:50:26 -0000
X-List-Received-Date: Tue, 30 Apr 2013 12:50:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* adding this extra functionality is an image- or distro-decision
* at least automount-rule/script breaks other automount solutions causing
  misleading kernel messages as 'VFS: could not find a valid V7 on sda'

same as already sent by Koen Kooi [1]

[1] http://patches.openembedded.org/patch/48139/

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-core/systemd/systemd_199.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 43463c5..08cb0c6 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 PROVIDES = "udev"
 
 PE = "1"
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -211,7 +211,7 @@ FILES_udev-dbg += "/lib/udev/.debug"
 
 RDEPENDS_udev += "udev-utils"
 RPROVIDES_udev = "hotplug"
-RRECOMMENDS_udev += "udev-extraconf udev-hwdb"
+RRECOMMENDS_udev += "udev-hwdb"
 
 FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/systemd/systemd-udevd \
-- 
1.7.6.5



