Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B62C4731E6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 19:24:09 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 145so18383670pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 12:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IRwHUvTKtqw/enKuo4rFwW7BVMCItscVXxl0q+QRY88=;
	b=thdFelOKoQKsQ4w4aff5YHy8JHawcERxm/g5d1zooag5rFUd9JmNM0iRCwRYcTN+nk
	HThlo/GPpz3IwkvoS5d+mhdCQNSyTtGG+7W3H5hJ14Mpq3z+T5dlpI3Rwgjacn98L0HW
	bCp/qsXdei+BQoAIoFnBPtnp7MVnWnJZeNvxA36gKeo3BixQm1nhB14sp32YT+pSt2WG
	eCnna/+MkWxTTPA6J4io1e4gptv56nO0ZcdSSM2S5QpHWzE2QqkvlfXDqJBafdRf/xD9
	Mrhb4LR3ebCv14+eDTQrSPhwjTt8kXiXJ8p0kPrERs3m/2Y5L+/73Ay2FWIgyUn5oqOV
	JTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IRwHUvTKtqw/enKuo4rFwW7BVMCItscVXxl0q+QRY88=;
	b=gdRwf4a5154SwjpRkHrs/HkNtnFAPGLKuxnC7oVjGMK4njT4Xv3sZNUr2PofGVfgyP
	tWrZQM1LNVDFJm5UzDDJqd2lOwC5bSf5iv+bYC6Vo2IVxrIYCDbp9/WhcmMlqUkV5Mel
	ArRiApvyrZ6hIl4NnTbl8a6iLhFfVxSwjplPTGt3zXr1j+whw4Uo7TnO7rCFoKvO9QrS
	0YbfYA2ZbhjaGIK0cyVHtA8VUsNSc/H54/2JHxNdt83ve5+gHP6SpblQj1HM4BeRGS8L
	ZzzKsfW50IVGG6YksJ+R2eEg/mt9styHCkKJKL1joRaQH6pUDPoY7VSmHQjMJmfknJz1
	dVdA==
X-Gm-Message-State: AOPr4FWIRgFe2Lv2DT8Xiy3LltJZsVNbmrHMeMc7C+1C1jmda8Bvu6sVQqHrD4EGyfudCA==
X-Received: by 10.98.2.16 with SMTP id 16mr54343621pfc.148.1462217050581;
	Mon, 02 May 2016 12:24:10 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	rw2sm47630613pab.30.2016.05.02.12.24.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 May 2016 12:24:09 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 12:24:02 -0700
Message-Id: <082b1dc91bca7617570284bc7f46511ffc037ddd.1462216694.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1462216694.git.chris_larson@mentor.com>
References: <cover.1462216694.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [for-master][RFC PATCH 1/3] image.bbclass: append to prefuncs/postfuncs for do_image_*
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
X-List-Received-Date: Mon, 02 May 2016 19:24:11 -0000

From: Christopher Larson <chris_larson@mentor.com>

These are list style variables, so append to them rather than blowing away any
existing value.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4542e95..bcb96aa 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -436,9 +436,9 @@ python () {
         d.setVar('do_image_%s' % t, '\n'.join(cmds))
         d.setVarFlag('do_image_%s' % t, 'func', '1')
         d.setVarFlag('do_image_%s' % t, 'fakeroot', '1')
-        d.setVarFlag('do_image_%s' % t, 'prefuncs', debug + 'set_image_size')
-        d.setVarFlag('do_image_%s' % t, 'postfuncs', 'create_symlinks')
         d.setVarFlag('do_image_%s' % t, 'subimages', ' '.join(subimages))
+        d.appendVarFlag('do_image_%s' % t, 'prefuncs', ' ' + debug + 'set_image_size')
+        d.appendVarFlag('do_image_%s' % t, 'postfuncs', ' create_symlinks')
         d.appendVarFlag('do_image_%s' % t, 'vardeps', ' '.join(vardeps))
         d.appendVarFlag('do_image_%s' % t, 'vardepsexclude', 'DATETIME')
 
-- 
2.8.0


