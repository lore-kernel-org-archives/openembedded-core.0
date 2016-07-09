Return-Path: <avery.brian@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 31248607A4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jul 2016 00:54:05 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id ib6so8970431pad.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 17:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iY/HVivKUDaNAdvcLbY+3GPFchuH+Q2tAluUTB0IRwU=;
	b=06rignacXD/gDPwXsVaVn5F84SxVLXkIaJ2FnXtuyeGO2mh/643ucvhOaFBxCjnNfQ
	FPmg8b/zE570yHEq2VV58vJ8WRWx29aoLS4b6ph36FPOuhDwUBjhh1zVkltgqTtzX6jh
	zIPkghfjmYz6RHskmUOxKFtfGjo4nXEtkZ1coQ+EkCuSiuHz/sPaZO4ppT14xT0HKdPs
	MXYAqhEnMiY+ChKjqxA2OJViOpiGlapiSB4ZbuHHXdFpbFb5I3MLbWjmVbVN475JTpje
	MzeehUbjfIsh6KBD+VkfLupWO6TgGiQFzQqiDYz52rbn5lnVl9gvv+5KdCTR/eqkZgxI
	XX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iY/HVivKUDaNAdvcLbY+3GPFchuH+Q2tAluUTB0IRwU=;
	b=GSO04dug7j47FZb3aYNH+CZuLvaiG1dx//o4MuAeTXh96NUBA0md2A5aft/BRb2jhQ
	Bx+hQIjEX3HWDdhdFNp3icRX4lOIEIFg1o4KALxYiz3O4ARrqAgE8kxR272BgI1Jb0n6
	sq6FkcxDGrZ+IWQL7PIbvbM25hl8Jy9H9ETNwEyb5BOquZuhPELZm31P0uW+IyT/ysVC
	fuwEs7l0bi9x9wHHYDkjDyo0PuStCYz3q/IlLtxxGqHopRcq1zhCC8xcbKWrsBfnqNnf
	eLe924bWMiULsD2zlr5AaqBeMfKjD53x5qQd71wpOTaISKatGm1DY4jTKMecc6EqV1cD
	9kzw==
X-Gm-Message-State: ALyK8tIwoRhPFuwUcQXXCCmEWbR2NoBE2NofnKadgsP9+hSiufSlvx2mhuCsrxHi59pn8w==
X-Received: by 10.66.66.108 with SMTP id e12mr14284082pat.95.1468025646697;
	Fri, 08 Jul 2016 17:54:06 -0700 (PDT)
Received: from whisper.hsd1.or.comcast.net
	(c-98-232-142-195.hsd1.or.comcast.net. [98.232.142.195])
	by smtp.gmail.com with ESMTPSA id o6sm229751pab.11.2016.07.08.17.54.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jul 2016 17:54:06 -0700 (PDT)
From: brian avery <avery.brian@gmail.com>
X-Google-Original-From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2016 17:54:01 -0700
Message-Id: <cover.1468023361.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] toaster: Artifact Selection Improvement
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
X-List-Received-Date: Sat, 09 Jul 2016 00:54:06 -0000

This is part of a patch set that is split over the openembedded-core and
bitbake-devel mailing lists.

This patch removes complexity from toaster.bbclass in order to move those
functions to bitbake/lib/toaster.

The intent of this set is to improve Toaster's ability to locate artifacts such as
kernel images, rootfs, and sdk tar files.

-Brian Avery
an Intel employee

The following changes since commit 308d0a8f1d06b22a9be8e5d55194544a2ee764ef:

  toaster: fix typo in arguments for libtoaster.js function (2016-07-08 16:25:39 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib poky-contrib/bavery/submit/elliot/toaster/8556-image_fstypes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/submit/elliot/toaster/8556-image_fstypes

Elliot Smith (1):
  toaster.bbclass: remove directory scan logic for detecting artifacts

 classes/toaster.bbclass | 74 ++++++-------------------------------------------
 1 file changed, 8 insertions(+), 66 deletions(-)

--
1.9.1

