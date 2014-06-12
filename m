Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6292F65E39;
	Thu, 12 Jun 2014 11:07:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5CB796u028796; Thu, 12 Jun 2014 12:07:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ll73KD24uPvK; Thu, 12 Jun 2014 12:07:09 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5CB72gL028781
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 12 Jun 2014 12:07:04 +0100
Message-ID: <1402571217.12440.385.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Jun 2014 12:06:57 +0100
In-Reply-To: <20140610114030.GG2433@jama>
References: <20140610100722.GC2433@jama> <20140610114030.GG2433@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, Failed tasks 2014-06-02
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
X-List-Received-Date: Thu, 12 Jun 2014 11:07:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-06-10 at 13:40 +0200, Martin Jansa wrote:
> On Tue, Jun 10, 2014 at 12:07:22PM +0200, Martin Jansa wrote:
> > On Mon, Jun 02, 2014 at 10:49:50AM +0200, Martin Jansa wrote:
> > > This build still contains huge patch setting B = S or inherit for
> > > autotools-brokensep for all recipes which were failing in earlier
> > > master builds.
> > 
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> > 
> > == Failed tasks 2014-06-10 ==
> > 
> > === common (17) ===
> >     * meta-openembedded/meta-efl/recipes-efl/efl/efl_1.10.0.bb, do_compile
> 
> I'll look into this one (as it's caused by my pending commit and doesn't fail on my local machine)
> 
> >     * meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb, do_compile
> >     * meta-openembedded/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb, do_compile
> >     * meta-openembedded/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb, do_compile
> >     * meta-openembedded/meta-oe/recipes-connectivity/libnet/libnet_1.1.6.bb, do_configure
> >     * meta-openembedded/meta-oe/recipes-devtools/python/python-cython_0.20.1.bb, do_package
> >     * meta-openembedded/meta-oe/recipes-devtools/python/python-pyyaml_3.10.bb, do_compile
> >     * meta-openembedded/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb, do_configure
> >     * meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_compile
> >     * meta-openembedded/meta-oe/recipes-support/daemonize/daemonize_git.bb, do_configure
> >     * meta-openembedded/meta-oe/recipes-support/eject/eject_2.1.5.bb, do_compile
> >     * meta-openembedded/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.2.bb, do_compile
> >     * meta-openembedded/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb, do_compile
> >     * meta-qt5/recipes-qt/maliit/maliit-framework-qt5_git.bb, do_compile
> 
> Fixed in master-next and jansa/master branches (I forgot to push it
> before starting new build).
> 
> >     * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_install
> 
> Fixed in master-next and jansa/master branches (I forgot to push it
> before starting new build).
> 
> >     * meta-smartphone/meta-fso/recipes-freesmartphone/python/python-pyrtc_git.bb, do_compile
> >     * meta-smartphone/meta-shr/recipes-shr/shr/python-phoneutils_git.bb, do_compile
> > 
> > === common-x86 (3) ===
> >     * meta-browser/recipes-browser/chromium/chromium_35.0.1916.114.bb, do_compile
> >     * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
> >     * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
> 
> RP asked for more details about this one (and volunteered to look into
> it - thanks!)
> 
> OE qemux86-64@ ~/oe/shr-core-branches/shr-core $ '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin/debugedit' -b '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux' -d '/usr/src/debug' -i -l '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/grub/2.00-r1/debugsources.list' '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/grub/2.00-r1/package/usr/lib/grub/i386-pc/uhci.module'
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin/debugedit: elf_update: invalid section alignment
> 
> workdir, rpm-sstate and few more logs included in 58MB 
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140610_021320.log/grub.tar.bz2

To update on this, "readelf -e uhci.module" shows:

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [12] .note.GNU-stack   PROGBITS        00000000 0010ce 000000 00      0   0  1

in a good build and:

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [24] .note.GNU-stack   PROGBITS        00000000 009180 000000 00      0   0  0

in a bad build. The problem is the "Al" (alignment) change from 1 to 0.
If its 0, debugedit complains.

It comes down to the linker. The command you can use is:

ld --build-id --eh-frame-hdr --hash-style=gnu -m elf_i386 -o uhci.module -O1 --as-needed --build-id=none -N -r -d uhci_module-uhci.o

and with bfd, it works, with gold it does not.

I haven't had a chance to dig into what gold is doing differently as yet.

I did change the libelf check to ignore the alignment if the section
size was zero and that let things build successfully. That probably
isn't the real issue though.

So the workaround could be to disable gold for grub and we need to look
further into what gold is doing here. Someone with some idea about elf
formant and linkers would probably be better than me at this point but
I'll try and have a look in due course if nobody beats me to it.

Cheers,

Richard



