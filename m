Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 14B1B6026C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:19:37 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id t23so3757953wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=69p6DyC16680iXlBtTVxV6ubmVOYOPnT0KA4vJAJyqY=;
	b=JASFvYhfTX+TWEtH0jA3vuNvkmJOzpVHcPouegYOGFqqZZbVBAA1F6AzNOWp9gsE4N
	yDrLZzKfPwiKip4UXzu6jjyi135r81Q/tlYP4coBKDAipkuxiaMd3t2eByjCSIU9kOK9
	IQpIy/2+4TBJbOJATSlgKu3DlQqbRI/LN2QgCxwKsurJ65tzCCNl99pN0EkWRaYO8X7d
	Mv4xRhLbH4v5/6K2mTgsw+gTcEFwnXvuijuZ30amuUc808RsSWMXjjrDJTi2TTswtTTa
	jK/cj8O5xBPkyw1t8R8E8hrMhoiC6ezXHLJ6CBms+ZfWtwSSsulge9noK/l0Swn2p9kK
	+mEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=69p6DyC16680iXlBtTVxV6ubmVOYOPnT0KA4vJAJyqY=;
	b=d9J1Q2sO0wFN5JNvWBtKk6qXfSfcAlHg95GlPHBr3KV3GeZAnp6CnQFEgc4t5WjFB4
	Af2bZjGbinioomO7DQDRoqWpcZaJt9CwPluY/hPzBzpJjnTILFD9+wvbsClmvavDD0+z
	uO9r1vXvU48+lATFe5qE4y1gRslm5qqSE03RybTGy7YAyyJk3uiz/eiQ1zCsd82vZ/or
	5z71j9ZK2YxU+M84Mt52hiSakVndy1+j3o3xKWLJjWfHgyyq6DfHwoEPxHzcpyExfiX9
	mjU2WyzmJucUkHqOuvNu6dII85CIfokrnsRmud0Psnrq1q8FHD0yU7dwzeNJL2pGafHI
	s+aw==
X-Gm-Message-State: APjAAAUBavIIWxBC7erRpVv9UKia3OEVJY+oYRjncHTtBbR40ppYH0hP
	U2r30IqD91HZxSMNN0a8LmW8mt6W
X-Google-Smtp-Source: APXvYqxOMUBUzB1ykjQFl25xllQKtsJvk6GCdkhI9PBjgTB26fBNTziNHN+TGCv/cpaLhuWg2R6ujA==
X-Received: by 2002:a7b:c1d6:: with SMTP id a22mr10076361wmj.134.1580288891779;
	Wed, 29 Jan 2020 01:08:11 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:21 +0100
Message-Id: <20200129090738.1398-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/24] puzzles: upgrade to latest revision
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:06 -0000
Content-Transfer-Encoding: 8bit

License-Update: list of contributors updated.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 57f2af48eb8..41b78d6fe12 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Simon Tatham's Portable Puzzle Collection"
 HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=da6110d4ed1225a287eab2bf0ac0193b"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=6099f4981f9461d7f411091e69a7f07a"
 
 DEPENDS = "libxt"
 
@@ -17,7 +17,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "1c0c49dd5cd8df6ae87f7be5371be84589fa2662"
+SRCREV = "79a5378b5adc46ee33ba34d55738f916fb8adfc9"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.25.0


