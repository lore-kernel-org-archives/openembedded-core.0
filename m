Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 369246C557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 01:48:50 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id t13so8006095ply.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 17:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HHP7rKZGqqkkFSXvItxBDWjUgL8UzEJAcEPk0IpbflA=;
	b=Re9pITH3lRiKtUJEmMnCN1qiAj63khhJYW5pro7542ex0peyP3NZ3jmJxfWPoxmtsP
	PbLRmMlA0QeCATdfmd9kzlwSquE9H2zc5xN3DjnHKrjH+uS7jmxAfYaZTko1zDyxC8WN
	V3ibfNYtk/33NfW2DBLOsQNx6tjGOdcLEP0yeY1DC9QRv3lJC+W5L/4ZxjfZglZZ7nJf
	Wmus3bdDqJ392m90QPv75cP5I6EU8PDoEEwW58KSAU7ZfqI+1Ypxs+SxoJgEHsBX6lGG
	oSmEQ7z0/yRdZ3wp/BkjHNbPbnub42dkQXry1jEwMHysP4NPfZfMvTp4Txr5CRSDwU/I
	mw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HHP7rKZGqqkkFSXvItxBDWjUgL8UzEJAcEPk0IpbflA=;
	b=kw1RN05K2jAnH43AC6SRh0Nz41aHy5LycpC5cG56wNKQXnIsHZazSPuF4mOBqeiHps
	EysPCnvOiJGmhPsTqbLA/GAKMbr8ovD63dIE7tOrlX29C+5Jl40s7uin6fTj5ktjFPyg
	XaqxFpCVN9HlVHryN5XlUuVoXppPiqdbWkPDslEb80nlrSBgV6+CpX9/zKpXQJ+W2bvw
	PDc3LV+zG+005Jy0J52w/OOEQi0Oy/yFKyk/huAOilw2PI7XavlB0mFYeumdp6KuoK8J
	cKjH3oVEf6z6n4VF0LxXZTQEi/QZ9A+02lTyfaQgJPm4i1b7uBz9ZOQ9CLsE01lP9pJt
	3RaA==
X-Gm-Message-State: AGRZ1gK6ckHtksgljlrFiC1uso08fLIhapJLgvWn4ZaLRb5BchuQpsjo
	PWJM4dPhb7d/xnwe3zBQ2DHPUYI9
X-Google-Smtp-Source: AJdET5dkzDrPgS7ii8VVAyPQ1c16OW54lzQNZiwT5deP8hoWwbLHWX3qKP1aczx1F5z8yyNHVv6kbQ==
X-Received: by 2002:a62:5444:: with SMTP id i65mr9603962pfb.193.1542851331063; 
	Wed, 21 Nov 2018 17:48:51 -0800 (PST)
Received: from ip-172-31-17-76.ap-northeast-2.compute.internal
	(ec2-52-79-234-68.ap-northeast-2.compute.amazonaws.com.
	[52.79.234.68]) by smtp.gmail.com with ESMTPSA id
	d21sm42216468pgv.37.2018.11.21.17.48.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 17:48:50 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 01:48:31 +0000
Message-Id: <20181122014831.46298-3-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122014831.46298-1-changhyeok.bae@gmail.com>
References: <20181122014831.46298-1-changhyeok.bae@gmail.com>
Subject: [PATCH 3/3] iptables: 1.6.2 -> 1.8.2
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
X-List-Received-Date: Thu, 22 Nov 2018 01:48:50 -0000

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iptables/{iptables_1.6.2.bb => iptables_1.8.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/iptables/{iptables_1.6.2.bb => iptables_1.8.2.bb} (94%)

diff --git a/meta/recipes-extended/iptables/iptables_1.6.2.bb b/meta/recipes-extended/iptables/iptables_1.8.2.bb
similarity index 94%
rename from meta/recipes-extended/iptables/iptables_1.6.2.bb
rename to meta/recipes-extended/iptables/iptables_1.8.2.bb
index e00824f763..a704245151 100644
--- a/meta/recipes-extended/iptables/iptables_1.6.2.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.2.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
 "
 
-SRC_URI[md5sum] = "7d2b7847e4aa8832a18437b8a4c1873d"
-SRC_URI[sha256sum] = "55d02dfa46263343a401f297d44190f2a3e5113c8933946f094ed40237053733"
+SRC_URI[md5sum] = "944558e88ddcc3b9b0d9550070fa3599"
+SRC_URI[sha256sum] = "a3778b50ed1a3256f9ca975de82c2204e508001fc2471238c8c97f3d1c4c12af"
 
 inherit autotools pkgconfig
 
-- 
2.17.1


