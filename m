Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1576.1793986648750430998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 09:37:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=queLAEiM;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a06454116eso458080b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986648; x=1794591448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XA8JbnX0yMfCLKAtg7U0aoNchl+2879mYlo5sjUqCcI=;
        b=queLAEiMfPF0OMIUwnwiI0rpR5+YGqtIcs5pTFNsbvXwcdLSe4a86XPxux/Dwjlj0/
         Fo2rMjL2vlKgCV/DjUiPL4a1Tt8fHPzCUKf9YhTchSqqiZ3RzQYBHcd6gJ7SWp6GL6yu
         W+kZbh2hEKmZA0EMN5zhtX8Jx3+TLm7kdPHR6bCWIe6mONSnTWH57L0Z/AhJH7YE/U0E
         hrBi1VDeu1gvncmfkVb9A9m9ZcaAKcMEI+YxykvFe1fsMluww8+8mE15OFWF2QInKvqE
         79JiyuTSfiB4AZFHFSb/uyu/uapzA/wxYeCwPVbj7RXynKmF28obBjlbfQsXtxqzLbBl
         qOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986648; x=1794591448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XA8JbnX0yMfCLKAtg7U0aoNchl+2879mYlo5sjUqCcI=;
        b=Sok96nP5dp+zIPAGFo4SiDJnHnbMk7FCAkQw4lm1uEqWjMbckY09ZGRrUL6ffl69Wj
         oXx1W1fUwlJmCu1SRCAfVs+1Dq9SNry5c4w4lBaxWMBZNpR8g5IhPeUXVsePPFHYGMWR
         v9L7eS4b/nz5SKqdYQZEL7zRQu9qIW0IHR6Zo/cQ4Yg6JNKpR4MiL+pEGHr570ZDUZ2G
         ECdMJYTA2TmbVBKu46xei/bwiJcXVI1UEKxem9arGoLko9qSdwevqG9bIublOxfuFpNe
         exOYZWxI1N8yjgyYk/9HfyUUT6bsT4ryr4dvX4A8tPtxPV912NuW718fUpAaPkYTU+Of
         x7Uw==
X-Gm-Message-State: APuU4Z+nz+suI639KdcplD/9RMRpzw9m61pfnU/dRmwENPW2QBOLMMIe
	DvMggXV+MmjPOayErJuDp0LrdcwUdj86UTnZkDWFYtoy8z96DrC8o/NeU7DMjsaWft0=
X-Gm-Gg: AYBFou3kTX2F+9quoFf+SUjrIxfHONoW/iwSd2n1W4CtOpbrGuBPUInovp+HTd/T4GY
	gM4S4dCYiQM/VZzFXxRwe1PkZlS00yXIXa2U31zXKM/LCxTvYx0wezQ8RdB60MShqPxPMYhDfPY
	qmV7G0TEKEPfLZhGQ2qvb0hDyoEwxUZyxwKmMDHH6xe3iptqGCRpjV5MHv8XY7OILg6hgc1DruJ
	mNm+8kmKKv3iYJCG0n60b5w1RiL5/ptNZOJtG5g2pFTVKzDGPT0qQbd8fGn9t+CePO36q+mMer7
	UZXTsvzYlD4H4UVI5vMQuepD1njvxvUbdnm2aHu4yK9DDhLa88pZQpjUk8ir0ZDnYdBYr4ARoue
	y6q04YbhY4wyYFD4/bxAZ/nfm4XNrxi05sfnmMoqjoRkEfVM0WkmnLNuc6R2apVrpvhKkbFyTf/
	sxM7pSZaTBvwzCSep+zkGUTK8hIHOWG43zAYiLizc3TF6LDjpWnbte+m2QxUlNMV0GT27eZDyuM
	SOJqII25TrhVoI/y1kSOz6ybzq/uF0k5DNlj6Zp2yMJDU0gXpKpRCxRbM74pdIN/4IE3ySdrH+8
	tbu4HEr0aXID32LM709UmzKRWE5ZksF+d24DmwomeuFF9DZHOuUHCLy6KxVyuVypb836fSMACzV
	8zXtH/eX/2kDk50yKyjdEZejD380lDxdJFBVKWKKWe+BwRKA3QXc7tFtFVg6MekbdPsyb3UOmIP
	utgb17VzQ2HcIs+ZzE2z75Mt4yhiNuJpL6NiI6Qhuiaa1VRd45WNO17wqXxFCc4xcjlLW2vvqMn
	oed0JpnUcKprWbHsVu81UYQnlo1uPQGUtQNaYu6l+DuTq59qiYyN3Au2wcz2UUASxmVR3sWfvYE
	S/QvWoqiYudoDw0lY+Mdha295Jk=
X-Received: by 2002:a05:6a00:98a:b0:8a0:7677:c8c9 with SMTP id d2e1a72fcca58-8b37c33fe42mr3269790b3a.51.1793986647876;
        Fri, 06 Nov 2026 09:37:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b356c2d918sm814411b3a.6.2026.11.06.09.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:37:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2 2/2] staging.bbclass: Do not stage X11 locale data in sysroots
Date: Fri,  6 Nov 2026 09:37:17 -0800
Message-ID: <20261106173717.1054294-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106173717.1054294-1-khem.raj@oss.qualcomm.com>
References: <20261106173717.1054294-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 17:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249710
Content-Type: text/plain; charset="utf-8"

Commit 63204f5551 moved the X11 locale data from the native to the
target sysroot for meson-based ibus 1.5.35.

ibus 1.5.34, which is what meta-oe currently ships, still copies
en_US.UTF-8/Compose from STAGING_DATADIR_NATIVE, so its do_compile now
fails.

On distros without x11 there is no target libx11 to provide the
data either. Keep the directory in every sysroot so both ibus versions
find it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
v2: Remove staging x11/locale from staging class

 meta/classes-global/staging.bbclass             | 1 -
 meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb | 2 --
 2 files changed, 3 deletions(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 5833abebc8..20340a16e1 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -34,7 +34,6 @@ SYSROOT_DIRS_IGNORE = " \
     ${mandir} \
     ${docdir} \
     ${infodir} \
-    ${datadir}/X11/locale \
     ${datadir}/applications \
     ${datadir}/bash-completion \
     ${datadir}/fonts \
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb
index 25fcd6d8b9..5e35bda3c5 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb
@@ -39,6 +39,4 @@ FILES:${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${datadir}/X11/
 FILES:${PN}-xcb += "${libdir}/libX11-xcb.so.*"
 FILES:${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"

-SYSROOT_DIRS_IGNORE:remove:class-target = "${datadir}/X11/locale"
-
 BBCLASSEXTEND = "native nativesdk"
