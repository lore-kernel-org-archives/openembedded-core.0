Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5602.1794387810582832850
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=RATwAv4i;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a215e64962so33153565e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387809; x=1794992609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TxIFThM+inTwaEWZt4QcUWgR5cl8bncdQcvNGuzBh84=;
        b=RATwAv4iuenvNh/q7pdT6JU3Ee15Nxap288oxTX3pMR4KwLw4oZFGLoowCs/cDnK4D
         W1DXcLC16XjP/mUjCoMLrQySjHGBFA2KYt4bHu+G4TJZmPZwm867hXk1I14a+fnmzpxT
         NEf/fvn+wzHBv5rJ9NPcQKunSmRjMGeEj6Vwgn7ABFEtg2T2/ZmreHcbgvywUqvKv9WN
         2ZWaO7uhTd/nocFPUjats2Vbx8lvXS6Si+U0Vw/EzEbrwbCPVRqrAkG7IDn6z4w0LNZv
         34Zlio4Ihw8SZ/mM3mn6G1g2seQXK+v3aEI6Z9dCcKNh4vA1H9oDE0KpUc0xkvMULPy/
         fi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387809; x=1794992609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TxIFThM+inTwaEWZt4QcUWgR5cl8bncdQcvNGuzBh84=;
        b=laETK41Bc7072Pualn21lJLZNloEbX7vnFSx2SnMdAx6r5wfFAkKQU5PxFr4VexotW
         CnKWdm0N5qDZ0X9z+T2kKP8LuGLIAhhMlwDDuO9fr7P/vi6KEETTRnc1Ierd6drejpTr
         uxqUbtAo4/LFLizjpHS0W5AbLEobQc7Cb0VYJGL1feSHJ/nuxyJP7kWPJ5VsQD6n5obe
         AEU+VrROVs6yVReWcv9dXsxr2ng0CONmHNxSluLnDhA9VAFpW4/FJbhVKf0aBt/vTBD2
         F5muVLrQCoX9GxOsDKfupHivBptyFF+8MNLwX5tMSLwPj61r8D1YO/HHdPRuQAbg47TD
         GA/A==
X-Gm-Message-State: APuU4Z8Lcw2j/LVtT+Q7vl5VUMN9Jq4UDAir3i8mxK+Xk2UkFx3k3Uks
	uYfvc5gfsh7DTsLvN2ZEMa2FOhasY5leY01l4KAId1MwHUQ7lDqbHmt3j/xhwR2oEpUhg0R6xKn
	0HWQw8a0=
X-Gm-Gg: AYBFou3QKLt1SCZ4X2R5BiF+oOkn0dots/Gvhb+5oOCxQN9Vg2c/pHWhNC+WqCQ3+qq
	LR6sqHUDvMXhl09LcCcMihrfVddQ8v5QaU1Vt9fT2sRJHGAZDKjk7KEp1hkzw8fNSbG8OLa/6Ye
	uIa908yHJSsnoI3QDDwNgzYKKxTYdZGLiPw2vk1AwbETduYKpsYYFq2T3PvZTctu+0rMpWddDGl
	iU+1Yh7+/zJyfWFGzl45FhpdTiIKwDFEYGCq6GPEO68Kj50h4UZ1ooaOUYhlrr2AHoGI40+WYYk
	ic86kHqN0AnjnVNjjfNbgsiEkmp3sqavxQ4rh9fVkTYZef12d4C/23aCia3oHsFvfrZs7Mm3uz+
	B9csqrCXq+p5RAPpAM2VpWGp1fcmpaEl8HrhJt2yfhrgGCxxqeCy0PvoTo6z8iZUYUVmSvo6pSX
	An57TE7AUBa3eRIjR2LoFtLdbfQ4p+cxg6Sh0/NZRcmuA+GLK4ha59sFDPlC/St+NJ2WFxTvKnd
	iqSzUBi9VBSIr7IsTdqUXfkfVPDLhpZQ1dBCtJN4fmvKpFXtKL1kVFeUh8wLhs8RBOVjHIm0k3e
	za0+FqtWFm4+wWtm04y7njnnvCYcmL7jfiPvC9CE7cefRgs0GIqDwNrg3eiGaiVu8iM2/gX3+nQ
	DP7RYoNhpyhMejW/513RsGJLQy+1U
X-Received: by 2002:a05:600c:3e0b:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4ba09383e7cmr28315575e9.24.1794387808808;
        Wed, 11 Nov 2026 01:03:28 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:27 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/35] kernel-fit-image: add FIT_LOADABLE_* variables to do_compile vardeps
Date: Wed, 11 Nov 2026 10:02:38 +0100
Message-ID: <99cab6528506fe9d78aa856484ca50c95490df38.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249984
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

do_compile only reads the per-loadable flags of the FIT_LOADABLE_*
variables with d.getVarFlag('FIT_LOADABLE_*', loadable), never their
values. As the flag names are not literals, bitbake cannot track these
accesses, so the flags are not part of the do_compile signature.
Changing e.g. FIT_LOADABLE_LOADADDRESS[atf] did not trigger a rebuild
and a stale FIT image was reused.

When FIT_LOADABLES is set, add the FIT_LOADABLE_* variables to
do_compile[vardeps] with a single appendVarFlag call after the loop
that already processes them.
Referencing a variable includes all its flags in the signature.

While at it, fix the duplicated word in the comment.

This is a fixup for commit 2535427d8de0
"kernel-fit-image: support arbitrary loadables"

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 418a35dd0b4a6d0ccddb49047f059120907f6061)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index cfe43a5a306..db4798d0818 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -32,17 +32,19 @@ python () {
     # Parse loadables config
     loadables = d.getVar('FIT_LOADABLES')
     if loadables:
-        # Check that the loadables configuration variables are not set directly
-        # directly, then assign them a synthetic value for testability purposes
-        for v in ['FIT_LOADABLE_ARCH', 'FIT_LOADABLE_COMPRESSION',
-                  'FIT_LOADABLE_DESCRIPTION', 'FIT_LOADABLE_ENTRYPOINT',
-                  'FIT_LOADABLE_FILENAME', 'FIT_LOADABLE_LOADADDRESS',
-                  'FIT_LOADABLE_OS', 'FIT_LOADABLE_TYPE']:
+        # Forbid direct assignment, set synthetic values for testability and
+        # add the vars to vardeps so their flags are part of the signature.
+        loadable_vars = ['FIT_LOADABLE_ARCH', 'FIT_LOADABLE_COMPRESSION',
+                         'FIT_LOADABLE_DESCRIPTION', 'FIT_LOADABLE_ENTRYPOINT',
+                         'FIT_LOADABLE_FILENAME', 'FIT_LOADABLE_LOADADDRESS',
+                         'FIT_LOADABLE_OS', 'FIT_LOADABLE_TYPE']
+        for v in loadable_vars:
             if d.getVar(v):
                 raise bb.parse.SkipRecipe("You cannot use %s as a variable, you can only set flags." % v)
 
             synt_value = " ? ".join([ d.getVarFlag(v, loadable) or "" for loadable in loadables.split() ])
             d.setVar(v, synt_value)
+        d.appendVarFlag('do_compile', 'vardeps', ' ' + ' '.join(loadable_vars))
 }
 
 do_configure[noexec] = "1"
