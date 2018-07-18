Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 59AB1789C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 18:26:22 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id 69-v6so3811995wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/vTV5D3qNGAxbbTab5K94UXAFNYfNKqlKxXiehoHjw8=;
	b=TYTLtwSzg7mnjJzUTATtaGG/CQoLamvYaRwrEyJZ9lkCvMjBT9fesAOT9bRTt7kIWt
	C/hlwKr1R3HXX/k55B1TCBOlWbuyCYiN8cOB1mBM+Xku40rsJsXHphIt881ECyXnSqTi
	Tntlz+CTPUMM8yo0PsMAlTxZjIvzfB3a/HkEmwkN+Uf06HIuhbrSRYef81qtzxAqfh0i
	FgIz628diLoyQ1WDL3GXfvS2t+2IvFXOGGCw1GLOXnFZoj64nh11sXsDXE4bUm08qhVu
	MZ/1578zwNMELENxD6eql4lGghCtu+7hCeL/Oyh2ZKYB7w6kfX0KnvEIvZWfFtUAZ15e
	vRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/vTV5D3qNGAxbbTab5K94UXAFNYfNKqlKxXiehoHjw8=;
	b=Q97ouFRA2SPzcfS0exUYgiqHK7tabtHBfdDaYCTCVowmCJWzIrWcDdBjALySNiMdZ/
	qzztEpu/a1p9GAM9L0IsLsc69syeeUhnfX0K6PMKpcv7awUKKf32b1gi9z1tuvuSiZ0n
	aiy63224cAONlQxKULYFi/LFpkrW77n/he1ypUahhCWbxbylpzOUguEm2n+lY9oKqeB6
	K5DBhrag2lo8MNYTxTxKChj6d3E4WWR+dzR2l30JVRhHm7rWkOw6+yGTRFWGdTKw+q7O
	GQLrLA9xn15rsuIwOADJWZvwVKBAhPducNeu92HDF7M4xAL/qeDioX4M3Y0ZC0HeIrg7
	qHgA==
X-Gm-Message-State: AOUpUlGomcscCjbE0V9GCVMzvvcQPqOfeAhkaO+XwWsYRUdxmNhaAwxk
	2bO+DC58CtkLVceyqkef+iCN8oc6
X-Google-Smtp-Source: AAOMgpeNP6VjglOWMHS3E7r162g/4luCXX0cMg7Tkq1Rxv2Tp7h8e+m3av8/T8zSyE55BzjnO/thog==
X-Received: by 2002:a1c:7501:: with SMTP id
	o1-v6mr2366761wmc.133.1531938382782; 
	Wed, 18 Jul 2018 11:26:22 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x124-v6sm1886158wmg.38.2018.07.18.11.26.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jul 2018 11:26:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2018 19:26:16 +0100
Message-Id: <20180718182616.18372-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180718182616.18372-1-ross.burton@intel.com>
References: <20180718182616.18372-1-ross.burton@intel.com>
Subject: [PATCH 2/2] gnu-config: update to 2018-07-13
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
X-List-Received-Date: Wed, 18 Jul 2018 18:26:22 -0000

License checksum updated as URL changed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 8de81381276..4745f19ceee 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -2,14 +2,14 @@ SUMMARY = "gnu-configize"
 DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a directory tree"
 SECTION = "devel"
 LICENSE = "GPL-3.0-with-autoconf-exception"
-LIC_FILES_CHKSUM = "file://config.guess;beginline=7;endline=27;md5=9bac8b1743c2240ae07cce6e546ac2f2"
+LIC_FILES_CHKSUM = "file://config.guess;beginline=7;endline=27;md5=b75d42f59f706ea56d6a8e00216fca6a"
 
 DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "b576fa87c140b824466ef1638e945e87dc5c0343"
-PV = "20150728+git${SRCPV}"
+SRCREV = "30d53fc428ea42af9d6f4d355db0022e3918a824"
+PV = "20180713+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.11.0


