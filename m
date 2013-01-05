Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrNO3-0004c7-Nj
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 07:37:43 +0100
Received: by mail-la0-f48.google.com with SMTP id ej20so10682327lab.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 22:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=zD/E0WiD+dtqkGtWBU4cUD1uWue21e1qUEtENSgsVeE=;
	b=EbzzLYlsnDbtHZBbA32DjnBtka+D0Ql+pDJBWoqJ2INqZ0Jvg7/kQnJqwBIzshV7+y
	zN406Q+UcP1qCTXVVYySinuo1h6e0SAmcuzm6j9qJ5JET/VOv8jeggi0J5WNIuSXsvwz
	OO/+t5zCmjXxEdrdTN2wOVBelbnaXqPZSiuuXOMB5VrHeNn9R8oQ2PRpuDB0EN0iMy7/
	hCPLYRS6/caOydVfkNipvfCKNtdX5dx5103WP+U5r6W0AgT/ou2l7JpnZHz/LGRB9nii
	Df175NQWAWvLJ625B/xig3sNSzY4w/2NRm6q6eJUImP+yoJW8cwkXKsueW5K0QZZ4z7w
	ZvVQ==
X-Received: by 10.152.129.197 with SMTP id ny5mr52419385lab.43.1357366957487; 
	Fri, 04 Jan 2013 22:22:37 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id
	ew10sm18549759lbb.10.2013.01.04.22.22.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 22:22:36 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrN9G-00081x-IO; Sat, 05 Jan 2013 08:22:26 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Jan 2013 08:22:22 +0200
Message-Id: <1357366942-30816-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357366942-30816-1-git-send-email-cazfi74@gmail.com>
References: <1357366942-30816-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH] polkit: update SRC_URI and HOMEPAGE
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
X-List-Received-Date: Sat, 05 Jan 2013 06:37:43 -0000

Author of old code.google.com homepage lists polkit under heading
'former projects'. Newer versions are available from page at
freedesktop.org. Freedesktop.org homepage also points to SRC_URI
different from what we've been using. Latest version there is 0.109,
while latest version in old SRC_URI is 0.104.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-extended/polkit/polkit_0.104.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index 74b5379..4eaec8c 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -1,6 +1,6 @@
 SUMMARY = "PolicyKit Authorization Framework"
 DESCRIPTION = "The polkit package is an application-level toolkit for defining and handling the policy that allows unprivileged processes to speak to privileged processes."
-HOMEPAGE = "http://code.google.com/p/polkit/"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/polkit"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4"
@@ -13,7 +13,7 @@ PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
 PR = "r8"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
-SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
+SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch \
            file://0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch \
-- 
1.7.10.4



