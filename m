Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QoEwR-00019C-K9
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 15:23:27 +0200
Received: by wwi18 with SMTP id 18so5659114wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2011 06:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=9BTcK7+3go0VaTzj+Ir61zbuSwIbFsveJBp5a2eProM=;
	b=EcBiuVNymaQWGx/Lm8gbEy9fCBiKGUdN/b+yp2vYaO77JtsCktzUon4GSJpm8EQSbj
	x30k1f+t9dFqDLJXA4cZVJ3BMc41LKHcyIC8pMLKGyNZaqQQeNDm2o4knMJO6bp0qGaQ
	pIrMP+VDwCgBWBnwov619iiKGHSTW1xFrAIyQ=
MIME-Version: 1.0
Received: by 10.227.207.206 with SMTP id fz14mr7224481wbb.76.1312291142034;
	Tue, 02 Aug 2011 06:19:02 -0700 (PDT)
Received: by 10.227.2.74 with HTTP; Tue, 2 Aug 2011 06:19:01 -0700 (PDT)
Date: Tue, 2 Aug 2011 15:19:01 +0200
Message-ID: <CAGiJk9dWLc6TqMRfG4nqfgHbBHnRVb3V7b_QQwH9UPjip1aNeg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Error running QEMU with oe-core / angstrom console-image, hwclock: can't open '/dev/misc/rtc' : No such file or directory
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
X-List-Received-Date: Tue, 02 Aug 2011 13:23:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
when running QEMU, build as console-image, some strange errors occur.

QEMU was started with the following command:
qemu-system-arm -M versatilepb -m 128 -kernel
/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin -hda
/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
-append root=/dev/sda

Note: If QEMU would be run without machine configuration, it would
load the machine "integratorcp ARM Integrator/CP (ARM926EJ-S)
(default)" and crash, therefore I run "versatilepb ARM Versatile/PB
(ARM926EJ-S)" which should work according to the machine configuration
of qemuarm.conf (OT: there may be a typo in the conf:  "#@NAME:
arm_versaile_926ejs")


The Angstrom splash screen was displayed, after QEMU loaded a bit and
it stopped (with progress somewhere at the right end of the loading
bar).
Thereafter this error, among others, showed up:
hwclock: can't open '/dev/misc/rtc' : No such file or directory

Also it looks like the root filesystem was only mounted readonly,
makes no sense for me.

For further informations see this Screenshot:
http://imageshack.us/photo/my-images/263/consoleimageqemu.png/


Comments or help would be very appreciated

-- 
Regards
Samuel


