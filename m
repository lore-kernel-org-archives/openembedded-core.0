Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1115C7EE32
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:02:46 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.69577.1677430962201381815
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FfMxBXpn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id i10so4394147plr.9
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLbNJjNwop/Eg47kzikBlOHdHh8CdLro6ok+lxWbUzk=;
        b=FfMxBXpnTBopLpxGQvold7RkS9nJOP8lbV4luj+GApwNoeBQcPFJ/EqBBY16OOgRh7
         Z2H4OYuWODVhd2KEiZx2i4tdxfG4utoF7XB+mjyaqQ/rBrODikQA318vLwBGE2ufHD67
         rTCxthpeWXBzOriiNb+x7IBbhqsfPcRXXH2X85Ojhqqx4ZrQrQvdj7cBy2jl5UQqTfOz
         NsPLA8c4f7ochaAReu7cDLthnI2tNsijyv2iTlnRMklKJjFw0sdWEWAoAmb+YnZatZGG
         cdMlOkStg86RRu8ZZJN49RECLwPdKIy2RMPs3UBFxQqopffj+GlN1jpms7hjdx4eqUyX
         n4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLbNJjNwop/Eg47kzikBlOHdHh8CdLro6ok+lxWbUzk=;
        b=dXHM4cZXk45EcNUtEHC5Nx5Ibpc5OGdWmPgPXL3LAVw1qfsZin2dR44x7yet2ETU40
         0MJ70skR36PMdxTH6xIMktK0gruDPhP1vyEQap9Wfj22VMTH3JNvfypxvjWxCHgeAQ8l
         scS83DF/oZe1+wPYgarpGDLOrYGxaQEM3/Uj86LhwVdFxzXuhdKU7+ZTFcy5/j5kj1QK
         mghWrngK8kjNyePFVV+HP9IxZg1TuoJQTmszH2eWfU0ZOGf/kZXPwB1TR8HOQUWtB9yq
         0H7rVU7XPPVmvEySCmP4OPQFHOtPibfCazSqU7cfq4u+FaFI5W4wIJ7vCnRPkJ1n+/cf
         EX9A==
X-Gm-Message-State: AO0yUKWNApC3e0zwk/Ng1spO67a0Ad8I09w9VIserkTG8VCky0W7KRfK
	s5MU0T2QwY249bs/296xX4Jjv0iI3NzrSRZ3nR4=
X-Google-Smtp-Source: AK7set93ANLYz5p+CvhJK/ZVxTkTAXSFt2+sugNeHl5eU6nYj7t8K0Zn+QfFSBFInw5AwpMag/6ODg==
X-Received: by 2002:a05:6a20:430a:b0:b8:8a19:d6ad with SMTP id h10-20020a056a20430a00b000b88a19d6admr18208368pzk.24.1677430961246;
        Sun, 26 Feb 2023 09:02:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:02:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/28] dbus: upgrade 1.14.4 -> 1.14.6
Date: Sun, 26 Feb 2023 07:02:02 -1000
Message-Id: <83e9bd1507fd5f79c680dde30b0f66df84cde6b0.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177744

From: Alexander Kanavin <alex.kanavin@gmail.com>

Denial of service fixes:

• Fix an incorrect assertion that could be used to crash dbus-daemon or
  other users of DBusServer prior to authentication, if libdbus was compiled
  with assertions enabled.
  We recommend that production builds of dbus, for example in OS distributions,
  should be compiled with checks but without assertions.
  (dbus#421, Ralf Habacker; thanks to Evgeny Vereshchagin)

Other fixes:

• When connected to a dbus-broker, stop dbus-monitor from incorrectly
  replying to Peer method calls that were sent to the dbus-broker with
  a NULL destination (dbus#301, Kai A. Hiller)

• Fix out-of-bounds varargs read in the dbus-daemon's config-parser.
  This is not attacker-triggerable and appears to be harmless in practice,
  but is technically undefined behaviour and is detected as such by
  AddressSanitizer. (dbus!357, Evgeny Vereshchagin)

• Avoid a data race in multi-threaded use of DBusCounter
  (dbus#426, Ralf Habacker)

• Fix a crash with some glibc versions when non-auditable SELinux events
  are logged (dbus!386, Jeremi Piotrowski)

• If dbus_message_demarshal() runs out of memory while validating a message,
  report it as NoMemory rather than InvalidArgs (dbus#420, Simon McVittie)

• Use C11 _Alignof if available, for better standards-compliance
  (dbus!389, Khem Raj)

• Stop including an outdated copy of pkg.m4 in the git tree
  (dbus!365, Simon McVittie)

• Documentation:
  · Consistently use Gitlab bug reporting URL (dbus!372, Marco Trevisan)

• Tests fixes:
  · Fix the test-apparmor-activation test after dbus#416
    (dbus!380, Dave Jones)

Internal changes:

• Fix CI builds with recent git versions (dbus#447, Simon McVittie)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 31245df3061c1a913bffe5e11ad6ac7fa9c83915)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/{dbus_1.14.4.bb => dbus_1.14.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus_1.14.4.bb => dbus_1.14.6.bb} (98%)

diff --git a/meta/recipes-core/dbus/dbus_1.14.4.bb b/meta/recipes-core/dbus/dbus_1.14.6.bb
similarity index 98%
rename from meta/recipes-core/dbus/dbus_1.14.4.bb
rename to meta/recipes-core/dbus/dbus_1.14.6.bb
index 5f91ec2dc1..a6e18a92cb 100644
--- a/meta/recipes-core/dbus/dbus_1.14.4.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.6.bb
@@ -14,9 +14,9 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://run-ptest \
            file://tmpdir.patch \
            file://dbus-1.init \
-"
+           "
 
-SRC_URI[sha256sum] = "7c0f9b8e5ec0ff2479383e62c0084a3a29af99edf1514e9f659b81b30d4e353e"
+SRC_URI[sha256sum] = "fd2bdf1bb89dc365a46531bff631536f22b0d1c6d5ce2c5c5e59b55265b3d66b"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
-- 
2.34.1


