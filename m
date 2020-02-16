Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id EBCFE6142F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 20:47:04 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id b9so7802026pgk.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 12:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SZiKoOzLrFM7p4zWlauxllOJ0PCKSHNiEVRJGi+su5Y=;
	b=UzKWWDQ5dfDpeVy/lTKWHsSxfylH0jwSGNyJWEGBJ2lPQV0ZVU75RWqHop1hn6R19d
	z/xJG+leVI+4kMr05888wdjFOZC2WXHC+9Pd932BlMf31IoGOXSDPDBUIcXTIrwpceuH
	5oabhHZ7pNlbwCqdAF5UmRbzMChG1fnyiR++aX7tufDzCVFtJG/E+vCBsydv3kOtjBrz
	F4/EFrYyZKHhEuvL3gFcnq+ictvvhJe0bK4ZKeDOwbbDQCPhMdvZUSCe35tiq2Ut+u1w
	rK1JVQ7xVovecACHyOH/M0BnVsGombts5rYNXKyo0nlFh95shLiDss0FavG8OsUKaDPr
	MIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SZiKoOzLrFM7p4zWlauxllOJ0PCKSHNiEVRJGi+su5Y=;
	b=IXvWHoCFE2qLnztTcn0FOaoJstGfzLE7XTlSGjNCE9RBLOApnfWQghMN3y751s4oYk
	Q3hW0PEdeFB5SKeg9e0aD6s8Lb1pJlmZM60wb+xFDkRz/Nvfo9MbeovQfu847SnYEsGk
	6Q3PVZYN/2q/VymZzg2alWaEfOgmNXiOIr6W+FSEPm9cNK9tvH8hdf+6jwulZKdDpw/R
	KpogEzkQtZU9JSSOwRYF4IBChGotJg05yX/OVHr3tB5wgBXcFpDBIqA86D460FI3O/7k
	WZ2zCRflqnDHJDN9ZWNPyN0iFnXHVSPfOMEAiub85TG2DhFQVercVvVgF02eTFnIv/J5
	yLxA==
X-Gm-Message-State: APjAAAWNvObjte7omc7xYVE5YHVDX8Mq+yfKmBlhmF8+/sAh3uEGTlMU
	maSm8/tig/Qp9NU3i0toHx/qluyyt5s=
X-Google-Smtp-Source: APXvYqx8Gy/ZyCZjvVUxP6nOq9wuMnipnCNcPFFRFeAPnZ+RJ0phOH3YZMvpzIdxl9XqSBFXJiRZIQ==
X-Received: by 2002:a63:920b:: with SMTP id o11mr14368010pgd.176.1581886025678;
	Sun, 16 Feb 2020 12:47:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	m12sm13877924pfh.37.2020.02.16.12.47.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 12:47:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 12:47:03 -0800
Message-Id: <20200216204708.7179-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216204708.7179-1-raj.khem@gmail.com>
References: <20200216204708.7179-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/7] libsigrok: inherit mime
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
X-List-Received-Date: Sun, 16 Feb 2020 20:47:06 -0000
Content-Transfer-Encoding: 8bit

Fixes
libsigrok-0.5.2: package contains mime types but does not inhert mime: libsigrok path '/work/aarch64-yoe-linux/libsigrok/0.5.2-r0/packages-split/libsigrok/usr/share/mime/packages/vnd.sigrok.session.xml' [mime]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
index 35e59d6d7d..e8c36a81d7 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
+++ b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
@@ -15,7 +15,7 @@ PACKAGECONFIG[hidapi] = "--with-libhidapi,--without-libhidapi,hidapi"
 
 PACKAGECONFIG ??= "serialport ftdi usb"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig mime
 
 SRC_URI = "http://sigrok.org/download/source/libsigrok/libsigrok-${PV}.tar.gz"
 
-- 
2.25.0


