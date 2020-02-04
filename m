Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 169C460F7F
	for <openembedded-core@openembedded.org>;
	Tue,  4 Feb 2020 15:06:19 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id k29so9583264pfp.13
	for <openembedded-core@openembedded.org>;
	Tue, 04 Feb 2020 07:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=iCWb3JWVtM4aVjBvSCvkARbrs5A5pEIJa6pFuQ4/ZiM=;
	b=V8XdLb3qcfypgeMfJ853U5RETfTGpHy8X1hX8biVtwtGgsaOMIZDKYbkwJMLcGWAo5
	pPWNq8Z1hrHhY6uo6WUpBH2qUMHp6uox/eX9HwcE52HtxOy1uK7/9JQLnSnhlZtDCxwL
	YiCfPoe/1Q0o1L8X2uCxI/Iw4PNM8usOO19lc8X2UDZ89ABtchWvvNbA+qXj6SQ49Vky
	625tExVDxxXfR/xdTv46FkUpo+1G1AwkfJef2ICt8Blqs6rVv8X74ZLPm9qSKb/6083d
	wzWin2DiDdrMi6oxiqsOhcSJwkYCSECHNHrg7LnYVUWw6oHKiH/HGE5JkS/W68/HruGW
	KzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iCWb3JWVtM4aVjBvSCvkARbrs5A5pEIJa6pFuQ4/ZiM=;
	b=TZ25DJcGOzM5ZhHPQy1J69zeb9WrhWHRZ8/sRpsE4RZP2Y9XZLixDmnFnH+WDaVobJ
	hPEY92Z4qnUYOWi2Hhl5rbpGgQ/I7OAOVoGqcej/1Mf+wFTRSOX8sV9tziTFkoIF6iBN
	rJ5ge+KN9jqLrmiOrLsQaj79PxuOUaxzb2kv7Xju6wqTgdwxOYyOadLR+aDVj7btgmeL
	3X0OTCYIsglgkJKituRilFzVRaEKEeAVahx4sjKe3MlXUbGFHnEN194oHcjnazxOmNyL
	4Mj0da8D6b3lfwlUZToc8ZE4IP1eGl+A4me5Th3yfIL6GaNR1NQR+Ft9GfOeYuLKtJgd
	UX2Q==
X-Gm-Message-State: APjAAAWNrcdrkeOUVqk6FaP9BimR4x7Ym5gDHMC6NVTtZi7EQlEjIPhZ
	aJ6A+2S3yI4py4Se1qsO8Ix16zNJ
X-Google-Smtp-Source: APXvYqy4gnozwLGb8Jek5XHlIFFFxsARUCE0jO65675MWJsWOIU1UQ7iKqQsvlLKUm3PEjb0563g2A==
X-Received: by 2002:aa7:8a8c:: with SMTP id a12mr30492722pfc.242.1580828780864;
	Tue, 04 Feb 2020 07:06:20 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0::afc]) by smtp.gmail.com with ESMTPSA id
	b98sm4216055pjc.16.2020.02.04.07.06.20
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 07:06:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue,  4 Feb 2020 07:06:08 -0800
Message-Id: <9b1bf083129be2b849db52d4f0eda9eb6077c97e.1580828664.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580828664.git.akuster808@gmail.com>
References: <cover.1580828664.git.akuster808@gmail.com>
Subject: [zeus 8/8] python2: add ntpath
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
X-List-Received-Date: Tue, 04 Feb 2020 15:06:20 -0000

python3 has this but python is missing this.
[Yocto #13740]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python/python2-manifest.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index eb52e862ab..fd98774d00 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -267,6 +267,7 @@
             "${libdir}/python2.7/lib-dynload/xreadlines.so", 
             "${libdir}/python2.7/linecache.py", 
             "${libdir}/python2.7/new.py", 
+            "${libdir}/python2.7/ntpath.py",
             "${libdir}/python2.7/os.py", 
             "${libdir}/python2.7/platform.py", 
             "${libdir}/python2.7/posixpath.py", 
-- 
2.17.1


