Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 823B46BC7E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:36:21 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i12so15393567pfo.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nYhZGyX/LK+OoR8aOnnGCjTxcIe5JxSy3KOdXzx7SGE=;
	b=makaRTaUXsC37xKSPuzaqON7AkwDiESC9YvRFimL4IhlOfZnOALbFyMuh7BM2rqkLj
	vrq00S2oG/BU4SyX28d7EKBni5AZ1wP6kqYhGj5efYN9VamkJaKYkDV+gRfzOgmUrGXo
	6juHm2RItrgsOYAbgoA2G7iIbvQRJ8htFkhtSBxw84EnaKN1QOWuSvlXQi0Nx9TOkhGw
	JnqJaAKHlu9PtRg6zImZTwR0KqzvazKV1YUX93/Aw4Fl+6rA9JS4q+EKC4rkqskPUPUT
	Mni52fnLCp5YAguZTb6QhQAQIc2NMta7Mlafow87ul6NWwsUI5WpvN8u7SfXy35IfTIa
	k/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nYhZGyX/LK+OoR8aOnnGCjTxcIe5JxSy3KOdXzx7SGE=;
	b=tHXcsK2Tw8lnWMyeMV24CIUpkxLI6wsvL8c3S7qzJQq+4KvSSasoLEPykoIEhZPrzy
	BaghlZhtUIWTeyWS0YpD7bgWN7xsr7ugzDNVWmuxZFjtbsBEZKRNl3NUEmEJUVt1pA1D
	u1NN0OUA/qVMRbhW+RNn4L0ZimQS20UkynqXJTIaChhPtvcnT3WVXX23q4vlh9xzdBiV
	Y3Gep/Tqlo48EEzc4byL1TolGwakzbv/wJ1TO8pJNb4vZPJC7C/Ae3sCN8l16ZwvDRDp
	/NTGfgy2S8mQ+Tg+oEfYIMAQw1g6fe5/qT2SzvVRWv+PiTz4FzowXRFBYGsp9BS96z8J
	vIvA==
X-Gm-Message-State: AJcUukfcbOQpF6eu1bgWQg6KLEXSUT7WKQ+4948sHhveX1idJZQ+PvzG
	CvnAf02l6r7Q8HqqLzL1bvI=
X-Google-Smtp-Source: ALg8bN522m5zptHZ+v3lHmLNJvNsSZQiZyf2k/cAT9kkkTFtPXaJhHD5v3mgkruUfeoHgHPOJjFXwg==
X-Received: by 2002:a62:178f:: with SMTP id 137mr44608775pfx.226.1546446982908;
	Wed, 02 Jan 2019 08:36:22 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:b176:14d6:5577:24f])
	by smtp.gmail.com with ESMTPSA id
	v89sm62973472pfj.164.2019.01.02.08.36.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Jan 2019 08:36:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 08:36:14 -0800
Message-Id: <1546446977-27510-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
References: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 5/8] gnutls: update to 3.6.5
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
X-List-Received-Date: Wed, 02 Jan 2019 16:36:22 -0000

Bug fix only release

Full details:
https://lists.gnupg.org/pipermail/gnutls-help/2018-December/004465.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/{gnutls_3.6.4.bb => gnutls_3.6.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.4.bb => gnutls_3.6.5.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.4.bb b/meta/recipes-support/gnutls/gnutls_3.6.5.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.4.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.5.bb
index d79a39d..dfc3507 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.5.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "63363d1c00601f4d11a5cadc8b5e0799"
-SRC_URI[sha256sum] = "c663a792fbc84349c27c36059181f2ca86c9442e75ee8b0ad72f5f9b35deab3a"
+SRC_URI[md5sum] = "3474849e1bbd4d16403b82ab2579000b"
+SRC_URI[sha256sum] = "073eced3acef49a3883e69ffd5f0f0b5f46e2760ad86eddc6c0866df4e7abb35"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.7.4


