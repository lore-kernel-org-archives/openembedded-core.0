Received: from mail-ve0-f180.google.com ([209.85.128.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1UXvhr-00063e-2c; Thu, 02 May 2013 17:46:04 +0200
Received: by mail-ve0-f180.google.com with SMTP id pa12so621336veb.11
	for <multiple recipients>; Thu, 02 May 2013 08:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=HigYpVBC5Mw55yaPEhJbcw/IFzp2RjEoEdxrruQk6WY=;
	b=mNEwTbdXDeJus5uaIayBcC+3R+YR5e/6ifLoXl7fwJOUW5xEAeGPSQ3PqrmLx+t7po
	qfi17B1BdBuNogj6DQgDW/bSMB+9T4FVTWX7nihRxZwaRfCGRxZQCowN4ynYe9cteNfo
	5PnjLYTzoKDbHpxDAitUzG9zgThhnAVaFyS6t9/GJxgoORoE4/HfIXbRGB8TNGMVKOEe
	jZ6jOf65GV50Whj8oE26IHPdyhC4Pm+x75QrAbGkiVZmW91sN/m5Ni+PwKOniBe53OgZ
	USu9nW2aBJgscPijxkbyyM6IWSpVcdZSsbQdZLu0i9pABPoRpyFKOJbEVMKX331bm2fL
	PZew==
MIME-Version: 1.0
X-Received: by 10.52.88.2 with SMTP id bc2mr2021854vdb.27.1367508488929; Thu,
	02 May 2013 08:28:08 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Thu, 2 May 2013 08:28:08 -0700 (PDT)
In-Reply-To: <20130502151833.GC3206@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
Date: Thu, 2 May 2013 17:28:08 +0200
Message-ID: <CALbNGRRPVOd65o-DqsrKe2aHtbo4r2u+uJ+P1jxifuowJr_yBQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 15:46:14 -0000
X-List-Received-Date: Thu, 02 May 2013 15:46:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 2, 2013 at 5:18 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Apr 27, 2013 at 12:54:00PM +0200, Martin Jansa wrote:
>> Updated status, but only change IIRC is fixed php, tbb,
>> android-audiosystem and partially fixed llvm2.9 (I'm testing patch to
>> fix build on qemuarm again)
>>
>> qemuarm Summary: 19 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130426_185942.log/
>> qemux86 Summary: 20 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130427_002532.log/
>> qemux86-64 Summary: 22 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130427_044751.log/
>
> Updated list, there were some nice fixes especially for gnome stuff, but this time it was
> built with gcc-4.8 and binutils-2.23.2 so we have a lot more issues,
> most of them were already reported in
> http://lists.linuxtogo.org/pipermail/openembedded-core/2013-March/037715.html
> so those are caused by gcc-4.8 not binutils-2.23.2
>
> Be warned, logs are HUGE this time +- 600M
> qemuarm Summary: 24 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130429_150137.log/
> qemux86 Summary: 25 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130430_170512.log/
> qemux86-64 Summary: 27 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130501_142102.log/
>
> Common (18):
>   virtual:native:meta-openembedded/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb, do_compile
>   openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.bb, do_compile
>   meta-openembedded/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb, do_compile
>   meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_compile
>   meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git.bb, do_compile
>   meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_compile
>   meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_package
>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb, do_compile
This one I think is caused by glib update and I have a patch prepared
(but I am afraid migration to gcc 4.8 has to wait for me) - hope to
send that tomorrow.
>
> qemux86* common (6):
>   openembedded-core/meta/recipes-devtools/gcc/gcc_4.8.bb, do_compile
>   meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
>   meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.22.bb, do_compile
>   meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_compile
Same as above - patch prepared & waiting

Andreas


