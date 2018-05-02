Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE27745D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 13:32:07 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id x22so11175558qkb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 06:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=zK/ZEEhQKjURYD7x/nqLxV/1zGw/bzm2nPQm4+qDX1U=;
	b=h5JLbVglPGjN18QiaOBR9eV4uTgn8TeT2Wc+Okcz/HoWAtKMO4hl40frm6GovTdn+b
	yIlkTWOfppM9wTgrqlA/yRQmLtwUDEZGgeyaXz0ic8G0R4NfENqkun8NAVB7Rtzic2dO
	gnAnzyPqt3Js1RxX5gGFRYLNW+Wl/qudufT4WnUvfH4ZtU8MH5i0NwbwokFmugC1WdCZ
	pw0zJ4p1l5a+ys48N4JQlQy4LxWnleJirJg4c1Q9+42c3YhWNgzKRkML/7cQnomXdmVz
	0ed50ryjLVOgfOMzN5e7kvuzPN9aBRzS6FhJ9H1M6HJ2a57CCHoVOIbeLDoizi16MSTl
	39/w==
X-Gm-Message-State: ALQs6tBYTBnZsY4EmYl402e2/RqbteFLp43zE7fE+ZKXZDjKF1AQSH/+
	2BC8CU0neJBLXaWsMgB+ya0VMQ==
X-Google-Smtp-Source: AB8JxZr3ULOCU++eens2WOC9jAUDZo2EKDMgTqwrYAK8q+1Acpikukriko4NKC4o4TQ7rAi8u+7rDQ==
X-Received: by 10.55.145.197 with SMTP id t188mr10590397qkd.159.1525267927873; 
	Wed, 02 May 2018 06:32:07 -0700 (PDT)
Received: from localhost.localdomain ([177.194.217.140])
	by smtp.gmail.com with ESMTPSA id
	r1-v6sm10804921qtc.15.2018.05.02.06.32.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 May 2018 06:32:07 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 02 May 2018 10:32:00 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  2 May 2018 10:31:58 -0300
Message-Id: <20180502133159.9544-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] go: Upgrade 1.10.1 -> 1.10.2
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
X-List-Received-Date: Wed, 02 May 2018 13:32:07 -0000

This is a minor release that fixes many important issues found since
1.10.1 release.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/go/go-1.10.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.10.inc b/meta/recipes-devtools/go/go-1.10.inc
index 1d5958a68c1..3a135bf2835 100644
--- a/meta/recipes-devtools/go/go-1.10.inc
+++ b/meta/recipes-devtools/go/go-1.10.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.10"
-GO_MINOR = ".1"
+GO_MINOR = ".2"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -20,6 +20,5 @@ SRC_URI += "\
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "d55e8b2c6272ab1abf5e4e6cdaaca680"
-SRC_URI[main.sha256sum] = "589449ff6c3ccbff1d391d4e7ab5bb5d5643a5a41a04c99315e55c16bbf73ddc"
-
+SRC_URI[main.md5sum] = "c63b35075bed693bbfc84d4a6262948a"
+SRC_URI[main.sha256sum] = "6264609c6b9cd8ed8e02ca84605d727ce1898d74efa79841660b2e3e985a98bd"
-- 
2.17.0


