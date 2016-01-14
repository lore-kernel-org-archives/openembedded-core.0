Return-Path: <george.mccollister@gmail.com>
Received: from mail-ig0-f196.google.com (mail-ig0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4CFD4731E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:58:40 +0000 (UTC)
Received: by mail-ig0-f196.google.com with SMTP id o2so20907973iga.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mhlwExPv1r2jlkgXl6SE2uK94ZIX5BcN5LXFIG+kdK8=;
	b=hycvo89An9PvXG2NrgbEzgmh9+NJPsQ7JEAtHh82lapHNUtbEI10o1KnLFefAd1JKt
	/xGpqErzil6S3U7SHvLr171orSmUes2+aRbiQs8Ec2XZ3MGhhOynQFnOMgxhhSPp8uPW
	K8wXhSUEPdM9K0uimKO1Njkbq/iA1i1dYrfe0Cl1vktYkeeqpi3F7T5cRpC6uS+pSQ+A
	L202mR7dv97j812/3uxrdlUKAIv0SMnmedborsjIDSzQU98/MOU1m1ebB2jTR57kZILX
	dLyYEghUFK39r8MLTkmScU6G9epPYC4Uq3aPgL8hCyFA87g2BAgR867XvzyoPxmS3+w2
	jGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mhlwExPv1r2jlkgXl6SE2uK94ZIX5BcN5LXFIG+kdK8=;
	b=XofUm+DWVl1H5s9Z5nRsiVwI83flcOGwdSsWrv1RZ77racl9/OsfRwKcV1+Oal4nLl
	BbI1oHHPWoSthijWR/W0uuzxY4sMqmmBcXfNN4t3lEQrKCY6cVyI81aomsmzNbTX7cbR
	mjHyTJFqn4YCjXnzdmh9MUIK+3U7xkmVb5u0TbwvlmnXQ1LCl7hw4YOoPdmpGnvj5xvh
	/bCun7d925VsxLxgVNDX6WUinLkrxBmKtA2n18Jj6rW9NDvjXXHRHn5USmAGx5kR+ZYa
	dj38xYxG/j13g8SpCHfZaWKdnKppXz9gpPzKaWxl+aZlLFB7NjxpSU90l1uVlTJL6N7E
	uGBw==
X-Gm-Message-State: AG10YOQ7RCBAQm+GLZP0iRIDLOeEVwtBs9tAdYGPlvvrTh1o5zzjb60er1IQMdOCgbymYQ==
X-Received: by 10.50.23.77 with SMTP id k13mr2957905igf.2.1452805121238;
	Thu, 14 Jan 2016 12:58:41 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	204sm3203278iob.44.2016.01.14.12.58.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 12:58:40 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:56:34 -0600
Message-Id: <1452804997-20926-7-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
References: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
Subject: [RFC][PATCH 6/9] util-linux: use bash-completion.bbclass
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
X-List-Received-Date: Thu, 14 Jan 2016 20:58:40 -0000

Use bash-completion.bbclass to package bash completions.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 7ef7a54..b9961f7 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c
                     file://libmount/COPYING;md5=fb93f01d4361069c5616327705373b16 \
                     file://libblkid/COPYING;md5=fb93f01d4361069c5616327705373b16"
 
-inherit autotools gettext pkgconfig systemd update-alternatives python-dir ptest
+inherit autotools gettext pkgconfig systemd update-alternatives python-dir ptest bash-completion
 DEPENDS = "zlib ncurses"
 DEPENDS_append_class-native = " lzo-native"
 DEPENDS_append_class-nativesdk = " lzo-native"
@@ -31,7 +31,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
              util-linux-mkfs util-linux-mcookie util-linux-reset util-linux-runuser \
              util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
-             util-linux-partx ${PN}-bash-completion util-linux-hwclock \
+             util-linux-partx util-linux-hwclock \
              util-linux-findfs util-linux-getopt util-linux-sulogin"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
 
@@ -64,7 +64,6 @@ PACKAGECONFIG[pylibmount] = "--with-python --enable-pylibmount,--without-python
 # Readline support
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 
-FILES_${PN}-bash-completion += "${datadir}/bash-completion"
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_${PN}-dev += "${libdir}/${PYTHON_DIR}/dist-packages/libmount/pylibmount.la"
-- 
2.4.5


