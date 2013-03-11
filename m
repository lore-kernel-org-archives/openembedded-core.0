Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF7fk-00008c-Vj
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:42:33 +0100
Received: by mail-da0-f41.google.com with SMTP id j17so938715dan.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 11:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=DY8EKKeL2L3jPBL0ZzQcH0nYKDqk4yg2PkfcBURGuKs=;
	b=biiOBhfKPw06Do9giFJ81mLQ+Su2W+M1aTb/aPaRkYScb6CGTQHmwCo5peM9sQCmVV
	NyVOqVhrq04xFTPY9t2cUwkeb32T5qpwTW5XGbARc1fwMVhsgyy+nvw8LyIkyN1kffUy
	ZzAVoY9RT0qcWby2O+7jOGn395bI7I78LFO2gr2r1h6373ML+AdEQ+zXDE3mnbMjjPNj
	vUr4MMn7U7UCKCllCbyzaeo04LZ6TFSzr+yhTvgRx7cXvONGaW8ol13k+5LBXyvT/CUw
	uYesHNHQhurnXeB6ipQ1VuwV89mfhY0rhy5PuMi7pX/LyN2hlowrax0IJC+2tZwvE8qP
	k6OA==
X-Received: by 10.68.197.193 with SMTP id iw1mr23615799pbc.86.1363026329708;
	Mon, 11 Mar 2013 11:25:29 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id hu2sm21402014pbc.38.2013.03.11.11.25.20
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 11:25:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:24:51 -0700
Message-Id: <c6f72639acbbdb466eb6166a0679d6e04405758a.1363025917.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmz1JLxcuTLhS0QHnDRL3HUZkm+iwpGAxoHbJmFKQzviLMR7N7USKQmh1YKlNx5paFrOCcn
Subject: [PATCH 08/12] systemd: busybox's swapon now supports -p
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
X-List-Received-Date: Mon, 11 Mar 2013 18:42:43 -0000

Now that busybox's swapon supports -p, systemd doesn't need to depend on
util-linux.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 31add79..2e637e0 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -173,11 +173,9 @@ RDEPENDS_${PN} += "dbus udev-systemd"
 
 # kbd -> loadkeys,setfont
 # And pull in the kernel modules mentioned in INSTALL
-# swapon -p is also not supported by busybox
 # busybox mount is broken
 RRECOMMENDS_${PN} += "systemd-serialgetty \
                       util-linux-agetty \
-                      util-linux-swaponoff \
                       util-linux-fsck e2fsprogs-e2fsck \
                       util-linux-mount util-linux-umount \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
-- 
1.7.10.4



