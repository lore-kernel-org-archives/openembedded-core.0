Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8E24172DFF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:51 +0000 (UTC)
Received: by pdbfl12 with SMTP id fl12so8541966pdb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=LiTJ8dK5Hll6LQ2DzKcN5lxWfejivRasGSficaStBRM=;
	b=1AIfsi1FujyphXBE5weZmjP/6vx70M0WwphOnx8G9/X0WRjUO0InHfEaLFGEz4z7dx
	urwOxbRpGUa59iT8kH7RHkKqjMd2mQipRZuRsbQNV/nMvgo5Py3LNTakX7zphR37ANKZ
	KMxxtVZJGSaeSlnIKuhDFWXVoQJytzs40o6d8GA90xqoIwHFy2Km0WUyTRzL81QKwgay
	kbBRpC7QBLzwcUkV9YZ088OI2ZA7UKimovlyFHrnQcoOuiNgeHaFVAr8MflbOnPBYj3d
	9FxrDP60jkNkIAu+ABk6RNtenZQi5TwNa+002tntKWv8cc/5e7ytzPMgZ8wdKy+VSni4
	dhzw==
X-Received: by 10.66.122.69 with SMTP id lq5mr4205417pab.52.1423152293184;
	Thu, 05 Feb 2015 08:04:53 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:28 -0800
Message-Id: <acac1512a3340cf4a6be18f9442a047323886505.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 20/61] parted: parted-ptest RDEPENDS on python
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:51 -0000

From: Robert Yang <liezhi.yang@windriver.com>

python scripts:
parted-ptest/usr/lib64/parted/ptest/tests/gpt-header-move
parted-ptest/usr/lib64/parted/ptest/tests/msdos-overlap

(From OE-Core rev: 80262094fde6a44afd954bbecc7e016243661b81)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/parted/parted_3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/parted/parted_3.1.bb b/meta/recipes-extended/parted/parted_3.1.bb
index 9057463..3f36f9f 100644
--- a/meta/recipes-extended/parted/parted_3.1.bb
+++ b/meta/recipes-extended/parted/parted_3.1.bb
@@ -42,4 +42,4 @@ do_install_ptest() {
 	sed -e 's| ../parted||' -i $t/tests/*.sh
 }
 
-RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup"
+RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup python"
-- 
1.9.1


