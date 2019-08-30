Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 94C647F45D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 20:21:17 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q12so8112841wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 13:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EEq29goQyc/+5Etph1GVf1IZYjMrjfqYdVA2VoC5oyY=;
	b=DLUXHBMOgMn/+0+z9vUYm0OnPTQQVAa33sIkO3UZwTkzsW7jXuzbZPzxDbSG+79HSF
	0bTpL+JfKHrmRh7HGLzFAgtAglQpjyRJV7QmSxHEeSB+lKqhvmw+06np/ZH1LPfLBv8d
	WfvCGut7Bq8V9Bhx13xokDHXR93+wd7eGO5gVMzLBbrGn2gYjSD5+prp68YB3El+UD8E
	aklhoR00WC7VD4f+r33/vG1P8ui+sk78fsF8vGUfBhMhrEdX9gh+//Dgo4rkOcUD7rkY
	AyrLxDBgtRul1I1IcL7BZQjlMIi4HoZL35om18IggvKFdsawNEs873vShMhh+Jzhi9WU
	wAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EEq29goQyc/+5Etph1GVf1IZYjMrjfqYdVA2VoC5oyY=;
	b=kzMrXTApMPq7qBY8X2fxHfe1qGse05AzAUt7oYcoJcLFXR2VRFBEgDzI1/ZTn/B6C3
	we9Y/D5RH7o0HqK4X76/szWe5SuOah23qLlLgatR0D60/Bu+jphCEZyeQJBSZn0PvMD5
	9vAMZW0QDC3lgNgDZNTLXmmhyrNx22K+yk+KOeM44laFkk/PMRTZsJICfQTMIxcAQZTY
	FAScBLNcmd8Sp1ySH4B+4UViCbKQOZxl2GJEBniUq1whSJm4HvqdesgLPSM2IzTXnF67
	AipDGOQx2FqdaO097Gse6kXTe9433TIttW8V65j86QVBt1CK9W6bSADi10w+szGqTKUD
	tdYw==
X-Gm-Message-State: APjAAAVyqiARYFuSxhgmQ9tROZkk6aKSboZXAsFtQ2j/G5yVS8AdSiNT
	6dxeIe1HTFDltDO5aLK0brAqrVz1
X-Google-Smtp-Source: APXvYqy6UQHjEqt2uVOHFzKaO6YV6lvi1Dj20DGCK7FsLkG/YroSLI+Gz9l8NWwiUGdpFF+no3z6bg==
X-Received: by 2002:a5d:6446:: with SMTP id d6mr6010438wrw.159.1567196478046; 
	Fri, 30 Aug 2019 13:21:18 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t19sm7219589wmi.29.2019.08.30.13.21.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 13:21:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 22:21:10 +0200
Message-Id: <20190830202111.34075-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] lsb-release: fix upstream version check
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
X-List-Received-Date: Fri, 30 Aug 2019 20:21:17 -0000

With the new recipe matching the tarbal version, there is
no need for an exception from the check.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/lsb/lsb-release_1.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
index 4d8b3d3d3c4..52e30267f50 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar.gz \
            file://0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch \
            "
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
 SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
-- 
2.17.1


