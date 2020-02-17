Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9ECE061514
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 16:01:04 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 2so9098703pfg.12
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 08:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CUSEQwCy9dc1D0hmQbUvcCFwEsghisFfBcJ1YvUE754=;
	b=Q3now7ss0W7nnF6i6ZeBQS9zGQMI21KTjUy/QkiGu0Y7L6WY13Kr3FVdbDWRsrQCI/
	BW81NWx1ne6iofBn+d1RlDJboVjraw5KK6xsKgpJUiuzUCKe71kf8Jlh7SDnwjrWBWAo
	UvvtbIk6o0BELI1RxHU/GQT5jvzYnicHAX5rk5+M0OwvvmT82pAplm5PW5KpoWHGmsLG
	gEl2L36oNY9jKyBUElKcj7Aqn7ZHuUfC02tcdA3pBMBlkkYc2C7oq5m82+MVi6uA2BYR
	J0OYlVMT6lo/Mc2eoBd7Y14tO0IopGLZHe4PcAlmSla4WplJ6FgeH7XSD/61BVO1kEqs
	RAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CUSEQwCy9dc1D0hmQbUvcCFwEsghisFfBcJ1YvUE754=;
	b=rSuErpNkV0LiwQ/OCCOIydTBUDAPfeW3LfT0WfFB/sWOEQD7li3dkV96vdsQEuswEl
	4VA3Offhvr7aT5eEPj4erT9CjLBZk/VqU/B72jP6/ILbV1BgG8lhW0/nZ1glY9XuOY7z
	3iU61STami/+CpYm7TjqSPj2hlF6oshy/vAkOwZrFnFEUKCVjxeTGtmJuIxJ+PrWOenf
	he32MkfXwHjaKzChY4vr9YB4o4i2/+SUfnjXMVqvNLGXBZvDXbXhIFErkGmhE+DttVig
	pm16vOuEPLDh2pKX/B7wlk4UPMMu/grA0Ac8NE1ZQy0699xnZd8jIFuIfF2V9I/gk2+7
	E82A==
X-Gm-Message-State: APjAAAV8keacY4J5Uf9c6Yt2FrIiLRu/GFEM/GTtyI4hPemctK77fSUh
	+gcEzP3kkq82Mo1zf7xhvWMqfQtV
X-Google-Smtp-Source: APXvYqzFpvdwSpjY4Ex5oa92kyUpF0tyoRyg8ti7TSIYGrK5UuJyPqo1ykfXnfq2CPcWgepumEwMTQ==
X-Received: by 2002:a63:7207:: with SMTP id n7mr18526879pgc.253.1581955265453; 
	Mon, 17 Feb 2020 08:01:05 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
	by smtp.gmail.com with ESMTPSA id
	a22sm928041pfk.108.2020.02.17.08.01.04
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:01:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 17 Feb 2020 08:00:46 -0800
Message-Id: <3e69681857b88be44797d1d302b9e44a46a7634d.1581955142.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581955142.git.akuster808@gmail.com>
References: <cover.1581955142.git.akuster808@gmail.com>
Subject: [warrior 08/14] python2: add ntpath
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
X-List-Received-Date: Mon, 17 Feb 2020 16:01:04 -0000

python3 has this but python is missing this.
[Yocto #13740]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af41a2238beec0c34c1c1e5f25eed55f2a214643)
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


