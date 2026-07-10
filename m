Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8929EC44511
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:14 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1860.1783701433452680831
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YiBvoE1Z;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b77b150aso9915405e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701432; x=1784306232; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DsKYczZMZbXWq2RlZ9f3AEDr6XXQThDOrpJFKgK5l98=;
        b=YiBvoE1ZR+JGwl1q2sQ2oepO7wwvNOcq0efNxaZF++jiqfMuYaRl8j4wA+Xmej74+R
         NMbOC1Vxsj9R+iB1uSxGgfbd+hpY0NIymCm806TR9KXH+UW2YpPCVbjbMBqFoLKexZl4
         x26P2Q4y0Jb+cELOdmlrEYfyGB75WTFoBR+T4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701432; x=1784306232;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DsKYczZMZbXWq2RlZ9f3AEDr6XXQThDOrpJFKgK5l98=;
        b=VQ4iGIvgaKaFn2j3Ao7IkfAL27nVh/+PHBMF5DkkDbG62ZA6xtpvZgdxI09EpLCX2y
         Hi4ylvoIjTRTJ5or9s+WNifU8Ms2WhR8OTJjksRx+Dea0cMVlX+9HhRag0waMawp7wvR
         eepR83C3/Xgq/uLOiic105TVTYa0YLiqX7wUTr/qR8U3ItbS3u1aeYAPut/FeaVSKD8/
         QENMBgGrvDs0KWl5OTyOlMBx2HCg/HKfS+nsWZVnWN9DraB6hU8AT2nCPtYfXDGjN5aV
         HFkvXUQr7a8gvc4lx8TLxK7xEchcE699+1GuC+3WLISwYSAPn2KBGt6bTHQsF14Aznq8
         8aOQ==
X-Gm-Message-State: AOJu0YwdkT5SvVJ/9Mv9RcSmsePZ+nSkHQMBCq0AKu2QHCl/1UBayvXA
	4Z5jiR/BqxkK+OO48iBCD+I4vV/51ou37de7vAo97b8Lro8kF7fnRgW6A8iB407JMVGB8WYHNu9
	awfyxwLs=
X-Gm-Gg: AfdE7ckbh6ZK5muNKJDkIpTmESwZDk5kED3btrWRbIDsUq5vD2skcNyPocAI85DVmqs
	QIeNFY7bdrFMC0TJKD6dM6v4rNR+2QnIveAz1EKJHF8QqppVJXC/mb948R+JqD7k+ZT9S4ips3W
	uBPeOc6/xcdlHCzpJ4kQUB4WIhd+8nhi7Luk2Fu2AnwH6Vf747PR2fMqugUf5zq8hDNp5NaDWN1
	F4QD/RtA//y+1ZDApSvAyaMM9Eui+8EkfqfNxDJR4nhu5WQ0iViz6W40THHxwlOaEGiAmLjwjdo
	Figkkj5fT5xDUQxi2bfoWwoSE8okkioVQgTlnJZ/irxi6DF281V5+1e9NdVW95zpHqhSFS+B/7E
	ijbtJM186E9avUw6aitE9dwXLwjB7IO94Nj7/mj1RbVwmP9C9fpr6Sf8P96MGsaa2FZOPwDwCDK
	zcVch62/RtQBoCbMo1wYWo6NBN2iOG3gfHM4ErBfZPZ9tK47Ubd4ZtKtgmQ9Tc/L7mJ+s9UiQ9u
	FEjCG+eQLoGIRC1RFc=
X-Received: by 2002:a05:600c:8711:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-493ec8a3680mr83084465e9.1.1783701431617;
        Fri, 10 Jul 2026 09:37:11 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/18] ovmf: fix tpm PACKAGECONFIG to use TPM2_ENABLE
Date: Fri, 10 Jul 2026 18:36:28 +0200
Message-ID: <ced96d736a3e5a2a5b53d8f5e955158cd558a24c.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240674

From: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>

The tpm PACKAGECONFIG passed "-D TPM_ENABLE=TRUE/FALSE", but ovmf
renamed that macro to TPM2_ENABLE in edk2 commit 4de8d61bcec0
("OvmfPkg: rework TPM configuration", first released in
edk2-stable202202). Since then TPM_ENABLE has been an unknown macro
that edk2 ignores, so TPM2 support was never compiled in, even for
MACHINEs with 'tpm'/'tpm2' in MACHINE_FEATURES.

Use TPM2_ENABLE (as defined in
OvmfPkg/Include/Dsc/OvmfTpmDefines.dsc.inc and consumed by
OvmfPkgX64.dsc) so the tpm PACKAGECONFIG actually enables TPM2 support.

The same commit also added a separate TPM1_ENABLE macro (TPM 1.2
support, default TRUE), but its dsc.inc snippets are only included
inside OvmfPkgX64.dsc's "!if $(TPM2_ENABLE) == TRUE" block, so it has
no effect unless TPM2_ENABLE is TRUE. No separate PACKAGECONFIG knob is
needed.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d6b434455544e5922d75ba07a74490e6a6df7a0c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 19bcc4a96fa..01f840c2154 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -14,7 +14,7 @@ PACKAGECONFIG += "${@bb.utils.contains('MACHINE_FEATURES', 'tpm', 'tpm', '', d)}
 PACKAGECONFIG += "${@bb.utils.contains('MACHINE_FEATURES', 'tpm2', 'tpm', '', d)}"
 PACKAGECONFIG[debug] = ",,,"
 PACKAGECONFIG[secureboot] = ",,,"
-PACKAGECONFIG[tpm] = "-D TPM_ENABLE=TRUE,-D TPM_ENABLE=FALSE,,"
+PACKAGECONFIG[tpm] = "-D TPM2_ENABLE=TRUE,-D TPM2_ENABLE=FALSE,,"
 
 # GCC12 trips on it
 #see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetools-turn-off-gcc12-warning.patch

