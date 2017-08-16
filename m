Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 626FB78507
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 07:13:20 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id i66so26227505wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 00:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ek/TVOwSR21gO0r860ku5vRdQexGAls/hprsFSWdHNM=;
	b=VgFhoL2mAcpLzo3DBdUSYmUg8GdbNVslRlUOfa5qyVX4uZhUf6oGK/Z/ucE3zZv9y2
	O40a16NZEszu5SsccE/4H5FYDR+zxWv1hJaBSWdmVvWbhoCRPcce1ZksFzkqWBf5qrqk
	m1x+tAnIaVFUZcHY0TfwYtIx3irSH6811ciBTCtbpgnwpm1/JQ5AofZZ7Y8C/+mjCYMy
	VASQi8QB2OOCcqMwM6V5amtLuEjSUF+1CFfZp3JYKGTFLlopbeTTEC4QudCh38G+Sfli
	6QCMcZOlmBP0/OBC9F6eLorvtknAly324Weln27Ae+N/GXynd6DHYvYKQ7PUyuOI8dMB
	Iofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ek/TVOwSR21gO0r860ku5vRdQexGAls/hprsFSWdHNM=;
	b=CYfYxP6DD+XEsrekt4YS5mkFQJciBe/XRqGlTfpS54KA3EiPVabGBTeawPzSlowxCm
	EWmxpmsqxhAn40wp0zNeEVnYm6sZdQxs9DGTgFElty1IMVq++OyI8Dr/sclrUmDOCLpj
	r3s2eGMXWccrEIAw+bIlk+8gkn9IFYJoJLxsuaWUgdh5h3K2+UNO7x7rp8Vo5icRFDpy
	jgN/WNjDDjAxD8NIQalL3E9jAJJqUX6SUoHcCqr9WdarcE2ofL3ONFQ19phP76qv96nq
	ASaFxH41Ukp5THV69eAU6WJx8RG2NEkkcJazpZdJwTTS8IHRYeny3wEh4QD2uuiNTt8j
	3lZQ==
X-Gm-Message-State: AHYfb5j4WPf72NvPP/PwVIE53t2wapBt6Zifnx4614i5LPAlM60CWrTt
	FZGby0y/0MT73dhG
X-Received: by 10.80.151.22 with SMTP id c22mr1110854edb.30.1502867601758;
	Wed, 16 Aug 2017 00:13:21 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.240])
	by smtp.gmail.com with ESMTPSA id v18sm298877edi.66.2017.08.16.00.13.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Aug 2017 00:13:20 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 09:13:12 +0200
Message-Id: <1502867592-32470-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] packagefeed-stability.bbclass: change another bb.plain to bb.note
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
X-List-Received-Date: Wed, 16 Aug 2017 07:13:21 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

In commit 255caaad:
[ packagefeed-stability.bbclass: change a bb.plain to bb.note ]

I changed a bb.plain to bb.note to get a cleaner console, but there is
still one more bb.plain left which I forgot to change.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/packagefeed-stability.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/packagefeed-stability.bbclass b/meta/classes/packagefeed-stability.bbclass
index 4837779..5648602 100644
--- a/meta/classes/packagefeed-stability.bbclass
+++ b/meta/classes/packagefeed-stability.bbclass
@@ -224,7 +224,7 @@ def package_compare_impl(pkgtype, d):
                     shutil.copyfile(srcpath, destpath)
                 f.write('%s\n' % destpath)
     else:
-        bb.plain('Not copying packages for recipe %s' % pn)
+        bb.note('Not copying packages for recipe %s' % pn)
 
 do_cleansstate[postfuncs] += "pfs_cleanpkgs"
 python pfs_cleanpkgs () {
-- 
2.7.4


