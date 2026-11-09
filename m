Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3760.1794253689325049251
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 11:48:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GUTVTybZ;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6e560e00a86so734648eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 11:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253688; x=1794858488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTYMigd0+ZyC4B85UyNY8s3jidM5wVxaP5djY52xhfM=;
        b=GUTVTybZ4FmZ4CSW7pCCuD7dxYRCLzExR7IRMr/L01QvWGT4UJ6HZnCaF+GogKxHR1
         CO1+atUdaFikE+cW/nvdi6+I37V7uXGEjiKqH9pPlOQXV2zI/iEHosnSUdwUGWNViAov
         1+klZKjTjCGciFGp7GvTw0iB43Fghx9PypiDXzG5IyWfNQvhsTbD5ex7aHO39m0IovPk
         CjQ3pJn19Q11IkPVPWOjmeWIxhQNo6g1mwdFRYCQp/h/wa/pvE5vw+boOGZqb9hHqFKU
         YOo8jndMHIXS06HJL3dOeImg9MD1fJPlcojlybBTKWpMH7LCuXPScjdY6rOz62hiuoie
         V7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253688; x=1794858488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BTYMigd0+ZyC4B85UyNY8s3jidM5wVxaP5djY52xhfM=;
        b=m4G6QGoQY/4VN0+HKf7NlzE/ci+cx/upIWAvobVdIMfWRx99TQxBQsDbyxnYgcvPGl
         ZbRfimrgMmGzvvdRoToZJ2gdwizPqZuC0ghJ2apnx2vo91Yw+2XSf/9zg9Wg0ZpVMMrc
         sLAm9bfDvsAHpEyJuuuLyCTUa9ol8z49NFcpaL8S87AniIIyQSv+aQlxzwGPwNJr70Fg
         TQDv3p2LcdMvGQsWQNDdO/bRVoWNyT+gmCLeT7oscXxQyaDCiyuu3vqYTO3vkPzcBUCg
         3XfB5+4jDexVGybG3Sny8RU6i25raM31qHQ2wtoBTrcuA9vkdemP51gK3TeJCnrdz3ko
         iwsw==
X-Gm-Message-State: APuU4Z8G7Eo9i+BVc/2LCXi5FKFj68ouH3r6gqnu8a/4ML/QsKv06Vao
	jQr6373fBNRfcRde2S+5TvEH4rOvxpnPkjEEG30zSJWEchKjp4XJ/g6oG/+wVQ==
X-Gm-Gg: AYBFou2i69G0KBiWWN486JMguw/iyPqPFQSA1Yw8TJblH8xzG7wqwyvjZmRPI37ShI2
	/MnxX4cJe0sryWZZU68J3eQrVPb+YmWh9Zzy3Ny1bWlo1Topo9tElw3eHLIb/BEuhK10Kwrlb3N
	m9I8eBVBHypmlBHKoO6qG/ReHkhj34H+5QfH603xDMF5P2ZR9PruWfAla/Lw2p3F3tYxPTa2C0q
	4cNAuEQlCZSAPcvNdGpDrrcQ0ZJczyzlg4vNQo5GdBXH/L2J6I48kb55XBCBq6C96QM8gkONba2
	s1ER5n1d/3LZiyYrOEQ24rP2N7+hGEEXO7OVO3h2cjSvhhT/hIaHcrxdfl03nU1zVqOYgjkfO2e
	OCMLy+3+TvYhbHRQexzYup/KeHa9ySbLY5jVgs7O7/17qeZxrZolxsYRw6zswkP1L4ahGcVPrY8
	tOo3vR1QFB/fQwyHtWeO6/fyoAOOp0V4cwpcmCyEag8TWkUraqHV38QBa+E8VQGowDe1RqtM71R
	j+6xn2qDm8ZCTuqdvcPh83kC1CoJShvhis9OgOEdyhUkXNyBvL5jhNhjaiUpp2lAe6joJ226jiH
	LPTLfEux7DxSEHT/Bt/oSiNoREw=
X-Received: by 2002:a05:6820:440d:b0:716:e855:4ffc with SMTP id 006d021491bc7-718a615adc9mr83582eaf.42.1794253688442;
        Mon, 09 Nov 2026 11:48:08 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::3232])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa132e65sm70363eaf.14.2026.11.09.11.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:08 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v9 8/9] ovmf: Allow empty SPDX deploy artifacts
Date: Mon,  9 Nov 2026 12:45:44 -0700
Message-ID: <20261109194759.550935-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109194759.550935-1-JPEWhacker@gmail.com>
References: <20261104153535.3184146-1-JPEWhacker@gmail.com>
 <20261109194759.550935-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249873
Content-Type: text/plain; charset="utf-8"

In native builds, ovfm do_deploy doesn't produce any artifacts. Set the
SPDX_DEPLOY_ALLOW_EMPTY flag to prevent SPDX from erroring when this
occurs.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index bf69108f0a..7cc844dfa6 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -249,5 +249,6 @@ do_deploy:class-target() {
     fi
 }
 addtask do_deploy after do_compile before do_build
+SPDX_DEPLOY_ALLOW_EMPTY:task-deploy = "1"
 
 BBCLASSEXTEND = "native"
-- 
2.56.0

