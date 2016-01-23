Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5EE2F7705C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 23:10:23 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q184so3930488qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 15:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=XyoqeLGaOzw+GsSbiCZoPACmk+gEj5Y8ZjVYK58Ql9E=;
	b=k1RzaSNLbmafEZjbPF+iwGckWN8pGjx5yfGLm0f6I0nrCa6UzM66Tvv9AR3OeX+uTi
	XrJfOGV7ZGMqFlHUjYvdiDLA/yksMnde3I1QBibBVzc8cZkhVtWIsP5+y+Ou+7NmfPyz
	6TETIemSw901e5ELzyEXQp2pv3hVlqGk/jG84Fy/zpUBlyf/0qx6xIFZgSWPwtQx+49W
	XvWT2V9v/k8aR5DW1YY2quaKBRr0yawiJtlHo9WXUcRhWf2tKK2p4H/b4N1KE+gVRdxK
	IOBPjEAn7E+9BTyojxl3OlEFSc8pbPoLxRv3OFkB229XVzHgjIUN0TOkktBtKd4PdEI3
	KgfQ==
X-Gm-Message-State: AG10YORAHHhsWvjLvMVTQlpS2fjkbwD7A58SfK71mtABZIvITXkTl/1r26BKL/Jf0AyMww==
X-Received: by 10.55.71.195 with SMTP id u186mr12608659qka.38.1453590623979;
	Sat, 23 Jan 2016 15:10:23 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 67sm5769501qht.14.2016.01.23.15.10.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 15:10:23 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 18:10:07 -0500
Message-Id: <8478bbd6a16a5f7e25514a2a5da4fba77e5d57a0.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 10/13] python-cmd2: update to 0.6.8
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
X-List-Received-Date: Sat, 23 Jan 2016 23:10:28 -0000

---
 .../python/{python-cmd2_0.6.7.bb => python-cmd2_0.6.8.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.6.7.bb => python-cmd2_0.6.8.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb b/meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb
index 0ae5c43..f4962d6 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.6.8.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=21;endline=21;md5=a00047b7e92e0781452d0beba4e7b44e"
 
-SRC_URI[md5sum] = "842df29ff2f72d64d7f0d917039c0e51"
-SRC_URI[sha256sum] = "8e98c7a1cfd106183559240b269e7cd9fe97e8342b5c05295f591aab6fd2f4f0"
+SRC_URI[md5sum] = "c32c9a897e010c977b50c1ddc13f09fe"
+SRC_URI[sha256sum] = "ac780d8c31fc107bf6b4edcbcea711de4ff776d59d89bb167f8819d2d83764a8"
 
 inherit pypi setuptools
 
-- 
1.9.1


