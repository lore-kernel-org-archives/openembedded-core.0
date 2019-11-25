Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8E9887F748
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 12:05:12 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id l1so15157593wme.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 04:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/QeeqS3aYa5EAYfiBDATu6h4XlLaEqTKBLeYLSHmVos=;
	b=aomTC6YxbndoMF0gyjeUlJlPX/geyZ6HuU5W3Foj/mQ6cbCsCSuHvPKEnnk3O905Aq
	uHQIV62/H1Hk0dScHjZNZ1R4wUM+6mtHMtONSQf/VdYlPaWS+27kdYBHYqYts/0SePzd
	u9J6fMXHRwwqPAM47eKXBoimQyVY0+Uy7WKsPwOPrYOlzzoXaBsW8dz72HQxVT6b65r9
	E3xOM9c5v756VrG0u6yaPfEbYFL3mBsUHewzMms5EriYhGubxKUjPpAbX9XQgwUgrdlK
	c+jN/xXIhxQuel6peuWncmBn0fD7s+s6xAwrZQfADcMD9wN7DVfO0xBCnPLOvYtsuzAh
	CF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/QeeqS3aYa5EAYfiBDATu6h4XlLaEqTKBLeYLSHmVos=;
	b=HsOMCYQ/eBI8aeMEURSGiQyxqJlWu4505sttRkiSu+Xf+20vdscu4pUumkcVov91Q6
	sqaJ2g2AZ+oNFDteS3pEKb96FDBOjQsqiMm6pAz8eyOtWSgT+HYVomp0pooWeIrbbD/g
	5rbYZoeIe/fUhLRfwuPcVDNyWV5KdJWE74bDk4LA/n/hd5V+tGqTFhVFiXp/rIK7ppYb
	FuyCSasHah8VCzn9aPMejzkNCNYSWDGoEzYOFBYI3anOCWdJHg/58DNdGLtjras0wKke
	Rp03Y59l8OTZ0cfJ5eoplIqWhASVZzcbFWpKgqVkDf3D3YO1SEChGnYfFDMkPItY6BQC
	4HXw==
X-Gm-Message-State: APjAAAW2yn5YZhjHFBYcnjM6nGnbVgEjaMZqkvgaDRIgtB4Kg6PSNZOY
	06NdzrNn3LNyzudJwNLBEEg7vYShmck=
X-Google-Smtp-Source: APXvYqxCwSZiHu26Rmt7+fZdLkDvgH0vTVXOF2/84KRYGmThWV1QKsZhTe5zvkJRUASs/KikbQdZrg==
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr27821745wmi.118.1574683512953; 
	Mon, 25 Nov 2019 04:05:12 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e16sm10227411wrj.80.2019.11.25.04.05.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 04:05:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 12:04:32 +0000
Message-Id: <20191125120435.5203-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/4] packagegroup-core-sdk: remove intltool
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
X-List-Received-Date: Mon, 25 Nov 2019 12:05:13 -0000
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


