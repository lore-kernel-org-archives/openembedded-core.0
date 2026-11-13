Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13794.1794582837571775714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 07:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eyabTmJ6;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: michalwsieron@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1503444f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 07:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794582836; x=1795187636; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrGtKJbeVRxLxpRXQXcs3t16IEh+APVZ7EBhEJCjgi0=;
        b=eyabTmJ6WTRD+x+kHXJbl5ZFabWefKxLdGwTfo5gnbs0/xii/DiI0YAmogwmiijZMr
         XIs+etKGUr//nDc+1fuWmDGs5Ctn2+vls1kQIJirUSOLq21ZdoxYhveRd77EKWxvapJT
         vQW40QMWvI7uED/gJXtPQD3xU88RzDI2ENmV3TZyx2LWDGQm8sshaooxzKgENOr/xCFp
         IHH/UPrTAQqVXNuu3XDVAQNNFsysEpH9GMSwnKMmHsD/Cx8cfugxc+YztmliSpzdIo3f
         apt3wqdMd0Cwm0lDuSi3lK829FBmRzvz88LTbnH7Q9zySlneVor1y4Q+/B5NavtT0+SW
         qUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582836; x=1795187636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IrGtKJbeVRxLxpRXQXcs3t16IEh+APVZ7EBhEJCjgi0=;
        b=oQXs0wNZGYYJvD4i4mDxWKl1CAdW/fdU9GDv65Om/sDHAWCzyC+lzOcC4qUwfT6S6U
         +HWaKYKqWQJXkJsS5S+RzrfLEGu7qWi4aDa5IgdNt7DkYBabh/nWcmnTn9UWoWHBpDje
         Zn5QytN4mi4iy9L+C18J6OvpIyc3u0QqFwAUQzeY5Lb/vIPjR25btEzmIv66kMhrNJKI
         P8Tq3y9jks7JG0nEn3Xy9VEcjv8g76X7RQUzd7hKxEHa16oNMPggXh7V06b2Q7GCsvEO
         RXSFTR59scH9PZswwv6ZR6sozmxipHwYHk5/0Vgg6lyzN6lz9j4TbkQJnH1yi+5Xv9dL
         ybPg==
X-Gm-Message-State: APuU4Z/ghamuEjN3y48C2ItCxHnffnIoEnSvEGXgBHRx+VIaTtQDqGa6
	C8BcIa2vGzOfiinwovObASKJ1D/8+xFSe8n3VOCjVOT5g8pRotslnmY+2lP2U6aC
X-Gm-Gg: AYBFou2O5xgfhyPUiF1HDTg37sngkdBYDy7jGDBZ5igHPJOIoAjwlWZaSd5jHc3ZgkZ
	4pCQ0vto02TArNnFKSA1IC+yGXnwO4XdCeouwldDAMkFcqRrmHLuXz8FG3tVQoX/DHPAFVf9vow
	89vO567G6M2FniR5sZVdy8b3wR3Z3Xo4aYq8BYBt4G3MV6YzS3SRctk4GT0PQMRsxCVgKfdFk8E
	ch7OEOJbVwgNnyK1i9ctXspdes8uABRxvnMsWq3yIdIYwZy1Fb/bjWrh52SPkxrvS+BN55Kc+t5
	6pij3DJ+0BSCroK8uXb8V4bxaL0n9+aF/eNHIYHYbqTgyYH9yRcYsiRQbWpt1+fDOvR/05sX5n1
	YMMshMjS6veRpHNbUelG/WxEno09yICA2b7ib98Lpkth/geo++LY+GOcw31GoJAiqK78VyZ1FDx
	joQ7KYzw6w82Co16iQOI7svLcYKVSSpw7y2URcB+ixedYQvtG0o4YaZTip1nSv7YpyH/Cn/eBYg
	Rgyp9pzSAYAps6Lmzsr558N1gFiLRWMf2lA9p48cPwS8fhtgYwm5YUq8Vi4JHUryckiVcaZ9oim
	f5EymTjSljG+0gQ0edE/tAJ9EJovFLpa
X-Received: by 2002:a05:6000:18a6:b0:493:2eb8:e7d2 with SMTP id ffacd0b85a97d-49c72306fdfmr6538253f8f.41.1794582835593;
        Fri, 13 Nov 2026 07:13:55 -0800 (PST)
Return-Path: <michalwsieron@gmail.com>
Received: from [127.0.1.1] ([193.28.84.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm5633781f8f.58.2026.11.13.07.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:13:55 -0800 (PST)
From: Michal Sieron <michalwsieron@gmail.com>
X-Google-Original-From: Michal Sieron <michal.sieron@nokia.com>
Date: Fri, 13 Nov 2026 16:13:23 +0100
Subject: [PATCH 2/2] rust-target-config.bbclass: Set llvm-abiname for
 mips64 targets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-msieron-rust-mips-llvm-v1-2-cd3b005bd089@nokia.com>
References: <20261113-msieron-rust-mips-llvm-v1-0-cd3b005bd089@nokia.com>
In-Reply-To: <20261113-msieron-rust-mips-llvm-v1-0-cd3b005bd089@nokia.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michal.sieron@nokia.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 15:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250186

Recent rustc requires 64-bit MIPS target specs to name the LLVM ABI and
fails the build of libstd otherwise:

  error: LLVM ABI must be specified for 64-bit MIPS targets

Set llvm-abiname to n64 for mips64 and mips64el, and to n32 for the
mips64-n32 variant, matching the ABIs the data layouts already describe.

AI-Generated: Uses Cursor

Signed-off-by: Michal Sieron <michal.sieron@nokia.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 1faaaef33d..2faecd55f9 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -418,6 +418,10 @@ def rust_gen_target(d, thing, wd, arch):
         tspec['llvm-abiname'] = d.getVar('TUNE_RISCV_ABI')
     if "loongarch64" in tspec['llvm-target']:
         tspec['llvm-abiname'] = "lp64d"
+    if arch_abi == "mips64-n32":
+        tspec['llvm-abiname'] = "n32"
+    elif rust_arch in ("mips64", "mips64el"):
+        tspec['llvm-abiname'] = "n64"
     if "powerpc64le" in tspec['llvm-target']:
         tspec['llvm-abiname'] = "elfv2"
     elif "powerpc64" in tspec['llvm-target']:

-- 
2.43.0

