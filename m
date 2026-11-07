Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1473.1794080268835422793
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2026 11:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IAdz5TaD;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso70247eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 11:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794080268; x=1794685068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOOMi8UftRpwDcDJAESTKhDJJF6CSlSU1q5Ab29WOH4=;
        b=IAdz5TaDoWSGZjA1vw/W/bXzAoqE03KUui/1WRZkWLBBWPLABHWhKcjZagfRkQ7GgX
         Dhisf7QW7HQuBpKo4LzrEBqtUTT9u+4OoQzCSGaoFJYoJKxy3kX40dR+2ljr3Hc+RvjM
         IBLSV/wf0L15/LFFG2B7HsOOiQ8tMD08cKCs530E+WQWGEPitSvXrbBd+m/Hf7i7PyIo
         oP1Q5gbNx2IrEjxlCUFZcHuJ+PLJfmsGgdZG8IqJvWAD4nsL+X1XKJZHOBJgsnGih0qS
         Wr3qT2ua0UBqFA53OLG9RGkrGFK1JLY7HodGieElApmmDysuylc8hmmAEi4czhPqRDoH
         pbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794080268; x=1794685068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOOMi8UftRpwDcDJAESTKhDJJF6CSlSU1q5Ab29WOH4=;
        b=notJAoD1v/vQlUrEdIcCOnjYCt+X1ho+fEjbUXJYEFzMLWufNhLC8SFiJ09SAF6Kr1
         Gz4gcw6d3spWYjsYcdPO+UoVBbworYm15x4XCzU7sdR4Ep7eU6e7r93kIhqnkRisuRid
         ehOeJDar6ODmrqtQuT3tBOGIkQGJTXOqptsnT+4MRyVDAIyA7GyPj5Va7vMyXiuzxcwE
         Q42F8/a7s1Vp4FRQjEsZhGi96GrcS3fP1nevnCQDS4GqgMQm0jUiMGKpgExHEKp9k7Ed
         TDhMRc63OVcbjy1tORwzFYvyA+lN+6X+avyD7Cku1I2R0c8PVSZ8U9/+8+50Ukw2f4Xr
         Pakw==
X-Gm-Message-State: APuU4Z/WKftFJYsntrfWRNd5at1Y4Ev56hXlOgSsE9+78kvHk5QvE4dj
	wltoVceSF3A0ersUuBegYYu6J9kH1MFRjMpXh5WOB17zxo1YGNWdrCuOL2ZvCZBuIIk=
X-Gm-Gg: AYBFou11RW+R6cv4I2oOgcVE1BPUIvmrkOBxpDNE7Q3SZVT1bR5YDsSqpuAG3mTLVk7
	jyiNsAl5TEl0sCQ8w0g+RHUh9xrLU+dFvAsWvYrVA78ibQT0cdp84jAPaPvwBB00V76zJHMbune
	R4Doc+LgOVuznugJ9RQI6VrGzx26DNd/fQu8++nn920N7Rae1RLRuNnMnIBO43ufXZQ20/M24Vw
	fvrUPVrdBwHDJULGM/0vC1orTZT5/I3NOJESnwnDuPwSeMqLftlXHrBs1svFuaERhErQTrc9eZf
	lerNc238asc13o8/EV0RhFBpddMGouykQnOWkrHvNAJMJgS4o1nY8qzO0xZmBVK5QLZRcFImRX1
	kzOOPrG3bDgGqmv2wihpEou5xjvef7VIaxNXd649APTntccTzxanCCLNPH1mj5KpRWXZ3kIlZmk
	y6V/MG8tDAyu8PffK1cgfrmer8HOFVXxMGhK5N/851I0wzgdNADvJe12zyiccqio8T5DUfFdwsx
	gxfLodWwAjPCOv3vWJGtY1r1YvN/nPYUTON3X/CYcIZXTU7WeYT+2NnxGEOllGZJmYZ4PHQFGMK
	dkQUGjSoBDMHKL5IhpwwAaMdl92vdEn2YTMEr1/Kc/c/RJslZFWHqUQSmz5y2CN1UDuLp1PPN1I
	28PZ0ZtwmKFJR4/GywIJdX+Lu7gioucz/5kOcA02H3NGEqbFP+VwOLGsAFNWOfqjA01DnV3sDGK
	IuInW2N2mb6+2sNTp20V1S9XdEM2zkZ2p5/++h+p1tm1kGI226mPxTVMqsvvxRaRXn9RJi3jzFl
	agi9MkmSxXkrK9eqxVgXtH2Z6HNSlKEZhymXY/NHCC95vdCQ8D9Sle2iPBmfmj/SYstW4NGes5Z
	/e5H
