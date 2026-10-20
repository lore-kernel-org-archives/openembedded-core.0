Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4778.1792538587063530239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=K0Xh0BqP;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso53593f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538585; x=1793143385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5bsRFljaqME2jGZO7ADAXf0o9FXJMbgbI0vRXj05aOI=;
        b=K0Xh0BqPjeiUk+gABEGfr2+3NIadMKEDDNwWBVOzyJx36HUDNXV2OjXJCJdcNaCSi1
         rQe3RCISDBJbxRs/kpY3aHp04hILDu2ZMLd29fysyZ+ylGZwvWNvY/CEHy6loogayeY6
         s5V3WcZmwby+FXV9v2V0JhETHvG9NIAwLQH5vRYU2Wr2dRk7elpTp4OneYJviRsJTI5D
         9jQ3VTg2n1T+a8YESKH6bM0YO75UKx591UNW0go/9T1oD2UFMZTCTLbBF+rVt2SzRtZy
         iEZb2CodAvl5IqhX+ABTEuQlosvDAgt17f3blQpODDbcfXyqqTVNFoGW120LesEBuv9j
         OPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538585; x=1793143385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5bsRFljaqME2jGZO7ADAXf0o9FXJMbgbI0vRXj05aOI=;
        b=DkfrlxrzYs7IXRwTUPt56h5lGapiWmyghrUs9FhBls4XJOPWPqba9Z32vEmoiFJmcD
         zzHnHN01Nte7Je+YNUu9vIqlKCBjVU1cFGJiRPls8u6rpvOexksaM18iR706HK0P5UhX
         9BCOJ2fwaAue+s0A0ejU5BAz0XEl4DunLFemAm1u38tM7hxz3f+0vGs5JdUBOa/Iq0E+
         E9x3QZXhstR0qKpt3FhknJGy2VEvATS/mzRfnU6GZNMc+zPu3GqHX7al57Nnc7bZVSVY
         pLpTEE+7xUltVXdrPzB484TG8qPrxSfpXJJ+RIgPsXBYbdXcpA8XiYnT0erphroDDDEw
         EmGQ==
X-Gm-Message-State: AFq9FYJDpPYkQ2G8lhxHuAp5/0OIWlb9ZLzBk/ceA/hEtPKlI0Lsq2ii
	pyFtifxnaNEr6ajeBfqTkMJ3OfyBXIYTfBpVfS2vl8bJY07zLFV3g81Mdd+HSBs0otKPtREnYbA
	HDu0dYEc=
X-Gm-Gg: AYBFou1v7zFjJfD6HhfXXjMlucSaHACTes3ZXaCeFgXDlcmPhrv3lQZ2eIMdQ8jA5tY
	FEzy6wmEzpJo59n/AChLcI74nvb0y+Nd/0Y2Qo5UUAgywsGCisU/xU66R+6Yh9Nj913O7TSIgOQ
	qKoR+IpX+Q//yMEjTahKZ2YFPhF9l9PqcT8p0NgDpTdilpJpIROQmN/zxRmnl3eHNl9OOdXyhPc
	KKg2ysu6FfRUTas0MFpxrwSCA26PEtpXBb+EX1bBtLPQCOuZct0fIy09+n0729oiCD+lqobDHLh
	gmJ2SXR2ilPSIqhua4coF/AnTyvWk+e3ty+B1ByzLovqcjaj2ZN5EMYJmmpikHX1/3epcSIH5hF
	0epaTEC25QeGLRlPI0qOyYM5w7geg9bqT0jx2G0JzqtFIRiHEO+md3pkACp/b4Njw/laM+CZKeh
	Uc3fOAULc9PfdLhibI+nPfyzzb8GBZEFVlTSpcLbZHc2ziiQ/AjFm+XvpAshq1UDoAszjGbXFAN
	0uA4nACPre5I6dECNtn5yZHLbdO0WGOapKxWuOuPSet3I3QHfN+mT7UiFRmmcWNlnJGykbABg==
X-Received: by 2002:a05:6000:29cc:b0:48e:159f:e33a with SMTP id ffacd0b85a97d-48e264ca494mr220935f8f.34.1792538585097;
        Tue, 20 Oct 2026 16:23:05 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.23.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:23:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 24/25] kernel-fit-image: reference the boot script as "script"
Date: Wed, 21 Oct 2026 01:22:34 +0200
Message-ID: <fe46090f6abbfeb20abf8bcc4f9b37e9d717d03d.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248343
Content-Type: text/plain; charset="utf-8"

From: Sergio Prado <sergio.prado@e-labworks.com>

The boot script added to a fitImage through FIT_UBOOT_ENV is referenced
from the configuration nodes with a "bootscr" property. U-Boot does not
know that name. It looks the boot script up through the "script"
property, defined as FIT_SCRIPT_PROP in include/image.h and used by
image_locate_script() in boot/image-board.c. The same name is used in
the example image tree source in the documentation of the source
command in [1]:

    configurations {
        default = "conf-2";
        conf-1 { script = "script-1"; };
        conf-2 { script = "script-2"; };
    };

As a result the boot script cannot be reached through a configuration:

    source <addr>#<conf>   fails with "Could not find script in <conf>"

    source <addr>          falls back to the image named by the "default"
                           property of the /images node, which is not
                           generated either, and fails with "No FIT
                           subimage unit name"

    source <addr>:<image>  works, as the name of the image node is not
                           affected, but addresses the script directly
                           and therefore cannot tie it to a configuration,
                           which is a problem when one wants to boot
                           exclusively from a signed configuration as
                           part of a verified boot chain.

To fix it, rename the property to "script". The entries of "sign-images"
are property names of the configuration node, so rename that entry as well
to keep the boot script covered by the configuration signature, and update
the expected value in the fitimage selftest to match.

Verified on an i.MX95 board with U-Boot 2025.04 booting a fitImage built
with FIT_UBOOT_ENV. Before the change, 'source <addr>#conf-<dtb>' stopped
at "Could not find script in conf-<dtb>". With the change, the
configuration form runs the script and boots.

[1] https://docs.u-boot.org/en/latest/usage/cmd/source.html#fit-image

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6bb0775e6ca56eb50119e9ad618dc5b865252f72)
Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/fitimage.py                  | 4 ++--
 meta/lib/oeqa/selftest/cases/fitimage.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index a1040181a23..2304119902b 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -453,9 +453,9 @@ class ItsNodeRootKernel(ItsNode):
 
         if self._bootscr:
             conf_desc.append("u-boot script")
-            opt_props["bootscr"] = self._bootscr.name
+            opt_props["script"] = self._bootscr.name
             if self._sign_enable:
-                sign_entries.append("bootscr")
+                sign_entries.append("script")
 
         if self._setup:
             conf_desc.append("setup")
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 84e21346abe..822b8c22c7e 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -697,7 +697,7 @@ class KernelFitImageBase(FitImageTestCase):
         if bb_vars['INITRAMFS_IMAGE'] and bb_vars['INITRAMFS_IMAGE_BUNDLE'] != "1":
             sign_images += ', "ramdisk"'
         if bb_vars['FIT_UBOOT_ENV']:
-            sign_images += ', "bootscr"'
+            sign_images += ', "script"'
         req_sigvalues_config = {
             'algo': '"%s,%s"' % (bb_vars['FIT_HASH_ALG'], bb_vars['FIT_SIGN_ALG']),
             'key-name-hint': '"%s"' % bb_vars['UBOOT_SIGN_KEYNAME'],
