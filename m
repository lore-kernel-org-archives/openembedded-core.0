Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1002.1794205937420963376
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 22:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gVMrdGhI;
 spf=pass (domain: konsulko.com, ip: 209.85.214.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9eb579c0eso2282735ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 22:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794205937; x=1794810737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gwbmv92ly6/0lK1lgU3CdDVpO2M4AMHsiRnmRJIzNI8=;
        b=gVMrdGhIXrZcliCjjKUTqYZ8cbkgGk3R5vPZJJCmJXvQ3knezPw7GFiXbjS2bXNt8K
         JHgLuOqIypyjATvjDERVIp7O/YoBbInHgmtg0aCgdelV8A7Q960kPu+Ang3GNop/1WY7
         ccDmoJqMI6rCg8MMFgR4NVH2oooMxYbIeaYvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794205937; x=1794810737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gwbmv92ly6/0lK1lgU3CdDVpO2M4AMHsiRnmRJIzNI8=;
        b=wuR5KbN7wmXLHpENuiAzB4WjgwouUe88HXswh+JTKs6QBE+xO40qUT0l0hqJDgebLA
         0VqL3RC+vj0YJ82ncgMzusoPUBEMCMgbTyVyn/BMI2YtFfqZANRaNFeZf1wxeAEcllFq
         f7TxRGgyFAZ6MeUDt+eXhRy4o+FVGpOizrIgsl/wQFDsjeAbQJhdOK5JUQs+8ERgrqdC
         nur0obaRZ6iM9M6jCePAmLzmUlDCNpZ+P8KmnIIC5F5Vz6iEkxQ6fNskS759zgFHVdMu
         NX0ppwoTBDZfpGFv8h8sMu7g6+1OiQs9pyElr7Oau2hZP+hLFNqarWQNf02Ci023rc+a
         AAmQ==
X-Gm-Message-State: APuU4Z9i/AV18oYBsTEhYZwM3PGDUS2arsnA3oQdr1pkvW3JuzC4TJIm
	K37wRvXXgD2quoPNP6hNoofjeRF0dk7Pbv5Dj3i0RoDXN4QWMIp/EQSwbXPaWr9QNGBkmpxp2Rm
	0dDnp
X-Gm-Gg: AYBFou1QRiL+L5yrnmzjncFrV6/OeVhZGCXoDjcQA5uNEMeuzCNJc77O+T25VuWo67c
	jTGpUE3+kp6nX3O9ZcvZ8ZsSwyO5ZKpMhv77ITMtChw57Dnm5kTCF835wpYuHj0L3VBQjcdnryE
	LqfchABaFEFBwfpn/Uhn8asLkW+Sadm08WCMrhhP5pzYrbEQkMySRPunRInp1JeyJqESUlDYOue
	JacshbsYKFeZAiCgpr1ooIno5UGgYeAPF4VAdR1vDn72+N0xkL7PHjCDL1MdDz2YWQqm5HN4Wa6
	jlz9e+xVjkeQBxvgRSbU98XRwGeJenbLZAP/Z745V3sfkyfZP9TlO5wIPMxRgAw9mdgWJUhHEyl
	Hc+hD1CsfSE3U5+TkmO+Uwt/qPV/21xbqV81dyMrY9y0cJEI1Fn9rMhLupTaR3m/DgYXDrd0QLy
	6+PJLG1TFv3bmYGHDnUkElyO0iiUav8JRhaDxyi/RPHB1KmnMMsZ5qNFQoU5ITmPlxRJOT5Rb43
	GBr5Eee05hIuCFBJKMge3y4P1noxkRriEl+4+77z4vy3XYTwyALtq3XLMI/zwKCDbcq4YgzVClJ
	nGyOAnHnuzSEDQBJ4JPnqnGpcwSD0EtozKU8gktXavtPBIS6vLd2IPM7hZGdIqE+lYmvMMQcM/K
	SWp+Ez2JpL7vjysBec06plttCHw==
X-Received: by 2002:a17:903:3c68:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2ed83c1333bmr31097425ad.63.1794205936744;
        Sun, 08 Nov 2026 22:32:16 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:8260:242:f4a2:d49c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed815e7416sm7792475ad.17.2026.11.08.22.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:32:16 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-websockets: upgrade 17.1 -> 17.4
Date: Sun,  8 Nov 2026 22:31:51 -0800
Message-ID: <20261109063150.3840618-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 06:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249796
Content-Type: text/plain; charset="utf-8"

17.4 fixes a denial of service by memory exhaustion: recv() now rejects
fragmented messages split into more than 4096 frames (tunable via
WEBSOCKETS_MAX_FRAGMENTS). 17.2 and 17.3 are bug fix releases.

https://websockets.readthedocs.io/en/stable/project/changelog.html
https://github.com/python-websockets/websockets/compare/17.1...17.4

Tested with the python3-uvicorn ptest on qemux86-64 and the bitbake
hashserv websocket tests from buildtools-tarball.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-websockets_17.1.bb => python3-websockets_17.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_17.1.bb => python3-websockets_17.4.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_17.1.bb b/meta/recipes-devtools/python/python3-websockets_17.4.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_17.1.bb
rename to meta/recipes-devtools/python/python3-websockets_17.4.bb
index b5ee3ec661..81c8ebed2a 100644
--- a/meta/recipes-devtools/python/python3-websockets_17.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "acfea4c20bf54384883ea33b1240fc1db4f52e190823a4e2b334bc3e8bfca96a"
+SRC_URI[sha256sum] = "09d3939b70df0c8ad2da145ebd50978bccaee1d565e838b0e7921a34d38571eb"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3

