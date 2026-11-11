Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5601.1794387806663371623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=kPDThV2m;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so24060385e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387805; x=1794992605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hEgH3pCXU/3pGpqMhn30xhXTMRrMIcglMWtSonjRXWc=;
        b=kPDThV2mUn8LQAZIriWoWiTZeEdG7l4+5P8VCQUfjXMleSfYnZmF1bUsXXtw9YaCR4
         vkX81PLL5lVI3nxQqFH2LynbDvIqBKRwgwGCaahN5qa9Bcb8ejf0pASCeBqN28JzWRRE
         aeoHZ4nTQ49Qy8Ob3kQGZgHoRHggcihXtB/ofE9nHa4RT5owAq6ydHsNJK7KiJA2P5Py
         oO6/WHGBWBudQ6DwK45wDXXNAHItxEc1WkV8N0qo0yXwPbx0sBX5W2JBoVf7C41yYLnr
         LzG94ewwwod7dMZDiRnkrPbXHcBWxm6sypEeZMatFzsPHerOWVgWvRb6p+ulhH1STV+Y
         cdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387805; x=1794992605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hEgH3pCXU/3pGpqMhn30xhXTMRrMIcglMWtSonjRXWc=;
        b=fbK2Q+Btf9PBOK4W1JtQrIF4nCgMMNYaQ7339CYIotRnhuKcmjT4pLg59cHIastZ55
         wfOQLSxuNkRSlUQ7aChhJlYeXdom44YKrb6zmdJNFN+vC9+stgDHWciHREqzIkaY68TL
         KyJWk9hoAIymkwNHYy0uoE6hGpyIOtTYcudGH4ILELi7Mt34FN7kKcfr4gw0d0nuVtS7
         NNhV5wJ2OiQ7JI9zbQHP01bPV94iBjuWyp+vnH97CgsMkfzM/6mW2GCwHFyKLB0bsTN3
         SJ2zSL/laEaStnnlfGETrgOB5k+1GvsKOV3/dE9StZjK2N1IvK6GOR4aubXOGZlSjz7X
         o/Kg==
X-Gm-Message-State: APuU4Z/so5o7pIL9BzJdJ6vl2JmEWQOOMX3L5JSACRMnX9ZYhHDK4Oz9
	LPtgkOrw6woctxD6n5qt10yAkgD6nm9ilbzXSZmzK7Tdn3BUVhnAnFAICVXT+QkvK/1ngL6FHz9
	7jvUuiPE=
X-Gm-Gg: AYBFou1ssS0zKD2Rili9DnIpbj8as/oBrrQZXkhM8bEg8HPQkChjGjn2fS+NwstCyxu
	YDCWdwQaukbcUdh7X0XykN5GEbr+kSFm5dTnUbPYQR9Rp2lKA8FyaxCOzH7t0fFWSNewKwybGcB
	y4/4TICoPDI13Js161w0PLtN0J7EuDzBDXyoYhiT42zFGapcZ/6bxoDzPykh9UKWLHju6l0+lL8
	rtkMTrTWuo1tI6SPB4dN7DU6wn4a+SAIUlT+1tVjU9wv14uDknOtsakyIyAV+XJbhlML1KDSBro
	NHzBtG4jgDkCkY42skGg5UBGstDK9pA6r35LzkXSuSiUpXQLGRjfJNzBzCmM0RLVQnJqo/oaoIj
	adWZj8Av4eiKKy+7mfI40rp1VrZ8qici/8dhrkUXPncSya41qMmtcCqoqUoeTbYTST9BwDU1681
	jBOVlJpXEgpGWGXmq6sWYX8edrLILC4qODDKrIfb9kOKjjMl5MgLDYklFkGQXM3hBL2LQAcYZHq
	0AwFZUncH0ve3lMGCOAenCnbh3RzVeEs0UqcFOAXgVEOhdu6Ger2GzYO50Mpjt+3RCGZgKLizND
	DTtkTZ0SUjiEw6ha2ZuESeafbvJfrLfiXXktrllagkYlwho/OoGSuKGvbGqbyyprbpO15HXgX9V
	WBgZp3crkZperRawV+EbxNsr2InW4
