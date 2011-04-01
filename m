Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W24-0004v2-Hg
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:24 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=OdzfO26pdu7LjPtQd3LejfSes8+Hf//HJNbN/VWxHrg=;
	b=tQYMX7OwQc+j0fnoL53PfPlhBkqJNjFg6ZrfdA55FfuXTkAUyyxdWvPQRVhEghw/8r
	upOlrpi198q4e0jxYciyvaWtIlP6aO4iRwsGGWL8ujAbhv7VshWkF7lq6t/EPMA5H/Iq
	ZWdWQ/AVVoFzii0C7TS7FvoJUtDYMCXcaqzVM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PmT5MRMThB1oDwEat3z2GRtvts8V5gYEsjVTa3PGri5HuJUkbzE5zwc3fZRPS+j3rP
	NFk7LmTQAWHjNZXntcDY8hsVxuM0y3voKVEAic/u6dOBTAZwR7c7NlDXb4uSYIzh5TXU
	bNqkpcmTe5JV1BdnCSiKrxqeXjmbFoWoAbQgo=
Received: by 10.42.97.134 with SMTP id o6mr4519268icn.516.1301632225858;
	Thu, 31 Mar 2011 21:30:25 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id hc41sm1179706ibb.47.2011.03.31.21.30.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:30:17 -0700
Message-Id: <3dc69d0a2cb611944a7ecc09b5857d07c50ac3e3.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 38/46] libgpg-error: inherit gettext class instead of adding gettext to DEPENDS directly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2011 04:34:22 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgpg-error/libgpg-error_1.9.bb               |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb
index 479a11f..560340b 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 SECTION = "libs"
-DEPENDS = "gettext"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
@@ -23,4 +22,4 @@ SRC_URI[sha256sum] = "54d9326bfbd46c705963c507953f65a40576d04b374e131008dc5b732f
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${bindir}/*"
 
-inherit autotools binconfig pkgconfig
+inherit autotools binconfig pkgconfig gettext
-- 
1.7.4.1



