Received: from mail-wg0-f49.google.com ([74.125.82.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5h6g-0000i7-Jp
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 19:30:59 +0100
Received: by mail-wg0-f49.google.com with SMTP id 15so1181896wgd.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 10:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=/yGAvl32QK4NzMDCGttND1iTIYv5lhONbRpJbzofwFQ=;
	b=pLXFVNegjotA+m9iM7hnfAzgZbGQaRr6NgpWOQj0MagCeqWSrt0PG0yazrJRquvaqk
	JdG6Gc8LE3kXPSy99m9ifhzlwEYZDLZvjV/NmNoRNYlSLJCgfDb3yC7LIvU6soO+AmP/
	8ZtNj5dDlydHIGXDCGNSscyDAT4Pn6r4JOf16NLIUlmTkt46YB+/u4gOftE22SPRBzI7
	wbmvks1i6X65pOOZ5A4qlcRA6yaou7OKawn9mnOpZlB1OPKyaCFxBWvLbT9lIph6wylT
	LL134I1j+gnz4s2uzZRx+INH7XWCTXWHWTpANb4hY7/wEd7G5Mm9scCMolwecx+K2zhw
	7VRQ==
X-Received: by 10.195.13.200 with SMTP id fa8mr40092921wjd.15.1360779297479;
	Wed, 13 Feb 2013 10:14:57 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hb9sm44033349wib.3.2013.02.13.10.14.55
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Feb 2013 10:14:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Feb 2013 18:12:42 +0000
Message-Id: <1360779162-28824-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnbHH8coTiwGRPirFoM/S06E65KVzOI9imUOBMd6I/uTpA07kx59I9fj54+KyBruh2nQBRA
Subject: [PATCH] systemd: add udev-extraconf and USB/PCI IDs to RRECOMMENDS
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
X-List-Received-Date: Wed, 13 Feb 2013 18:31:14 -0000

The standalone udev has these dependencies and extraconf is required to have
working automount amongst other things.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index d55206b..0c3ebc4 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -194,6 +194,7 @@ FILES_udev-dbg += "/lib/udev/.debug"
 
 RDEPENDS_udev += "udev-utils"
 RPROVIDES_udev = "hotplug"
+RRECOMMENDS_udev += "udev-extraconf usbutils-ids pciutils-ids"
 
 FILES_udev += "${base_sbindir}/udevd \
                ${base_libdir}/systemd/systemd-udevd \
-- 
1.7.10.4



