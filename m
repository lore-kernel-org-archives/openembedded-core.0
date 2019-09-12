Return-Path: <daniel@qtec.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id 539C87C603
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 19:54:39 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id o9so25080898edq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 12:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtec.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LZXLVFjnsNKAd2YixxLOvjt/0qCUm6IHkDmj95KHwxo=;
	b=qA+fEYE4p00hWacvHE1oJzqOIkrs6wPAb8c/vyfeQsfTNeFHCPV52i8mKznC+9UKEm
	9HT2U7aywbzojvrqQ9S/pL11IovGbPmc/fvZYDNFpJVeuaZRefl70qGadWUJFSuALtE6
	JnWlVEvlO4ziT/DUlqcYFz15pFE5GH5Bn1smU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LZXLVFjnsNKAd2YixxLOvjt/0qCUm6IHkDmj95KHwxo=;
	b=JEObNlPcgW5K84vjoLYbhXDWd2f5/mNnTPzrYvn5G0A/bIy9+nUC897pOn6YgQHRKg
	Andmd5JQoGOcsukubk2cE06efUJ2p7Jiqmu/T+uKIr1sgDGDFUIxnZVPjCeGG3S34IYa
	FyNy+5nVaVoOdgwOz0q01Y3iUUF9e/h5HqxV0Ru3GcR5zQBNNZxlL8eevEYy68lihf6T
	W/E0qcqVomXta3A3tfTElU1qUI3eS8/LQSB0beFCUULifQY8nqjaSB+I3F95ODyXVLJq
	cfz1A369FnV8GwNB75B3mOXrGcB5fABnLRNyO858A578Gu8akJM6In046/FGJ8JMUjt4
	gVdQ==
X-Gm-Message-State: APjAAAXCC+71z151gb1aqHpVoemQVaV7HY/4FIBSJ9LXT/nsnV8ng9Vc
	a+jHGvV7Y0OuYWgu4fxCmQRuMWRC2oA=
X-Google-Smtp-Source: APXvYqxv1UzLWPqh+q6QJ8sCV2yoDbvc4uN9Avih5/3cM8bluigNT5J84VSSdZQYj0ip8GHhQ9PTXA==
X-Received: by 2002:a05:6402:b11:: with SMTP id
	bm17mr43972787edb.31.1568318079590; 
	Thu, 12 Sep 2019 12:54:39 -0700 (PDT)
Received: from turia.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net.
	[80.197.57.18])
	by smtp.gmail.com with ESMTPSA id l1sm4948932edc.11.2019.09.12.12.54.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 12:54:39 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2019 21:54:23 +0200
Message-Id: <20190912195423.29246-1-daniel@qtec.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] lttng-modules: Add missing SRCREV_FORMAT
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
X-List-Received-Date: Thu, 12 Sep 2019 19:54:39 -0000
Content-Transfer-Encoding: 8bit

When using devupstream class the SRCREV_FORMAT variable must be set.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---

When using class-devupstream, multiple SCMs are used. Therefore, it is needed
to select the variant of the recipe via PREFERRED_VERSION. In addition,
SRCREV_FORMAT variable must be set.

An example of devupstream class + SRCREV_FORMAT:
meta/recipes-kernel/linux/linux-yocto.inc

Error log:
ERROR: ExpansionError during parsing /workdir/repo/poky/meta/recipes-kernel/lttng/lttng-modules_2.10.10.bb
Traceback (most recent call last):
  File "Var <SRCPV>", line 1, in <module>
  File "/workdir/repo/poky/bitbake/lib/bb/fetch2/__init__.py", line 768, in get_srcrev(d=<bb.data_smart.DataSmart object at 0x7ffb7638add8>, method_name='sortable_revision'):
             raise FetchError("The SRCREV_FORMAT variable must be set when multiple SCMs are used.\n"\
    >                         "The SCMs are:\n%s" % '\n'.join(scms))

bb.data_smart.ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetcher failure: The SRCREV_FORMAT variable must be set when multiple SCMs are used.
The SCMs are:
git://git.lttng.org/lttng-modules;branch=stable-2.10
git://git.lttng.org/lttng-modules.git;branch=stable-2.10

 meta/recipes-kernel/lttng/lttng-modules_2.10.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.10.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.10.bb
index 6e2d655495..dccc4b9842 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.10.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.10.bb
@@ -43,3 +43,4 @@ SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.1
 SRCREV_class-devupstream = "624aca5d7507fbd11ea4a1a474c3aa1031bd9a31"
 PV_class-devupstream = "2.10.10+git${SRCPV}"
 S_class-devupstream = "${WORKDIR}/git"
+SRCREV_FORMAT ?= "lttng_git"
--
2.20.1


