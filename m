Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DB8CA6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 10:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2KAvufH031214; Fri, 20 Mar 2015 10:58:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hl2TVpWU3cWG; Fri, 20 Mar 2015 10:58:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2KAw0qe031225
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Mar 2015 10:58:11 GMT
Message-ID: <1426849080.29168.71.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 20 Mar 2015 10:58:00 +0000
In-Reply-To: <B83906C4-D2EF-4D2A-80FD-C8CBF3AEA6B3@gmail.com>
References: <1426764810.29168.49.camel@linuxfoundation.org>
	<B83906C4-D2EF-4D2A-80FD-C8CBF3AEA6B3@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu-internal: Add cpio support for qemux86 so that we can boot poky-tiny images
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
X-List-Received-Date: Fri, 20 Mar 2015 10:58:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-03-19 at 17:39 +0100, Bernhard Reutner-Fischer wrote:
> On March 19, 2015 12:33:30 PM GMT+01:00, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> >poky-tiny generates cpio.gz images, add support for these so we can
> >boot
> >them using runqemu.
> >
> >Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> >diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> >index 6594dc3..2db5566 100755
> >--- a/scripts/runqemu-internal
> >+++ b/scripts/runqemu-internal
> >@@ -408,6 +408,11 @@ if [ "$MACHINE" = "qemux86" ]; then
> >KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw
> >mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
> >QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $ROOTFS_OPTIONS
> >$QEMU_UI_OPTIONS"
> >     fi
> >+    if [ "${FSTYPE:0:4}" = "cpio" ]; then
> 
> Is that positional handling mandated by the POSIX-1003.1 2008 shell?
> 
> Otherwise case $FSTYPE in ..
> Would cleanup the rest if the mess below..

Its a bash script so it doesn't need to be mandated by POSIX and I was
trying to be minimally invasive given the point we're at in the release
cycle, the rest of the file uses that syntax.

I would like to change some other things but it isn't really the time...

Cheers,

Richard


