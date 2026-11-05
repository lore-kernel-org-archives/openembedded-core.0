Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29818.1793868237029083024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=meDy1OJT;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so10186025e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868235; x=1794473035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+mFqgxWpeu6DCCyQZkkCaxJZ9NwWmNtDZVDoRkS+8t8=;
        b=meDy1OJT4aOGWMVpWSaB7ZuxfI70IxmzCznLXXQzqg+HLtK6Js0hgdIoTdeagrDpst
         yWxkqN6rdjKV86CvdYXmTvvG8KbYNANx6z9+YUIop5pfACdw13nijXXpXkLLdCclZ9R+
         Lg8I4xne7trYS3bw6gK2On11UJ5j5J0PAwvC6moiXZqlHkblhxKBHtQjsi2cNCGH9Kb4
         4yq0jt4gKyKEM/A2VMqyMss3O/BDbCVzVTp7uodFTRuo4Xj3y5ZUgH+i3PZFKFLE61Dk
         aL98cGDuOVg8UemXaj462CU7mbl16Dna1TDj5e1OZOeFadA8OE03CsnZlKeZnwZ7Lzgj
         DXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868235; x=1794473035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+mFqgxWpeu6DCCyQZkkCaxJZ9NwWmNtDZVDoRkS+8t8=;
        b=f3mSwnweZiIHUpchl+Nl34mzV7Ia/u/kHsMvIHtddD57eW16dVGASZ2XiVGe00FQpB
         4QWw2MH8r0BwN6UxsSwcNA7VEAdoIhIHnh8jf4reB0xLfB7rlHpjBnSr/fFHcaR35WSp
         06hSy4MerZCZAJILvL1F+Jwuu00jsSU+lw3TRoqqqO0gXaSGZoF9h/WuTPKT24bAA9qm
         2MKwK0NL7eSzJFbenbF0DXcL2Iyfwnp/BPUOGPG7FflyLFjYDVd7MBh3wVIsRKANNupX
         +AfRVeKfwUW4z3I4IWcDJb6++pPyIyERmykahh8spiwniAOKWRznv3OvbSxmdOZ6wq8F
         YRvg==
X-Gm-Message-State: APuU4Z+05XoVnB5EI+RITlmGr7GCHGNy3KZdRdAUDVk92buw/kvTjugI
	eK8HAIFMinsRvv4+nbT93GgpBXcYmcwkfONO+gGW/YSK6fcYvqfpBPB1snWExZMlgcJfZNmORPR
	Rb3l3H5A=
X-Gm-Gg: AYBFou0N/Nq6e6c+2aTOdwpHQrlk9fl10f1sSGrvsvGhHnEeWnM0UdOe1Z5iKe3wH4j
	ngKfaVjuiQPyl9/ZiRw7aFGx8N1Dfdi7sOoo4GwZBslYCfamL4EFC8D7tZxD5EDVb1GUWAUGwot
	ytIBtIHgKE+Oge+9zNhc0DPEPnXferpFlUIzFFgT4ZhaHdjqIr6iwbVwdHfPBJzpSZScG2gP02k
	d/U+7wlKD4s+4WZ6MnMfa+YG/2OD9wmE9qri/Jx4SbnM581FE/+iea2KYKe2Q6cja9Yll3OTV2+
	JLFW/+2DIkNoXG8//HDkdD1DXldVUlnsyiYHnShj9fEJc7szh23sLKBlpBYpzBoxmKuKDkIURra
	vkcZmnkVd2GfUstPedN1U7ljPLD/MsCoMVnUKCVzUAYs2yIo5UDoLuLtCmy0jsXTxud1MHrXKqZ
	6e6DcBk1M/qeY2lgBPbRgH9pP61zP+x0QHS6TzA9WdpWnQ+0Wbym8NW5rhETvDkx3aLtta4tJyq
	6X9q79POad2G8pWOwf23N2OvdzKDmQPu8JIfX/uqfCh3lnGOTJGYEjDe74YmxV+z58VENImnjyu
	c3MGsi81IfJwTgqX+tKSnULuuprg/XJYc+UrHE5z2fo+lL8sX5pZcgYHE+QE9YY9fwUl/SGIcil
	gequ1HuOVusmWyttB4LF3LTcGMPl01w==
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr392811885e9.18.1793868235222;
        Thu, 05 Nov 2026 00:43:55 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 31/60] erofs-utils: Make reproducible for different BUILD_ARCH
Date: Thu,  5 Nov 2026 09:42:50 +0100
Message-ID: <9b9ded409a5d1af883c1dc457133481bd2ba8e8a.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249490
Content-Type: text/plain; charset="utf-8"

From: Richard Purdie <richard.purdie@linuxfoundation.org>

configure was querying the host's page size. Avoid this and set a value
based on the target insteadl. aarch64 is the only one we commonly build
which isn't 4k as far as I know.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eac126b02f93a87a789356b48792b52202df25f6)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
index 45339656b5b..9c0db7c2c05 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
@@ -17,6 +17,11 @@ PACKAGECONFIG ??= "lz4 zlib"
 PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 
+# Would otherwise query the system the build is running on
+BLOCKSIZE = "4096"
+BLOCKSIZE:aarch64 = "16384"
+CACHED_CONFIGUREVARS:append:class-target = " MAX_BLOCK_SIZE=${BLOCKSIZE}"
+
 EXTRA_OECONF = "${PACKAGECONFIG_CONFARGS} --disable-fuse"
 
 CFLAGS:append:powerpc64le = " -D__SANE_USERSPACE_TYPES__"
