Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 61C4660589
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 09:02:09 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id m124so59192866wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 02:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=lTAPeJwR3tKCL4rHwTkmi92ZoJvOcD6gu0b8Cn3v8wQ=;
	b=ia4WSiP3smuiekOhg7PZZNHSZOF9hUVQ2ZZ/JLojkdcYzhk5rXcjvq4AroKFuCaCuN
	A0b81eIMV1ugc4Yx6u3ZngDneIilhx/CKA2Y3z0I1ZIFJf4Wza9RjPeHYOwDkSuk/lYC
	RAwtNi3HC6j30BdIP75yJonprY5TpOGqZV+thDaRZ2UMA3+W0klNEmZIHGv4U3EQtc3I
	MEb/P/VxeHP8VQLVvxZR1AIiGwYMqoj3OdLEdJD7SrzXe7prHZAfLapcZua3OJ+kqS4C
	LvJvyeZIaIm+wRG/zZ3ikP6UiCV+XOJufHbyZI4WbswlWhGf8+MYWCztPNIl3OlHFv7s
	L0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lTAPeJwR3tKCL4rHwTkmi92ZoJvOcD6gu0b8Cn3v8wQ=;
	b=LPCAZsV323f3L0rt+XPs09kEmJfaNG7WfbJQbrxquMR5dVYft0NauLF/hpmmlCcPrz
	2f1ei7dWuQZMF0GVI0LAbesGRmE4IR1JNHv4rM57R7McBZX059RqsEbZzAWjwaDqrlwd
	rqiSd3pAgOW8Om5lzyemgJ9IoJxa/Wk/FppWBVN3WqvnmrTaGE0YMuqlPBj1dZb7YY2Y
	sQsN0UGoxsJfsnVx46bivrFw+Dxpir88yxvE7wWd9dTj9CSSnugUeYzLET4qKdL72XaC
	m5aDqLo/zHRDIcPZGK+THl0W0uEk6iLpl4dpkQcKAS4wCP6kdy8f9YQQXgNo0qyuapW2
	OwVg==
X-Gm-Message-State: ALyK8tLLdcIEDa7SC4nXXlf8ixgvlF7otbjLBTtOu2q+B5TNlXZOAIaH0LzKwMIWhM7bFGo6
X-Received: by 10.28.154.214 with SMTP id c205mr14610967wme.9.1466067729717;
	Thu, 16 Jun 2016 02:02:09 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id k3sm4053551wju.29.2016.06.16.02.02.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jun 2016 02:02:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2016 10:02:06 +0100
Message-Id: <1466067726-1792-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] packagegroup-core-device-devel: add binutils-symlinks
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
X-List-Received-Date: Thu, 16 Jun 2016 09:02:13 -0000

This packagegroup previously included oprofileui-server which indirectly
depended on binutils-symlinks.  Since the removal of oprofileui-server
binutils-symlinks wasn't pulled in, which makes a packagegroup apparently for
development on the target fairly useless (and also broke QA).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb b/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
index d20eae7..edee474 100644
--- a/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
+++ b/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
@@ -12,5 +12,5 @@ RDEPENDS_${PN} = "\
     distcc-config \
     nfs-export-root \
     bash \
+    binutils-symlinks \
     "
-
-- 
2.8.0.rc3


