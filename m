Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 419C57FD6D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:48:11 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id q8so1290798pfh.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 07:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wtWSzqS7gxlHm8pXhj95/BkaZGSol0+WHCnCNH095ko=;
	b=abYzWRzCVj/IK4IBkQFvfeaCTeDwyEOPkVhOgYdCZkYv2ZW0EP6tpb1PlzdFoS6pZp
	X+JM1kvyd7e+NBnOSFSRr43JXAeEgpIwoSSUnx53/2iP9+35xZLrp6mzW7CLFAsk5Hrn
	TsT0K0KM2MIfY3hS+ZeNPtJdBLVZJa89cWaMoxe09cwzoipxytExvOgbVYs+e5rTlD9L
	5sSqK3982rSbXXTNF3P0ymR1kflIyipAajzCN/bt9WUzPXV8Ye36NVcNxIHY7CD4mlOF
	2YEco3UyLnvkiQd+FHl/g2CkVaiN6ljxxFeZqD8q4Rn8+UycYsPkbWrBsHkbR1IHU2Ma
	/xyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wtWSzqS7gxlHm8pXhj95/BkaZGSol0+WHCnCNH095ko=;
	b=Xg7ZA+v8BnkjTDeZmXSt6viJMs+j7x6s/bldzu0VK5KHFLagVvjCrhajQbd3wZ5UJZ
	Vvcvj5nHMs/L0hzR6MSeQwwJcLHstDGJHQoV3ge1H7+UNEVVi0WCzxTyZCY8q+8kTcOF
	9IcocmohO9cf9JEEKeByKTzqIisY1wEFWSvpwga1oONPaLXRlZ27eIzOBunMDD1H1NKz
	wXkcJ9Jl8OV6IsYH9Q1udISMwqQicYkUQiMVLyk/zji6tozo4Tqt6BDgbilO2I9NPMcT
	jmH87KS+HGWPyZZEG+R1QLG+xlTDLxIRNe4X8nEgkfXNcKGG26IXpCITcWY4cgmGxXfL
	P7BA==
X-Gm-Message-State: APjAAAX/fi8XbM2jAZrMNR5LOs5qu2YKZw9OTcyh2Bv45Ln7acaS+HBk
	NDdYl52IPj2b/nC0lpr4tWxw0rNTeJk=
X-Google-Smtp-Source: APXvYqzz9uPvwp1as7PvaasV3LXC+CTs2FJaI47Zzd1A+33pBFxg9mQjb84pXwW79x8+mEehQpceUw==
X-Received: by 2002:aa7:8299:: with SMTP id s25mr3672488pfm.261.1579880891985; 
	Fri, 24 Jan 2020 07:48:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	(c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
	by smtp.gmail.com with ESMTPSA id
	133sm6729608pfy.14.2020.01.24.07.48.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 07:48:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 07:48:08 -0800
Message-Id: <20200124154810.1760420-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200124154810.1760420-1-raj.khem@gmail.com>
References: <20200124154810.1760420-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/6] spice: Use python3 and modules during build
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
X-List-Received-Date: Fri, 24 Jan 2020 15:48:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index ebf4d576e5..9d3a0e6cb5 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -31,11 +31,10 @@ S = "${WORKDIR}/git"
 
 inherit autotools gettext python3native python3-dir pkgconfig
 
-DEPENDS += "spice-protocol jpeg pixman alsa-lib glib-2.0 python-pyparsing-native python-six-native glib-2.0-native"
+DEPENDS += "spice-protocol jpeg pixman alsa-lib glib-2.0 python3-pyparsing-native python3-six-native glib-2.0-native"
 DEPENDS_append_class-nativesdk = "nativesdk-openssl"
 
-export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
-export PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
+export PYTHON="${STAGING_BINDIR_NATIVE}/python3-native/python3"
 
 CFLAGS_append = " -Wno-error"
 
-- 
2.25.0


