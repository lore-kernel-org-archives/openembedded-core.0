Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6161F6BD13
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 02:08:53 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id o17so4682512oag.35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2013 19:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=RQvYjPillo/LfqNh8GT/MbDT1ZieqoX+8FifDU6W5X4=;
	b=AHQncLNY7E2cWQjbnRSWUBA20/LbmtSfD4wjOrWBH1/4yhHEBUp9nCNgt2nmdciNJN
	hWSUQWL7ShirTj/yy9TLJuFjhCBQ7DR3hxnLzV4PAMSXZajVaZ5vk3NtdFtPN05rY9hX
	eYzYm7i4Qsj/sN1nx1RBkMmiWkXDUDm2G+q1B0sX6jRBbzK4LzSJQrx4jQKt1/crPiCx
	+mQ32Ph7Tj+hDb+GwiQ1jgwQmtbL0zlx39yo0ABlSWkgJhzZ15X4tvpt2fyHTypSY+dV
	MojlN4HApDeSJOG+3+fDPdoUkHFx4nW7jKXI9mQ1Dx3dYnNuTlrQwoElTVIAzwVo0QKy
	qZQw==
MIME-Version: 1.0
X-Received: by 10.182.144.136 with SMTP id sm8mr15268202obb.63.1378087733402; 
	Sun, 01 Sep 2013 19:08:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sun, 1 Sep 2013 19:08:53 -0700 (PDT)
Date: Sun, 1 Sep 2013 23:08:53 -0300
X-Google-Sender-Auth: zVEA6BcP6Cd7RCYatqImUszafW0
Message-ID: <CAP9ODKqj3M+rxAK20=xU2RfJAAFO4JZyH0nWO9PVRt_exO6Q-A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Failure
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
X-List-Received-Date: Mon, 02 Sep 2013 02:08:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I got this build failure today; I am about to leave so I removed the
tmpdir and will let it running during night. I post more info if/when
I reproduce it again:

Patch redhat-portability.diff does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in:
/home/otavio/hacking/freescale/fsl-community-bsp-mx6/build/tmp/work/x86_64-linux/elfutils-native/0.155-r0/temp/log.do_patch.20173
ERROR: Task 662
(virtual:native:/home/otavio/hacking/freescale/fsl-community-bsp-mx6/sources/poky/meta/recipes-devtools/elfutils/elfutils_0.155.bb,
do_patch) failed with exit code '1'

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

