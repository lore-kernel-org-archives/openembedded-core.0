Return-Path: <andhorsthemke@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2636B72FC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 15:05:53 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v77so13873846wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 07:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=52Tij0TJSXPl+dqL1+YmoSMBBeTUKlbxDA9mG0Xq2dY=;
	b=DNjrDqPJYDMA6jQGbkEhVH1dobWwpxLsb2mxz3RxTwzvKOC0iEpfpB02by1bkwPwiD
	AkR8JzcKJCsMb9HdUIdrf+PIAPmQzOM9W/FErqQnovB1/nc0h2TjGUuTEYs3SaUGcl1y
	4a9kAglCHpEiWBdnGOSQdr1b6doKOdiMLhzF3ViCj6MkOBONqGMUBz5Y7MNoThOn9rdX
	m2A90o03HDEEU/DxnHzfEYFmY6pdcBchED/kQV1cV6w/N8e8d/agF3SLI1Wq3SqLYvR2
	t5RwNpqi3cgzI5wbp/bBZzt2MUSZA/FAhQTPa3pg4ALHo9lF4B0RqCc6ToryWAN6uvzf
	DpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=52Tij0TJSXPl+dqL1+YmoSMBBeTUKlbxDA9mG0Xq2dY=;
	b=FCIqi13HRJnjlhtzxQY47HCbtx+uJcrfm62v+TqOY773I+As02b0IzN00UKx5PwZGR
	54yUUx2RxuJT03RCP0QSTiZql4vAzfsuOGWdMZXG3Bo7tar9EApVIEwhKylYzd6Dcn+C
	//hCLpF2DEtncGNRZTEFUCiWB98UNedKOoc485xLtj6ZraWdShq3spK/K/TJyG5wyw4F
	PT3fFbdEpgSSSQwNybibRxv7JgDs82TIP9eD9NwvV8hRLkQ1P/wYv4kEnew9ilOLhV0G
	Ka+lUoXTTF+F+F1oqnn8OtkfM+KIT/80zAKK8/XN3VmtauznHu307txhTb7oyUQvOOOp
	M8gA==
X-Gm-Message-State: AMke39lraEveKYrmhv8ng+Wo/aZdAUZhMyhRBd7lLtyvna0XyILLdzsmpcE0VLqTuSuJew==
X-Received: by 10.28.23.140 with SMTP id 134mr11919725wmx.23.1488207954622;
	Mon, 27 Feb 2017 07:05:54 -0800 (PST)
Received: from workstation.Speedport_W_724V_Typ_A_05011603_00_011
	(p2003007A89742911D1FE4EECCC17D06F.dip0.t-ipconnect.de.
	[2003:7a:8974:2911:d1fe:4eec:cc17:d06f])
	by smtp.gmail.com with ESMTPSA id
	m80sm14617784wmi.34.2017.02.27.07.05.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Feb 2017 07:05:53 -0800 (PST)
From: Andreas Horsthemke <andhorsthemke@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2017 16:05:36 +0100
Message-Id: <20170227150536.15378-1-andhorsthemke@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] lz4: upgrade to v1.7.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Feb 2017 15:05:55 -0000

upgrade from r131. The version numbering changed to a new style.
The licsense is BSD for the library and GPLv2 for the CLI tools.

Signed-off-by: Andreas Horsthemke <andhorsthemke@gmail.com>
---
 meta/recipes-support/lz4/lz4.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/lz4/lz4.bb b/meta/recipes-support/lz4/lz4.bb
index 18e56d04c6..6c77aa1536 100644
--- a/meta/recipes-support/lz4/lz4.bb
+++ b/meta/recipes-support/lz4/lz4.bb
@@ -1,12 +1,16 @@
 SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
 
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
+# The source includes GPLv2 and BSD licensed files.
+# The library in the `lib` directory is under BSD 2-Clause license.
+# The CLI tools are GPLv2 licensed.
+LICENSE = "GPLv2 & BSD"
+LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
+                    file://programs/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "d86dc916771c126afb797637dda9f6421c0cb998"
+SRCREV = "7bb64ff2b69a9f8367de9ab483cdadf42b4c1b65"
 
-PV = "131+git${SRCPV}"
+PV = "1.7.5+git${SRCPV}"
 
 SRC_URI = "git://github.com/Cyan4973/lz4.git"
 
-- 
2.11.0


