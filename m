Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1655.1795712304611165835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 08:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vMlxQu3X;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so3337332eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795712304; x=1796317104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFxP6S53zeQKn+vSwAsJCh5+0Bj0P7P+VoMGzAC2mNA=;
        b=vMlxQu3XzZWumpVCCLIkLJtHOjN9wMtbm5VPlpHUyT2qNKpSUvD68YNd3IiGxcFfsw
         rygEgy2Q7L7hu1/hUWrxkXtJHBKUeOh1JVSNgnoonR9GgUcjlArkpmvr18y2TGhZAE13
         20sc5sIOzc3lcbhwUdo03hN58RJLg4cJEkKyY92yrgqxof9pGCal6pg//3UntEFizhps
         RrblLzu62DRtyYLdxtINe6o5J+3/mM45fdon2nHiJGm3zrN2usfYgwu6ZA5t6IyFSU/z
         4Me85mje9OZnKv8G5SxFBcUrLlgXesq7w/rJdIzLCjezISMHmtpMCb1BBMIftEDU54vE
         d+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712304; x=1796317104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lFxP6S53zeQKn+vSwAsJCh5+0Bj0P7P+VoMGzAC2mNA=;
        b=EvmwfAegkqu2RXhBdBSxjc0xoWqt1BKFEKh8NshXB6aqhXnZko1kKZC3reETOCtYU/
         KQ0DcmWHFNQzzw3B0jOejk2LJk3y+9OFlzSErtjTRSk0hY2wyUk4ZdrB6jaNTKIxBdwW
         yNM22n16fSPoyBNLtIlnhm2hMg3hs06vmQry5DQsl2a98iPH8ioXV+uy+4LuVbsTmJwt
         VW7YtBPXY0tayE3GyAl3fjksIdqQ6E5XVOhtaWBR+Pyg6o3uaIrlqMnAz0zFV0TbQevJ
         +T2A3PhzaMBrnf2JkYjnWFAfqb/Dr/EZnQjEE8cfWD95LllurgUeamZoEqk5vz/m4Jdx
         DKdA==
X-Gm-Message-State: APuU4Z8dugUJ8PHdYApigPB5xUTse3IsfIAhuEwp3POMVlm8EOGghTdL
	VMb6F4sfXgmAcWjt3uBYIdX17QwsIO5d68nD/1uYpzVwwHhGVaDvw4MUFVVRT5u2
X-Gm-Gg: AZFdTZel62BTuRxGEP2nmj60WrC6ZYUM4qPEU/2xHXQhqlEjS9S+d/oWFIvgZKB1T4p
	nyuyrl5YRyL9bmDsIsoXglfdJ6p5zFIqU+ZaSY0KD3X9oTDaBdjQepRscPlAHGolMaYpZEVEzyW
	r3yc3LbYePAfAEt3VXzQjyROGy15sHAPSEaIEP8eKDy5uWCwfEgYhIhog2JDvyoZG0gKNg4uEMG
	OKRKhmmkQjZPghPpGxBVNJETa39S8bv5Gz/5ouTje9eXxgRMQWA5U3FLE6GH9chJUxCZpZXKetG
	msE8Yu+IkcU1AxMzhhH7PajxWwKRMtuzaUiQ6xgItgnibLmReLwJNp+TYKoqHaE7jX27GFJMJgI
	NJ3b1wZQrfFeFYU3p3T91ife4iVkzMvdq3yt6wKHZVCc5uMGxHbKNvOwQs+gjlTM/FwjAt4U5Oy
	mYfI47plp+qDLSvjDKzV5gFbJ5nTePrgGRCOcgybjoXvcuC7s7leOEXEsU11vfhHMhC+kYmD59y
	Fd5GoPArxnorZb5gEtanzIfjbOqrbBVeXYcOw/gHYadMZhd/HpBMu3t40f9MTM/ls2kf1gJaqK2
	Y/dGvwqIQBw05ltUhStvnMlnzHWit6bKjrNXrbtg59eVoqFXsvo6Q5qcKuJ0lt3dwJ4vvle/BsR
	ZXSGsyjLylzM0Y5dtO0XExwz5pnUGcsjKBXSfcmg61cevUv8gxxLoQdB2RydklNlZz8QQj3Uyzi
	n3AH46UyYfIqtlxeQFN1vcVysVr4vtXzxIyhQK9iKZ+LFevvH1daNgyBN5FHaiIT8fHX+Vf3jNo
	NjhIR5mycvTbv5gT0I3IBgiHAwQyhdp/22oH7BxD6fT6tKJARC4M1PRSU+jsyfChsLG0iBwSXqs
	XoOk
X-Received: by 2002:a05:7301:150b:b0:36d:a466:9d0b with SMTP id 5a478bee46e88-3856ef47c9dmr21162572eec.19.1795712303786;
        Thu, 26 Nov 2026 08:58:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm35395295eec.0.2026.11.26.08.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:58:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ross Burton <Ross.Burton@arm.com>,
	Paul Barker <paul@pbarker.dev>
Subject: [PATCH v2 2/2] packagegroup-core-buildessential: Add clang with clang toolchain
Date: Thu, 26 Nov 2026 08:58:19 -0800
Message-ID: <20261126165819.1624670-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126165819.1624670-1-khem.raj@oss.qualcomm.com>
References: <20261126165819.1624670-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 16:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251326
Content-Type: text/plain; charset="utf-8"

When the target is built with the clang toolchain, python's sysconfig
and perl's Config record ${TARGET_PREFIX}clang as the C compiler, so
anything compiling on the target through them fails when only gcc is
installed:

  FileNotFoundError: [Errno 2] No such file or directory: 'x86_64-yoe-linux-clang'

The target clang package installs the ${TARGET_PREFIX}clang symlinks.
Add it to packagegroup-core-buildessential

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Ross Burton <Ross.Burton@arm.com>
Cc: Paul Barker <paul@pbarker.dev>
---
v2: Drop anon python from ptest.bbclass, it slows things down

 .../packagegroups/packagegroup-core-buildessential.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
index 2cd67ad05f..d33af54d26 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
@@ -29,3 +29,4 @@ RDEPENDS:packagegroup-core-buildessential = "\
     pkgconfig \
     "

+RDEPENDS:packagegroup-core-buildessential:append:toolchain-clang = " clang"
