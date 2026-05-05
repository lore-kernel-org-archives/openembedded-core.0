Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED737CD3441
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:58:52 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1076.1778000327731888532
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=z0IlgVrQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48d102471a4so22241005e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000326; x=1778605126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWhucAe1nmwi1xosahyfMtEQF1x9iNOUWp6y2UEoG4Q=;
        b=z0IlgVrQ71Gh6WnYNv/6qH1POKftJ/BlJF9CnL8AN7s2YfXvg6RLC3UV16ywL8Awy/
         7uNqeFGlF8M8CV8F2fey6Je/S9ypJl5Ep7/iGnlByr3Ofz6j35hHLvB343LKlfXAvlVd
         8P7/D/Xq+8g7LAme1vA8dy3CexDYNG7zqQ4E8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000326; x=1778605126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TWhucAe1nmwi1xosahyfMtEQF1x9iNOUWp6y2UEoG4Q=;
        b=Fb9FTOF+8B/JVDBiYCKL7C4TVLrlC2rBXx2HUVDtBLP24SByxl7u3MC/6AjvjXDMw8
         NQ+NFjCO7NfGVDYs8NvHH9uRDz31/32UZGAyvB7GKOZXZq1ZVcaHcFSV8LtJbSv+/57J
         WupLvYejcDFyLksjMD5+MR72Q6+KDED72PSspJgAuGzy0/nQ1nCMgFjNH8j4V8yD5i2M
         8pkPLhbDpLN74q3q/WMcWNAFZf+PnkniOeTsNZ9bhZjUM618OdVro/LiTZ1o0sk5E5xa
         WF963KHz54752qCKUsUy1xzixXQ0GrJNyo4/s3r8l3pTNz9LaOizvBWUQLNJT0eHQrO7
         wFow==
X-Gm-Message-State: AOJu0YyX4xKUFd38ehpFWcXAd1nLa65EWvAqVvh6f2duQwoInG1hwZ69
	B2AdAbMgy+P3u7pxoyRN340r7dsrz4TOsU8HhHwn9l8CUZWk1W3q+q7a9ZwurXxiuhhmNJzQyEs
	V2lkSvu8=
X-Gm-Gg: AeBDiesLKlUHY6Lcugbli7yZC0rjvreYPKwglUxfq4GbtVHd8f+MiYOy2H+MQ8nxz50
	JSzjLJMDyPAlkpsaZYZKpYwCAxti6wZRfkKkes3VdZURBcAHsJCs1IfV8AmvhAFsJajzHTe9GeD
	CZre8hdiSfrNa3lZyppGvxmiTLoNb0xmwV4hZNHiA8IqX4tAsXg7cfdaIEF8EAubMtzBEflVW2l
	nExA0nJmX6xfZaqfePTLnLYvUjkp9prrQPS89JONc+hvcpLsmLVKMK59rdxsuOJkhGo6L6nWxFg
	VKrkwyQqjNLyYMEYo4MpWyjhLYQwLKEhYozQi6itW35YQuvol8UYZD3BL8059Bqp2YeoSaCo59X
	YwMnQGdBrzcZMQk6TxN8tK0VRrnY+ani+6DNz0qgM5Tl/etZeKZVK421Wup5wmexkCarQtgpp34
	dSlvy0w0+m49Y6hxl/5dHi9fd/f4fNh6PjbEYYdHfdyHig0StgLF0yNFFLIgr4xh4tXE+J7yu3B
	4t3m7viVL88MksB0e/0tqWumsvWsbJN85eW
X-Received: by 2002:a05:600c:8b04:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-48e51f183demr1231275e9.5.1778000325841;
        Tue, 05 May 2026 09:58:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.58.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:58:44 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/23] dbus: gate user-session PACKAGECONFIG on systemd in DISTRO_FEATURES
Date: Tue,  5 May 2026 18:57:21 +0200
Message-ID: <5550d6eadb2fea1ecb13e035a04a57450510441f.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236495

From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>

On scarthgap images built without systemd in DISTRO_FEATURES, dbus
still shipped dbus.socket and dbus.service under
${systemd_user_unitdir} (/usr/lib/systemd/user), because the
'user-session' PACKAGECONFIG was always enabled and passed
--enable-user-session --with-systemduserunitdir=... to configure.

In dbus-1.14.10 the user-session autoconf option (configure.ac and
bus/Makefile.am 'if DBUS_ENABLE_USER_SESSION') only installs systemd
user units; it has no non-systemd effect. Enabling it on a sysvinit
image has no benefit and produces the stale unit files.

Make user-session a systemd-gated PACKAGECONFIG by using
bb.utils.contains in the default, so it is enabled when systemd is
in DISTRO_FEATURES and disabled otherwise. No changes to the
PACKAGECONFIG[user-session] or PACKAGECONFIG[systemd] entries are
needed: --disable-user-session is passed on sysvinit builds, which
prevents the configure/Makefile machinery from ever setting up the
user-unit install step.

This is the scarthgap equivalent of master commit a296b0623eb2
("dbus: use the systemd class to handle the unit files"), adapted
to the autotools 1.14.10 recipe. The master fix was broader because
the meson 1.16.2 build handles unit-file install differently, which
let that commit drop the manual do_install unit block, the
systemctl mask postinst, and PACKAGE_WRITE_DEPS. On 1.14.10 those
pieces are still needed; the minimal correct gate here is the
user-session default.

Fixes [YOCTO #15779]

Signed-off-by: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-core/dbus/dbus_1.14.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.10.bb b/meta/recipes-core/dbus/dbus_1.14.10.bb
index ffbf0780ed..e57a01478b 100644
--- a/meta/recipes-core/dbus/dbus_1.14.10.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.10.bb
@@ -29,7 +29,7 @@ EXTRA_OECONF = "--disable-xml-docs \
 EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
-                   user-session \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'user-session', '', d)} \
                   "
 PACKAGECONFIG:class-native = ""
 PACKAGECONFIG:class-nativesdk = ""

