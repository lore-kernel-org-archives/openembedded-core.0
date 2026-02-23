Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BB8EC1106
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 16:28:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39137.1771864092415003313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 08:28:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Py+ykR6t;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48336a6e932so27979105e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 08:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771864090; x=1772468890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X5b6qeoaue3xhtVYvOOiGJTOY7r1/K4Jis0Aet8OT48=;
        b=Py+ykR6tpdJ7rVGkq+xDI1hX3wLjRXb/werWdsRb5l+KfLIuwTYE+/UynZZl/BDJcH
         /OVOoMUITizASoivTWfJr9U6ya+wl9Eb9TNyK8c5G4++o1/4hP/pBKve34hj4fatpaBu
         2LB7+BRc0+FxviljXLBmjcsbEM82w0MdeX1UfEiG92okw1M1V7eOv5OWfj1lJgortDKm
         FBQKIL69sbGKV6ZCJnWDrDCYMvopaMo2ctedInTa105QxONpATS4U4RLt3q1Vq+Btb2l
         YnLA6R5g8lhmVFzefyNVw7CsE4fwqhoI8JeYNTlyHb9uH5NpmEs7qL46wNVe/kfgNPad
         cnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864090; x=1772468890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5b6qeoaue3xhtVYvOOiGJTOY7r1/K4Jis0Aet8OT48=;
        b=MywpPFlKosH/H8CXUqCChIFxlOwOFRxdAgUSKO8qVilHQaWzJvfWFkGLGoTRFwv/LH
         8mkmrZqEi5WGv033UVazkxptrCnzAaMan4MezjS1rL+NKReCV/q3CpgCK+NuIpjl1v0P
         2eEn/tBCEgA0UhnMCokjIvbYzo4yEk2KmqIh/awV7dgZZxaLWU/+PQx+h0Jr4Ybo2EqI
         k3vYuOB8ziDiXP1VjnOLLszvoEmnXIMWHE2Rbun2XwW9aUFFlG0f5lItTLc6jZ3xdjeI
         qHOPSfibJdODIvMMZbWdR0RAXPk8WhHjW3923OHvLw72iiCFBfBFMhI9ATHwzZwNw/am
         /75A==
X-Gm-Message-State: AOJu0Ywu/PyeAyP90IFYaJrjL+pBd+pbbQG3TlEDIe78rxb17yOkDnVZ
	bhtl3ICZ/Co90VXRVf9ZhBywlk2QK9HjKrNl5w83NluwhzEpR04E1X1p3GpZ1g==
X-Gm-Gg: AZuq6aLE+31yuY3xswoyguoh85n69kRUqOII1eDUdl1IHW6RxHToZ15UyepNvdcFUWd
	xhgCIDss8s8lGZ7SmI+L9klqvNFH+mnu32yMLjnF6S01jQhWg8jovVFvyxjkLkT/FIbwasqXndj
	eJqaTtobSlO+FXKvw9FrQ3PIbrOO/NZVLrdWxrrmyZciKpc2L0BxFhr65SYEME3HdcGcEPBthYS
	TbTpaasSEjCCBlNUL6krSR87Gc4G596Lv95rsM8Xr4MudV7tYnq/vGXEuyKzAtpEXntZMQB8dg9
	Rv7RMYgGjfwRrMhDA4fSu/OMBftcCjYrUwoS8CaTzTtX2rZiv1VL9Nio7K11IrGD87ydBY/PU79
	jwDIfyaoX/jLoVsriDxGBUE6mkWl7DNzFuNTZAOW8WSOdUbYTqwd/Cj1SKafjbrbvkyctb11HBE
	5nLm2Vxm8Wp/XqtsbyIfrTy4ubHCia4dvjQFN9h8t5zw==
X-Received: by 2002:a05:600c:3b10:b0:483:43da:6c87 with SMTP id 5b1f17b1804b1-483a963d603mr133230865e9.33.1771864090154;
        Mon, 23 Feb 2026 08:28:10 -0800 (PST)
Received: from toster.lan ([185.228.162.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a8df83bcsm225794605e9.13.2026.02.23.08.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 08:28:09 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] systemd: drop sysvinit PACKAGECONFIG
Date: Mon, 23 Feb 2026 16:28:07 +0000
Message-ID: <20260223162807.2584370-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 16:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231681

Systemd sysvinit was removed d9ec9e20 but the packageconfig knob was still here.

Remove the sysvinit knob and fix:

| ERROR: Nothing RPROVIDES 'systemd-compat-units' (but /lmp/build/conf/../../layers/openembedded-core/meta/recipes-core/systemd/systemd_258.1.bb RDEPENDS on or otherwise requires it)
| NOTE: Runtime target 'systemd-compat-units' is unbuildable, removing...
| Missing or unbuildable dependency chain was: ['systemd-compat-units']

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-core/systemd/systemd_258.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-core/systemd/systemd_258.1.bb
index fdf4dc5bdc..acb8af3255 100644
--- a/meta/recipes-core/systemd/systemd_258.1.bb
+++ b/meta/recipes-core/systemd/systemd_258.1.bb
@@ -204,7 +204,6 @@ PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux,initsc
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
 PACKAGECONFIG[sysext] = "-Dsysext=true, -Dsysext=false"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
-PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path= -Dsysvrcnd-path=,,systemd-compat-units update-rc.d"
 # When enabled use reproducible build timestamp if set as time epoch,
 # or build time if not. When disabled, time epoch is unset.
 def build_epoch(d):
-- 
2.53.0


