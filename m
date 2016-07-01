Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 10C436067C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 21:27:14 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id t2so3096376qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 14:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RE6Kl9zpjkGUgDoRAq4y3Y6W5F1oyKZPHT+zx8pZh3k=;
	b=ily+Mm/JeFomQH/c1Jy7Q65zveL0HwNhAeecKqfG1UGl1EMuTB/QkA85LYfIw9DwEG
	GgC+HmtDHlsTxf7z12KFVjbiAzeUW4Ks8kN7Vz8B8EyoxQT5WYnO6ASeHYKvigHrxshi
	7zXWC+GvxDbmUmn/1Z1irREMiC9KkLbSxP451mV7JSEmN61nhA03eYdg6ZQsBuSvtWIu
	sa0+KGuIwCuUdFlvl8NsTnjy/IRMWE7LUT1GFbU2F2t1FJk7EZIgj3GOf1GfHtVgqYRe
	/rAsshTV9Iu6USJoUQsNDMawnGJr1nvCZwP9uCPfo2SuXaS4pjqP1JVvA4mIXiTVD02Z
	VsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RE6Kl9zpjkGUgDoRAq4y3Y6W5F1oyKZPHT+zx8pZh3k=;
	b=Usp7a5IcD5KpQccaVm/XsAtRrOeRvx5sTXWxSQAUVA4eFihyaCpRyiK2g5ak+gUrXU
	6W3p/vG7ZWKkZVNAQ4jMVfqmoaRq6UQI1m9QCzlqm2Gp2xaKVN72VObZeXKZqR4PqHo7
	4JZCdDvWr6Q3p042g7Sonh22m6m0CKMonU3ffuQuHlu5VygePm/LP7+GOfV2Kzz94WWt
	cJKCg7z4VgqoqTC4pxRQ2uqEDYzBzn/VUoL5K1Z6CEMfXzDGuMrLCnHOo9GOjVuCzY0G
	nqSRcnn0bQELX0Y7275k+ViuhBddHrdnCZkbHRpUEpPwqCDCdS9z+NdAhDgni4mCKOgG
	sOJQ==
X-Gm-Message-State: ALyK8tJCVxhKzXSBt2ppBCPpNjmvFfCyNLKK2CiSNKH7TXyeSHjNkZ0E0mH4LyTggLI1xw==
X-Received: by 10.55.109.195 with SMTP id i186mr488820qkc.207.1467408435544;
	Fri, 01 Jul 2016 14:27:15 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id l2sm1660633qkb.45.2016.07.01.14.27.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 14:27:13 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 14:27:08 -0700
Message-Id: <ce4d11cf2caf0fa17dc28a71df76ab9bea7d107b.1467408317.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1467408317.git.chris_larson@mentor.com>
References: <cover.1467408317.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 1/2] image_types.bbclass: add intermediate var for WKS_FILE_CHECKSUM
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
X-List-Received-Date: Fri, 01 Jul 2016 21:27:16 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is a bit nicer to work with, and easier to override.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image_types.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 72e8ed3..f7de756 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -215,7 +215,8 @@ IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 
 # Rebuild when the wks file or vars in WICVARS change
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '', d)}"
-do_image_wic[file-checksums] += "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
+WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
+do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
 
 EXTRA_IMAGECMD = ""
 
-- 
2.8.0


