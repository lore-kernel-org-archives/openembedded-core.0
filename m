Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1E89C7ED31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 14:46:44 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id m8so14674393lji.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 07:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rrjCbd2auHtaVQF9fYI+SLb7PYyiSOgg+MMdN/ZNCNY=;
	b=dbEJ+eLZa5DH1s4lmHhLkGJ1ebHcVXCHX/rX7AugAGLKlgA9WM+4Lb2ok2dz4Hy3TU
	HPBt6EPk5tpD3hc8eeY8ccL2ZgVo3W+JqczTuIbPK6nF4MXxskkBiCksikD4lzXpnMUu
	mflL1beFEyLSgHgG9wH8vCGrPi2UxSPle7i3j2HSlSdhkD8HLiT+goG27PUMgPr17pJl
	GQebf/+09slVRoKNB8yqCCw+uWdteJAwOXxRMroD1QSboQSZCnBHVgD3Rt56lAHdVVnh
	KFTeQYypjELVsSxijaIpR+ZGJGe4irdLY0CKEDC9S3Ah1lr9FLdm5fPKsy9yYwSanTI/
	XIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rrjCbd2auHtaVQF9fYI+SLb7PYyiSOgg+MMdN/ZNCNY=;
	b=IfRkbnwpxmCnS/7BzB/4Ti/9amfpHVeLXEPhvpQNBR40v7ae/RZwWfHRbPuxA2hIic
	+db+YD+HT5p0gDrqUDqcmEIyeFmGBcQwyCNA5xwQYEUnKmP/MHu60aTnRpAFPFBN1+k1
	JVoYKeTtNZ6Iniw6hshz5M4GAUzW+NY3gK6rTEG7KEP4PCtCj1JGRVvbus/FQ/0EFugk
	pDqrbh18i5HLqkIbZ7Wbc2J7X0hjPChKydLJxLjkrcwmaEfxv8QYcxuIVkU6NOAyNlYU
	JyL/ffplMaFI5TW/7dpJgTvggGU0cUd6rfZ4DdHS6oWMqstfSvKkLlMRAa9BTJc9P38w
	h3nA==
X-Gm-Message-State: APjAAAXdB9VussS60DNBzz4nXxheHXG8g4W2AeDGKVg0rAPG9vjlF4Bc
	957WsNeANyh5pcR5VRMlTnbFRsZ0
X-Google-Smtp-Source: APXvYqyjn74p2eTxVlWpdFMBC1PSTmRxvKn6E3wdAB0vtSK2WdFnfBb5szBh9nKJmCJ7LvHzt6gS/g==
X-Received: by 2002:a2e:9a13:: with SMTP id o19mr47703863lji.102.1564066005073;
	Thu, 25 Jul 2019 07:46:45 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id h3sm9204873lja.93.2019.07.25.07.46.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 25 Jul 2019 07:46:44 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2019 16:46:37 +0200
Message-Id: <20190725144637.13462-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-pip: update to 19.2.1
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
X-List-Received-Date: Thu, 25 Jul 2019 14:46:45 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-pip_19.1.1.bb => python3-pip_19.2.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_19.1.1.bb => python3-pip_19.2.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pip_19.1.1.bb b/meta/recipes-devtools/python/python3-pip_19.2.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pip_19.1.1.bb
rename to meta/recipes-devtools/python/python3-pip_19.2.1.bb
index baf32f4724..ebf1f25c16 100644
--- a/meta/recipes-devtools/python/python3-pip_19.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_19.2.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI[md5sum] = "4fb98a060f21c731d6743b90a714fc73"
-SRC_URI[sha256sum] = "44d3d7d3d30a1eb65c7e5ff1173cdf8f7467850605ac7cc3707b6064bddd0958"
+SRC_URI[md5sum] = "e9ac3e030e88b6c076a20ab371a30742"
+SRC_URI[sha256sum] = "258d702483dd749400aec59c23d638a5b2249ae28a0f478b6cab12ad45681a80"
 
 inherit pypi distutils3
 
-- 
2.17.1


