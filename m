Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id C186E78493
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 17:11:24 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n198so424144qke.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 09:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=nNqWd5tjTR7m7LvOi8RlkCDuRSmF3Bx9Q/QJ7f8Fqdo=;
	b=mzqldSdkbSF0l05Z7ee76OLZSYytWhlfjheutUlRd+1eRa3U5RY+1Hi7mHQrYipCrU
	CWoEf2tv/uTt/f5ypnDmWLbEn0bbx4sN0m6+m/bT38fzn9vDhxNt8EueqKiZIhgJhFTO
	H/nHTwgzCupGw/pi/rFGy9gi61mIbEcy1g8PXInPJbm8Azj60ZQOntmr9VVMpoMI9SPb
	ln9LH7kamcFA2KaUnRWPParK7swl9ZvrcHSxh9C+0i+5Q1nHSHZ1cUn7P7L3cRpxyc5v
	F35aTcdMSmco8YEmLHodESyAHXz8dg0/3wRsUUIi9krjvbTYTx31s9K3jXowyNIJy6AA
	o9VQ==
X-Gm-Message-State: APf1xPDSTh+qtuGD6NMHtBsSeonJ9Qqupkj1zYnKP1dwZslo1OSJ6IID
	fXJv/3oGaEbsnpbg9XJCDxaH/A==
X-Google-Smtp-Source: AH8x224pngUvc4mwgm4TpzNuZYtAwKj7eiz6IplHJh6OiPS0w7p3bt6SOIdc3Ol7l/CPvlZTtFMBhQ==
X-Received: by 10.55.178.5 with SMTP id b5mr5212524qkf.335.1518714685175;
	Thu, 15 Feb 2018 09:11:25 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	y27sm1283636qtc.85.2018.02.15.09.11.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Feb 2018 09:11:24 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 15 Feb 2018 15:11:17 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Feb 2018 15:11:14 -0200
Message-Id: <20180215171116.27911-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] go: Upgrade 1.9 to 1.9.4 stable release
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
X-List-Received-Date: Thu, 15 Feb 2018 17:11:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 1.9.4 fixes a number of issues in the Go compiler and is important
to get in before we start working on 1.10 inclusion.

 - go1.9.1 (released 2017/10/04) includes two security fixes.

 - go1.9.2 (released 2017/10/25) includes fixes to the compiler,
   linker, runtime, documentation, go command, and the crypto/x509,
   database/sql, log, and net/smtp packages. It includes a fix to a
   bug introduced in Go 1.9.1 that broke go get of non-Git
   repositories under certain conditions.

 - go1.9.3 (released 2018/01/22) includes fixes to the compiler,
   runtime, and the database/sql, math/big, net/http, and net/url
   packages.

 - go1.9.4 (released 2018/02/07) includes a security fix to “go get”.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/go/go-1.9.inc                                | 7 +++++--
 .../recipes-graphics/mesa/{mesa-gl_17.3.3.bb => mesa-gl_17.3.4.bb} | 0
 meta/recipes-graphics/mesa/{mesa_17.3.3.bb => mesa_17.3.4.bb}      | 0
 3 files changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.3.3.bb => mesa-gl_17.3.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.3.3.bb => mesa_17.3.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index 7f12241dc18..2823304b7ce 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -1,6 +1,9 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.9"
+GO_MINOR = ".4"
+PV .= "${GO_MINOR}"
+
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -19,5 +22,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://set-external-linker.patch"
 
-SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
-SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
+SRC_URI[main.md5sum] = "6816441fd6680c63865cdd5cb8bc1960"
+SRC_URI[main.sha256sum] = "0573a8df33168977185aa44173305e5a0450f55213600e94541604b75d46dc06"
diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.3.3.bb b/meta/recipes-graphics/mesa/mesa-gl_17.3.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.3.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.3.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.3.3.bb b/meta/recipes-graphics/mesa/mesa_17.3.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_17.3.3.bb
rename to meta/recipes-graphics/mesa/mesa_17.3.4.bb
-- 
2.16.1


