Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 407BE7DB8F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 11:54:15 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l2so5007524wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mVmHD9jvr/EunU8sntXm2g2AbYKukQM2t3ELQn8Xxac=;
	b=a90PMU5yrjEkI0YcG0gGJ+caLPCMdgdZkfcXMTpa8VjwITP/hy0pNbJSM+mpd5NpIG
	z2K57ooHm/wdAGD+ctHPe8V2Of2H+eyLdaM+Rt8JNOVn2Z4l2HhfQJMlgZe+JTLIeS0x
	RMb3lVkQ9JKrL0z7ax26hN6xVZNLiUQcQ4tA/rekgYjeDr26UNewTskc1o4cMuj2VKky
	ma4ioU8hTrIhFFYlJMoLWkLInNNmPxjsqoU33oyyLVT2WbAQ3mv91jdsOmD7hhGuR11G
	h4YOVvxbHycm2LeayHnetP22ZYY1bW2rFIGhmLlK24/7t9s6wKmgXSnGNyh2QhRl7tNU
	2RNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mVmHD9jvr/EunU8sntXm2g2AbYKukQM2t3ELQn8Xxac=;
	b=na9jnRREEldfdcFedy5H54mhKhPaoeoyNcsxOAsft7/zk7ByAw3axHuT9pUvtZpwso
	z/hvcPyGc/JtsUkS48TaE4n0b1KLw1PUdGjevx0uLj0Ts4ujoAloIL355LzszUEpQa0z
	RIiabupCeB5ETeXKfwipbgnNtXjSB2SWCRWA9gLzDTREXTXl/zzyTKf3uXzDCdjkC+et
	UuIW9o+n45kp6rYg9J1cxndRMPQeTje3XJTwR162MG9ebLmMn9i1VoICu6iBDDhc3OnD
	6mw/ZgCHkG6iAsJXaWHy7TlUd7XDd8/br7UWDM3pWa8LVzLMHfJU4LXNNVkefGlyWok7
	ik3A==
X-Gm-Message-State: APjAAAWZnNR8t1AfBgpVh5Uk1NoU4wh0mD+Eh13bDK87N/o6JrGKs/92
	6Bh9MuwprxjyqZbHN1Ik87+ymBmV9Bo=
X-Google-Smtp-Source: APXvYqwfCwUTQ47oTKY/sgMYVMxUPkmTCiU4RNiEwMA8W8YovrIkQebkCfcAFnKopZ0Uk5Cqxo8h/Q==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr856857wrm.329.1556625255855; 
	Tue, 30 Apr 2019 04:54:15 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id f8sm244012wmb.32.2019.04.30.04.54.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 04:54:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 13:54:08 +0200
Message-Id: <20190430115408.21601-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430115408.21601-1-alex.kanavin@gmail.com>
References: <20190430115408.21601-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] maintainers.inc: take over as perl maintainer
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
X-List-Received-Date: Tue, 30 Apr 2019 11:54:15 -0000

Ross requested; I agreed :-)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 41c2a95d534..8c4548f2399 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -556,8 +556,8 @@ RECIPE_MAINTAINER_pn-pbzip2 = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-pciutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-pcmanfm = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER_pn-perl = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-perl-native = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-perl = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-perl-native = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-piglit = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-pigz = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-pinentry = "Armin Kuster <akuster808@gmail.com>"
-- 
2.17.1


