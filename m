Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3E3E6749B
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 11:39:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78512.1766403539786653773
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 03:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PliGtafP;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso38278265e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 03:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766403538; x=1767008338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oToKjaL9pfg18oimfCQOZ/WHY18gs2mEq9bx8uN6eq8=;
        b=PliGtafPuYJvuesNsR0eOEOlkCI4c7hFLowWNjOfTx0JmvFVVuoLwQx2Yqo4W631EL
         zBi8Zyq2fcpHtJKqAzZr+xEFXxQ/BoTbSQDgVO+LliArdIaRbZomEkF9PBCvW3NfTELu
         awdlS+sYg7tAD7thZchC6quVyZ2eg22gX5ZPVaAUrzt/tG2DlLOkeseZ11dAUffyG2Hc
         boz+Cu5+pmHcubdbcSPEgQvbjh4Be9hDD2L5lKUR4WkTH4jf1Q4Seg9Zp/0FjjkUb376
         WTuSvhXbFlfz9WOzZbSr792TQHh0a1y9p1k0i9lxHUiqalyPIfGPbOhq557C8pPWF85f
         u1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766403538; x=1767008338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oToKjaL9pfg18oimfCQOZ/WHY18gs2mEq9bx8uN6eq8=;
        b=DnMtesPjGXjFp2yog0Rc7/vnvKTPMNYvaSocC6vqym69P4CkIu1xl38jGbDfwCxaPG
         Zy5DY2ZFrT98NDHnnOKyCMIfmy9oo7mMDF2qYUIcvr31vLDOU9GQw0iPXzY32AFM0FYz
         euhELLIqoMtCddISj/dNrQDAmMygpldjNvJ/JLkyw5kPAaBXJKu3kXZAWeqIsyBho1zi
         g2pn50gciKyMYXP18Wd4cJyVnGC9W1ZGHqspeMjNCbgeAMwhboRjH5FSPk674hUUdeoe
         EZ0ZABev7/82RSnDir3dRM3DzeWB9+4V7AO/qJSJusePyjCLrOFdoTqWh7+mG0ikJXCR
         C0Gw==
X-Gm-Message-State: AOJu0Yw/gvhY1UD+gMC4H/lSGZJefuaKrpB/4lPjmacZ1khSKpqj0mks
	LKGMNlzB2Jl6ioq5vO2bPWTYP33XXU7eVQp9t0+BTunn3g6Rb0xj9L2oJ+I89aviNJQ=
X-Gm-Gg: AY/fxX6D1shON62OC8j0LmA93iYdskoo4inBYHKyvA7rgdPVHvzCOzN+7EhH+dUlmx3
	mc/Wu7mClPejNyvLByl6tcldhbhJJm2KP3cFjZO+8HiUnpX6jX5YB+1DMD1F1lz7qEUq+d31g5y
	ThphUtovuJYdtmZVDvPhOa2hh9D1fW9rcaNVmqLUW95VaiaTzEOdPileMaw61RHfbzc6A+gwHoJ
	bt6exVPb9R4laiZceonFB6NIMdOs6Emi79wj3Ag6yueSP8j81PfRRAAcmIaRO3g3glxt9wbpAcC
	Qn1lUUV2DnWKmEo9sfq8UfdHmtrkPgpHFL/HMmoaLvwBUVVJo5dSac0BbeM8BLHOu9byurCfMw1
	J62Sc4OTXhRu0fzJ7up61Jmq/dMi8bwIlietfMD9V3ri1F59DVbyxNwKuXEGz4GoDReRMVVQpG2
	Qx14H0HnZyZnL5
X-Google-Smtp-Source: AGHT+IEdCRbhz4I5iPgUJ7RNcP49HGdYcZ8IOoe8A/VQjR/GQOceQJStrEpSY7wy0ldLaJE14dpuew==
X-Received: by 2002:a05:600c:3588:b0:477:fcb:2267 with SMTP id 5b1f17b1804b1-47d1956eb88mr129125985e9.8.1766403537684;
        Mon, 22 Dec 2025 03:38:57 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08efsm21720373f8f.29.2025.12.22.03.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 03:38:57 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 4/4] oe-selftest: overlayfs: Add a demo case for /etc
