Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF56619A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 22:53:38 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id j9so2437632pfa.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 14:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pFiNVtFREtpdVwd47rrzKR/ziuPng/yX6SKP+3b66uQ=;
	b=d8OPWxleo38VP3DrX7/dbRlGOHb/ACUe6xFlLV8nUIU+eLQIGrOtN0wKN6r6MLZJUQ
	IieMwLYq3gBQO5As4sV/zeqtulCjZWYek1WyfXbY04r0fBKa2+xf6MpYbSSCezoix6YU
	US8F+jCmUM4N3ZtdcWdiR0jltHGTzd1SeM5mA+u823x6hynjnMHm9G6XnkSjsiZZy5wU
	TBDdlUVcfWKiyyxgFLHPOS4DrJyPQcih9muCVoi2QI4RnCpN90+mMIWFLDoaNv1bz+kF
	29iehX3SQKuEOB6xa+IPbD4AxXlZJDUY4sOpymkzt0T9dMMknHpexqnltUD0S53XH7pb
	87Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pFiNVtFREtpdVwd47rrzKR/ziuPng/yX6SKP+3b66uQ=;
	b=q2Xh4aeqrwPPniC8zOIYO7UXeRPYdfPbESqW9Bcm7Z8gSYhTc4vrt7ZPEko0mNXGc7
	ntpzb/QKEYlIkgxGLT5C9mg6/VFMuhmNul8QZ6h12t7mS+j/B0kOWq6k+Yzj65NImGhM
	uWixOGWmLyrRDjwRtzndLwyYEPkSn6iYEaQuhBhzdu5zFY4NIknUn6HiWqxAy1jT+3Os
	e6bA5wZwFwqeopsiwjmrcGcl6qAtBzOkMeBZzA+cw/Oxnq2vNpH6MmNS7sQ5Gq0P3aY8
	61uOjBenS7DZi1EjRy9E8D8OTNkLmjQkWg30oWFWU0THkj5t53lA3rzfVh2fOWy7TmtH
	a2bA==
X-Gm-Message-State: APjAAAVqwzB9ATOjUSTCGnTvCSt092EhofFRVoj3A80QqC4CO+qkS6iy
	TxIgSHFxSbL29cCAUj8AXTU15eiG
X-Google-Smtp-Source: APXvYqxeyRCuEMZK1H78a+C9BHHUDo6Tunyd0RQK3mXExXsvugQX+W8GdEiIwQS2v2tDkPS+z9Xh/g==
X-Received: by 2002:aa7:8552:: with SMTP id y18mr6651496pfn.176.1582930419421; 
	Fri, 28 Feb 2020 14:53:39 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id a17sm3446700pjv.6.2020.02.28.14.53.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 14:53:39 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 175F72A07C2; Fri, 28 Feb 2020 14:53:38 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 14:53:34 -0800
Message-Id: <20200228225335.28139-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228225335.28139-1-jpuhlman@mvista.com>
References: <20200228225335.28139-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] apr-util: add multilib script for apu-1-config
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
X-List-Received-Date: Fri, 28 Feb 2020 22:53:38 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

apu-1-config encodes library path in to script
27c27
< libdir="/usr/lib64"

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-support/apr/apr-util_1.6.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
index 1f9fea25d8..3896c924f0 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
@@ -28,7 +28,9 @@ EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--with-expat=${STAGING_DIR_HOST}${prefix}"
 
 
-inherit autotools lib_package binconfig
+inherit autotools lib_package binconfig multilib_script
+
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/apu-1-config"
 
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
-- 
2.20.1


