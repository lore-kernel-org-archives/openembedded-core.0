Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 41413605FF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 14:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4OEpjdd003739; Tue, 24 May 2016 15:51:45 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KpDa86wNuIKH; Tue, 24 May 2016 15:51:45 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4OEpdqR003735
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 May 2016 15:51:40 +0100
Message-ID: <1464101499.9570.59.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org,
	"Ashfield, Bruce" <Bruce.Ashfield@windriver.com>
Date: Tue, 24 May 2016 15:51:39 +0100
In-Reply-To: <1463295824.9746.152.camel@linuxfoundation.org>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
	<2cc568062314cdddd5ff2f60dd6d9685b3b12831.1463157783.git.raj.khem@gmail.com>
	<1463295824.9746.152.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 4/6] tcmode-default: Bump gcc,glibc,gdb
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
X-List-Received-Date: Tue, 24 May 2016 14:51:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-05-15 at 08:03 +0100, Richard Purdie wrote:
> On Fri, 2016-05-13 at 09:46 -0700, Khem Raj wrote:
> > gcc 6.1, glibc 2.24, gdb 7.11
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> I'll merge most of this series however before we can move to gcc6 by
> default there are some remaining issues:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb
> /b
> uilds/788/steps/BuildImages/logs/stdio
> 
> qt4-x11-free fails to compile
> linux-yocto 4.1 also fails

I just retested gcc6 and the above is still happening and has also been
joined by a xdg-utils do_compile failure.

> (on qemux86-64, qemux86, qemuppc, qemumips, qemuarm)
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds
> /7
> 78/steps/BuildImages_1/logs/stdio
> 
> linux-yocto 4.4 fails on ppc
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/b
> ui
> lds/768/steps/BuildImages/logs/stdio
> 
> non-GPLv3 on elfutils and diffutils

Khem fixed elfutils, thanks! diffutils still breaks though.

I really can't merge the gcc upgrade until these get fixed one way or
another...

Cheers,

Richard

