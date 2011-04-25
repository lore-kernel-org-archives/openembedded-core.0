Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQyH-0003kf-Rf
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:57:22 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so1379643pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=JbYihcekU8X5zlW0UPG1d8FqJ/rlRg0rLOh7t3h0qnU=;
	b=oOrWgXsd39kEjVVFyZOSiv2mWMqK8ra/WEWwdxXxfMt1gndWUEOD269KAv670HCimr
	SENiItY1R1FkP5W53zSHOEGjdc9RGgQ+nvLHXMkOgn81NCMosQzyWdCpWBWXJO7HolCS
	dkx1pBe5wKlFr2XoE//oUsKZpOZ3TG2Kl9hQc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GRU5g2PEyGcGmmFonIzd8iu9dA9OjMB35T7ycozvDgSXLCDFUrneLFHK8WS+LKWrPZ
	8qGD4rhjVvkdDwmm0Yn5XwMs2GxJNlKRDm6gTnNsvQwvo2XHCHEL02WSZaycZGSpGGQp
	1+/1P6//sZZUTfhH4flzXJ1FWB8VQ/ix172gU=
Received: by 10.68.39.69 with SMTP id n5mr1339249pbk.182.1303757694820;
	Mon, 25 Apr 2011 11:54:54 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o3sm1187126pbt.61.2011.04.25.11.54.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:54:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:54:49 -0700
Message-Id: <8f93225c993b39516f88caa24eef0af409834812.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 07/17] gettext_0.17.bb: PROVIDE virtual/gettext and RCONFLICT with proxy-libintl
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
X-List-Received-Date: Mon, 25 Apr 2011 18:57:22 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.17.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.17.bb b/meta/recipes-core/gettext/gettext_0.17.bb
index bfcb5ea..ce5fc3e 100644
--- a/meta/recipes-core/gettext/gettext_0.17.bb
+++ b/meta/recipes-core/gettext/gettext_0.17.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 PR = "r5"
 DEPENDS = "gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = ""
-PROVIDES = "virtual/libintl"
+PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_virtclass-native = ""
-
+CONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://autotools.patch;patch=1 \
            file://wchar-uclibc.patch;patch=1 \
-- 
1.7.4.1



