Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id A31D37D476
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 21:19:56 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 132so7892427ljj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 14:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=K/I93DBn7sDf4BkdcKHEzGSMoNDbuA/irtIGwr0L84E=;
	b=i45tRUuYjDlhPhKCoLxCwT9AAuEyvNIgzjKXSSeJR8D5D6ZJPp6ExOQnHimhmogWLv
	2TqElZnF/kFo91qBeIcgycTbB+s90JIyEEponfj4uCCzkwKDUdcJp5sKcoWGy5saeTN3
	Vttg5D7oPoJSGtkK0dSbEWLV52dOvpQhWfshrppgp8Dzy2QuX7p8ueTpSGqW7JaMtG89
	+PMKGKA3wqTuKQO8VtV5C/XZUTTl5GWT3PXQE11HbAfexGaGqtUl/E4ybIkAnLmIOeU5
	NxX79lzpF7F8lPDehDv/nvm7gWv2ujku5/3nhKL+boxTPviKjLmo+f6NhUwYWlHaJrvp
	oQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K/I93DBn7sDf4BkdcKHEzGSMoNDbuA/irtIGwr0L84E=;
	b=dLluwRvmGRU1riTZBeDwXqmBd0iSyr1EKDR5CbnTmBa9zRY84QYxZlH1pRX+TneHII
	uNr0Ir/CnCQoJfAvXgJ8wuSQgI0uh4ikzUy60UUrN4OPcZLAuvMHhMFV7kVgtIPQooyx
	Qzq19zr5RGOvLdkL62IvU3sabodr8RqsSxrlhJbpOQVsi+5EjOnn1P5orwmxBgbcpePD
	fPuTddz1FWhy6bfWYDyZtLxS2UIkCQksSKg+Xg2kwFjtstyh/XH7XE6+GnRVm/lnbsDz
	HIW/QY4PQGWViLCtU/txLy9VQJa2aPH8PdUSt7/wfNFqCqFOoE0Z+Caw7V1IhwyOhDx2
	Y/oQ==
X-Gm-Message-State: APjAAAWOMxW+zpVRDxZ3un6RVCzWqJ0jePuqPV7wKI0GXFis+3vvWpMy
	r8ebujZShRQVioSXQ3DjeikZ+Vh7L5g=
X-Google-Smtp-Source: APXvYqwfQJfmubzv0BT3zp4q4QOxQqDqs0fGSbY3UFiQvsiTF7Zwki/TCTUZLfVUEkrU32XTnB6Onw==
X-Received: by 2002:a2e:810d:: with SMTP id d13mr17376325ljg.93.1557263996918; 
	Tue, 07 May 2019 14:19:56 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	h24sm3381953ljk.10.2019.05.07.14.19.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 14:19:56 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 23:19:54 +0200
Message-Id: <20190507211954.10762-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] bitbake.conf: remove GPE_MIRROR
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
X-List-Received-Date: Tue, 07 May 2019 21:19:56 -0000

The site is down and no recipe is this variable.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/conf/bitbake.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 14b0764f22..790d088dc0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -645,7 +645,6 @@ GNOME_GIT = "git://gitlab.gnome.org/GNOME"
 GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
 GNU_MIRROR = "http://ftp.gnu.org/gnu"
 GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
-GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
 KERNELORG_MIRROR = "http://cdn.kernel.org/pub"
 SOURCEFORGE_MIRROR = "http://downloads.sourceforge.net"
 XLIBS_MIRROR = "http://xlibs.freedesktop.org/release"
@@ -663,7 +662,6 @@ SRC_URI[vardepsexclude] += "\
     GNOME_MIRROR \
     GNU_MIRROR \
     GNUPG_MIRROR \
-    GPE_MIRROR \
     KERNELORG_MIRROR \
     SAVANNAH_GNU_MIRROR \
     SAVANNAH_NONGNU_MIRROR \
-- 
2.17.1


