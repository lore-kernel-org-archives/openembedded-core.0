Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 056A477016
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 05:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9E53Vhm003570; Wed, 14 Oct 2015 06:03:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dl9djtnz-Mmr; Wed, 14 Oct 2015 06:03:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9E53H6t003554
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 14 Oct 2015 06:03:29 +0100
Message-ID: <1444798997.3844.47.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Oct 2015 08:03:17 +0300
In-Reply-To: <2D1734FF-E28E-4B9D-AF22-A4911A5DE293@gmail.com>
References: <CAP9ODKrxCLF1m-UR9_TYQboUQtWODG8erwgnmjFiWd_O57CEEw@mail.gmail.com>
	<2D1734FF-E28E-4B9D-AF22-A4911A5DE293@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: glibc build error when it is rebuild due hash mismatch
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
X-List-Received-Date: Wed, 14 Oct 2015 05:03:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2015-10-13 at 09:52 -0700, Khem Raj wrote:
> > On Oct 13, 2015, at 9:45 AM, Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:
> > 
> > Hello,
> > 
> > From time to time I see following error:
> > 
> > | /usr/bin/install -c -m 644
> > /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueabi/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/option-groups.h
> > /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueabi/glibc/2.22-r0/image/usr/include/gnu/option-groups.h
> > | /usr/bin/install -c -m 644
> > /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueabi/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/lib-names-hard.h
> > /home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueabi/glibc/2.22-r0/image/usr/include/gnu/lib-names-hard.h
> > | msgfmt -o rw.mo rw.po
> > | /bin/bash: msgfmt: command not found
> > | Makefile:84: recipe for target 'rw.mo' failed
> > | make[2]: *** [rw.mo] Error 127
> > | make[2]: *** Waiting for unfinished jobs....
> > | make[2]: Leaving directory
> > '/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueabi/glibc/2.22-r0/git/po'
> > | Makefile:234: recipe for target 'po/subdir_install' failed
> > 
> > and it seems to happen when a rebuild of glibc is triggered due a
> > change in the sstate hash. The host is a very minimal system so it
> > explains why it does not provide the msgfmt in host and also might
> > explain why it is not being catch in Yocto Project AB.
> 
> 
> are we missing a dependency on gettext-native ? it could be that AB slaves have gettext installed on host
> and you don’t.

Agreed, this does look like a missing gettext-native dependency
somewhere in the system. Unfortunately gettext(native) is a pretty heavy
dependency too :(

Cheers,

Richard



