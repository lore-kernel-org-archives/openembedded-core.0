Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QDKVv-0004MD-5u
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 19:51:31 +0200
Received: by pwj9 with SMTP id 9so422498pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 10:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ohVMrrzSHWRqb51qaHgCtMzlSBy2k5mmr2RUwXM8lPU=;
	b=K87sBg2ln5ILGVgdxpNyVohh36jJ876ZxP5hd7DzcfcjVZF148YX6AbOKuHiCtyPaY
	yj1hMUsIgXDv7vgN9Fuj/29kVlKWFuThifWAsFqQhR2WgbzrcQ84wnOPmJbfsanhklFH
	TSQbq64OxRUiMCyj0VUAXdSkxyojHxxhelLUA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wOivK7e6DWZcw4e+Hpy/AxgKAs6rX/UA6cmk9Db3Z75fLyZbvS9fQ3zy9Ml0J+ESGH
	x+iIf66po9w0OuANN9Iog+tN8jgRXDW4E9FrmHFfKzUkbmAMmx0uIxSl8e+qhD9Y9szc
	S/I/ZoVsTcS1of/KKQ5kVXf9d09yjkYU3ySug=
Received: by 10.142.154.20 with SMTP id b20mr736698wfe.371.1303494544330;
	Fri, 22 Apr 2011 10:49:04 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k7sm665213wfa.14.2011.04.22.10.48.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Apr 2011 10:49:01 -0700 (PDT)
Date: Fri, 22 Apr 2011 10:48:51 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110422174851.GA5060@sakrah.homelinux.org>
References: <cover.1301567822.git.Martin.Jansa@gmail.com>
	<ca0ffb747b87caed609b2edf08f963751dbc8873.1301567822.git.Martin.Jansa@gmail.com>
	<1301581599.24596.106.camel@rex>
	<20110404183138.GA30816@jama.jama.net>
	<20110418055406.GH25122@jama.jama.net>
	<1303109834.5518.57.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1303109834.5518.57.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/3] distutils-common-base.bbclass: Prepend STAGING_LIBDIR to linker library search path.
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
X-List-Received-Date: Fri, 22 Apr 2011 17:51:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/04/11 07:57), Richard Purdie wrote:
> On Mon, 2011-04-18 at 07:54 +0200, Martin Jansa wrote:
> > On Thu, Mar 31, 2011 at 03:26:39PM +0100, Richard Purdie wrote:
> > > On Thu, 2011-03-31 at 12:40 +0200, Martin Jansa wrote:
> > > > * This was done generically in bitbake.conf this should be done on
> > > >   demand and distutils based recipes seem to need it. So we define it
> > > >   here.
> > > > * imported from OE 629ae87eadeec1068c3778e14488b549029adffb
> > > > 
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > > >  meta/classes/distutils-common-base.bbclass |    2 ++
> > > >  1 files changed, 2 insertions(+), 0 deletions(-)
> > > > 
> > > > diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
> > > > index f66a5cd..b6caf24 100644
> > > > --- a/meta/classes/distutils-common-base.bbclass
> > > > +++ b/meta/classes/distutils-common-base.bbclass
> > > > @@ -4,6 +4,8 @@ EXTRA_OEMAKE = ""
> > > >  
> > > >  export STAGING_INCDIR
> > > >  export STAGING_LIBDIR
> > > > +# libtool 2.4 does not export with LDFLAGS but distutils need it
> > > > +LDFLAGS_prepend = "-L${STAGING_LIBDIR} "
> > > 
> > > This should not be needed, the linker itself should automatically look
> > > in that path at link time. What problem are you seeing?
> > 
> > sorry for delay, my previous reply was refused by mailman at Mon, 04 Apr 2011
> > with "The message's content type was not explicitly allowed", maybe PGP
> > sign is not allowed? ;/.
> > 
> > 
> > when building any python extra module ie python-numeric I get error like
> > this
> > 
> > | arm-oe-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/OE/shr-core/tmp/sysroots/nokia900 -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -g -feliminate-unused-debug-types -fPIC -IInclude -IPackages/FFT/Include -IPackages/RNG/Include -I/OE/shr-core/tmp/sysroots/arm-oe-linux-gnueabi/usr/include/python2.6 -I/OE/shr-core/tmp/sysroots/nokia900/usr/include/python2.6 -c Src/ufuncobject.c -o build/temp.linux-x86_64-2.6/Src/ufuncobject.o
> > | arm-oe-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb -D__SOFTFP__ --sysroot=/OE/shr-core/tmp/sysroots/nokia900 -shared -Wl,-O1 -Wl,--hash-style=gnu -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -g -feliminate-unused-debug-types build/temp.linux-x86_64-2.6/Src/_numpymodule.o build/temp.linux-x86_64-2.6/Src/arrayobject.o build/temp.linux-x86_64-2.6/Src/ufuncobject.o -L/usr/lib -lpython2.6 -o build/lib.linux-x86_64-2.6/_numpy.so
> > | /OE/shr-core/tmp/sysroots/x86_64-linux/usr/libexec/armv7a-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.5.3/ldERROR: Function 'do_compile' failed (see /OE/shr-core/tmp/work/armv7a-oe-linux-gnueabi/python-numeric-24.2-ml1/temp/log.do_compile.16227 for further information)
> > | : warning: library search path "/usr/lib" is unsafe for cross-compilation
> > | /OE/shr-core/tmp/sysroots/x86_64-linux/usr/libexec/armv7a-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.5.3/ld: skipping incompatible /usr/lib/libc.so when searching for -lc
> > | /usr/lib/libc.a: could not read symbols: File format not recognized
> > | collect2: ld returned 1 exit status
> > | error: command 'arm-oe-linux-gnueabi-gcc' failed with exit status 1
> > | FATAL: python setup.py build_ext execution failed.
> > NOTE: package python-numeric-24.2-ml1: task do_compile: Failed
> > ERROR: Task 4075 (/OE/shr-core/meta-shr/recipes-devtools/python/python-numeric_24.2.bb, do_compile) failed with exit code '1'
> > 
> > in oe we had the same problem after switching to libtool 
> > with sysroot support IIRC and this was fix for it 
> > (and it helps with oe-core too)
> 
> This isn't a libtool problem, we've patched that problem out in oe-core
> (and I think in OE-dev too now). In this case something is adding
> "-L/usr/lib" to the compiler arguments and that is the reason things are
> failing. I'd suggesting finding out where that is coming from and fixing
> it at source. Yes, it so happens adding other search paths first masks
> the problem but it is just masking it, its not a proper fix.

Its added by distutils IIRC when I fixed it in oe.dev with this rev
629ae87eadeec1068c3778e14488b549029adffb this would nullify the addition
since we now have staging libdir before it. 

> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


