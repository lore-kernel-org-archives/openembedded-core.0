Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by mail.openembedded.org (Postfix) with ESMTP id 055017C20C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:27:10 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id a16so8267936lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WUq/hieqCL4iLSPqts/n9LKbAPVXZgUGxe2PdpFdWKQ=;
	b=dbLUiac+3PJAP783+dE4ZTtdljB2rbL2Lg5gGZlNQTDt4Mc+TWyTp37dJR7lbmOCBK
	DGJrmlrOGHnUZgp0Qlvven46L6WTaCuZUoD8z+kA2JW+bTc7rzg/+j1sBHDrP1Zu3iOo
	VJJoaI99OEouXFbW+dA0VM/RqXv+RdJl411eVZIijFjarzgl76NZMZUKPRjFeIyFSMNh
	mzB6/LvuZRT1B70p6lmhpH0eDv0nJtTCqylkmushBeTcgGaP86duM2XM/CXZZYj6f62D
	xNFiiqetbzDg2LZqrh88uUswtTaq/kw7cEsPQSgRRzaWte3gfgm6XMbQMld6wDeFNFDP
	JACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WUq/hieqCL4iLSPqts/n9LKbAPVXZgUGxe2PdpFdWKQ=;
	b=B0y8gTckWbP6Y7ZBSVYYJMbZ1rIu1Pu/HJAvSvA1ApoaYgXviMNn6nJp6FsxIC/KIp
	06SpituBPZH255r71geQbxEXayXNtWnAFx/XUB4yMeGexyCXDiBJ8NdV7SA4sbktuSDT
	eyajSDuAPoj1znCZoTUY2GFu/5c+RIp/WorMjuulDrHX2eslpm/Oab2ZSujgNT6+EczB
	pA+UMSm2Tvuy/x5gWg2nKXj1VFP/5Qq3obNMPzIOQ4+QYJIN8QajmePgk/5eJVI6Sogb
	he8MoJKu7D2KYHC3lR4Hf1ujATqOruwSJA4h4RxtmspuZ6P+S8EvARH004ZwQ1OX32PY
	CzUA==
X-Gm-Message-State: AJcUukcYjC4dJPz2474qZubyFvaaeroR0ZSX3BECkAtqMh3uvT1TWZKx
	dT3ijkewY+PABDScSo8pKrkNyE+f
X-Google-Smtp-Source: ALg8bN5hDG46pB4MxUQRhrToMPqcEsnUDD9evTjDtgT3/VbO+Mo++/SKJOW94WBT5jneuQzAZgcoIw==
X-Received: by 2002:a19:d58e:: with SMTP id m136mr11423100lfg.70.1547742431060;
	Thu, 17 Jan 2019 08:27:11 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q11sm358866lfc.92.2019.01.17.08.27.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:27:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:52 +0100
Message-Id: <20190117162659.24997-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190117162659.24997-1-alex.kanavin@gmail.com>
References: <20190117162659.24997-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/11] libfm: upgrade 1.3.0.2 -> 1.3.1
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
X-List-Received-Date: Thu, 17 Jan 2019 16:27:11 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libfm/{libfm_1.3.0.2.bb => libfm_1.3.1.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libfm/{libfm_1.3.0.2.bb => libfm_1.3.1.bb} (93%)

diff --git a/meta/recipes-support/libfm/libfm_1.3.0.2.bb b/meta/recipes-support/libfm/libfm_1.3.1.bb
similarity index 93%
rename from meta/recipes-support/libfm/libfm_1.3.0.2.bb
rename to meta/recipes-support/libfm/libfm_1.3.1.bb
index 62d6a51e871..65a6f8e78c3 100644
--- a/meta/recipes-support/libfm/libfm_1.3.0.2.bb
+++ b/meta/recipes-support/libfm/libfm_1.3.1.bb
@@ -16,8 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
            file://0001-Do-not-add-library-path-to-avoid-host-contamination.patch \
            "
 
-SRC_URI[md5sum] = "02a024714d51e0d37afc7bd596a44f3b"
-SRC_URI[sha256sum] = "18d06f7996ce1cf8947df6e106bc0338c6ae0c4138c316f2501f6f6f435c7c72"
+SRC_URI[md5sum] = "c15ecd2c9317e2c385cd3f046d0b61ba"
+SRC_URI[sha256sum] = "96b1244bde41ca0eef0332cfb5c67bb16725dfd102128f3e6f74fadc13a1cfe4"
 
 inherit autotools pkgconfig gtk-doc gettext distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-- 
2.17.1


