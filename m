Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29836.1793868248471639815
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=dsvVkpj5;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20edd106so1055949f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868247; x=1794473047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xHzL/haYzMLuoPUzbIvRE5P9vG+vjqYgVtbP2M1fBgM=;
        b=dsvVkpj5D2JTTadwJOvFJtznKfLxPDViclUUSADlrHMve7W9iq6fl5CavlDvNAkOzu
         dgwyTTD81/WwAKDWGzifJK/PckSWNDGOpGNyVmq1cX8+sHFOJaO2p37RujvQLwaVTwZh
         Hm4dOMt5KjJIWMFZXyyJhiR7G9agNEHiOV5MjN1dXOFe+CMbzLGrM6WbVh6Qwf172M7H
         ydAJPRO8VSSfQ6/9uwjKCtwwoGqsV404uPQhEilB/lL7rGstL2LH6gwmJ8XMZGFp93NS
         XtKZXAIg+C0/OdcEFF9ucRRnG0uHykYhaANkC4BWyPFMRrQlVRRRtTpkMuvP/gfN4vRk
         5XJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868247; x=1794473047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xHzL/haYzMLuoPUzbIvRE5P9vG+vjqYgVtbP2M1fBgM=;
        b=yqhjnd+rIFFTtvqA/2nDcren75wOawJ49ca/ETexqfQlWnjlaYhvooR5S+3GxzEUSy
         9OR9Q8e5c56LneoMlZN7HW4O4XQYW1DWzgV9slDOAi3p9YCUrPl0QiikKD61QEXTTicZ
         3SFdliS7xWjW2jtb3aXn8H7rcaMH41DBzYfbBuFxYcbda35Q74v8qmNMfDsajNZydBOj
         5ctuLyK4IW4gbh0/mxxz1aGnnSMw9J87HgGr3aBWt2bkBpIHBIm5VJXImqP+3M6h2OFs
         NLHDoflLei2s74H9R8sD27lZjRCIvJpDf39DLTgoxemCvKDUlQ/qUMzauxlsbjVtsX1R
         fnjA==
X-Gm-Message-State: APuU4Z/46aWzX4RTUzFLxsjXiIL1BHsgo5+44QHwI8g8PxgXhtYKe2Zv
	Al5wQISTn18kNtBQ6MvtiPeP68Aqn8y9j4Q1OvVOj7sA+4xL+U9zEWNDVD8Twkm8c2wExhqWqGL
	0IVHRrfU=
X-Gm-Gg: AYBFou0q8pnu+nyYcEaHNmeoScAdktz3trvRFHD760NfVdDeHZqo5nMnoNsnYbPV25y
	DhrWK+Vp18Fl2XJL3TUmZEC9aY21tg5eUmeisL9T1GxOK1lZXa6pEhF6P5Vx4qc4goW1X/sfFRK
	yVM1MKegVTttS7J+N1QI7qsX3Qr04+g/dpatmUSSn1YmtDWDA715Z/zfZVRnyCb005izzLPVdi3
	qkaHn27YXxs7TbY37Z/Ku9kWjF54L542RfBURzZj9RMGmsUSc1VQxjZAoHAQcCYGU5gHs0ivV1D
	MVHc1D1sZsbCc8ZCXZApjig1SUCza/yOLFQgfdMPoqLz9cIncx8nypdIrAx/V7zgMgW3ixb+Vnh
	knvJxI1RKwalThudb4lCMz4M9Zje0QXWI6UOVqQAngauQoK+kX4cLfxF2rxJ1qFcTgJPoNAJfWX
	eKvIR6ipv+TTPRalQkBG4SHukYJNUW5PaaSpSslfMhQnSSnuWkc2O1Wj+W5Xa8NdJOMWUHaCNHT
	MFYC+O+X4KzUi4L+/JuSDz8epJ3lC+qaCIoOgMsFTgzH6mquH2UMiNBvOdIKwjq2YohjgvOCgOj
	lqZZjtSmHFmwFteJd5J9NffQs53aBluim8Hu7RNnglAdF6gGNyiIHS2uen4tnvKE05cGB9tguLb
	+BtAsKOcSl3sZYmz3cN38cnE9j+qQ
X-Received: by 2002:a05:6000:188b:b0:48e:3df8:74cb with SMTP id ffacd0b85a97d-48e6e2ba5dfmr41811687f8f.6.1793868246630;
        Thu, 05 Nov 2026 00:44:06 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:06 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 54/60] kernel-fit-image: add FIT_LOADABLE_* variables to do_compile vardeps
Date: Thu,  5 Nov 2026 09:43:13 +0100
Message-ID: <60c4dc612afabffdc0a8b6b8e87e67f116f05007.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249513
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
index 7b2bcd46737..a238de1aa2d 100644
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
