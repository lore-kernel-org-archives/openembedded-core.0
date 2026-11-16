Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24203.1794820877439055477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 01:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=COWPJSNk;
 spf=pass (domain: snapchat.com, ip: 209.85.221.42, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490f38e9688so2219229f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 01:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1794820875; x=1795425675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JoSyn/VBHlR1AT1LDE8Q+91Ss0g+RCUTYMOO6y6JgZ4=;
        b=COWPJSNkokvFasY93NTO0wEgjd4HmX6uyxcFqP3ITkWU+pgS6e6YigTAImRCWJnxz5
         Knz83+Qv2npeztfSbPBokT2Yy5AyH86OaYfdi+ET3+uuqBfQQ0TNM3eb5Zgh6IAF6rzr
         DJ+BgJbAZf39t4H9PTHIrgWVgZKjgYPtXEzXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820875; x=1795425675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JoSyn/VBHlR1AT1LDE8Q+91Ss0g+RCUTYMOO6y6JgZ4=;
        b=onInVvnlBVsLfOmZvOsNwzrCbsSHxyu8XlbWPareVjrE9VdKMqp9kZY85DIhTKu/Op
         NMmHANOLTGipO6UlQAaK6l5BtdAUj3VmG8eymd3c58N2cIWEbm4pIKurHQyr5bn4C74k
         EcB27V0MJ2iztkOj+LwH3NGHqopGjPSDTn0dQLCvDPpGo0Vc4IolnG7EdvId62rRVKkb
         GuhdjyQGBCMTXJDrUqXa65XUW1tmp6PoWSTJq/2f8j4wrsB89dXAeWQze2ucR8/6ceHh
         G9TU0Lv/Rh7SPWDMCyUiOzYryZt5VTggxhscb9QVfEgkuD6la/cv8NzV7FKzRgeIFydh
         26Zg==
X-Gm-Message-State: APuU4Z88pOY8GEvvnQgWwjynk11L8ML7cBfNST11eMRq9DEx+V+a39yt
	/+rmc5JyFEEvNGCMWGwkQ6ZlRkDalM5h08vj2BQZx3O5kAMsdJsaLyJTRVuEv2UA/AWtN9Fw3hv
	qupgWQWo=
X-Gm-Gg: AZFdTZeZDwaMWIygT8xTyJOgKTtbeqBHN7yUY5V0kZTeMjotMhr4tn2K+zzHpFP2Syb
	SGlK39m066SeTtkTNk9oitTrXw1lkDVYhpSEk5BNB9Jd1uQpQA1mz+lX41n2wtJSYPTnWksUu59
	HUz9Ewdqk1nWSH5y0aNACwdN2mj+U9j60A4yMEmfbn1E+dwBQpR0IAE+xLuwvLWA7z6FeGDGHLD
	ywPV8+jdEU/t2t1aSg4a+le7wNr0DcLfaSOBQpOsXlNQ9wiIqYR2Z30SR/x3Vwadt8I5v5geN6k
	Y13jlZm90Velqx1isybhxNpQ3bkC7ccFjB+fs+bT94Nj8sh6kbk+4/9tR+bL1+Rzd0QLoNDzGE+
	xJJi1yxn7ZrYTOy/ns73z/QQZzwFz4/xqc3yNMzWYd+B18ov3ahfG0pb9NGLMQbUOjp6SN49U+0
	8tIEV071FiZAStYDagx5lSdcofw34mZcdVx0XJ9Z7NC0NCvhD4OpTmn+MaBldeiuilQWL7es5pU
	KhDCuUbzK8ah75pAfjr59lG5JRAzgZ/WLPMEtkb/m2qFc9nwj2ScmaXJOpTcBzxt+iHfX9c49L2
	UTPBV4DyO9Pp4cOhyEdgFiNtkPIwUf5XIs3CbNBFoKnM8OyG2MpJBM0TbiiOhUnrFwkIubkhGTC
	ZvhLOnnjBJ+d4vSJPgDoLeDuqhvc+vgSeN+B6I4M=
X-Received: by 2002:a05:6000:250d:b0:48f:bf71:2aeb with SMTP id ffacd0b85a97d-49c70ed8f89mr24128530f8f.23.1794820875225;
        Mon, 16 Nov 2026 01:21:15 -0800 (PST)
Return-Path: <ecordonnier@snapchat.com>
Received: from localhost.localdomain (80-108-196-96.cable.dynamic.surfer.at. [80.108.196.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm19930812f8f.34.2026.11.16.01.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:21:14 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH 1/2] sysklogd: enable journal forwarding to syslog.socket
Date: Mon, 16 Nov 2026 10:21:02 +0100
Message-ID: <20261116092104.3160433-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 09:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250324
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

With systemd, syslogd.service requires syslog.socket and reads the
messages that journald forwards to it, which only happens with
ForwardToSyslog=yes. Install a journald drop-in enabling it so the
daemon keeps working once systemd-conf stops enabling it for every
image.

Tested on qemux86-64 with systemd: "logger" messages reach
/var/log/messages with the drop-in and are not logged without it.

AI-Generated: Uses Claude Code (claude-sonnet-5-5)
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-extended/sysklogd/sysklogd/50-sysklogd.conf | 2 ++
 meta/recipes-extended/sysklogd/sysklogd_2.8.0.bb         | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysklogd/sysklogd/50-sysklogd.conf

diff --git a/meta/recipes-extended/sysklogd/sysklogd/50-sysklogd.conf b/meta/recipes-extended/sysklogd/sysklogd/50-sysklogd.conf
new file mode 100644
index 0000000000..29a7331b3c
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/sysklogd/50-sysklogd.conf
@@ -0,0 +1,2 @@
+[Journal]
+ForwardToSyslog=yes
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.8.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.8.0.bb
index 79e2612653..762bf33504 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.8.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.8.0.bb
@@ -12,6 +12,7 @@ inherit update-rc.d update-alternatives systemd autotools
 
 SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=v2.x;protocol=https;tag=v${PV} \
            file://sysklogd \
+           file://50-sysklogd.conf \
            "
 
 SRCREV = "e2c0c1d9585e88b1a85e3634c4dc230517f68f0e"
@@ -23,6 +24,12 @@ do_install:append () {
        install -m 644 ${S}/syslog.conf ${D}${sysconfdir}/syslog.conf
        install -d ${D}${sysconfdir}/init.d
        install -m 755 ${UNPACKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog
+
+       # syslogd.service reads syslog.socket, which journald only feeds
+       # when ForwardToSyslog is enabled.
+       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+               install -D -m 644 ${UNPACKDIR}/50-sysklogd.conf ${D}${systemd_unitdir}/journald.conf.d/50-sysklogd.conf
+       fi
 }
 
 SYSTEMD_PACKAGES = "${PN}"
@@ -33,7 +40,7 @@ INITSCRIPT_NAME = "syslog"
 CONFFILES:${PN} = "${sysconfdir}/syslog.conf"
 RCONFLICTS:${PN} = "rsyslog busybox-syslog syslog-ng"
 
-FILES:${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/sysklogd.conf', '', d)}"
+FILES:${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/sysklogd.conf ${systemd_unitdir}/journald.conf.d/50-sysklogd.conf', '', d)}"
 
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.43.0