X-Received: by 2002:a05:600c:1c0e:b0:4a1:fcfa:2a07 with SMTP id 5b1f17b1804b1-4ba0937df39mr32122265e9.30.1794387804870;
        Wed, 11 Nov 2026 01:03:24 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:24 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/35] spdx_common: modify UNPACKDIR instead of WORKDIR in get_patched_src()
Date: Wed, 11 Nov 2026 10:02:34 +0100
Message-ID: <2f9302882115ae7652fff0fb2bb6a0e3476f9125.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249980
Content-Type: text/plain; charset="utf-8"

From: Benjamin Robin <benjamin.robin@bootlin.com>

This change will affect the SPDX output: the source file path will no
longer be prefixed by `sources/`.

The rest of the changes are safe because:
- `S` should reference `UNPACKDIR` and not directly reference `WORKDIR`.
- After analyzing all public layers, no `do_unpack()` or `do_patch()` was
  found to reference the `${B}` variable. The comment mentioning the
  `${B}` variable traces back to [1] (though no further explanation was
  provided).

Additionally, this ensures proper capture of sources if the recipe
modifies `UNPACKDIR` outside of `WORKDIR` (though such cases should be
rare).

With these changes, SPDXWORK is no longer a working directory which is
"temporary" replacing WORKDIR, it is now a "temporary" directory containing
unpacked source files.
The run.do_patch.XXXX and associated files are now stored in ${WORKDIR}/temp.

[1] https://github.com/doubleopen-io/meta-doubleopen/blob/e84f0c32663da9c743e4f1802042b733df0e36d7/classes/doubleopen.bbclass#L285

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit aa44a0f0eb5e260959ebd77f439a5d25b3c1aa2a)
Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: The SPDX change was judged a divergence from usual design where
source paths do not have this "sources/" prefix. So, this patch is a bug
fix. See https://lore.kernel.org/all/DM9S9QJC41I5.HBYN1E0X32YB@smile.fr/ ]
---
 meta/lib/oe/spdx30_tasks.py |  1 -
 meta/lib/oe/spdx_common.py  | 18 +++++-------------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 1821dd7de4a..862e57c3d12 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -873,7 +873,6 @@ def create_spdx(d):
             lambda filepath: [oe.spdx30.software_SoftwarePurpose.source],
             license_data,
             ignore_dirs=[".git"],
-            ignore_top_level_dirs=["temp"],
             archive=None,
         )
         build_inputs |= files
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 9d1e22629b2..013f23ae7c6 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -169,28 +169,20 @@ def collect_package_providers(d, direct_deps):
 
 def get_patched_src(d):
     """
-    Save patched source of the recipe in SPDX_WORKDIR.
+    Save patched source of the recipe in SPDXWORK.
     """
     spdx_workdir = d.getVar("SPDXWORK")
 
-    # The kernel class functions require it to be on work-shared, so we don't change WORKDIR
+    # Do not unpack the sources again for the recipe using work-shared
     if not is_work_shared_spdx(d):
-        spdx_sysroot_native = d.getVar("STAGING_DIR_NATIVE")
         localdata = d.createCopy()
 
-        # Change the WORKDIR to make do_unpack do_patch run in another dir.
-        localdata.setVar("WORKDIR", spdx_workdir)
-        # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
-        localdata.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
-
-        # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
-        # possibly requiring of the following tasks (such as some recipe's
-        # do_patch required 'B' existed).
-        bb.utils.mkdirhier(localdata.getVar("B"))
+        # Change the UNPACKDIR to make do_unpack do_patch run in another dir.
+        localdata.setVar("UNPACKDIR", spdx_workdir)
 
         bb.build.exec_func("do_unpack", localdata)
 
-        if localdata.getVar("SRC_URI") != "":
+        if localdata.getVar("SRC_URI"):
             if bb.data.inherits_class("dos2unix", localdata):
                 bb.build.exec_func("do_convert_crlf_to_lf", localdata)
             bb.build.exec_func("do_patch", localdata)
