Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3FB6C12E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 15:39:55 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id v1-v6so26506718ljd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 07:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IpYlmbcH33jjfGutSfVF7gOaUNA/xiNyyVGijhADckk=;
	b=dpNeOx3PbM6eTLw84sFRragWwB43g0h75rmwL/k8o82AnoBIM351+IUKqHW2tVcn9S
	RvcX0qVhsV3ZcLlm3uHUTOJIYqoMYpHG5fzOsBGys7ERrOK+TSA6uaitxFXdv3YO9JHA
	hnJAOrMXFoEzucANWV5RmBYaoygPJgcdxhqTtgs0MIY4nsKhlav/OGHsujXxEIx4YLV3
	w0NIcOe2Vfv978BlKFI0j9i9f55JL9ciothaOKOP+gR+zdKoFncCnJ1dPPiNLbKehOiP
	5VKWvSvGfcxHfolEzwYCw49LFaPo+2ledxqRvi8vpdh0WklYiBHkjzHeh1lKkfFntuBi
	LFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IpYlmbcH33jjfGutSfVF7gOaUNA/xiNyyVGijhADckk=;
	b=NEQls1Qu90eO8bqfMlPjc8q+2FD5xOpC8I18sjMftv9XBOnE0IpZHcmC9kgb5kbDSr
	DgUbTbFlZOz/bwFU9Ofe6odhvXN/N0UE/8s+/pK+d83laQru24gAUQ7lFeit62d84mN0
	OIp1BL5fd3aPURDB+beR+KCjM3fy8SeN+gpDN1B9TEAZcKoXQ2pqn4hq8/Jf0mzA7AFA
	tbgE2BfdAAfcgj5nuo8K8y8cJJgNb4kujaJbdQIp1PNXDi2aLqkgmM1X/uJFf3dYyGBq
	VR1qvdMpqpJiPMIY1emsbItYDC3QcH5vThjaplUKEzdeyFj+y5nd2f0KFRm6+YSZebsS
	wsAg==
X-Gm-Message-State: AGRZ1gJ+ZdAyh50SgIrHtZoSKfXPvt3N3RhBbnyv7lF3/bGW04I+Z+vF
	TJ8ej1bHtgz7WVJAZxlHvMnXx6sj
X-Google-Smtp-Source: AJdET5dHTeSIKylS1QXVTjSliqQODVzrFFCUpV3cBou6RZBskre7xtbS9Eip0RwUe1m049r0KpjioQ==
X-Received: by 2002:a2e:681a:: with SMTP id
	c26-v6mr11332856lja.175.1542641995368; 
	Mon, 19 Nov 2018 07:39:55 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q6sm3557743lfh.52.2018.11.19.07.39.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 07:39:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 16:39:48 +0100
Message-Id: <20181119153948.83542-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] maintainers.inc: add libmodulemd entry
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
X-List-Received-Date: Mon, 19 Nov 2018 15:39:55 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0889c1c4295..0d5c416fe88 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -326,6 +326,7 @@ RECIPE_MAINTAINER_pn-libksba = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libmatchbox = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-libmnl = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmpc = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-libmodulemd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libnewt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libnewt-python = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libnl = "Alexander Kanavin <alex.kanavin@gmail.com>"
-- 
2.17.1


