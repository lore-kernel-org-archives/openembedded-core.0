Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1E27F65CBA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:34:37 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n129so18669038wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 13:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=oQumN2rWiVi8/5Cbrwr/SM9Ld1g2oY5vYbqu6pEjgrY=;
	b=0Iw953Ej9Svb/Gz1lPbiKA0OJTNaokWS/wRD3fJxdSsk2qi+cd1h5vdjUd6gW2FB2/
	w2RAfO4FVEvf6/Tv8c3BqDK3aaPQfBVBa2MLDl4fDskpR+9Sp+ReBmfviYmDDZJS2g7l
	xgJVGGpiY75AHdT3fddBSG9RBu1oImFe8Kwf3/dVRJdZqKCXyvSmOPRUF7D2G/w+jjN0
	GPJtKTU4ql4YXvz1a5S/pumSFmdUvHQSOuCktu3qCHSVQ8ZV68CS/XgfODnUzcpIlHIq
	xBa41Pgz1bdAz8BFxEDw0qgjmXwGyYcKctIYFZqCt1iDDE83yKJ4Oe5hC4cMe9lfmyoL
	nSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=oQumN2rWiVi8/5Cbrwr/SM9Ld1g2oY5vYbqu6pEjgrY=;
	b=CJK7tKn/0hXtC118KOx0X+4j87ym4zLGBU7AEnGAr+O8V+7lt/Dc76NkEyZ+kb9vQE
	pcQN538HOUK3jmf9c18mKVN264QaH66AxL9nbUUix0SQu88gxTVw9bkDr2Ir8OsKOQAV
	exFPLSQZkv7LAsLpN6HNwIiQ2Uv3m5Y3Lny8xKduUPw6HRTbH2JvmrrXrYqvKFTPdQIK
	0HkHsVmD2MTgcP34OcMPkwtQGxqn2fzggA+N6HvxgXUUMdx4oFJV1Jy90GkhnQk0mips
	MFhyN+zHWqVt+DIXcch55GET63BtCJ+Hmx5V204Y57HpaYgMRWsMI0noT+F9eyk2eUFa
	aH1g==
X-Gm-Message-State: AOPr4FVTci8SQIzK4xY+3391ymQggjIGaMXCdFHYgDVXPYqyADXaCdcfQYdagYnczd5ckA==
X-Received: by 10.28.178.209 with SMTP id b200mr18558401wmf.21.1464035678174; 
	Mon, 23 May 2016 13:34:38 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	r123sm15532548wmg.20.2016.05.23.13.34.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 May 2016 13:34:36 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 13:34:25 -0700
Message-Id: <77bd36f9477a21184e87f0f7351cc3a42d63c48f.1463769811.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <0b22f46a6e565f757c0fc11aeab27e9f336c5b37.1463769811.git.chris_larson@mentor.com>
References: <0b22f46a6e565f757c0fc11aeab27e9f336c5b37.1463769811.git.chris_larson@mentor.com>
In-Reply-To: <cover.1463769811.git.chris_larson@mentor.com>
References: <cover.1463769811.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] image_types.bbclass: add intermediate var for WKS_FILE_CHECKSUM
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
X-List-Received-Date: Mon, 23 May 2016 20:34:38 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is a bit nicer to work with, and easier to override.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image_types.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index ea45809..dc681ae 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -208,7 +208,8 @@ IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 
 # Rebuild when the wks file or vars in WICVARS change
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '', d)}"
-do_image_wic[file-checksums] += "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
+WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
+do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
 
 EXTRA_IMAGECMD = ""
 
-- 
2.8.0


