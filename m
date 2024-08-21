Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF614C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:50:53 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.18786.1724244643880836407
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DEHtivgO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so4448892b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244643; x=1724849443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A47OQfYDva3PJ6Whl4cq0eTvTUhA5ZnGyvCmgqM8wQQ=;
        b=DEHtivgOAmh0SskR3TFZYdIaW86sKsXkPaqjvyU2sJ4DDbsBBomIFa0Otf04amCsTE
         A57b0iqp3itv3q8nP6WVzDcncPn1VTLbURQdAYxy5Duz6XwB9FdAMs4fUq/7RNkC6cFX
         3d17zSoQqPnzVbcGDm+td2aOqn1J4eNsAce8NHA/B0V/FuFWfqEfxK3PXAvl8C2nQ6b1
         s/v+xF2bRPsVCv3o7cOmDEi5sestoGlC6TJY8Oday+B75gSIgy20sPRUqSzex6ZK1wqP
         lvHKpH1x3kPKngnEjMwQLuBxj9Yvnf7axe2dlkbE4XnEcBtzrxXoAansPu/PV1Gb7QuO
         FmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244643; x=1724849443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A47OQfYDva3PJ6Whl4cq0eTvTUhA5ZnGyvCmgqM8wQQ=;
        b=xLvDiUEywOpEp5Ly2F7JP/F5oUKzHmDi/Et69HrbGWvGeCMgTSlRPB9bq18enj7sg2
         hODRvL1Pyu+V8MG094RUp+QUiBKQmcxdMzhiRlqkUr++78ShxeE3rEzpWX9XtGe6vTB5
         NZ/PcxYvoKC0qlqKIK3i25oCVdpd78Pta91FtCd+JyDItTyxav0OojrUQu5TrgXNP6gd
         5sG+50sRR7R3RHiEFZXyqeJl41P21KAFrCykRXsJ7zm74rhoX88slTuJG/8d6YjL+AwI
         W1DZlWlFh6ObXihme4whSpiosOAswCtToLGt9cm/U3ogEbu3Gn3Pi6Raxk07ecHORzRh
         hw1g==
X-Gm-Message-State: AOJu0YxhqYux4+KctLmugfiXtrykevL619qpJPtZvkSnK69CbB8qQXb7
	IxK4971McRRM58dSdaKw1Oxp8I9NlBnfpxLeMIVdbdEwvy2R1Iz3rFlg4Q7J1fJMW71TAeeEXOc
	6ev0=
X-Google-Smtp-Source: AGHT+IF4raH/+6mpgRVkx6bZW1RwtNJRxwl60hRw7hyWr/iizqSK6CBW9XV54DtaOScs+f0LyHJwfw==
X-Received: by 2002:a05:6a00:3ccb:b0:710:4d4b:1af with SMTP id d2e1a72fcca58-71423769a5bmr2838403b3a.7.1724244643004;
        Wed, 21 Aug 2024 05:50:43 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/18] initramfs-framework: fix typos
Date: Wed, 21 Aug 2024 05:50:17 -0700
Message-Id: <29b33a9329d69806fda9ef6ce65423df6c19e787.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203594

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Fix typos in debugging and error messages.

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4995e222ebdc9b5508c2f03a11868f184e4629a0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init   | 2 +-
 meta/recipes-core/initrdscripts/initramfs-framework/rootfs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 567694aff7..20c0455ec8 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -117,7 +117,7 @@ if grep -q devtmpfs /proc/filesystems; then
 	mount -t devtmpfs devtmpfs /dev
 else
 	if [ ! -d /dev ]; then
-		fatal "ERROR: /dev doesn't exist and kernel doesn't has devtmpfs enabled."
+		fatal "ERROR: /dev doesn't exist and kernel doesn't have devtmpfs enabled."
 	fi
 fi
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
index e0efbe6ebe..38e138f618 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
@@ -59,7 +59,7 @@ rootfs_run() {
 				fi
 			fi
 		fi
-		debug "Sleeping for $delay second(s) to wait root to settle..."
+		debug "Sleeping for $delay second(s) to wait for root to settle..."
 		sleep $delay
 		C=$(( $C + 1 ))
 	done
-- 
2.34.1


