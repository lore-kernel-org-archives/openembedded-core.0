Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6E30D7F830
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 18:38:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t26so777188wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 10:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/QeeqS3aYa5EAYfiBDATu6h4XlLaEqTKBLeYLSHmVos=;
	b=KZ1ejn9BdZRY98+R60F+rBIMp0DWUZt9eQQncc+MoxFnbKP3DLV7UiHjhxFhvKsg7H
	cnaqKUAbPAvJflg2J0jSzuysJu6xZgmRbYS6Y/xRbzRR4vYigm5twfuFGvZEOO88Gkel
	Xviwwa7hUotr8iOieLGSY+T9blqd3Ule7IXQKrmmUyujZmbanQ5U080N+imIix3uaNLa
	AvtZNkyIBNYikUUd90hl6OBo1DNit/Nz7EffcfXRX8eFopeoKeI69jlSlfw+olDO6JLH
	7glsLrIjiR00yNxqbt1uLIbLjlkJU6KTDqrB576/NAJr/dpqLVDX0jNcTuPvcLDCWL1e
	gnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/QeeqS3aYa5EAYfiBDATu6h4XlLaEqTKBLeYLSHmVos=;
	b=i9B7mm/h4lfUxUn9lroioppcEq7YEXFdmtTQV+8RaWkuceDWX026UmzrkGm4xsbL8a
	59rYmFK7ZTNKVQtAFKqBjjMfeMuR5FXI3DtMMuovk8Tv/bx1ATRzz3CXl2pkbUgd5VU4
	N6FH9o/iYMePxEJzGDmA7Dfed0mVym2BRZFbAGahiHS1SX5SfG2DFZTrCS2RmbxeqFFL
	OOkKBAF+xsAwfkrdLVTAD5bvAexWFSao+tODj7vw20YcqFz6gDfxhRrShrDccb1MQNYU
	ZndD0ZKEJ/YWNbTb1O2Xg98Carw1HZCAI472nSbtXRJo4IoDSbx4fggSoF7hpQ/NKlYV
	C1xQ==
X-Gm-Message-State: APjAAAUP4hEJsq4mrzqtlyDXvkCL28HSM/y31gaCW1626zsNl+5USYsC
	hEkZPvK+aSMXCnzqnQsk1OZO0yTC96s=
X-Google-Smtp-Source: APXvYqxM8rx8m2wsR8KvnZdj/Ih9C7eOtkS/k+p9kBeDzFp34DhjB8HLtYOgndsh3kP9zGAJhgijpg==
X-Received: by 2002:a1c:814b:: with SMTP id c72mr5286968wmd.167.1574275101936; 
	Wed, 20 Nov 2019 10:38:21 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p25sm143652wma.20.2019.11.20.10.38.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 10:38:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 18:38:09 +0000
Message-Id: <20191120183813.9390-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/5] packagegroup-core-sdk: remove intltool
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
X-List-Received-Date: Wed, 20 Nov 2019 18:38:21 -0000
Content-Transfer-Encoding: 8bit

Intltool is deprecated these days, as gettext can handle almost everything
intltool could.  Remove it from the SDK packagegroups, if it is needed then the
user can add it explicitly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 8854ec4801f..03fa5296c15 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -16,7 +16,6 @@ RDEPENDS_packagegroup-core-sdk = "\
     coreutils \
     ccache \
     diffutils \
-    intltool \
     perl-module-re \
     perl-module-text-wrap \
     findutils \
-- 
2.20.1


