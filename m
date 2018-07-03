Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2B0786EA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 12:34:46 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id z6-v6so1349290qti.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 05:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=kaSqRTmAlH0/iX2+5otXAVWd4QI2SU/PvbL3aQRoB7g=;
	b=o8RO5ugTj7h27lf/DqSMtElUlJi01Y8TEMO5Tq3g1v5H1bKzPpmPxchIlP1pOQxyeg
	p1PzzivI4lpOr4WQioKg8nz6S/w0jQNIfIkA7sbENmnEhP4BBb2VN2wnCO9FVqkzVk+t
	OdQ/iFqlxfKrtd4AbQ1sYBsJxbO9z04wnHx8noVKdJa3i8r312mJvxl8nlqWNoqnSsyC
	O2ZP+vYuoUsGy/yD1mlpI2XXWdf7alvrYjd/Aiu/qLdDjeKTo9sugk2IqnjRJoA6t/BF
	CDr02OfLU55Z+EKr/1NB6EOSgkASOwLUd8nUNjghSM/uxzYcJa/2lKrpDkIcLM7t0B+1
	TFCA==
X-Gm-Message-State: APt69E1LiF76teL7LiPge5szlCLxKXJs5VOF+xmikG9axqEkoSufa/zY
	JZ8AS/2XGtZGyASWtG4hBbCntw==
X-Google-Smtp-Source: AAOMgpfHm0FFdnTk/9aJeUL95Gc5ac82wEZbPkU3lhrubQRjoHm8yptSfRq67f0JboD8KuspqfzEZQ==
X-Received: by 2002:a0c:c505:: with SMTP id
	x5-v6mr25443357qvi.206.1530621287713; 
	Tue, 03 Jul 2018 05:34:47 -0700 (PDT)
Received: from localhost.localdomain ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	z202-v6sm603314qka.8.2018.07.03.05.34.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 03 Jul 2018 05:34:47 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 03 Jul 2018 09:34:43 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  3 Jul 2018 09:34:34 -0300
Message-Id: <20180703123434.29588-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180703123434.29588-1-otavio@ossystems.com.br>
References: <20180703123434.29588-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] go: Update 1.10.2 -> 1.10.3
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
X-List-Received-Date: Tue, 03 Jul 2018 12:34:47 -0000

go1.10.3 (released 2018/06/05) includes fixes to the go command, and
the crypto/tls, crypto/x509, and strings packages. In particular, it
adds minimal support to the go command for the vgo transition.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/go/go-1.10.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.10.inc b/meta/recipes-devtools/go/go-1.10.inc
index 3a135bf283..1df0fc5b6a 100644
--- a/meta/recipes-devtools/go/go-1.10.inc
+++ b/meta/recipes-devtools/go/go-1.10.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.10"
-GO_MINOR = ".2"
+GO_MINOR = ".3"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -20,5 +20,5 @@ SRC_URI += "\
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "c63b35075bed693bbfc84d4a6262948a"
-SRC_URI[main.sha256sum] = "6264609c6b9cd8ed8e02ca84605d727ce1898d74efa79841660b2e3e985a98bd"
+SRC_URI[main.md5sum] = "d15dfb264105c5e84fbe33f4a4aa5021"
+SRC_URI[main.sha256sum] = "567b1cc66c9704d1c019c50bef946272e911ec6baf244310f87f4e678be155f2"
-- 
2.18.0


