Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED7D60557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:04:48 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id z12so10375308pgp.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GgZBgPmow5ehu8UB3kvmHXJ8ZxX7VMDMQY09HvTHRPk=;
	b=t95a7pBBogWF/IGn3xZvP8tEZk91iM/sa91bSAkUbuEaHGjCJxVAgx+TzFTTZ4FnTK
	zGNFsqUD+5CVM1keT5Fp3wns+9nGacXfMoFduURx4Q0A19McsC7qrxTgXxERN7dfarI9
	0hMCRHRewE5K1jPxZfwcaHo9W5q7h3e02zDJlXfP21oTE+4xLqLCi7/g1MvHT74IJT/7
	0YFHDvCLujx/8VDVt0k0A9bq7Ob4eTLufwXiMU1ufJ12KA86ssEYkBiQmAIE09m0GLqE
	yfbWFqP3nZHEmoPTU9NfklIAl1cn6/j+7S6lYocm85euxwgrl1WJ7aqWQXO+WyPEywun
	Pcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GgZBgPmow5ehu8UB3kvmHXJ8ZxX7VMDMQY09HvTHRPk=;
	b=aVJGOA9EGuf4SncBaSLk+XjB33ztqMdr+oqbzvqrwv6yn9tlGgEOLcvfHIXzw1yF1R
	1sm9zCX5qUZg6FLxRfVKlhAC2vs65xayaTV9c7kBcxakCGlgQQQhNUUI/f+XKjXqXs4Q
	ebg8c//eXD6wEzEFC5upYSHPbdm3NIuR4YU3RA2BvAuqBnvW3YMWTOdk8op1SBApctFL
	/WSjCXIug5lHsVNrbGOjfp6LNa/6nD5M4obg2r+ithCXttfkwkFmVXPrVRR5S8FNspXM
	4HF6Lf5SyrhIOz/60luYDwEyJh59Dw630Fth9ujxNIwYQc61txid1gOW9T3CXzx8LjxV
	UfRw==
X-Gm-Message-State: APjAAAU37saOOUhItq2uLzXuMi7w1Q0ipCaiy/JxIYixajxFFnqfR0tN
	1g75ZxWau28V2ewoQEBK706qHu1uKUU=
X-Google-Smtp-Source: APXvYqyUa9HwtWADijyELP2KDnVtLMWe5voq1rO9TfCUiOHIhdPsDLjWchiuL+xiwfMj6ue0sy95+Q==
X-Received: by 2002:a63:dd0a:: with SMTP id t10mr4859737pgg.354.1570547089340; 
	Tue, 08 Oct 2019 08:04:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	a8sm17675579pfo.118.2019.10.08.08.04.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:04:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:04:33 -0700
Message-Id: <66c05bb2ca6ecdb621ae1e5bdf28e7aa768d9aba.1570546808.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570546808.git.akuster808@gmail.com>
References: <cover.1570546808.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior 06/10] classes/image-live.bbclass: Don't hardcode cpio.gz
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
X-List-Received-Date: Tue, 08 Oct 2019 15:04:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrii Bordunov via Openembedded-core <openembedded-core@lists.openembedded.org>

There's INITRAMFS_FSTYPES that can be set differently.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index af71be5..54058b3 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -37,7 +37,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
 LABELS_LIVE ?= "boot install"
 ROOT_LIVE ?= "root=/dev/ram0"
 INITRD_IMAGE_LIVE ?= "${MLPREFIX}core-image-minimal-initramfs"
-INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.cpio.gz"
+INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.${INITRAMFS_FSTYPES}"
 
 LIVE_ROOTFS_TYPE ?= "ext4"
 ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${LIVE_ROOTFS_TYPE}"
-- 
2.7.4


