Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5288978513
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:09:39 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id 1so31343677qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WoGBxTWSKK7Q9Csh9jtKULc2AUVpgQRcs7V3vznPgpI=;
	b=oP8d03jgE2pqjMlLawBG0aSQGA5ZmMHNNlOJaZyl5rV2201wGfd3Rusba566bZolbg
	G6YUIeI0HR4weLdWkbEFt43CVEUrxLJD11fKzLGnoK+J4oHiAabPDUXF9yXdq8GvHh83
	vZ274//vEYUTWFFYiZBo8G9MOva/lZriNrSdV+mMZt6B81jqGm22UR9MBR+9/wos/5m+
	4zSX2/CyEveSsK4bA1K/eVol6KjGFkSpamw9ZYwfTF4WIpM46P7IJAhX2IjgItARK2JM
	why0It4uWUlMGtDeoGan7gICOk0AI7CUWizjIBiZAshzt9czjSsF4P3TalDILRs0zAWp
	WqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WoGBxTWSKK7Q9Csh9jtKULc2AUVpgQRcs7V3vznPgpI=;
	b=LEd2+rG0N1A1HyKHhyJklNlW4Kv5B7Pz7qcAiE2dIBYRDg8ntxjMJP+Mn6Cej0UbOH
	RJETL6ylgoQ7DN82EtmmC0uQG5TgRplhKjjyXiNjpvdCstoEiwk1xQhUOmkNGGXmxuRm
	Odk7xFZfcicIwlM60U7V128gfJu5zz19EOLptZuq/loXCmLlf4nzPHDx7DaWKB9PbToH
	TyYGEWXMPQGmGSScCxcgzJAE9NDAGr75AK8F3E+rqnm+8sw+PKh9xUvEfogrnejMsDLr
	RUIKcG5sKbKtzbcZ1qJczSYIOPxhaDYVbzzPuByGAk9/2g374+NUSjWbh2fEWHm0WVe8
	O7Tg==
X-Gm-Message-State: AJaThX7yB3vGXAw2lxqSsXlSf0vKFR62wTrtbEsFjvbDEMBpOqLslzcd
	oK+3rHh67rnioODGnkpi8arqrw==
X-Google-Smtp-Source: AGs4zMZWb7XduXUdwl0VTD+LcBTLKC0ZoAxy0xDkVEVpIViezuHKllPM9Ck9/HgqdpSS6UPyy7rjUQ==
X-Received: by 10.237.60.117 with SMTP id u50mr21878951qte.6.1510715380442;
	Tue, 14 Nov 2017 19:09:40 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	r21sm7319968qkh.89.2017.11.14.19.09.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 19:09:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 19:09:19 -0800
Message-Id: <e7e785aca5d96b26f9e69e083b08fbceb05bfeee.1510715185.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510715185.git.raj.khem@gmail.com>
References: <cover.1510715185.git.raj.khem@gmail.com>
Subject: [PATCH 8/8] glibc: Upgrade to latest on 2.26 release
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
X-List-Received-Date: Wed, 15 Nov 2017 03:09:39 -0000

For detailed view of changes see
https://github.com/kraj/glibc/compare/glibc-2.26...77f921dac17c5fa99bd9e926d926c327982895f7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 135ec4fb16..d449af2548 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "1c9a5c270d8b66f30dcfaf1cb2d6cf39d3e18369"
+SRCREV ?= "77f921dac17c5fa99bd9e926d926c327982895f7"
 
 SRCBRANCH ?= "release/${PV}/master"
 
-- 
2.15.0


