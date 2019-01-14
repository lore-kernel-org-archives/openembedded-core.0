Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A563B7C052
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:38 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l9so23182343wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nfsWBpNUdF9h5DgreoovAdTam7h8FJckkikIZONVh38=;
	b=b8Hj/S77rzS8RFtYZ+1n8EFhRcwqKEUEiRCfIo3n7r5qdzQLsb6/sKv1nb9RdA8K7U
	w7F0xDzjQqIqAokmnIkLQ8aFcazoJXNaiQIzdN7e3a7Po5XwuK6l9aoueb10EaoyN69w
	iMdzh2G4Gi0EH9v959r5rErnVMwSZ4iU+VV/kV1W9ZxvGNrCRxfsB4rXWybJOmOympcu
	eoZZdzQGCwNPrFqFgVpAvZXlHTMH9vxGJTEMiyB8toZwtb4edSoe8vE/8k4jdCA4z3t3
	prkSzlsBRHAUYt7qMNzxZzuJyMfiBUmCgUFsjo0NQ84TNnUCp8bVA5aDcrXGV/mfDII4
	kYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nfsWBpNUdF9h5DgreoovAdTam7h8FJckkikIZONVh38=;
	b=p7bK14iFaprQu5BSbZZYqcnBytXngONGGtk6qTzoU5A/fWWn4t3LTh/iJkvohgptGN
	IIlJZRYobwHQu0eM9ot+MObVIDgM+JzgZHUZO4Rk+ZnlF5TUYnF6gkZSJv8TIumCD4fH
	pW5LWTbKLM44XdYA5fpNfY0kGNH1jzu8mEMDm0ICVZMmFVz6TDNzpf3qhdxIgWadN+x6
	UEhUqwmBgzo5pZeH6NoctXzbIQhU6DsdME1HlJkPSB1mg2wgo/GfkhMM3k6GoBX8w2eH
	8WDPLE5hYd1Dgx+E5J+qiJIdx0cRVKz3DQBJDExitvnkrRHLJxxqBRxX3B+SOQkPdGPi
	3X5g==
X-Gm-Message-State: AJcUukcW1PEaIOWG8VF0U3EJ7xTigFyRDDvc0iGe4UaZEoPfOXSyvYa9
	zabngNOfuc6UU/6JF14KdQ8MO/wN
X-Google-Smtp-Source: ALg8bN7qvd3UU85Y4aqA2fkg6Z0omzsNn3Gw7HZbuqf78Jbz++54Qfj9bSQEdcPzFNMitGRx8ynUtQ==
X-Received: by 2002:adf:9d4c:: with SMTP id o12mr23265660wre.94.1547478219310; 
	Mon, 14 Jan 2019 07:03:39 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:11 +0100
Message-Id: <49f8cc26d93dae0a40b877c675f059f23eb96da2.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 15/23] qemu: remove support for building against host sdl
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:39 -0000

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


