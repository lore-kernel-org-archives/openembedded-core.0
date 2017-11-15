Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 604C16093C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 13:18:00 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v186so2919131wma.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 05:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0jCd/oDUt5p33IThX/9Yd3FPx+skq9JaBmAAgxHTGHY=;
	b=djMCsYawhavS07aa0OoPVUiRRHzWBMwirPS+/h+9TSor9xA2sFombWeqfgmFj/k6b3
	hF/kUPK7EOlyLjVnEGJKPKoDeb19VA9LwgisvEMrz+XpWSo6Cj6kJzXOHgZ4kZRHkYAb
	6b2ZTkYA6U44yI4r755TBbzAMT//ypI7mhLTSbIavxU1j6bXhH6cMpoq6cYZ0ZO2lFcR
	fdDB99QfzcxmmBrMnViZjPGhS/b0NV3hfSeSygXcN9gXOcjRNvIXuNZQMR2U2yzsyyeG
	4AqkULVd4DnLq01TIVDy+2nDSCA/BtaGkPiwpwvfdfqgfzxETW4cBReOf8WdXGE8fX1b
	BF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0jCd/oDUt5p33IThX/9Yd3FPx+skq9JaBmAAgxHTGHY=;
	b=tmQmvjIuIy7sMrkjZbaioiKOJttM7HpbfLbbrle+IPdjNZnwh7i1N3r8pADxlIHVrn
	6CX1VsQoycY2Z0uPVcsI4qkFU1IfNZ6gZcpe5UfzQf2uDAMw9hMPXiv4V/mk+Z5XezRL
	yIzld4o0AaSdOJGzxeOeLaaOiKcLzSUkrIvOQKxY9RwrUDTzy19PngQJXVcPDEEDD10p
	He5w0NTqQYB+ILEVEZCYiETCDKhTCB3uzNnMUiG1a5D9sP2OhlFlBc3DkM6zCsPJM1O4
	CEZD6IhgZNeLz765CA0aDhNad2bx/uG9e4V1wU6SlVpXHR22fMVs3FWT4NsJq2RnWGCZ
	sGlw==
X-Gm-Message-State: AJaThX6G1z0Bu1rKJnHDi7xffRlDQF3woq39dfmdoimGJfwghCCeEfxE
	znZGSu+lraMNygkUB7zhpVc1gg==
X-Google-Smtp-Source: AGs4zMZpke3FQXWlsTAbRZfsxzPu3cGKcN8joNVpEvqUDndYJClIruPeFhYMnqjmwW3WRrdlK5k4SA==
X-Received: by 10.80.146.184 with SMTP id k53mr22563736eda.78.1510751880943;
	Wed, 15 Nov 2017 05:18:00 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	c5sm18017967edd.38.2017.11.15.05.17.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Nov 2017 05:17:59 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Nov 2017 14:15:50 +0100
Message-Id: <1510751750-1916-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] qemu.inc: let linux-yocto-rt also provide nfs server kernel module
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
X-List-Received-Date: Wed, 15 Nov 2017 13:18:00 -0000

From: Ming Liu <liu.ming50@gmail.com>

In case some users want to use linux-yocto-rt as the preferred kernel.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/conf/machine/include/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 0e4103b..e64b0c8 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -25,6 +25,7 @@ EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
 
 # Provide the nfs server kernel module for all qemu images
 KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
+KERNEL_FEATURES_append_pn-linux-yocto-rt = " features/nfsd/nfsd-enable.scc"
 
 MACHINE_EXTRA_RRECOMMENDS += "rng-tools"
 
-- 
2.7.4


