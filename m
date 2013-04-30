Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXA0i-0002Am-Uc
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 14:50:24 +0200
Received: by mail-ee0-f49.google.com with SMTP id d4so223922eek.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 05:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=C2uVaZA9+P13GP/IGNCneB6gOgH+N4BxWVjTbjLsx8k=;
	b=KFZIo8c6zZSTFe6Kg5WCbFW1SgeaXihASC1P7V5RTCxc4hJlOsG7oNVH+mzBXfDAj1
	1eSp48maGPa/fRWLnxE494NRatfB6h+VfiF38q1LSbdIZfyP1U7MugT92XHQQxBvisVT
	8T2sxZW0h+DSzy0IWPVas7Iv6f9A9yHc4ZMtkUOdscUGPMROUKcEelcaq7BYBBnAswkR
	XMBNbJzScACGgsBfnDmphpBXg0vtaIFxJ9oWM0EDQ97AP4q0WBSjeZNpAYB8492F6z4T
	pNSQzwcqsnL1ARxZP6JJ8lln0dVX2x8xX0b5j0V/Po4lpfkEFHl65BFan4n3IhbGrQNr
	F6zw==
X-Received: by 10.14.106.200 with SMTP id m48mr14997422eeg.17.1367325149982;
	Tue, 30 Apr 2013 05:32:29 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id cd3sm38486124eeb.6.2013.04.30.05.32.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 05:32:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 14:30:03 +0200
Message-Id: <1367325004-7740-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1367325004-7740-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367325004-7740-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH/v2 2/3] udev: do not recommend udev-extraconf
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
X-List-Received-Date: Tue, 30 Apr 2013 12:50:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

same as already sent by Koen Kooi [1]

[1] http://patches.openembedded.org/patch/48183/

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-core/udev/udev.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index dd250f7..769d861 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -14,7 +14,7 @@ LDFLAGS += "-lrt"
 
 DEPENDS = "acl glib-2.0 libusb usbutils pciutils gperf-native libxslt-native util-linux"
 RPROVIDES_${PN} = "hotplug"
-RRECOMMENDS_${PN} += "udev-extraconf usbutils-ids pciutils-ids"
+RRECOMMENDS_${PN} += "usbutils-ids pciutils-ids"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://0001-Fixing-keyboard_force_release.sh-shell-script-path.patch \
-- 
1.7.6.5



