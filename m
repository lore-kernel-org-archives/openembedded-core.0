Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 394FC60079
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 22:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v35MkTnU020473; 
	Wed, 5 Apr 2017 23:46:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dI0Uaax6100f; Wed,  5 Apr 2017 23:46:34 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v35MfCNc020118
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 5 Apr 2017 23:41:13 +0100
Message-ID: <1491432072.17200.26.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 05 Apr 2017 23:41:12 +0100
In-Reply-To: <CADkTA4M3=Tk7J51LHieVsrkwR38wrYWXvMiC-QiFa5aT+xa+Ag@mail.gmail.com>
References: <1491395972-25386-1-git-send-email-bruce.ashfield@windriver.com>
	<1491398474.17200.13.camel@linuxfoundation.org>
	<CADkTA4M3=Tk7J51LHieVsrkwR38wrYWXvMiC-QiFa5aT+xa+Ag@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu arm/x86: drop linux-yocto preferred version
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
X-List-Received-Date: Wed, 05 Apr 2017 22:46:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-04-06 at 00:33 +0200, Bruce Ashfield wrote:
> On Wed, Apr 5, 2017 at 3:21 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > > @@ -16,5 +16,4 @@ QB_MACHINE = "-machine versatilepb"
> > >  QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
> > >  # Add the 'virtio-rng-pci' device otherwise the guest may run
> > out of entropy
> > >  QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device
> > virtio-rng-pci"
> > > -PREFERRED_VERSION_linux-yocto ??= "4.8%"
> > >  QB_DTB = "${@base_version_less_or_equal('PREFERRED_VERSION_linux
> > -yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
> > 
> > Note the line below the line you're removing here. This is why we  
> > need
> > this one...
> I had noticed that, but since the newest version is well above that,
> I figured it would be ok.

An unset variable returns "None", not sure
what base_version_less_or_equal makes of that...

> I can spin another patch that leaves it in place for ARM, but drops
> it for x86.

I took Martin's patch moving things to 4.10, quite happy to take a
second one removing the x86 version. Removing the arm one too would be
nice but I'm not sure we can yet.

Cheers,

Richard

