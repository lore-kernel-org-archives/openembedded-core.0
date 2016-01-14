Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id CE0AF731C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:58:26 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id f81so18410594iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oozim+PODSNPbPQCl9GD4uX6+Fh31bAbsND2wJucIUM=;
	b=jZoGRJqITx+4CID80jEikKMlp7ipuZBWATYRkW7BAfRjjfbMLdI+9Toj3zABhP/f1/
	cbdpVvumM6EGe6MV9KLaZkPol9AuUhWAvWnHiXPQ/5hOv2qnyJGSHX1hMtZuA7qWsL/2
	16jFy0AaRLbz+1g0RPPlINPddc/xrYOxzJJQmCc9rEng1p9EULe7nRfPH0Pg2atEMEeI
	6tDvdEqiseiOgGD6cnJdu5n3Emubm3R6NhNu/tg4GZ17N3vjsZkpeTUXnNoeZJAR4G4C
	SAKpEYoFdBEk7tg8o0Qf0fTqK18K566hhHec7exquz8AcKaG/IO2c6XOUkdiqiKSb4xN
	7LUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oozim+PODSNPbPQCl9GD4uX6+Fh31bAbsND2wJucIUM=;
	b=lelYsjiOno2lBv8zQkVH4gRPrcQp/MtWX04/LVN7U9J2MHP2JyivTRPOTCjRSfa1cv
	BFL2uuUHwQXDWr8XhA4nuvk/obyn0LCgw8AbGGW6vpfQBXYtarqBPkAa1AL5T2eVEyE7
	nLOiUs4tKYsfjcW+RuOMqV1cJgihK3blE5pSXYmrCC2iZmgpsuGg8B08Bd8bA/OIZD0F
	2iXzle2GGAfRCgt5IkRTLMAhH++lb48CfRVl9Uu16V7DqHfc1jr1UKaf9c0dxL5XUZfP
	KvoL+neS6r77QCY9PGzkj2Wj24octbjJaii09CNB3Ekamtpc/yRkMGwx+K/8DPShdy0G
	TDDQ==
X-Gm-Message-State: ALoCoQmdvMQDBCMhi3Ifb9RYNBR0X3xdUO3O2jYhES8Ya8Be7hFvXXyeloQIhDEW8LSIYf7gyAoY7V4yqP5ixdWa3C0O632j7g==
X-Received: by 10.107.130.209 with SMTP id m78mr6263428ioi.69.1452805107108;
	Thu, 14 Jan 2016 12:58:27 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	204sm3203278iob.44.2016.01.14.12.58.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 12:58:26 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:56:29 -0600
Message-Id: <1452804997-20926-2-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
References: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
Subject: [RFC][PATCH 1/9] bash-completion: move in recipe from meta-oe
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
X-List-Received-Date: Thu, 14 Jan 2016 20:58:26 -0000

Recipes in OE core are building packages that should RDEPEND on
bash-completion so it should be in this layer.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 .../bash-completion/bash-completion_2.1.bb         | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/bash-completion/bash-completion_2.1.bb

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.1.bb b/meta/recipes-support/bash-completion/bash-completion_2.1.bb
new file mode 100644
index 0000000..fbe4278
--- /dev/null
+++ b/meta/recipes-support/bash-completion/bash-completion_2.1.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Programmable Completion for Bash 4"
+HOMEPAGE = "http://bash-completion.alioth.debian.org/"
+BUGTRACKER = "https://alioth.debian.org/projects/bash-completion/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SECTION = "console/utils"
+
+SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "4e2a9f11a4042a38ee79ddcd048e8b9e"
+SRC_URI[sha256sum] = "2b606804a7d5f823380a882e0f7b6c8a37b0e768e72c3d4107c51fbe8a46ae4f"
+
+PARALLEL_MAKE = ""
+
+inherit autotools
+
+do_install_append() {
+	# compatdir
+	install -d ${D}${sysconfdir}/bash_completion.d/
+	echo '. ${datadir}/${BPN}/bash_completion' >${D}${sysconfdir}/bash_completion
+
+	# Delete files already provided by util-linux
+	local i
+	for i in cal dmesg eject hexdump hwclock ionice look renice rtcwake su; do
+		rm ${D}${datadir}/${BPN}/completions/$i
+	done
+
+	# Delete files for networkmanager
+	rm ${D}${datadir}/${BPN}/completions/nmcli
+}
+
+RDEPENDS_${PN} = "bash"
+
+# Some recipes are providing ${PN}-bash-completion packages
+PACKAGES =+ "${PN}-extra"
+FILES_${PN}-extra = "${datadir}/${BPN}/completions/ \
+    ${datadir}/${BPN}/helpers/"
-- 
2.4.5


