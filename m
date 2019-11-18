Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7188C7F939
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:08:26 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b18so17954228wrj.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Zu24RQgKVLAUPtaz1C9qLLDwbQz+ROvVc3LbaOYROBM=;
	b=tGjDmJzqyQ9iL3hbumzCYuow4/VaALF3ix8KmBc34Wsmw3p1Dn4recp4jqTQMZauJU
	Eg5s7R/ngtvdqcSPP0I4wEIeyJa1l8WHi3S+IkMz1l8GlsvLE4eHQujkm4jMBLHf574/
	h6rd3hfo5oYNm5sr1qr/yx2LcuyvFKDWGXU93Q7hM7NsrdPDe8waveh8mizGYdSFe63y
	C7j9b666odgmYU4WT5Ytx6/x6z0YT3lYjjN6vPfAfHOyCVc5W6qHLuKjG98jKDsIMPNc
	p+dk4Sh7+fpJ03XF8r7Ea6k4CabrBgIlMOGphnikar5rx9i8KvTOLT5bKi170TRcQB53
	0Skg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Zu24RQgKVLAUPtaz1C9qLLDwbQz+ROvVc3LbaOYROBM=;
	b=rUK+e3G+yVbmM0aFonlGNVSBi0k9SB+emuw2ju+0pWJEP+8dXrKR8NI4faCu0FhGKY
	cyuaRhdRC5pokZ3nwXjVwwG8aIoOxWvy8wXzq/5nGJLYRK4+GmDNwhRY984kKGDwlSuC
	J87f4r3Fbbj3GX9H3hBS2THIhN94xAHsQZr/Ld9Nc7qHzwr+0WIq3M4OKPYFEE0JCZiZ
	3G1SvRAy5DMKzyhz9Yp5LKOMYBG7dG8W/m3VccX8eiS6ixPPEob8SXapkOFP9LA48Yk+
	osjd6AdaUCzFV4Ahcho0BFAxf3TynKwJNDlYb1Aqlj75SHkRUL91aHfO/mpIrKQLMPCI
	TM/w==
X-Gm-Message-State: APjAAAWY+pxWGiz6wcWqVFVDhyd6ehIFKHE4idroNB707kvESylzCRPZ
	HJRul07rrRNViGqcKveTD/vEE8cR
X-Google-Smtp-Source: APXvYqyFHpFCECqjg/L03Ydtv202FXRGew3Zxh4lZnXns5/Wy2UjsLyCRj4A66h/KBA3MKotNLICSg==
X-Received: by 2002:adf:c00a:: with SMTP id z10mr29638543wre.81.1574082506870; 
	Mon, 18 Nov 2019 05:08:26 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	z4sm21413846wmf.36.2019.11.18.05.08.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 05:08:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 14:07:54 +0100
Message-Id: <20191118130801.21860-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118130801.21860-1-alex.kanavin@gmail.com>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/13] btrfs-tools: upgrade 5.3 -> 5.3.1
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
X-List-Received-Date: Mon, 18 Nov 2019 13:08:26 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_5.3.bb => btrfs-tools_5.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.3.bb => btrfs-tools_5.3.1.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.1.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.1.bb
index 12b5c4562dc..a44c0bc87af 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.3.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "de7856cee5907938441f765ebab7cc106b7faf70"
+SRCREV = "f82e569b33c3c1cfd4f8f405085ff8d439a0a915"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.17.1


