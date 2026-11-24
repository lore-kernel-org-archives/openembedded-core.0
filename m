Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11074.1795492039985879641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 19:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PiMGC+8T;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-385d8a00598so5727144eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 19:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795492039; x=1796096839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mxkw2exhTcyUmRtKKc8B3vj+QmQjAhlJYDX2DjvJnwE=;
        b=PiMGC+8TIHDLBYhU+95YcYy6029pd06nAq+bWoXeszDnI7KxSYrlbn5s/WO8PiwGEN
         AFf0hx0n9CmnlxeG/QnhY47V06xaAcbGE2Gruh2LFfZGtrFsog37wAA+WZGeGRUhhIgP
         PRA3QMnO/+qyqb0HIhROeZ9SocCxds6Zpel/9HSPaHg4yuSuRUT6FuHjHyuSqvG0I/Pm
         uVlkhYpHtqCcIBi+Erlo/StB6yxSZtJGABOJtVY1fQX6CCjCYLdlYa7dWX59gUhn9GCU
         NQDpZkqT9Jj93JJOaZyv6ySEMy1Xu5BrhzVf018Th/M/XzBUjdyGBWuJbxiXCa1gHEHs
         Fs+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795492039; x=1796096839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mxkw2exhTcyUmRtKKc8B3vj+QmQjAhlJYDX2DjvJnwE=;
        b=PpDRPRvHMD6jIIVkMZRDE3VJ5mdaWlUASYGfsLl5UrHn9IdNJBCmOY4V7UjcFg/t78
         23bCVLJ/QBMvpBZomcU/SHUKyPXEdfuNYxfnRr69UYKHpkjr47ZD3XYfQfzz6NaYoKjO
         BqOXas38hbkorvUbf8FQw98SqyyqK1WiZwZ192H9whnV/HtoeZrGcJyZB2A56CxLMWN3
         Uvx4JwZGUjv19RRHwx9J5SLGh4m2JeelJXhtVsFTjeEvuNq+GMs+0IVGuPMqHKZlVbYC
         NNLdjXJ+TVBDHMFyVx/7uQssqtHi6MTjVL7lOX5eKl24WIbV9GWpf+vrmlRHRolxDxlQ
         TBeg==
X-Gm-Message-State: APuU4Z9iMjOMqJl5AOc8HfHMR0wUCL0UYEOI9dWk8/RSC69K3D3bRoVo
	JL7Sgjmyrtc9PaejZYsXKrRkyfYz/gN/pyctxMrc1XQl5JtCxzzZFRKv/Cwo90xN
X-Gm-Gg: AZFdTZcgqSFBqaEXiD0+WQmAHlQ7genLu7BfBDa1AQAu6Adl3MSdS+pwT7z6bEWs7QE
	sUfDaEUrdscXRZHQad9VoT5eo61SRgLKmg0Y4y29CluYEMbxeBlMXfsnHVZ2A2KohJA3dCbqrLz
	2WsfA8mxTQ03kyftTwlI4QoNWQ7w35CxUhRUq6GwoyBe1f0P7oB7m9/c8NoNkKzXkcDLarFf4FM
	6NO5kGapIJhB+3WYKeGKVsT3JzANF0e582OC2XE2Hhayhrvkc4sTPgC9MJ5/QOQzkWFAAHeOcCn
	ikCqCTXa143U6jdInrK6iuklrDfHwkvxB9GHplN+qyVfDiTX6mJmjKZOK/TPmDoLKwLIjMI1655
	0v72NTVLbUIIQq6RJ1DbN/H/Emfg8Ez2KSOX/v1hsJ3xmN+qaz25Hc+b4TidhG1GI+vbCluztsg
	Lb5841FPyzKfRmgs65fA/BKEMgeVyLwwmrCxh8ckk8AnVtYggDxYzM66w8Pb4l3zHdy6NyyDd7W
	3nOTygCkuOBdhunzUvJFtuj4aXpHSYsKGTuMrzx0rkvWvaIHaGn91+cwCuEhQW5V1mJOBC1Dzf/
	mzUfzoElNwdSs8hQCFu3J+XoKNkpT2WzlAl7tTw9fTgTCVjbveV62wJPm2HMRRtINA/N9Oca3lz
	EeGd2m6+wO4DP2PyQcn8WV0PQXK+gXbw0/bjIbumP77UXW6miYX0jnJYfkUkIBTQdVnfYx8krEk
	BGrj0vNt6AvM7tczCtbq4KQqBBYrHRHKp5EZR6WyU1BtCPw8X4Jrli8LJM+PGcHCUPe9vpb7imR
	qVoqG2flesi51NwJvE3DoTue7X+xUBBOwL+FQvaiNdcLyge6g81nuqjvQ/26FPtZFbfV05UlmbH
	UXLN
X-Received: by 2002:a05:693c:8948:20b0:386:b08e:4b7b with SMTP id 5a478bee46e88-386b08e4e93mr4943430eec.29.1795492039102;
        Mon, 23 Nov 2026 19:47:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm43734561eec.14.2026.11.23.19.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:47:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] cmake,cmake-native: upgrade 4.5.0 -> 4.5.1
Date: Mon, 23 Nov 2026 19:47:15 -0800
Message-ID: <20261124034715.3661490-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 03:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250941
Content-Type: text/plain; charset="utf-8"

4.5.0 broke implicit link information detection when the linker is a
prefixed ld.lld (e.g. x86_64-poky-linux-ld.lld): the linker line regex
in Modules/CMakeParseImplicitLinkInfo.cmake no longer accepts a suffix
after "ld", so CMAKE_<LANG>_IMPLICIT_LINK_DIRECTORIES and _LIBRARIES
come out empty with clang + lld. As a result the sysroot /usr/lib is no
longer filtered out of runtime paths, so binaries get a redundant
RPATH /usr/lib (useless-rpaths QA errors in cmake, libssh, libyang,
...), and FindOpenMP no longer links libomp. 4.5.1 fixes this
("ParseImplicitLinkInfo: Fix linker regex", CMake issue #28299).

Other changes in 4.5.1:
- libarchive: do not run a filter program from the extraction directory
- Makefiles: revert grouping parallel build output via
  GNU Make --output-sync
- FindPkgConfig: restore unsetting normal variables for flag results
- FindDoxygen: fix regression with absolute output path
- FindCUDAToolkit: revert the CUDAToolkit:: namespace targets
- source_group: fix erroneous group for root files
- ctest: fix CDash response JSON parsing

License checksums are unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cmake/{cmake-native_4.5.0.bb => cmake-native_4.5.1.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.5.0.bb => cmake_4.5.1.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.5.0.bb => cmake-native_4.5.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.5.0.bb => cmake_4.5.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.5.0.bb b/meta/recipes-devtools/cmake/cmake-native_4.5.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.5.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.5.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 01fe71c119..c7e3172098 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "424352d6133e8455e020da787008e8dc67abb18820af3532572ab35657e49213"
+SRC_URI[sha256sum] = "a79bf33cbe05686fdf79c2bbbcfe5e8e62ad16d3d540fa737cbedfeed41fb69e"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.5.0.bb b/meta/recipes-devtools/cmake/cmake_4.5.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.5.0.bb
rename to meta/recipes-devtools/cmake/cmake_4.5.1.bb
