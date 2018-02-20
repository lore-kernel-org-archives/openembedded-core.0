Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id A1B0277BC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 13:28:20 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id l19so1602261qtj.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 05:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=bzaQvkfG2OgGHJHDv6hBBY7zOJ9El0BczpobNOiuuMc=;
	b=rQAkvKwPowZC4U0ZyWwmwIyUV81WXAEHRGtx80YffGsLfQDQbzbEC2rU7qb+f2SSQL
	gHK/u+mYx6LeiBp63v1kdWdQu1nH8QHMWYgUzMUpEWmZLnjviRkIUsnQl2Q6RKW4ATce
	wiCEbL7Z09cHcexKXtyfZ2ahaU5HLNS+7JXmXKiO0BLDpMrRaH9pnGeOcXrpQFo7M57e
	zeqE5MIk5NySZMOxSe2tYPkVkEIqSfVgeT54Tmgzt/mwwgyvCTXO4LHy+Iuo7vV2IrgE
	V7MIF+mC04C/bx8+5GSq4152v2XiH75sn7ufvXMFkNncgqYfGVRUlQumn2Zmzs9rRv4/
	ApSQ==
X-Gm-Message-State: APf1xPDMVaXI2cguRPC4V5rx/EEGWyuf/Y7Vv3T/V6kDaoUcN/lz8ca0
	ieiLuZWgtjoYIuIpqQkpweiijA==
X-Google-Smtp-Source: AH8x225qfciQjXUqqAorgWwGuPoco79/G/Q0pLOc3HjD3CIEmajWmAl78jYcdYxgoKfou/gG3cmJ4w==
X-Received: by 10.237.58.225 with SMTP id o88mr7236384qte.307.1519133301266;
	Tue, 20 Feb 2018 05:28:21 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id q3sm5789071qkd.45.2018.02.20.05.28.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Feb 2018 05:28:20 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 20 Feb 2018 10:28:13 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Feb 2018 10:28:06 -0300
Message-Id: <20180220132811.16100-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/6] go: Upgrade 1.9 to 1.9.4 stable release
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
X-List-Received-Date: Tue, 20 Feb 2018 13:28:20 -0000
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

Changes in v2: None

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
2.16.2


