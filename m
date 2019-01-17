Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1E89E7C21C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:39 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id y11so8316559lfj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nfsWBpNUdF9h5DgreoovAdTam7h8FJckkikIZONVh38=;
	b=qEfKHfUE4aQLHnX+S8nGSjuD8RDD5ba909UzniPsPCZrKnCB4bLK0v7pgjZl0g+5a/
	BmUUb0aJu7bmzPUuM9zdW2C9NDvmfA6uZih8lIOD6F4EAib1RT1ZCgvcMJ2UQYV6y0O7
	IGvW6xKbh7hl7ApkRtLEeMX6wSuH26BvQQuzi7dm14dnEPDp0L9biqcBumJrOFlIL1C2
	fbSiiYidPJrdYrB1Rjk5mksJLc9KFKXqlv86lhaLkj12N0+4ZgGiv3SYa/TI10ier7Ai
	HY5F5TSYW45I1r7SWvgc6tuAwkgcWO1ufX/xs4P7toTCooB4s6uF81MEaUMa9GcQKawj
	gSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nfsWBpNUdF9h5DgreoovAdTam7h8FJckkikIZONVh38=;
	b=l9boSHOUvP9LuyF10OIw4HSMjLUeO9XXRj2t58ZN6N7UIOuM8dHzdFfv6AjcazvZzi
	FGheQI1yKsnAbap8/WU6fxgfhkHehVM0vi1oOdc8EBodz7L9jXOexFyeddCmTUWIDaJX
	nWRdReiVTRxdHhzwLFh/A8H4CbFroj1f6seNRNgiLaQ6M3yptgvHEEsyRIgowWvnYces
	xkZrE1FdHAHAt0ptPGHdhbobnu/wBpgMf6W14CXo3CRqQBLw3W5yGEsRKol0CJJj1MYB
	rOoPNe9qgrnc8W37usinkpwryHkqew1VeHvOp39LCbs7uJD6/XFF+Mw8z589VQ4BC80B
	M6ww==
X-Gm-Message-State: AJcUukdgTuyFk96uBlnFtu+AXKkcWbQAHPsNK1/72YxadGM3NI+3zgU+
	x39sEUkJSglvNn8Ki8kZ4vbndoTi
X-Google-Smtp-Source: ALg8bN6CgIyhnTZiYyISt3RDKnwJsPbTmJSwWnVM1W90T+EwlnU9YCCFV/VTCGMR1IAqcPjsh78boA==
X-Received: by 2002:a19:1019:: with SMTP id f25mr10474320lfi.54.1547743240275; 
	Thu, 17 Jan 2019 08:40:40 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:39:59 +0100
Message-Id: <f7561adf88a24091a597302b8c51905929d5ba7b.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 14/27] qemu: remove support for building against host sdl
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:40 -0000

This hasn't been the default for a long time (as some distros don't
support it), and with gtk+ being the new default shouldn't
be needed at all.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 531f0a04c58..db9c2245df9 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,14 +39,6 @@ export LIBTOOL="${HOST_SYS}-libtool"
 
 B = "${WORKDIR}/build"
 
-do_configure_prepend_class-native() {
-	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
-	fi
-}
-
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
-- 
2.17.1


