Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id E44F5703A5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 21:33:18 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id r10so5925832pdi.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jul 2014 14:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Q9g2zEgH2TJV4cLsifIyaIQKSklJxO4LlMwbuDvTOSE=;
	b=dkR2DIWU0tjibzbewxHccuKAg7d5kaoGeQClOpt/gxmjbiVsdsSbI6V6XyQTd6ox4u
	lq7qMAJ8IcJF7TyMs12E03tcRK6yDBdb22xrqcQISAvHtO6mli8Kpd3COXjVfRD3caUh
	VcG2L3L5aPjzUvO3B7L5ued+fwh+itWr+XFy5WhQa3OjRZPg3bfZBaUXAJc4s4t8ONuY
	4nx1LerKwJMmD0LZy/BRB0Rtmb4fdhieXz7ff5vPZBtuAeFNnN5znRwigQ00+MFgZfRN
	DYgbypkaSqo4yNhC6IPyVfrxUALS6b8mvQ18S3OU4bZSPZnUdHSQ1cBvgPEj0RrmdwcC
	q0BQ==
X-Gm-Message-State: ALoCoQlFfLIj/jzo10osimuzOG0qah55HyFxAeELBlPWbDtb+IrQ6lsUBpEBQmvVpDTVFk6u8SUN
X-Received: by 10.66.155.227 with SMTP id vz3mr30702364pab.26.1404768799654;
	Mon, 07 Jul 2014 14:33:19 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	oa17sm21571189pdb.46.2014.07.07.14.33.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Jul 2014 14:33:19 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jul 2014 14:33:05 -0700
Message-Id: <1404768785-24026-3-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1404768785-24026-1-git-send-email-akuster@mvista.com>
References: <1404768785-24026-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 2/2] lz4: Add self to maintainers list
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
X-List-Received-Date: Mon, 07 Jul 2014 21:33:24 -0000

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-yocto/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
index 4d2f46b..4c566d1 100644
--- a/meta-yocto/conf/distro/include/maintainers.inc
+++ b/meta-yocto/conf/distro/include/maintainers.inc
@@ -419,6 +419,7 @@ RECIPE_MAINTAINER_pn-lttng-tools = "Richard Purdie <richard.purdie@linuxfoundati
 RECIPE_MAINTAINER_pn-lttng-ust = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-lzop = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-lzo = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_MAINTAINER_pn-lz4 = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-m4 = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-mailx = "Kai Kang <kai.kang@windriver.com>"
 RECIPE_MAINTAINER_pn-make = "Robert Yang <liezhi.yang@windriver.com>"
-- 
1.9.1


