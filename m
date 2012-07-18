Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1SrL6K-0001jw-US
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 05:39:01 +0200
Received: by obcva7 with SMTP id va7so1466009obc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 20:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=YVtSdsbHaSuAmYo8mxwWqJzmzUw+VHAbWsm0ektv/4s=;
	b=oPkJA6fatLeLeXBuA9Fmmv9EhJQJUVmCHR76Hxs0WMXZuCEIX8iv4LptO5fu1rRPm7
	aam7MuMwYqMiyv3OI8o9PMGGKtE/52LASXWDnrDHIAbiTjAa7rh3EXGQZ98iz2216fEh
	xYiWvivLVHW1O+zCJxyIHyy+IdjdZZd4AMKe/54BW+iBDLpuPN3fC/teFcf6FZp9/j6k
	EtDTKGLQF+CVZKwramqk69uzSesVOl7xn/g8oX6fOBw11ly2m1w6EPPiNm33K+35bsog
	ZErY4MS3dQFLu2Ra/cADjWuMJMXp4BZX7ElcHSsBRQGRF1TF/hV6ER7zbNoB54SxG555
	R5dw==
MIME-Version: 1.0
Received: by 10.182.160.10 with SMTP id xg10mr6637213obb.76.1342582060239;
	Tue, 17 Jul 2012 20:27:40 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Tue, 17 Jul 2012 20:27:40 -0700 (PDT)
Date: Wed, 18 Jul 2012 11:27:40 +0800
Message-ID: <CAF1ZMEdcbw78ViHnxiFH2BY4rweS8nzQoTG_=5EcUTjqPw8G+g@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: core-image-sato fetchall fail due to circular dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 03:39:01 -0000
Content-Type: text/plain; charset=UTF-8

hi ALL:
 hit following error, any ideas?

Dennis

 $ bitbake -c fetchall core-image-sato
Parsing recipes: 100% |#########################################| Time: 00:00:38
Parsing of 833 .bb files complete (0 cached, 833 parsed). 1132
targets, 19 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.15.2"
TARGET_ARCH       = "i586"
TARGET_OS         = "linux"
MACHINE           = "qemux86"
DISTRO_VERSION    = "oe-core.0"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta              = "master:2bd0aaf98c5d586638d82f5f22c1c24122a889a3"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
ERROR: Task /mnt/work/oe/oe-core/meta/recipes-core/ncurses/ncurses_5.9.bb
(do_fetchall) has circular dependency on
/mnt/work/oe/oe-core/meta/recipes-core/eglibc/eglibc_2.15.bb
(do_fetchall)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.


