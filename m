Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6BC7D40E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 11:29:51 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 7so2188418wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 04:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ysDJO2v/j+7IXlry98vqzxODhhHKjljkC7F8XFldEl4=;
	b=HyaGYFUvw9hBYmc8mzTVjn0FzwF1i/O1nAidu51yz5Cs9q7QKKj7mkZKuW4zx1giUe
	ahEGnO3X60fj70mQLljqd7qsSKQ+KWImmL4iWjyr7xy0ZyLQYvTU9oR1rOlvEIkUGCp0
	6/GBBCNREVgqO96tHDIRL+q/m/0uHtMwFrGl4GrocXVkyjRhNv6jJgqCHn7fKSlM77qk
	dwef4ck4j4C+c290KJErUl/EX1WhmAI7/G06isGEzFMSoe4FO464fyu3norbkj3ZgR+g
	S92VeIGstN1wG8pSFAKASv2q1Y2eLPwUfjBBa+F5On2ctlGJ+6boROWDOlbbfa2dOj2t
	GX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ysDJO2v/j+7IXlry98vqzxODhhHKjljkC7F8XFldEl4=;
	b=lC9G04exoa7wGTbVapGNK4JasYRClrTdIrIpfGpZkhgM3LMEJKqoNCI7hyX3DP8BPZ
	TecAH0xiABpArsZDoJfZR/94s0+n6CAUtHDvFH+K/uPNneAba14CKcEGeptrjpRyHJD3
	8RkNL1GgCBvmRdPJOQv8IZ2csfQr866RfUUncBUPsxJPVmMSJrtgnN3p06/lQSLn+ONc
	2yKYJgjFjdr3YGRm4iWpZhR8uqWwtL3GTPWBcBoyJ4aBS6ejf5kfoB3kha4s0GOyq1lM
	cTArPhg/yQeKMilggR7f5quXsvS4i9pKD6s/sePmQ126KW1GVisEufoldQK5nvbJzpFg
	IRXw==
X-Gm-Message-State: APjAAAUymBqPPqrmLTf1F5vy2+LU9UBT13hneZBMBB8ysRlAQ/pKiJAU
	Ki8RDIed5dvEMvbEwXDRk9NWDDofJuA=
X-Google-Smtp-Source: APXvYqyiBjTez3tAMdTM2p0O+u3l/OXGmUIE01k5SDpUAmcw+yLh+CMJ/BiqBC62ocYP68J68nl4ZA==
X-Received: by 2002:a7b:c395:: with SMTP id s21mr2632323wmj.114.1571311792515; 
	Thu, 17 Oct 2019 04:29:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r2sm1907514wrm.3.2019.10.17.04.29.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Oct 2019 04:29:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2019 12:29:44 +0100
Message-Id: <20191017112945.345-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017112945.345-1-ross.burton@intel.com>
References: <20191017112945.345-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] python3: -dev should depend on distutils
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
X-List-Received-Date: Thu, 17 Oct 2019 11:29:52 -0000
Content-Transfer-Encoding: 8bit

python3-config uses distutils:

Traceback (most recent call last):
  File "/usr/bin/python3-config", line 9, in <module>
    from distutils import sysconfig
ModuleNotFoundError: No module named 'distutils'

Add the dependency so that distutils is always present.

[ YOCTO #13592 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index cd9dc847a8f..5fd9d7dd668 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -500,7 +500,8 @@
             "${libdir}/pkgconfig"
         ],
         "rdepends": [
-            "core"
+            "core",
+            "distutils"
         ],
         "summary": "Python development package"
     },
-- 
2.20.1


