Return-Path: <danismostlikely@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1966579B34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 21:22:40 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id u34-v6so31885664qth.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 14:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=du6lqnak+EYu1Wi03ICm89M5vKIeGdfyjPMvP+qKuBM=;
	b=NXoTRAcGkabNucXxzbFIeGrowlgwbx/IkZQvZd7Lmlgb5ltJJ0FPmOj+2m+Ao4PYZZ
	kNySjDkUnP3GBEYFx2CAlKoPoOkhJ39JLL490V/4hBYfpLacgE7gD19bpqQGzlbLaKnw
	886eXpF6IHqE4w08XM2J2N38INgtIGLUSR4nruYFvvoV5KpdUIFdGsKLgLt1FZgA07jT
	X55+sgdNRFHIT/+VZSZ+ZbLGhm9IgT1VT1IDwC6edCdY+3fmgkgPxWDXxS1KRMPIgKni
	EyrUPxBT3nI2BP41l21+Sh9WPX6fuvhaOzWOY2jEwozdblJWUxubxsiW/D7cJoAbakdJ
	d1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=du6lqnak+EYu1Wi03ICm89M5vKIeGdfyjPMvP+qKuBM=;
	b=otzS/6zMY3BdgMb7ox9TfgGBeUAcesbWXf0mWR8NVX7OLn8RRSqNYpvqRp+R47XSX9
	xSY/zOONyzt115SJGK2DruREx0f3XQsadMqcYUXxrdHh7lo65QQCQHLq92syXCtvbPdQ
	wOYW1Uub3nDrkKLUm4J4Hti9gc/dx1RrOi6MLz81NDpwvw5Tg/VASGsJDEyFOxYm7UfY
	GgrlTQtEuNz8xHiLgboqwaXKjb/atFSRJyB7OOjNo9kmu2LpNq7He0i/aITSoii+Gj4o
	QBm8U7RqH5Ajv8LXCZ7HhwemqQLeOldjqV3SIXGl+lemCRaWcwGMtRJRhk+K4l/kZZBw
	Vlcw==
X-Gm-Message-State: ABuFfoiQutLxjCoPwN5u7m32XVeuShK/unspbcE/HQI4lfMiTEYXR56A
	l1ff5q2pEKapzCWwxRkyX8djAdF8
X-Google-Smtp-Source: ACcGV62wpVC8bnUnNuVDygqYXjJmhjavUTRv56A0JhctdyaqFomgc3sn7dAWGtSoNrq+TqbSeubr2g==
X-Received: by 2002:ac8:ec3:: with SMTP id
	w3-v6mr26502468qti.138.1539811360924; 
	Wed, 17 Oct 2018 14:22:40 -0700 (PDT)
Received: from mediabox.local (204-83-204-143.prna.hsdb.sasknet.sk.ca.
	[204.83.204.143]) by smtp.gmail.com with ESMTPSA id
	h4-v6sm9799796qkg.95.2018.10.17.14.22.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Oct 2018 14:22:39 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 15:22:33 -0600
Message-Id: <20181017212235.8453-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.19.0-dev
In-Reply-To: <20181017212235.8453-1-danismostlikely@gmail.com>
References: <20181017212235.8453-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] file: alternatify file
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
X-List-Received-Date: Wed, 17 Oct 2018 21:22:41 -0000
Content-Transfer-Encoding: 8bit

From: Dan McGregor <dan.mcgregor@usask.ca>

file is also provided by toybox.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/file/file_5.34.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/file/file_5.34.bb b/meta/recipes-devtools/file/file_5.34.bb
index 6612b71000e..5d92913cb03 100644
--- a/meta/recipes-devtools/file/file_5.34.bb
+++ b/meta/recipes-devtools/file/file_5.34.bb
@@ -21,7 +21,10 @@ SRC_URI = "git://github.com/file/file.git \
 SRCREV = "315cef2f699da3c31a54bd3c6c6070680fbaf1f5"
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools update-alternatives
+
+ALTERNATIVE_${PN} = "file"
+ALTERNATIVE_LINK_NAME[file] = "${bindir}/file"
 
 EXTRA_OEMAKE_append_class-target = "-e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
 EXTRA_OEMAKE_append_class-nativesdk = "-e FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
-- 
2.19.0-dev


