Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5589A6D13A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 11:12:44 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wn1so3367852obc.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 04:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=XdSgMK5dOIRMTG0d3vu/RWqU5SBUDgwP1BYADal2y6w=;
	b=R/mIt24UKcM4ItAAjdrkyW0QCfUzKSnPmrPtAegqMFk6KURuPr30yToBFcxDLgJEqb
	lq6ZWJ/bLquMSPSGuVVgSUesYtqmdKMfITxyHIAkKJTwVBVWUQ8UNt4JLwKhSVf4re/M
	1hFIB45U1FOHEoQffYJTdEiKo8DAeMn+5gLQszvhGzZoBWhhgU23JoaWDMDsPippqzNJ
	4tEp5xba6lMMLptUYUouTOTCwxwdIHkOReW5IVudU96kp/+dEGp5G/M9QgIBRIKurb4+
	MU8bdmf6q+JJgRGygvMe3NDW3JvjtadPy3FV87hYHU5MVUhlo6r1ergaujCjRfKH1CXG
	OOxQ==
MIME-Version: 1.0
X-Received: by 10.182.28.35 with SMTP id y3mr1308943obg.55.1382958765875; Mon,
	28 Oct 2013 04:12:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 28 Oct 2013 04:12:45 -0700 (PDT)
Date: Mon, 28 Oct 2013 09:12:45 -0200
X-Google-Sender-Auth: gUxDgGrhD2MizNYaEWRZ1O5s7KA
Message-ID: <CAP9ODKrGAG00NrEaZ=yz=HnWXC1jRVY7fQQxQ8J3ejA7_QC2TA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Non-deterministic build failure
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
X-List-Received-Date: Mon, 28 Oct 2013 11:12:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I got following:

| /home/otavio/hacking/fsl-community-bsp/build/tmp/sysroots/x86_64-linux/usr/libexec/armv5te-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.1/ld:
cannot find /lib/libc.so.6
| /home/otavio/hacking/fsl-community-bsp/build/tmp/sysroots/x86_64-linux/usr/libexec/armv5te-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.1/ld:
cannot find /usr/lib/libc_nonshared.a
| /home/otavio/hacking/fsl-community-bsp/build/tmp/sysroots/x86_64-linux/usr/libexec/armv5te-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.1/ld:
cannot find /lib/ld-linux.so.3
| collect2: error: ld returned 1 exit status
| make[1]: *** [../../../bin/moc] Error 1
| make[1]: Leaving directory
`/home/otavio/hacking/fsl-community-bsp/build/tmp/work/armv5te-poky-linux-gnueabi/qt4-x11-free/4.8.5-r0/qt-everywhere-opensource-src-4.8.5/src/tools/moc'
| make: *** [sub-moc-make_default-ordered] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/otavio/hacking/fsl-community-bsp/build/tmp/work/armv5te-poky-linux-gnueabi/qt4-x11-free/4.8.5-r0/temp/run.do_compile.25489:1
exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at
/home/otavio/hacking/fsl-community-bsp/build/tmp/work/armv5te-poky-linux-gnueabi/qt4-x11-free/4.8.5-r0/temp/log.do_compile.25489)
NOTE: recipe qt4-x11-free-4.8.5-r0: task do_compile: Failed
NOTE: recipe lttng-modules-2.3.2+gitAUTOINC+4f1217f8ce-r0: task
do_fetch: Started
ERROR: Task 465
(/home/otavio/hacking/fsl-community-bsp/sources/poky/meta/recipes-qt/qt4/qt4-x11-free_4.8.5.bb,
do_compile) failed with exit code '1'
NOTE: recipe lttng-modules-2.3.2+gitAUTOINC+4f1217f8ce-r0: task
do_fetch: Succeeded

This only happens when building in my auto-builder; it does not happen
when building byhand in my laptop.

Can someone give any hint how to debug it?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

