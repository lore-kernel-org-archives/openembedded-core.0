Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC5C60C13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:22:01 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id j15so2680887pgm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sOxPrrAujN5DVlnZRPmsCbaJjyGO7gvZNMd2E3//6b0=;
	b=HMsk+w6qKizWTth3tHkQtMSMSJzJyRmCkMjFPa/AwDLFQS7RRzMGwV1VdnVVX/rPpS
	aRJYZDRPhcgdBtn3nI4uCElTT2xDu0AvpTIGiXBtTiUP4Om9Yi0GPQ0bRKh0hPr4/B3b
	Yhj+DGFq36PSLEa4bMEca0mQ9mde57+QQpBdMl/5T3+33vxTsV/G9bfBkWg/YsxTaPaY
	8EqolXisbiKTP/8FHe0npQkS7w1y38/Vt0QuswlmRbL/U76ngP5lfs7f9CVg1lpsQcLV
	3/LsCzrFhUGE/u9bsUuksgkDwj6pAKmSv1ko3H4AVdHQvPUx8I5XeaPSRBMPBlctDSMY
	m6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sOxPrrAujN5DVlnZRPmsCbaJjyGO7gvZNMd2E3//6b0=;
	b=lnBGPfcvtyp4lzQqG/eSsGHtBfwGy+1bBxhOxBmE2BDzxMLagL5Vnc/LxnfYGH42DW
	/RJpjH2lXSTz6/7OoiEN+/GcmUlq9sYSnCQrk4EdPOSDjvjpwUgt+YXUadoGGnoSPVWP
	t/osFlUOl4JwRWtmj+Kt2XF1aiyw5ysjbZGKl8WwQ9NI0gtNpIolKj0BP5dAVAadIw28
	btYEulLmZJVl12ZqegFTJ9HOTlPpp4mkNVZJnfidX1k6cfbTBR6Aq3pp28m7PfoFKLio
	a/ofTpgnXjCsDfVaarCnKgdcmtD1ll6xQ3jPasVUItSmTEumFH8unxsH2ABl6DJ/UILD
	mtCg==
X-Gm-Message-State: APjAAAXICFq+fYWuqnGvt6t9F/tC9encdzoCkvtd2+3IRXlXL5uNqTRm
	ZsMxEkovwe0dOVQ92UeQptn61j774Fk=
X-Google-Smtp-Source: APXvYqz6WHQ2IFqSTM2p1jwE6s+Kho75UPDYsfYIVCQhW31/viCzUpC9fFgDcuizrA+o+JdIaGTOmQ==
X-Received: by 2002:a62:ab13:: with SMTP id p19mr12510061pff.98.1581582122227; 
	Thu, 13 Feb 2020 00:22:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	f127sm1958085pfa.112.2020.02.13.00.22.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 00:22:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 00:21:53 -0800
Message-Id: <9bb12593baf723d5b00320c25c0658c77919c304.1581580428.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581580428.git.raj.khem@gmail.com>
References: <cover.1581580428.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/10] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Thu, 13 Feb 2020 08:22:01 -0000
Content-Transfer-Encoding: 8bit

dnf does not work with opkg or dpkg/apt anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 2 ++
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index f38167f1ad..220f1aabbd 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
                          dnf-automatic-notifyonly.service dnf-automatic-notifyonly.timer \
 "
 SYSTEMD_AUTO_ENABLE ?= "disable"
+
+PNBLACKLIST[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index 882c435b32..49afa04812 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native = " -DWITH_GIR=OFF"
 EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
+PNBLACKLIST[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
 
-- 
2.25.0


