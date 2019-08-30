Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 503EF7F45D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 20:21:18 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id t17so8611097wmi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 13:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GAcA8gQFMOI8yvkvmf4HwgING2IO1HNm2G9EmBZkhZM=;
	b=uqlBnydFkHxmpY+IFfWKYGgXg1TOywvCvgxZDpQM+R3A4naSVAxnPrq2EhdrHji0oT
	45IGTH5jKQYg2fkjd6XZbwPL3ehzU2Nr0+HABvbXLPFSft3Ip8ovT+wv0YoU47AknIOi
	t6Lt46TH6dAsBSMhdt/AX95zubPPNGJC7rdKAOSGWUtzh5NMfG7bUxCPErep8xAFMSJo
	MDaWRMR6X3mc1AaYmw1M07brVHJB3HspjlNweZy0Wx+/UsMNmSF2AOnZ891i/txg+pcW
	5zsv6fs9SBZaFLUDOuMtO3WYSsComaSREXDINkiryksUzlHLYL2fC7yNjJVWc2fIKYKe
	UzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GAcA8gQFMOI8yvkvmf4HwgING2IO1HNm2G9EmBZkhZM=;
	b=ug8hPRsLhPdGHT7Y613uj922dbuqbCMCaRqtLROjKN+8UNNNQDzGjI7/GK1a3YQMom
	DzBIr5M0x1pDOaevlS97chZSlCEM2hvXRQajb7GaDUYoB9jDdytMczIHcIZ+caGee7DO
	gf34hxKwpASbJvd6S3fkHHkMrMqO2ioVuG9JkhnN7jiuwCKB6MGKcfMfKFoDibP7vgpn
	ixVEQ0nqnQC8Bfgb55V1LupI/1By+TgD4eOr1JiiJELeEAOl2Gk72Bqh8Hktv1Rh0PYL
	8ojMLkDyYSGsgJgzPz+GFvU+zW1HB7/54vRuMbfJIrc+G03XjWAaJ/gNL2g2lK6aF4++
	rKZQ==
X-Gm-Message-State: APjAAAXSZFcnMF2cRar33sTYZ8mw3AhvISlyipLVb/JY/sRrhp4uiLhY
	cwLlKjY38XsW+jvq3d5/4nVFUf+4
X-Google-Smtp-Source: APXvYqwxDG6tmYujxwDXxu+FC5Y6RJOs75iTTtzEefaG03ra7++lziN7MC4WEtquQ3+onKFYTrdi2A==
X-Received: by 2002:a1c:d10b:: with SMTP id i11mr14881756wmg.8.1567196478841; 
	Fri, 30 Aug 2019 13:21:18 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t19sm7219589wmi.29.2019.08.30.13.21.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 13:21:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 22:21:11 +0200
Message-Id: <20190830202111.34075-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830202111.34075-1-alex.kanavin@gmail.com>
References: <20190830202111.34075-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] libffi: fix upstream version check
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
X-List-Received-Date: Fri, 30 Aug 2019 20:21:18 -0000

As there is no version newer than 3.3-rc0 yet, an exception
from the check is needed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/libffi/libffi_3.3~rc0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libffi/libffi_3.3~rc0.bb b/meta/recipes-support/libffi/libffi_3.3~rc0.bb
index 3e2845546e0..8acb699d4ab 100644
--- a/meta/recipes-support/libffi/libffi_3.3~rc0.bb
+++ b/meta/recipes-support/libffi/libffi_3.3~rc0.bb
@@ -16,6 +16,9 @@ SRC_URI = "https://github.com/libffi/libffi/releases/download/v3.3-rc0/libffi-3.
            "
 SRC_URI[md5sum] = "8d2a82a78faf10a5e53c27d986e8f04e"
 SRC_URI[sha256sum] = "403d67aabf1c05157855ea2b1d9950263fb6316536c8c333f5b9ab1eb2f20ecf"
+UPSTREAM_CHECK_URI = "https://github.com/libffi/libffi/releases/"
+UPSTREAM_CHECK_REGEX = "libffi-(?P<pver>\d+(\.\d+)+)\.tar"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 EXTRA_OECONF += "--disable-builddir"
 EXTRA_OEMAKE_class-target = "LIBTOOLFLAGS='--tag=CC'"
-- 
2.17.1


