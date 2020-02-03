Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4488160BBE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 01:16:46 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id dw13so5547412pjb.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2020 17:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=iCWb3JWVtM4aVjBvSCvkARbrs5A5pEIJa6pFuQ4/ZiM=;
	b=f9lFWv5J0kByvY9igFUc2F5tzkh8WbIcqRuZu84A5sauYmNMDwfV4vCssQ7AwNNNhQ
	orvQh8YIBxS7Fg7RfOW0r3Ga3lhJa8t5Sjsc/yL38jwVwTHXzR/1sGsHIEp2gVUHaGrS
	eGPjgDs5IrK7Wbdvp40FZ21ISJvXE/2TYRuBYmc7YDdd/chLkwU8rIdd6fbaR0jfiOPu
	EUel/8lxGt/RQ4MEhQ+7b3AehTmwBwUacxI4WMLZVuMBV+NsuOim3DWwmU504rY8u2pz
	LihNzIvLTn+30SCqvtcHrojTwQ6qUnCgsU+Q64drOxHMTeaES34NEujkaIoIDkViB03G
	t53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iCWb3JWVtM4aVjBvSCvkARbrs5A5pEIJa6pFuQ4/ZiM=;
	b=SkGJ2PtGvpoVK8HWH9WfuQ5xa82wSEOC3FcUKgwbO11njNKzikjxwkI+UrSlggeQgf
	jTOmH5lXzMRu6z5Wz1L+HpuAi5OXSrkXxCiktifVLAIPmCroOiShaDGDh4bOZMJkCwpy
	E2S+Ry0sZ+Y9nwNoWL0FvrWjO26xpALdFJYTm2Or5uEqQEhZ6zd1BYYCgjJMRj4H4q+C
	EuhboDZJ+4KeY7MSFUb85koVnj4W5XZm3kt1GlTIsKa5OpqTucrh6UUImziBLtBaoNNs
	NsiuxEQka3W4YX+8k45X82C63sqAhrkUHdgClmMk30u5BbNRHGr+1YGIA9sqa39j35S9
	6POQ==
X-Gm-Message-State: APjAAAVmFr7/bOX5cH2L37Vysz5CsxHKV3npqx/mLyRo07HagvqlAB3J
	N+MhoHLBC8pCa/ikOE0Nsr3mTTNd
X-Google-Smtp-Source: APXvYqzco+3RK3S+AcFc3x9mhFhD9bEzpHiK09Hxra1ic8ebS8g1F4vWWghAa9omQ0esDVKWQECDpQ==
X-Received: by 2002:a17:90a:c24c:: with SMTP id
	d12mr26899727pjx.113.1580692607106; 
	Sun, 02 Feb 2020 17:16:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0::afc]) by smtp.gmail.com with ESMTPSA id
	e17sm18670053pfm.12.2020.02.02.17.16.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 02 Feb 2020 17:16:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Feb 2020 17:16:44 -0800
Message-Id: <20200203011644.29098-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][{ATCH] python2: add ntpath
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
X-List-Received-Date: Mon, 03 Feb 2020 01:16:48 -0000

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