Date: Mon, 22 Dec 2025 11:38:40 +0000
Message-ID: <20251222113840.2163929-4-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222113840.2163929-1-uvv.mail@gmail.com>
References: <20251222113840.2163929-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 11:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228300

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

/etc is a special directory. It's possible to create a mount unit for
it, but many system services that start early at boot time will not
rescan its content when you mount overlay on top. The added test case
demonstrates this but adding a sample systemd service and enabling it in
overlay.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 98 +++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 3e55e97927..288d889f03 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -263,6 +263,104 @@ EOT
 
         self._test_correct_image('systemd-machine-units', systemd_machine_unit_append)
 
+    @OETestTag("runqemu")
+    def test_etc_mount(self):
+        """
+        Summary:   /etc is not supposed to be used with overlayfs.bbclass
+        Expected:  Observe inconsistencies after using etc overlay with a mount unit
+        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
+        """
+        systemd_machine_unit_append = """
+SYSTEMD_SERVICE:${PN} += " \
+    data.mount \
+    etc.mount \
+"
+
+do_install:append() {
+    install -d ${D}${systemd_system_unitdir}
+    install -d ${D}${ROOT_HOME}
+    cat <<EOT > ${D}${systemd_system_unitdir}/etc.mount
+[Unit]
+Description=OverlayFS mount for /etc directory
+DefaultDependencies=no
+RequiresMountsFor=/data
+
+[Mount]
+What=overlay
+Where=/etc
+Type=overlay
+Options=lowerdir=/etc,upperdir=/data/overlay/etc,workdir=/data/overlay-workdir/etc
+[Install]
+WantedBy=local-fs.target
+EOT
+
+    cat <<EOT >${D}${systemd_system_unitdir}/data.mount
+[Unit]
+Description=Persistent storage partition
+
+[Mount]
+What=/dev/sda3
+Where=/data
+Type=ext4
+Options=defaults
+
+[Install]
+WantedBy=local-fs.target
+EOT
+    cat <<EOT > ${D}${ROOT_HOME}/test-daemon.service
+[Unit]
+Description=My one-shot task
+After=local-fs.target
+
+[Service]
+Type=oneshot
+ExecStart=/usr/bin/echo test
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
+EOT
+}
+
+FILES:${PN} += "${ROOT_HOME}"
+"""
+
+        config = """
+IMAGE_INSTALL:append = " systemd-machine-units"
+DISTRO_FEATURES:append = " overlayfs"
+
+# Use systemd as init manager
+INIT_MANAGER = "systemd"
+
+# enable overlayfs in the kernel
+KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
+
+IMAGE_FSTYPES += "wic"
+WKS_FILE = "overlayfs_etc.wks.in"
+OVERLAYFS_ROOTFS_TYPE = "ext4"
+"""
+
+        self.write_config(config)
+
+        machine_inc = """
+OVERLAYFS_MOUNT_POINT[etc] = "/etc"
+OVERLAYFS_QA_SKIP[mnt-overlay] = "mount-configured"
+"""
+        self.set_machine_config(machine_inc)
+        self.write_recipeinc('systemd-machine-units', systemd_machine_unit_append)
+        bitbake('core-image-minimal')
+        with runqemu('core-image-minimal', image_fstype='wic', discard_writes=False) as qemu:
+            test_daemon_path = get_bb_var('ROOT_HOME') + '/test-daemon.service'
+            status, output = qemu.run_serial('cp -f ' + test_daemon_path + ' /etc/systemd/system/')
+            status, output = qemu.run_serial("systemctl enable test-daemon")
+            status, output = qemu.run_serial("sync")
+        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+            # Check the test service status. It's enabled and supposed to start, but it didn't
+            status, output = qemu.run_serial("systemctl is-enabled test-daemon")
+            self.assertTrue("enabled" in output, msg=output)
+            status, output = qemu.run_serial("systemctl is-active test-daemon")
+            self.assertTrue("inactive" in output, msg=output)
+
 @OETestTag("runqemu")
 class OverlayFSEtcRunTimeTests(OESelftestTestCase):
     """overlayfs-etc class tests"""

