Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 29AD77FF0F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 14:45:53 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a5so7106455wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sWizTaMmdlu2riR+UWUJYtCkXyEdGJO15rDRfyAiMCc=;
	b=uA0XnYsrneIowJsHYvjjQQ05jDYTeBahdUrR9pkgleUsAhmhugcaAPAPB1q4+gjftO
	3zMdNFOrYW8bA1WqFVuv0lK1h7gsTGmtVNWqUgWlSlSVvsqKXPUv9eA5dJgqhJd3IXp3
	/fX2OeDNap8cfvlMuDdXqNISLmOEyfqvwpZMgz95617eEp+Tq8FUvDNry39iYq/uBsBp
	qJbvjHfGS3w9gxkmjDdADxfgQzkl9ohjYC32Cli/KkKM2+vlZ5oWrFI/aFRYZaUjdCsD
	NjT1UNzGN35B2Wbcx5BHRxi2zPuxbDYVCM66vZsRXycjfZPE48oSBv/WZAklHNFkr9zQ
	7EPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sWizTaMmdlu2riR+UWUJYtCkXyEdGJO15rDRfyAiMCc=;
	b=QKBfM4q0Zh0nLcH2sr9yDWVJl+UzeGTfIixw5me0yk2gKHJuYd40VXOg5LWuxdsdrA
	XTVReMpw3TIQFmXLbUH9OODMAc5ijOqo5xmDuL56xZKZSApkNcwpKffq4Rv2e/OCY3xW
	WWXfs7hDzZzIJBArmN+Bly5WprXf5md+mhCW4NVt17/Py9Caq2IsbS3J7VOUQne+uvbs
	PhRF9Q3BJ3oQTCX/hyH0ITP2H19iCWbQIkpIS+++f2CVVWKYz1OWUHtUVs3ehqBpjwkQ
	BRL9mDBu70yGpQWsPbXLEARUYsK6Pjy5sXDz7m0+KcukZUZ7Dn/NsQObcYRqKrIiY0hl
	sOwA==
X-Gm-Message-State: APjAAAUCBuEwJ7l0WYk5IfvofrHeMmM/w99ZOP0jfQpXdaIrUHfS2EzQ
	bh5mi0T/dR27yPEspCTYCu1rGG4ZIzs=
X-Google-Smtp-Source: APXvYqw2PPePD4qMnXZS5q92+Ja3piyCf9fBWwVnoyETmJ4bmWaRT/bm3A7Mj+n2emshp8fUOn6L4A==
X-Received: by 2002:a1c:cc11:: with SMTP id h17mr3313170wmb.19.1579704354637; 
	Wed, 22 Jan 2020 06:45:54 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	60sm58552442wrn.86.2020.01.22.06.45.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 06:45:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 14:45:48 +0000
Message-Id: <20200122144548.5723-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122144548.5723-1-ross.burton@intel.com>
References: <20200122144548.5723-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] shared-mime-info: actually depends on itstool-native
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
X-List-Received-Date: Wed, 22 Jan 2020 14:45:54 -0000
Content-Transfer-Encoding: 8bit

shared-mime-info needs itstool-native, not itstool.  Fixing this removes itstool
from the rdepends of shared-mime-info-dev.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index b2d562157b7..f0d5bc62e9e 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libxml2 itstool glib-2.0 shared-mime-info-native"
+DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https"
 SRCREV = "829b26d85e7d89a0caee03046c3bce373f04c80a"
-- 
2.20.1


