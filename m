Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4528.1792753059953035231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=G5Fm9EMj;
 spf=pass (domain: 9elements.com, ip: 209.85.167.46, mailfrom: tan.siewert@9elements.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bc18f54abbso640372e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 03:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1792753058; x=1793357858; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbMR20+5krRb7mSmuHgXvqTdbf+997mDChVYSkJmrZA=;
        b=G5Fm9EMjzBy8eKaCUtPiZ0FqxeZghe3rGzmxrGLNK08s3HAluRgv2U3TanyakeMP16
         aEPvVb013MfQhmzhf5mbpeTFAJwBfM3QIxJpO7YuQ5pUIMLxtxvZgmukAZOMPTOqmVDs
         EAGuqqA1ADoN9nWK3aaFH8Jkp6HYgbRNkHpXQf0Sp8ggSoXXKM4icLNbdsF13Lx/7cHp
         dPwszXxN82aS8mI9O8dq0S7G1LcgJHCfwoFB07q0mpMTKIgnW1LGXSydmIElllkT4ufF
         m/T/jNNHxpAOY2Df4SzDq0PMCO6vq3c1uElctTc6vGO7/Yvj2gNNlVriIIW3YL9t7fu2
         vEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792753058; x=1793357858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbMR20+5krRb7mSmuHgXvqTdbf+997mDChVYSkJmrZA=;
        b=sPtT5A3+X8441oJOhnUEETRq2ws3gwYPjOFqzmQusoOq6XM5HMA/8VZEsj9z3XjPj/
         oZcbNmt4aQPBN1AMEiP9RdH0UJFVp/cZ4eMWl0j3ZDFGBMdnp2EMDwFcGb/YE4uZA2jm
         95HEjMedcfcI0n/ti1CIQSxEIQz56EFrt8SVsox6ou0a0fghC30dWYLTI6IuTNlhVRPM
         lcEkt/CzaVmgPfUg3NK8ofIyMNyPTfyzuO6D6rW5CtMGCP42x8PRe/qx2/F8BofNDcsZ
         OW9KDUQwVm4nztFbDXT9LSwOLB0UwZHSsxBYBY3ph7UMmNp8y25J5THUkTqhUr/OgqtX
         YqXQ==
X-Gm-Message-State: AFq9FYI6xhXYPZkdECLI1SPeVMgIEBQYoDDeHv1bxd+WPLMF/N9THFvQ
	+x3VkLBzDKAMq4KWyqhb3HPvNxhQp31bOmsnJw3buwEZ9x5oASBsXaWNufvEdLQrwL8S/sSPdLo
	q6N8Ttfg=
X-Gm-Gg: AYBFou0voNEnq1OkAektV8RdpwnH607an7FyW0YQnv3nYug1CRE69UMYbM7NPQi7K0C
	WSRdyCgP01I6ZBryMjgkU/Py/f+cSscnxxjfeSsBEAS/MwG2a5NUfg2MEA+xJsKjPIPuOSAk5rb
	FL5ZdCWVQKGR/kPBa//bUjYXVVXU9yCxas/BRrnBe6QsR2AB71rFR1iJOreR7aM2Kkjadbgqi+k
	f8oHyjDWfj+z5OjTGbT/SUhZnONa/V6n0gaoQIP9yXIVKubqdP/bf/cqTBmRUDTfaFoD3dHC9Cw
	mTl2oOjXjE7DGsLsTxF4cDodPZ+SriVaDmsPPgR3fXtu2VgsZJwvLVPqMDbV1fOK0mBgIFLvZre
	rfAxpaqk5ZVZcqYi6uMhP2K2i5kd9u9k49Ajty6sBx+3ZPKNZxf+Si0MxRPDttOmyI1eyQo9MqE
	Zp0Qlxt41QG+RCgwSFsp/m5uUGZZIZY7/OnQCHHUOflVQGQLXS8f5o6IRQxl4uTNOVcSAM2Pd3S
	a4eUZBV+E8lmqNMuX0duVRc7LCSpRRlMAta7Gby7uaDheM9vEsEJbxczR7uUKiZ7FJevZDzFA==
X-Received: by 2002:a05:6000:400f:b0:48e:3678:5112 with SMTP id ffacd0b85a97d-48e38593c26mr3195425f8f.21.1792752728662;
        Fri, 23 Oct 2026 03:52:08 -0700 (PDT)
Return-Path: <tan.siewert@9elements.com>
Received: from white-mocha.local ([2a01:599:841:69c3:a3ce:18eb:5996:fa43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37eded3fsm4268891f8f.7.2026.10.23.03.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:52:08 -0700 (PDT)
From: Tan Siewert <tan.siewert@9elements.com>
Date: Fri, 23 Oct 2026 12:51:54 +0200
Subject: [PATCH 2/4] systemd: add sysinstall packageconfig
MIME-Version: 1.0
Message-Id: <20261023-systemd-optimisations-v1-2-0cce103e54df@9elements.com>
References: <20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com>
In-Reply-To: <20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com>
To: openembedded-core@lists.openembedded.org
Cc: Sai Sireesha T <saisireesha.t@windriver.com>, 
 Patrick Williams <patrick@stwcx.xyz>, 
 Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792752717; l=1952;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=lLHMqhgvR4DDYQKpbYv4IJBhsQ21GQiAEgbaYY0qPnU=;
 b=a/b/o7eQ2/nVn0c65is5nTuTgFs+gQeUpP+9DrX+HzjFu3mtOcxFJXREBVCPu+0CJ/YOjLo1N
 U8GXwSdcqR9Bfypwq3mPHYArfHSLCb3emCUk1Y/bmNnT8z0XaW0LFZH
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248538

sysinstall is a system installer tool and is unnecessary on some
embedded systems. It calls systemd-repart at runtime, but repart is not
enabled by default, so the shipped tool could not work in the default
configuration anyway.

Add a packageconfig option, disabled by default, and warn when it is
enabled without repart.

Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 meta/recipes-core/systemd/systemd_262.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_262.bb b/meta/recipes-core/systemd/systemd_262.bb
index 24797e2e08..60d8ed00d5 100644
--- a/meta/recipes-core/systemd/systemd_262.bb
+++ b/meta/recipes-core/systemd/systemd_262.bb
@@ -188,6 +188,7 @@ PACKAGECONFIG[seccomp] = "-Dseccomp=enabled,-Dseccomp=disabled,libseccomp"
 PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux,initscripts-sushell"
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
 PACKAGECONFIG[sysext] = "-Dsysext=true, -Dsysext=false"
+PACKAGECONFIG[sysinstall] = "-Dsysinstall=true,-Dsysinstall=false"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
 # When enabled use reproducible build timestamp if set as time epoch,
 # or build time if not. When disabled, time epoch is unset.
@@ -871,6 +872,9 @@ python __anonymous() {
 
     if bb.utils.contains('PACKAGECONFIG', 'homed', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'userdb openssl cryptsetup', True, False, d):
         bb.error("PACKAGECONFIG[homed] requires PACKAGECONFIG[userdb], PACKAGECONFIG[openssl] and PACKAGECONFIG[cryptsetup]")
+
+    if bb.utils.contains('PACKAGECONFIG', 'sysinstall', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'repart', True, False, d):
+        bb.warn("PACKAGECONFIG[sysinstall] may call commands from PACKAGECONFIG[repart]. Consider adding it")
 }
 
 ALTERNATIVE:${PN} = "halt reboot shutdown poweroff \

-- 
2.53.0

