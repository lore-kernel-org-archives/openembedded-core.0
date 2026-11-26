Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1881.1795712425303301225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 09:00:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JnBY0HN8;
 spf=pass (domain: konsulko.com, ip: 209.85.215.179, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so3005459a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 09:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795712424; x=1796317224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=358G/s8+EecErUgtnvoNA4DlQvVTu07WLvHPzrEdqRY=;
        b=JnBY0HN8tPNs4YN4qX6OAHD3HYTkno7IZpih16/bUNU2VPEOVUF9ypB3JkvTvjAMcp
         ZhLXJ+yCiWvuZLs5e+a2AgsQqySucb/CIO+kXY9AR0ZsvdJUYuhbCeWXWdDsnVR0mEXA
         8B0Wk1V8gI/9HuhAdVqZMnVcIow7qcqL47oQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712424; x=1796317224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=358G/s8+EecErUgtnvoNA4DlQvVTu07WLvHPzrEdqRY=;
        b=Kx6vxCyac/47pzD84a1sxCllLzhmHzBmbkWv8f5eqOrZEd7dkD6rzlP5IudATdR0zR
         ZfNv2rGHkpMSr2v6uxfWCmH1lZnFrvcBsc//nFsLZqsRtEFN5JtusQc9TdbDn4JZkcl3
         3hrUQZGmgU/li9EndE1b89Oy96p9j+1JY7C8eDIlRch4uQmyxCPH3gbjrxNUkPI9B4J3
         uU/0I5ACseMmCbNWaH9j04LmzUn1BlRP63z73RjWYl4AmwkfFXrpaZW+/qh7n3t4KrQj
         VKZLf6Pm0b3QjbyfXDZ2zRV/grY86tSZn4ZsFcxrPtFohVCImlx1rryd5BNgkIkclT3Z
         XnUg==
X-Gm-Message-State: APuU4Z/k1L6+GceStrqbHNqERgyfH/pt52DZX0CiAZ5YuiX5jdPfoxkF
	AXBFnZ4pqkYKjLEbIkOu8aKJq+UpEx7Jff69YXCkQKTA3N1I/Dy5jmreVw1prcKBbM/xeNmjvWm
	8diRo8zQ=
X-Gm-Gg: AZFdTZcdcmwQRFdV3v5moNc19RfqiIfEMfxGBo3s4vTM7hi0XujgUl124i/VLb6Okfa
	NCu1L2c+J5UWY4kRC0goenEdo9drYTSSqbAR6qLp0AyfH2lzX4gMevvP+6rfvyOXKknLK9jWlCy
	3Bhcve5QP1peunAKIL0aP1rCxa2u9Qg3AJxi8PEn+PUT3edHPHCG59VEsLkB7RNDCMwaVlDQBBZ
	kA7/AKEUulOGCJ2XYDRyxQBUo0a3MMtXfMNknZAm8FMXDtIi+reCN5n+PBoy5pA9LPmyJdqbDcX
	VoZqO8rKskB0xi7E5OtOy9mwYhL84h2CdsnK58+RKyPjYxh1PwpGhx01FY5LfozYfU9hiAoUUZy
	caHeTmz3qrdNM3yan+3Gbz2MK40V7OjQhBI1n2DeWn2e4QbZlulTErF3M6K39d6d1nmElQFBk7s
	CnxT4zyH+47FfNi84tjzCYMASflA7K3A4bOrd40KWB2+jqr64tweksm8c4N8sDr07D8Ajr6GcSG
	u8zRofJOf8p8F3ws2hxNtBVwQ3eT2HwOICfv4EWiaaJhWKtB3JblpFKVPBB1vvGAwhvzJP4clis
	JxS8ax6vPoxWJmuD4CZV0sndtL9BsdGgSZqAS+8DkFacLC9GSIWHUtuIuSy+sqt6UAadd7jPZec
	LC446Cko5rYRNzVZdb50NtjniPxmnbaHpxtOEsCQoXr5NHCrvKhfBA5xFfSZJ6yS6Mw==
X-Received: by 2002:a17:90b:2cce:b0:3b0:a7b5:c046 with SMTP id 98e67ed59e1d1-3b41c9759cbmr21790961a91.54.1795712422976;
        Thu, 26 Nov 2026 09:00:22 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from localhost (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm17542544a91.5.2026.11.26.09.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:00:20 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Hernandez <alejandro@enedino.org>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/2] picolibc: upgrade 1.8.11 -> 1.8.12
Date: Thu, 26 Nov 2026 09:00:10 -0800
Message-ID: <20261126170011.30593-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 17:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251327
Content-Type: text/plain; charset="utf-8"

Upstream reworked the specs generation in meson.build and added libgcc
-L paths (libgccdir option), so avoid_polluting_cross_directories.patch
is rebased and the -sysroot arm extended to the new libgcc and
multilib libgcc paths; every specs_option_format() call now takes four
arguments.

License-Update: COPYING.picolibc lists newly covered files and renumbers
stanzas; license families unchanged.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-core/picolibc/picolibc.inc       |   6 +-
 .../avoid_polluting_cross_directories.patch   | 198 ++++++++++--------
 2 files changed, 117 insertions(+), 87 deletions(-)

diff --git a/meta/recipes-core/picolibc/picolibc.inc b/meta/recipes-core/picolibc/picolibc.inc
index 750098ca60..4e93136d64 100644
--- a/meta/recipes-core/picolibc/picolibc.inc
+++ b/meta/recipes-core/picolibc/picolibc.inc
@@ -7,12 +7,12 @@ SECTION = "libs"
 # are GPLv2 and GeneratePicolibcCrossFile.sh is AGPL3 but not part of the artifacts.
 LICENSE = "BSD-2-Clause AND BSD-3-Clause"
 LIC_FILES_CHKSUM = " \
-		file://COPYING.picolibc;md5=e44132dded508048efb22b15ccd40d7d \
+		file://COPYING.picolibc;md5=3e890b5a298befbadf25f805ad23f341 \
 		"
 
-BASEVER = "1.8.11"
+BASEVER = "1.8.12"
 PV = "${BASEVER}+git"
 SRC_URI = "git://github.com/picolibc/picolibc.git;protocol=https;branch=main"
-SRCREV = "f7edb0869e64b9d687f46961adeef7154921fe92"
+SRCREV = "2ae376c6cdf4fef90ca2388ecf7a07457fa63cff"
 
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.patch b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.patch
index 54f17a1b62..46edff3eec 100644
--- a/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.patch
+++ b/meta/recipes-core/picolibc/picolibc/avoid_polluting_cross_directories.patch
@@ -28,111 +28,141 @@ first place.
 
 Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
 ---
- meson.build | 31 +++++++++++++++++++++++++------
- 1 file changed, 25 insertions(+), 6 deletions(-)
+ meson.build | 41 +++++++++++++++++++++++++++++++++--------
+ 1 file changed, 33 insertions(+), 8 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 3323741c2..0df0768df 100644
+index 93daa5dae..86f15441b 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -622,12 +622,13 @@ crt0_expr = '%{-crt0=*:crt0-%*%O; :crt0%O}'
- #
- picolibc_prefix_format = '-picolibc-prefix=*:@0@'
- picolibc_buildtype_format = '-picolibc-buildtype=*:@0@'
-+sysroot_format = '-sysroot=*:@0@'
- gen_format = '@0@'
- 
- #
- # How to glue the three options together
- #
--specs_option_format = '%{@0@; @1@; :@2@}'
-+specs_option_format = '%{@0@; @1@; @2@; :@3@}'
- 
- #
- # Build the -isystem value
-@@ -639,10 +640,13 @@ isystem_prefix = picolibc_prefix_format.format(prefix_include_dir)
- buildtype_include_dir = specs_prefix_format.format(get_option('includedir') / '%*')
- isystem_buildtype = picolibc_buildtype_format.format(buildtype_include_dir)
- 
-+sysroot_include_dir = '%*'
-+isystem_sysroot = sysroot_format.format(sysroot_include_dir)
+@@ -2057,12 +2057,13 @@ else
+   #
+   picolibc_prefix_format = '-picolibc-prefix=*:@0@'
+   picolibc_buildtype_format = '-picolibc-buildtype=*:@0@'
++  sysroot_format = '-sysroot=*:@0@'
+   gen_format = '@0@'
+ 
+   #
+   # How to glue the three options together
+   #
+-  specs_option_format = '%{@0@; @1@; :@2@}'
++  specs_option_format = '%{@0@; @1@; @2@; :@3@}'
+ 
+   #
+   # Build the -isystem value
+@@ -2074,10 +2075,13 @@ else
+   buildtype_include_dir = specs_prefix_format.format(get_option('includedir') / '%*')
+   isystem_buildtype = picolibc_buildtype_format.format(buildtype_include_dir)
+ 
++  sysroot_include_dir = '%*'
++  isystem_sysroot = sysroot_format.format(sysroot_include_dir)
 +
- gen_include_dir = specs_prefix_format.format(get_option('includedir'))
- isystem_gen = gen_format.format(gen_include_dir)
+   gen_include_dir = specs_prefix_format.format(get_option('includedir'))
+   isystem_gen = gen_format.format(gen_include_dir)
  
--specs_isystem = '-isystem ' + specs_option_format.format(isystem_prefix, isystem_buildtype, isystem_gen)
-+specs_isystem = '-isystem ' + specs_option_format.format(isystem_prefix, isystem_buildtype, isystem_sysroot, isystem_gen)
+-  specs_isystem = '-isystem ' + specs_option_format.format(isystem_prefix, isystem_buildtype, isystem_gen)
++  specs_isystem = '-isystem ' + specs_option_format.format(isystem_prefix, isystem_buildtype, isystem_sysroot, isystem_gen)
  
- gcc_dumpmachine = run_command(cc.cmd_array() + ['-dumpmachine'], check : true).stdout().split('\n')[0]
+   gcc_dumpmachine = run_command(cc.cmd_array() + ['-dumpmachine'], check : true).stdout().split('\n')[0]
  
-@@ -651,7 +655,10 @@ cxxconfig_isystem_prefix = isystem_prefix / cxxconfig_path_postfix
- cxxconfig_isystem_buildtype = isystem_buildtype / cxxconfig_path_postfix
- cxxconfig_isystem_gen = isystem_gen / cxxconfig_path_postfix
+@@ -2086,7 +2090,10 @@ else
+   cxxconfig_isystem_buildtype = isystem_buildtype / cxxconfig_path_postfix
+   cxxconfig_isystem_gen = isystem_gen / cxxconfig_path_postfix
  
--specs_isystem = specs_isystem + ' -isystem ' + specs_option_format.format(cxxconfig_isystem_prefix, cxxconfig_isystem_buildtype, cxxconfig_isystem_gen)
-+sysroot_cxx_dir = '%*'
-+cxx_sysroot = sysroot_format.format(sysroot_cxx_dir)
+-  specs_isystem = specs_isystem + ' -isystem ' + specs_option_format.format(cxxconfig_isystem_prefix, cxxconfig_isystem_buildtype, cxxconfig_isystem_gen)
++  sysroot_cxx_dir = '%*'
++  cxx_sysroot = sysroot_format.format(sysroot_cxx_dir)
 +
-+specs_isystem = specs_isystem + ' -isystem ' + specs_option_format.format(cxxconfig_isystem_prefix, cxxconfig_isystem_buildtype, cxx_sysroot, cxxconfig_isystem_gen)
++  specs_isystem = specs_isystem + ' -isystem ' + specs_option_format.format(cxxconfig_isystem_prefix, cxxconfig_isystem_buildtype, cxx_sysroot, cxxconfig_isystem_gen)
  
- #
- # Build the non-multilib -L value
-@@ -663,10 +670,13 @@ lib_prefix = picolibc_prefix_format.format(prefix_lib_dir)
- buildtype_lib_dir = specs_prefix_format.format(get_option('libdir') / '%*')
- lib_buildtype = picolibc_buildtype_format.format(buildtype_lib_dir)
+   #
+   # Build the non-multilib -L value
+@@ -2098,10 +2105,13 @@ else
+   buildtype_lib_dir = specs_prefix_format.format(get_option('libdir') / '%*')
+   lib_buildtype = picolibc_buildtype_format.format(buildtype_lib_dir)
  
-+sysroot_lib_dir = '%*'
-+lib_sysroot = sysroot_format.format(sysroot_lib_dir)
++  sysroot_lib_dir = '%*'
++  lib_sysroot = sysroot_format.format(sysroot_lib_dir)
 +
- gen_lib_dir = specs_prefix_format.format(get_option('libdir'))
- lib_gen = gen_format.format(gen_lib_dir)
+   gen_lib_dir = specs_prefix_format.format(get_option('libdir'))
+   lib_gen = gen_format.format(gen_lib_dir)
  
--specs_libpath = '-L' + specs_option_format.format(lib_prefix, lib_buildtype, lib_gen)
-+specs_libpath = '-L' + specs_option_format.format(lib_prefix, lib_buildtype, lib_sysroot, lib_gen)
+-  specs_libpath = '-L' + specs_option_format.format(lib_prefix, lib_buildtype, lib_gen)
++  specs_libpath = '-L' + specs_option_format.format(lib_prefix, lib_buildtype, lib_sysroot, lib_gen)
  
- #
- # Build the non-multilib *startfile options
-@@ -678,6 +688,9 @@ crt0_prefix = picolibc_prefix_format.format(prefix_crt0_path)
- buildtype_crt0_path = specs_prefix_format.format(get_option('libdir') / '%*' / crt0_expr)
- crt0_buildtype = picolibc_buildtype_format.format(buildtype_crt0_path)
+   #
+   # Build the non-multilib libgcc -L value
+@@ -2119,10 +2129,13 @@ else
+   buildtype_libgcc_dir = specs_prefix_format.format(libgcc_dir / '%*')
+   libgcc_buildtype = picolibc_buildtype_format.format(buildtype_libgcc_dir)
  
-+sysroot_crt0_path = '%*' + '/' + get_option('libdir') + '/' + '%*' + '/' + crt0_expr
-+crt0_sysroot = picolibc_buildtype_format.format(sysroot_crt0_path)
++  sysroot_libgcc_dir = '%*'
++  libgcc_sysroot = sysroot_format.format(sysroot_libgcc_dir)
 +
- gen_crt0_path = specs_prefix_format.format(get_option('libdir') / crt0_expr)
- crt0_gen = gen_format.format(gen_crt0_path)
+   gen_libgcc_dir = specs_prefix_format.format(libgcc_dir)
+   libgcc_gen = gen_format.format(gen_libgcc_dir)
  
-@@ -695,10 +708,13 @@ if enable_multilib
-   buildtype_multilib_dir = specs_prefix_format.format(get_option('libdir') / '%*/%M')
-   multilib_buildtype = picolibc_buildtype_format.format(buildtype_multilib_dir)
+-  specs_libgccpath = '-L' + specs_option_format.format(libgcc_prefix, libgcc_buildtype, libgcc_gen)
++  specs_libgccpath = '-L' + specs_option_format.format(libgcc_prefix, libgcc_buildtype, libgcc_sysroot, libgcc_gen)
  
-+  sysroot_multilib_dir = '%*' + '/' + get_option('libdir') + '/' + '%*/%M'
-+  multilib_sysroot = sysroot_format.format(sysroot_multilib_dir)
-+  
-   gen_multilib_dir = specs_prefix_format.format(get_option('libdir') / '%M')
-   multilib_gen = gen_format.format(gen_multilib_dir)
+   #
+   # Build the non-multilib *startfile options
+@@ -2134,6 +2147,9 @@ else
+   buildtype_crt0_path = specs_prefix_format.format(get_option('libdir') / '%*' / crt0_expr)
+   crt0_buildtype = picolibc_buildtype_format.format(buildtype_crt0_path)
+ 
++  sysroot_crt0_path = '%*' + '/' + get_option('libdir') + '/' + '%*' + '/' + crt0_expr
++  crt0_sysroot = picolibc_buildtype_format.format(sysroot_crt0_path)
++
+   gen_crt0_path = specs_prefix_format.format(get_option('libdir') / crt0_expr)
+   crt0_gen = gen_format.format(gen_crt0_path)
  
--  specs_multilibpath = '-L' + specs_option_format.format(multilib_prefix, multilib_buildtype, multilib_gen)
-+  specs_multilibpath = '-L' + specs_option_format.format(multilib_prefix, multilib_buildtype, multilib_sysroot, multilib_gen)
+@@ -2151,10 +2167,13 @@ else
+     buildtype_multilib_dir = specs_prefix_format.format(get_option('libdir') / '%*/%M')
+     multilib_buildtype = picolibc_buildtype_format.format(buildtype_multilib_dir)
  
++    sysroot_multilib_dir = '%*' + '/' + get_option('libdir') + '/' + '%*/%M'
++    multilib_sysroot = sysroot_format.format(sysroot_multilib_dir)
++
+     gen_multilib_dir = specs_prefix_format.format(get_option('libdir') / '%M')
+     multilib_gen = gen_format.format(gen_multilib_dir)
+ 
+-    specs_multilibpath = '-L' + specs_option_format.format(multilib_prefix, multilib_buildtype, multilib_gen)
++    specs_multilibpath = '-L' + specs_option_format.format(multilib_prefix, multilib_buildtype, multilib_sysroot, multilib_gen)
+ 
+     #
+     # Build the multilib libgcc -L value
+@@ -2165,10 +2184,13 @@ else
+     buildtype_multilibgcc_dir = specs_prefix_format.format(libgcc_dir / '%*/%M')
+     multilibgcc_buildtype = picolibc_buildtype_format.format(buildtype_multilibgcc_dir)
+ 
++    sysroot_multilibgcc_dir = '%*'
++    multilibgcc_sysroot = sysroot_format.format(sysroot_multilibgcc_dir)
++
+     gen_multilibgcc_dir = specs_prefix_format.format(libgcc_dir / '%M')
+     multilibgcc_gen = gen_format.format(gen_multilibgcc_dir)
+ 
+-    specs_multilibgccpath = '-L' + specs_option_format.format(multilibgcc_prefix, multilibgcc_buildtype, multilibgcc_gen)
++    specs_multilibgccpath = '-L' + specs_option_format.format(multilibgcc_prefix, multilibgcc_buildtype, multilibgcc_sysroot, multilibgcc_gen)
+ 
+     #
+     # Prepend the multilib -L option to the non-multilib option
+@@ -2185,6 +2207,9 @@ else
+     buildtype_multilib_crt0_path = specs_prefix_format.format(get_option('libdir') / '%*/%M' / crt0_expr)
+     crt0_buildtype = picolibc_buildtype_format.format(buildtype_multilib_crt0_path)
+ 
++    sysroot_multilib_crt0_path = '%*' + prefix + '/' + get_option('libdir') + '/' + '/%M' + '/' + crt0_expr
++    crt0_sysroot = sysroot_format.format(sysroot_multilib_crt0_path)
++
+     gen_multilib_crt0_path = specs_prefix_format.format(get_option('libdir') / '%M' / crt0_expr)
+     crt0_gen = gen_format.format(gen_multilib_crt0_path)
+   endif
+@@ -2194,7 +2219,7 @@ else
+   # above. As there's only one value, it's either the
+   # multilib path or the non-multilib path
    #
-   # Prepend the multilib -L option to the non-multilib option
-@@ -714,6 +730,9 @@ if enable_multilib
-   buildtype_multilib_crt0_path = specs_prefix_format.format(get_option('libdir') / '%*/%M' / crt0_expr)
-   crt0_buildtype = picolibc_buildtype_format.format(buildtype_multilib_crt0_path)
- 
-+  sysroot_multilib_crt0_path = '%*' + prefix + '/' + get_option('libdir') + '/' + '/%M' + '/' + crt0_expr
-+  crt0_sysroot = sysroot_format.format(sysroot_multilib_crt0_path)
-+  
-   gen_multilib_crt0_path = specs_prefix_format.format(get_option('libdir') / '%M' / crt0_expr)
-   crt0_gen = gen_format.format(gen_multilib_crt0_path)
- endif
-@@ -723,7 +742,7 @@ endif
- # above. As there's only one value, it's either the
- # multilib path or the non-multilib path
- #
--specs_startfile = specs_option_format.format(crt0_prefix, crt0_buildtype, crt0_gen)
-+specs_startfile = specs_option_format.format(crt0_prefix, crt0_buildtype, crt0_sysroot, crt0_gen)
+-  specs_startfile = specs_option_format.format(crt0_prefix, crt0_buildtype, crt0_gen)
++  specs_startfile = specs_option_format.format(crt0_prefix, crt0_buildtype, crt0_sysroot, crt0_gen)
+ 
  endif
  
- specs_data = configuration_data()
-- 
2.56.1

