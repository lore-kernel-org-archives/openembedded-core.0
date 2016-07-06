Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6731160119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 15:04:24 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id dx3so12561126pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 08:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3sYKGvs2RTq+BfzY6H/AhyNiFTOS+Z4kKkoT12FzWZ0=;
	b=PGDj25IB3d40fnvrb6UsVAceM7Gp9/hdHt23KRMtb8Nf94WRVjQgN+4Z870v7HIdyR
	0tqXjToGBt1b+9rgyBaE5vIF/j8qY0oLPdil1oT2Foo5LgGluemnywxKXyXh+8Gr5Ku7
	FET7AnDDLZk7KDc5F9AaE0w+nPtf9WzLin0VRChBibsfdn+qTnN5XdUTpTqn7YeMxgu/
	wfpcKAtVKK7TInCVuQZqnS/okQ6uAgF0bI0zmgkl33sOTCEBR9kqJBtWqimTyfLTAvkh
	xLK74iqfgXhsIy0cMEWZVAU989f0cqVdGzHtMjzFAS58XDGSeJHwh5ydfay23UVNX5fp
	Uz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3sYKGvs2RTq+BfzY6H/AhyNiFTOS+Z4kKkoT12FzWZ0=;
	b=LZT9sH3bX44jmkapE5VFOz7OZ91abbjCgQq+JRRULAQ4fqqZXLpPzSxP1wsoCqkjZ5
	5seypgPFy0ixGMPVmbpon60shEVcUotzBBHTW843FTqFSiU16RDmdHQzz72EPmTlaUX+
	mrgRpOHxBpKN7IvNhwzsLbH28R6N5o7SxFmwJR+G5WozYsbkD1BYxnqigGzTFr/M30aP
	NFX1ubUpDfxaUc4fg5TVddRZIxs382jYe3ga9ctTC4/aRGEBvteGiiueQolYKS7wQdQ2
	Ep8DBPh5OEyMrL7X6umnIAntY9iHYFNAkTHL1UnWmRPhNw0VHQc0qxdB45Hb6lPN/qO+
	bWMQ==
X-Gm-Message-State: ALyK8tLEIcmGLJQyHGJMa8Iw8lMlZV7s4HskQR2kA6Itz5Eb4m6Aeo4cH759RRs7iJC5UA==
X-Received: by 10.66.251.170 with SMTP id zl10mr42366861pac.25.1467817465070; 
	Wed, 06 Jul 2016 08:04:25 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	bw1sm5423663pab.17.2016.07.06.08.04.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jul 2016 08:04:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Wed,  6 Jul 2016 08:04:10 -0700
Message-Id: <cover.1467816214.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/6] Krogoth pull request
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
X-List-Received-Date: Wed, 06 Jul 2016 15:04:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Here are a few more changes for krogoth-next. The first two are the ones we talked about in the YPTM. The rest are bonus.


The following changes since commit 7e9297e5722d0a589fae1158908cf8cf8c1d0b37:

  bitbake: bitbake: fetch2: Safer check for BB_ORIGENV datastore (2016-06-28 15:22:59 -0700)

are available in the git repository at:

  http://git.yoctoproject.org/git/poky-contrib akuster/krogoth-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/krogoth-next

André Draszik (1):
  feature-arm-vfp.inc: fix overzealous ARMPKGSFX_FPU modification

Anuj Mittal (1):
  gcc: make sure header path is set correctly

Armin Kuster (1):
  Revert "openssl: prevent ABI break from earlier krogoth releases"

Ed Bartosh (2):
  devshell.bbclass: fix double unbuffering
  wic: rawcopy: make source filenames unique

Khem Raj (1):
  gcc-5: Fix hang with mmusl option on cmdline

 meta/classes/devshell.bbclass                      |  1 -
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |  2 +-
 .../openssl/debian1.0.2/version-script.patch       | 31 +++-------
 ...l-as-a-musl-libc-specifier-and-the-necess.patch | 72 +++++++++++-----------
 meta/recipes-devtools/gcc/gcc-target.inc           |  1 -
 scripts/lib/wic/plugins/source/rawcopy.py          |  2 +-
 6 files changed, 47 insertions(+), 62 deletions(-)

-- 
1.9.1


