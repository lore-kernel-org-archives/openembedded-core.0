Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id DABEC78EE9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 22:16:00 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id a108-v6so8733605wrc.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 15:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VP7tvR9rAbVPVtSvORBmXRNNWoaSwwzWCGLTtW5kXHU=;
	b=O3v8RvXwJqW3CwiqZIcmwvtnM3GemudtAobbZ4uSKaQufjC3blj/PCnDi+qxdzp76Q
	gog0EbE9Ok06RLs4NLxkqdxGDcVul16yJ9qYpFV/h9dwxtd3lRKd9BzCFNsKafN0+7gb
	NH0mMOyyzHJ1ssST68OwkQ37K6nOi2N2CnBgbctfCap2NlFGeWabaFmspjuETJzjcxVD
	M39OEfTNx0SbiUKGeaGeoVMIxSGoJcXLYBoQvFXlL/0H84CoQDgIm8UFjjFUqrhltgjP
	Yuo/Op/G9zIb9ZNdiXJrKqNsvIgX8Y92ENZT5cbXUZ5nwnJjvZjvL3lj6UlGiWArgEKC
	R8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VP7tvR9rAbVPVtSvORBmXRNNWoaSwwzWCGLTtW5kXHU=;
	b=W2/QIxPrhS/7QuHlNvd1/3LLNHo/89XDE96+bsMqo4MQTDfpeQQs1Ou5dbyxU2pZlg
	xJSbAy6wOnRzAofVt+lhLF8pfHdqxDM3B9PEftEz2jAbYTvM79TA5EILgqcPIdmuwIHS
	HPppRCZiqF5hZRKVClWFG0CmUe0DL483OBBDVImZerLkJQYDvNCl1jyT9kDiKCfhygEn
	IUOHj3aC3LAKczn4G+tHvl24P/YavfVCA71VLmjU41tl3igKlP15RBB2F4d8Ndxu3Mvg
	nHQcfCCN+ut0zSXdJqORdr1bQpVXvxTkhcp/xtHyM37IX8lT+e57htLpSK/wQTlBW0N4
	cRAQ==
X-Gm-Message-State: APzg51APCmivP8t7s1ETE0ZxZtD0oypQ3iDRUdkhXno0vuXUN9RcW/3A
	R/8RBBg8sXlANUTLAZUNZ7aOag3t
X-Google-Smtp-Source: ANB0VdaRGRCGg7KM8MFj3BCwImp7exY4EDyhxpcMylhvPL4ojjN+gqB58LbldTJ3JTYsYuTU81Nrvg==
X-Received: by 2002:adf:9a21:: with SMTP id
	z30-v6mr1477344wrb.47.1534716961334; 
	Sun, 19 Aug 2018 15:16:01 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	q2-v6sm7245013wmc.44.2018.08.19.15.16.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 19 Aug 2018 15:16:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 22:15:07 +0000
Message-Id: <cover.1534716156.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/6] deployed artifacts naming improvements
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
X-List-Received-Date: Sun, 19 Aug 2018 22:16:01 -0000

This is just the preparation for last bigger change to have consistent
naming across all deployed artifacts. These 6 preparation commits
shouldn't change any names yet, verified with core-image-base for
qemux86 and raspberrypi3.

Using more variables allows to simplify appending some release
information to the images, corresponding kernels and other artifacts as
shown in:
https://github.com/webOS-ports/meta-webos-ports/commit/6fd0af4dbd3da396d41e330f9dd932e859c5f7f0

The recipes and classes which generate or use new artifacts might need
to inherit kernel-artifact-names and update the variables as shown in
example here:
https://github.com/shr-distribution/meta-smartphone/commit/5e70b3779e0d6c90fbfbafeca2c9e4c4943d1196

The final change which allows to re-use do_deploy from sstate, while
still producing the consistent naming scheme (e.g. image as well as
kernel will have the same DATETIME stamp or for release the same build
number even when the kernel.do_deploy was used for multiple builds will
look like this:
http://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/master&id=91e5b30f10f24210c31d3f5ec137de22f89967d7

The following changes since commit 176e50fb177dc40e439700d5f3f838dd7eaaa427:

  runtime selftest: limit kernel hw bp arches (2018-08-16 22:40:06 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/kernel
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/kernel

Martin Jansa (6):
  bitbake.conf, kernel-artifact-names.bbclass: introduce
    IMAGE_VERSION_SUFFIX instead of using DATETIME directly
  kernel-artifact-names, kernel-fitimage: add KERNEL_FIT_BASE_NAME,
    KERNEL_FIT_SYMLINK_NAME variables
  kernel*.bbclass: rename *_SYMLINK_NAME variables to *_LINK_NAME and
    *_BASE_NAME to *_NAME
  kernel-artifact-names.bbclass, kernel.bbclass: remove prefix and
    extension from MODULE_TARBALL_* variables
  kernel-artifact-names.bbclass: Add 2 more variables to make it easier
    to change all names with one variable
  kernel.bbclass: rename type variable to imageType

 meta/classes/kernel-artifact-names.bbclass | 27 +++++-----
 meta/classes/kernel-devicetree.bbclass     | 22 ++++----
 meta/classes/kernel-fitimage.bbclass       | 34 +++++-------
 meta/classes/kernel.bbclass                | 62 +++++++++++-----------
 meta/conf/bitbake.conf                     |  5 +-
 5 files changed, 70 insertions(+), 80 deletions(-)

-- 
2.17.1


