Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 778D27F332
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 15:54:42 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id 31so66381210wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 08:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jNANNLUQuydNzQhqBbHlzDdYgVUfEZpExs25VdQqqxI=;
	b=F+yZy3cXIjhPub3vNfOCgT+XLKncT5HXRF0du2Dk0jb6vYgtwroK7hCX9miIx+LQLl
	+aM8gOcmPk2IjqxFZTGtsarerS+hdh58w3/PJ3EfrHQn3KjYeEPy7OGuoeTOkEeWUUS4
	1f71zqUQZp87cmbOU9w99QakVQc/7tmjZZaJxSKMThhAjRyFdbE3q2r+zDYG+wOhC6jQ
	/aNewsHI2LJozTxvzgeHOpeFi9cjAVHNTJcL6BjCcgRWrYhwRmg7Gnmf/FefDNzu5io6
	81PMdJcoMAsAyR9ZKAa+N0eJSEYugAk+sMG+N2sy3A3ZVU2rg+Kfvqhl19gqcKrmCHuF
	4F5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jNANNLUQuydNzQhqBbHlzDdYgVUfEZpExs25VdQqqxI=;
	b=So+SB6xlyQz8SapGLosDavd7zsU4L4t+LOIVaziDA9p6D8cqvq6sDCQz1S71bJEuUr
	6WlOOxPHbp0NP1s4hjsA1eXkFZRi2hW+XIZZCta4H8ghB9IuDolX7ub0MxqFHzcP0fUA
	NvAGCIwWg8IO2/6a3jJ+vuEjOQMemD4Llk3kMm38LNxg6EU0NsuspIIDPF4Bi0wr3dhz
	AVwQaGcJgQl1opQMfHAFLd/d7aiUjgAYRUCR9xtJAcaxwdUd2e/0OfBe5/PY+9edUxiF
	BCqx+gYdjf6353FqbP/8cqRWgEQOit/Vp/0335hFA5WVcen9tu9FthJmSL/kYraHQFEO
	PM0A==
X-Gm-Message-State: APjAAAUv9OWVicdW6M8LrSYbJRSptDs9RMm5dhG66CYnvHrOXEn6P+MG
	vqpav0HbfYD7kQZlEU5xK7KaFBuBXyg=
X-Google-Smtp-Source: APXvYqxakVl8s0q5fDGJRjcRcD1oMlODcbpD5UJ8EStyG9DG0gOHF8afybTo9cp+QuYyGdejlRAtBA==
X-Received: by 2002:adf:f042:: with SMTP id t2mr322934wro.139.1564502082495;
	Tue, 30 Jul 2019 08:54:42 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c3sm70781403wrx.19.2019.07.30.08.54.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 08:54:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 17:54:27 +0200
Message-Id: <20190730155432.96611-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730155432.96611-1-alex.kanavin@gmail.com>
References: <20190730155432.96611-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/8] btrfs-tools: update 5.1.1 -> 5.2.1
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
X-List-Received-Date: Tue, 30 Jul 2019 15:54:42 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_5.1.1.bb => btrfs-tools_5.2.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.1.1.bb => btrfs-tools_5.2.1.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb
index 2cd99706b43..138ec749e73 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "781e36a784faa58a4f0515eef124af860d59e2c0"
+SRCREV = "9a85732d8beaae4b80cab98bb3355660389c1d36"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.17.1


