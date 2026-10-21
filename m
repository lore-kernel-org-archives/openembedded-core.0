Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5931.1792607393480623439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 11:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Nhu3L5Ir;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso694116f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 11:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792607391; x=1793212191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vNsYbnaN265+nFD9PXDidXGJwO3r3dRzjlTaSob9Tsg=;
        b=Nhu3L5IrzNxLCby7yD3adYJdAwMAUzWh231wvlMetzo3hKpVhCBXxWiylEjKbkL+3O
         /i0LiUo3Wpb8Lkm4Cip1smo1OJlIQXME33jeZYrqpS/7/rn9gSTvVsjtcnmau+s5jnNf
         L/+pWacqGsvNYz9R3eeG6QNK6VPIy9Bi3Wh9SpyS2JrGwhM6X3nio+yJ2OZ3zRJ4VuQg
         RRNehWVtHsJwJdn283SZheguPTg3KcgPJdXcuyuXi7k0RaSZuqVedVDTBt9VbjUMXiGN
         uOpSApKpixGzKHRPerv5oObbURMEY2fn6qlfiwkxAmqNZI50dcTRDEfYu7nGmSVJhUeD
         XLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792607391; x=1793212191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vNsYbnaN265+nFD9PXDidXGJwO3r3dRzjlTaSob9Tsg=;
        b=f2pMdZkxqqdRxw5rbZ7kMQfVBKsQjgjT4aFtqgPtH6CQcEFbUpY3bA23HOUEFxo+20
         rM7q4CrJAHsENbqpP/yz12RhE2EH5QrlDw7V28VqEMu9qt6g5LJ94hqWGp4n3Z0gagVB
         Z4To74/lZWmC3kfvzEqgq1pUpT8FHVPu3Ijns3MHk/bfiu4sGU+XprDyZNrprIFUsIz3
         rMlbCfUQlevF7+Wt7lWqnaDJZe3aYCMx0AVewA2PG5arHWiJ4qmPheAHfNj8nIBH5fWH
         H7Apl8r9UK31YFSRCizwOrBJNXXOiXZa1f9R/k8xcH+xSeFRVAkOglVqAWbiTwIXSRXZ
         4bpA==
X-Gm-Message-State: AFq9FYIgKK3UmMFgRA7CD+B41vx7ZwEOGSQfYrWwvofGTy/0zjvqx74i
	qYfpyWoqvvK5M3ghSDkKq1QHZrpqoyyNasS+NKnXd9dIoZb+4b3KTyX9jm7hV2pP
X-Gm-Gg: AYBFou2Y1Iey92nfGCN3sn7zT/GXkFS41nQ4BgiFOJ3z20LmFOoxDU0YQ6/HLvjFj8h
	58vLj4FQbmoWJdJ1pkPOJcLqfsO7G7dyy5fKYH4ANaBFGFsQ1srnrjwmgF2Hft5wvpfgT7nkkfr
	PhbSGxPV5bIX7e81//z7SOOGSLkuiYtVxr02pz9O9O6pyrAsNwM5rmVBJKvi+wpRGhfsL6AoUzN
	LBTLZWvOH6UGhmBXy2mH63/GQJ+GWUU3wPJhQ6hQfO2ItAqqzU9uMmzCOVfHE0/zCVD6PcDYeV3
	PwhNGrDOxUpIQ1WdJNK2iH873n57JPXpsKDpAXqdvCKbaGjGeVChLcku221h+Lq0xCYOyQVpWDm
	mAddOCdflhRHbOm2C9y8jcrScTZ1JTQ3O9EEncmVG2FpGUcrDxuCCuUZYmIngVEwUxKco/xP+m0
	sl3mrErmeMKo8xd7akbHRqTVDSmHQlM87rnXpuK05rxuaiEpCEgKsv3rzk5EjuDAg1hZXQuftxL
	6NnGq1IE0O8jDLmvEV4K0btS41QxEELAqkgaP9qG8KNqqFXfO99t43U9g==
X-Received: by 2002:a05:6000:2c05:b0:48e:2406:57d0 with SMTP id ffacd0b85a97d-48e2649d9d0mr5540147f8f.19.1792607391275;
        Wed, 21 Oct 2026 11:29:51 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([2a01:4b00:d036:ae00:57e2:b323:d4:c643])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e2581eed3sm7729658f8f.12.2026.10.21.11.29.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:29:50 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dlopen-deps.inc: also parse executables
Date: Wed, 21 Oct 2026 19:29:31 +0100
Message-ID: <20261021182944.1820061-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 18:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248404
Content-Type: text/plain; charset="utf-8"

From: Luca Boccassi <luca.boccassi@gmail.com>

The dlopen note is not just applied to shared libraries, but to ELF executables
too. This is especially the case in systemd v262, where binaries now each have
the precise list of dlopen dependencies they require.
For example, systemd-repart requires libblkid, which is not pulled in otherwise.

Signed-off-by: Luca Boccassi <luca.boccassi@gmail.com>
---
 meta/recipes-core/systemd/dlopen-deps.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/dlopen-deps.inc b/meta/recipes-core/systemd/dlopen-deps.inc
index 2d43f2dcb8..37074a9682 100644
--- a/meta/recipes-core/systemd/dlopen-deps.inc
+++ b/meta/recipes-core/systemd/dlopen-deps.inc
@@ -3,7 +3,7 @@ PACKAGEFUNCS =+ "package_generate_dlopen_deps"
 python package_generate_dlopen_deps() {
     # https://systemd.io/ELF_DLOPEN_METADATA/
 
-    import struct, json
+    import os, struct, json
 
     def extract_segment(filename, segment):
         """
@@ -57,11 +57,11 @@ python package_generate_dlopen_deps() {
             continue
 
         for f in files:
-            # Skip symlinks, just look for real libraries
+            # Skip symlinks, inspect executables and shared libraries.
             if cpath.islink(f):
                 continue
 
-            if ".so." in f or f.endswith(".so"):
+            if os.access(f, os.X_OK) or ".so." in f or f.endswith(".so"):
                 try:
                     elf = oe.qa.ELFFile(f)
                     elf.open()
-- 
2.47.3