X-Received: by 2002:a05:7022:ea46:10b0:152:3812:496a with SMTP id a92af1059eb24-1b25d3769b2mr8226158c88.43.1794080267738;
        Sat, 07 Nov 2026 11:37:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314626dsm668099c88.1.2026.11.07.11.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:37:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] slang: Fix link with lld
Date: Sat,  7 Nov 2026 11:37:44 -0800
Message-ID: <20261107193744.1040700-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 19:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249745
Content-Type: text/plain; charset="utf-8"

src/slang.ver lists SLang_Rline_Quit, which is not defined anywhere.
lld defaults to --no-undefined-version and fails:

  ld.lld: error: version script assignment of 'SLANG2' to symbol
  'SLang_Rline_Quit' failed: symbol not defined

meta-clang worked around this with -Wl,--undefined-version for slang;
backport the upstream fix instead, which drops the entry. GNU ld ignored
it, so the exported symbol set is unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ve-undefined-symbol-SLang_Rline_Quit.patch | 32 +++++++++++++++++++
 meta/recipes-extended/slang/slang_2.3.3.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/slang/slang/0001-src-slang.ver-Remove-undefined-symbol-SLang_Rline_Quit.patch

diff --git a/meta/recipes-extended/slang/slang/0001-src-slang.ver-Remove-undefined-symbol-SLang_Rline_Quit.patch b/meta/recipes-extended/slang/slang/0001-src-slang.ver-Remove-undefined-symbol-SLang_Rline_Quit.patch
new file mode 100644
index 0000000000..30458ad721
--- /dev/null
+++ b/meta/recipes-extended/slang/slang/0001-src-slang.ver-Remove-undefined-symbol-SLang_Rline_Quit.patch
@@ -0,0 +1,32 @@
+From eb22c5c3cb253bd4c6ad20d73f76dc7105ed0f3d Mon Sep 17 00:00:00 2001
+From: "John E. Davis" <jed@jedsoft.org>
+Date: Thu, 1 Feb 2024 13:18:03 -0500
+Subject: [PATCH] src/slang.ver: Remove the undefined symbol SLang_Rline_Quit
+
+SLang_Rline_Quit is listed in the version script but not defined
+anywhere. lld rejects this by default (--no-undefined-version):
+
+  ld.lld: error: version script assignment of 'SLANG2' to symbol
+  'SLang_Rline_Quit' failed: symbol not defined
+
+Only the src/slang.ver hunk of the upstream commit is taken; the rest
+is the pre-release version bump and changes.txt.
+
+Upstream-Status: Backport [git://git.jedsoft.org/git/slang.git eb22c5c3cb253bd4c6ad20d73f76dc7105ed0f3d]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/slang.ver | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/slang.ver b/src/slang.ver
+index aa030c9..4b01f9f 100644
+--- a/src/slang.ver
++++ b/src/slang.ver
+@@ -70,7 +70,6 @@ SLANG2 {
+ 		SLang_Last_Key_Char;
+ 		SLang_Load_File_Hook;
+ 		SLang_Num_Function_Args;
+-		SLang_Rline_Quit;
+ 		SLang_TT_Baud_Rate;
+ 		SLang_TT_Read_FD;
+ 		SLang_TT_Write_FD;
diff --git a/meta/recipes-extended/slang/slang_2.3.3.bb b/meta/recipes-extended/slang/slang_2.3.3.bb
index 3f365cb3cf..67d1d62eba 100644
--- a/meta/recipes-extended/slang/slang_2.3.3.bb
+++ b/meta/recipes-extended/slang/slang_2.3.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
            file://test-add-output-in-the-format-result-testname.patch \
            file://terminfo_fixes.patch \
            file://array_test.patch \
+           file://0001-src-slang.ver-Remove-undefined-symbol-SLang_Rline_Quit.patch \
            file://run-ptest \
           "
 
