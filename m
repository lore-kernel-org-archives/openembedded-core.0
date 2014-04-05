Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 29C0560DD7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Apr 2014 04:37:59 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id t59so3973897yho.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 21:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:cc:content-type; 
	bh=AHRGNo2xs/bRzSKTfERy83oeaKCrOA1hItvaDKHzcJU=;
	b=Bc65J6IiI+ZbKgRfBfxEFMDBazgsmtSM5iddY6RJVaAFNahIMVGE/tza+yWmptvV4E
	MudzZPbV22fFdE9hVISShYUieZLglVxNIYFgkxLrl7Mg/8++9FTeDGxFWYQh7toMAlsm
	nXeUvTw5CjqFSKeMyw78XSqlBHLvqsAVLYd8s8twCqjDuCxIgGhco+OYzGnLy4gl+jDa
	XQQomE3SgEvXKZbfEBrU2pG/5IthOvBW3CP2LAe24b/wnAkYeKAf2IkJVqVxtJa10TEN
	3nBugzgBgx1LaxzBZgIK8NIHylHkiLn8xh7roU+aRjjtENlzq2esxqGbgeuyk8tkUAYD
	eP7w==
MIME-Version: 1.0
X-Received: by 10.236.163.8 with SMTP id z8mr22983644yhk.43.1396672680361;
	Fri, 04 Apr 2014 21:38:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Fri, 4 Apr 2014 21:38:00 -0700 (PDT)
Date: Sat, 5 Apr 2014 01:38:00 -0300
X-Google-Sender-Auth: iI7c6NCgkiLZhMOvMW-_1gz7n_w
Message-ID: <CAP9ODKoLt=HMhiGQZmQhDUUFm-efPavZRftR7A8Wf7gECw+Amw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>
Subject: [dora][regression] mesa failed to build
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
X-List-Received-Date: Sat, 05 Apr 2014 04:38:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

In one of our custom BSPs we saw a build failure in mesa:

| make[1]: Leaving directory
`.../build/tmp/work/cortexa9hf-vfp-neon-mx6-oel-linux-gnueabi/mesa/2_9.1.6-r0/build'
| sed: can't read
.../build/tmp/work/cortexa9hf-vfp-neon-mx6-oel-linux-gnueabi/mesa/2_9.1.6-r0/image/usr/include/EGL/eglplatform.h:
No such file or directory
| WARNING: exit code 2 from a shell command.
| ERROR: Function failed: do_install (log file is located at
.../build/tmp/work/cortexa9hf-vfp-neon-mx6-oel-linux-gnueabi/mesa/2_9.1.6-r0/temp/log.do_install.17155)
recipe mesa-2_9.1.6-r0: task do_install: Failed
ERROR: Task 2643
(.../sources/poky/meta/recipes-graphics/mesa/mesa_9.1.6.bb,
do_install) failed with exit code '1'
recipe gnutls-2.12.23-r8.4: task do_configure: Succeeded

This seems not related to the bbappend we have in meta-fsl-arm[1], in
Dora. I think this came in today's changes in the branch.

1. http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/recipes-graphics/mesa/mesa_9.1.6.bbappend?h=dora

This builder has PRServer enabled.

As I am going to be traveling so won't have time to debug this bug I
preferred to report it so someone can debug.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

