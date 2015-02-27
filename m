Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 3ADCB73772
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 08:40:14 +0000 (UTC)
Received: from [99.240.204.5] (port=56254 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YRGSz-00036W-95; Fri, 27 Feb 2015 03:40:13 -0500
Date: Fri, 27 Feb 2015 03:40:14 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Andrea Adami <andrea.adami@gmail.com>
In-Reply-To: <CAAQYJAtoKqKUEukAu+4Fv7FXDtF5HD0_EUTBKb6BRZduD2nWVw@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1502270338360.2537@localhost>
References: <alpine.LFD.2.11.1502261554100.6816@localhost>
	<CAAQYJAtoKqKUEukAu+4Fv7FXDtF5HD0_EUTBKb6BRZduD2nWVw@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: any value in keeping INITRAMFS_TASK?
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
X-List-Received-Date: Fri, 27 Feb 2015 08:40:15 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 27 Feb 2015, Andrea Adami wrote:

> On Thu, Feb 26, 2015 at 9:59 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   just tripped over INITRAMFS_TASK in kernel.bbclass, which claims to
> > be only for backward compatibility and should be replaced by
> > INITRAMFS_IMAGE:
> >
> >     # NOTE: setting INITRAMFS_TASK is for backward compatibility
> >     #       The preferred method is to set INITRAMFS_IMAGE, because
> >     #       this INITRAMFS_TASK has circular dependency problems
> >     #       if the initramfs requires kernel modules
> >
> > but i still see usage over in
> > meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.1[07].bb:
> >
> > INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
> > INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
> >
> > should that be updated, and INITRAMFS_TASK tossed?

> Robert,
>
> this is is an unobvious way to allow the build in one pass of:
> - a standard kernel (without initramfs)
> - a second kernel embedding an initramfs
>
> The 'preferred method' does inject the initramfs in any recipe using
> kernel.bbclass so to keep the old behavior (selectively add the
> initramfs) we can circumvent it using INITRAMFS_TASK.
>
> So no, please, don't toss it ;)

  which is fine, but then it shouldn't be described as discouraged or
only for backward compatibility. and perhaps it should be listed in
the YP reference manual in the variable glossary as well.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

