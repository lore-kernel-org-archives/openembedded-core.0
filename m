Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE18798B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 12:54:09 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id c190-v6so11283079oig.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 05:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GrA0nZHYvTUT+XF+qItV5H/t54N+JiXSLfb7bit39K0=;
	b=gyN8xaGWqpd4c8aDKFHbjX2Cr6EMUVzAPpzWt1ALFdNfwF2uUbBtsdNuikmjC0MXVu
	uQQ7EzQnuxol0yf5iNZxHW/xSGpWqM3P7ZX1R1a5EE0rHyZIHiJ0qdPsy8dffHPAxtfp
	Xsi6uZxYhNhXPpxcE/RE+WjEFXG3VGOoH5bmMLwkRaKKiqkd/IG/uv5G/mLq6KSrEDd8
	HcZwvaR0Im49YPcj3lnsT6VTAoKwNVmhGCgaQPYCJ9wL0p9gmySJ/wbDgI5yv9crViSi
	CoPGL2M9bNAc0s4qZZXOkLXSGAQ8KrDUxL+4oiDgaNG4cr85n3Vug9LqeAtDTV/I43+m
	1uZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GrA0nZHYvTUT+XF+qItV5H/t54N+JiXSLfb7bit39K0=;
	b=EKo5Sdu763HXiFx+5vviLTMqOmbin9c7lH7oNatS6QSCENctaY8kwthB85wDPwPfi8
	nMG/xAAhcWgsaV8n0kfDUff2LTm91ITQOol2dhJjTiQXGw92Tmd5Flg23ZqeHCu3hyPN
	m4PeOatXqkuR+Vx3QwDS6Is7tcVKzI3Z0zG/WwiPsM/tz3xcS0PIgbvofVkCCUu+FIlz
	QO8190NjukCEKlCH/wLrn66UQRB7Pkqxms/WMbevPlUO7k24avmkG3h9blymoSB8nRUG
	ljcGHCgZZZOvLp8PfpyUp4mWAVJrnM2m3oJjVvNJs6+hTxHvwMwidjD6LW5Ti1Pz7USa
	X14Q==
X-Gm-Message-State: APzg51DRZCihBpZ2fVYBNFEQ8+5BIAmGKqciVHvLVz+xUHnpbb3DXQNQ
	b/lm1Cw/i3g9Ms4sljfJ//zvVQWXypXVzBVBgVXe/Q==
X-Google-Smtp-Source: ANB0VdaYV7wyx3U7pueuX8Ox46BSD10l11HBxGYpCxILRDDxWcA3rby7iNsoZGLS7YaWLNW7MFiHxkNyhiyGwW+qUOM=
X-Received: by 2002:aca:ecd0:: with SMTP id
	k199-v6mr1439124oih.227.1537534450483; 
	Fri, 21 Sep 2018 05:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180920204232.10583-1-abrodkin@synopsys.com>
	<20180920204232.10583-6-abrodkin@synopsys.com>
	<CAJTo0LbYHuG6E4LgQpZCDQ+XaM+rt0N683cP3nuPu-DojFEmSg@mail.gmail.com>
	<9bb4d4d54024982cb3a0b02222a45e12845cba85.camel@synopsys.com>
	<bb6c7d725f34a4bb5b08164268db7a2863aa1cf3.camel@synopsys.com>
In-Reply-To: <bb6c7d725f34a4bb5b08164268db7a2863aa1cf3.camel@synopsys.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Sep 2018 13:53:58 +0100
Message-ID: <CAJTo0La_MuDqcdy4brMRkiprQzAnAwo1omdGzz_=kDjgc1Hsvg@mail.gmail.com>
To: Alexey.Brodkin@synopsys.com
Cc: linux-snps-arc@lists.infradead.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 5/9] libgpg-error: Add ARC support
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
X-List-Received-Date: Fri, 21 Sep 2018 12:54:09 -0000
Content-Type: text/plain; charset="UTF-8"

Can you check that v3 works with x86-64 targets?

ERROR: libgpg-error-1.32-r0 do_compile: Function failed: do_compile
(log file is located at
/data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/temp/log.do_compile.13345)
ERROR: Logfile of failure stored in:
/data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/temp/log.do_compile.13345
Log data follows:
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function do_compile
| cp: cannot stat
'/data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/libgpg-error-1.32/src/syscfg/lock-obj-pub.x86_64-pc-linux-gnu.h':
No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/temp/log.do_compile.13345)

Ross
On Fri, 21 Sep 2018 at 13:51, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> Hi Ross,
>
> On Fri, 2018-09-21 at 14:31 +0300, Alexey Brodkin wrote:
> > Hi Ross,
> >
> > On Fri, 2018-09-21 at 11:43 +0100, Burton, Ross wrote:
> > > On Thu, 20 Sep 2018 at 21:44, Alexey Brodkin
> > > <Alexey.Brodkin@synopsys.com> wrote:
> > >
> > > >         case ${TARGET_ARCH} in
> > > >           aarch64_be) TUPLE=aarch64-unknown-linux-gnu ;;
> > > > +         arc)        TUPLE=i686-unknown-linux-gnu ;;
> > > >           arm)        TUPLE=arm-unknown-linux-gnueabi ;;
> > > >           armeb)      TUPLE=arm-unknown-linux-gnueabi ;;
> > > >           i586|i686)  TUPLE=i686-pc-linux-gnu ;;
> > >
> > > Is that right?  Just saying, it looks wrong...
> >
> > That's indeed a hack :)
> >
> > libgpg-error [upstream] patch mentioned in this commit
> > adds support of ARC architecture as an alias to "i686-unknown-linux-gnu"
> > (that's because headers are the same).
> >
> > But since I provided generate headers only for arc-xxx-linux-uclibc
> > (and there's no guarantee glibc header matches uclibc) Werner only
> > added support for uClibc.
> >
> > That said if we were building uClibc toolchain in OE then no mapping
> > would be required at all but for Glibc toolchain we still need to
> > use explicit header for ARC and the one that matches our needs is
> > essentially "ock-obj-pub.i686-unknown-linux-gnu.h", see
> > https://lists.gt.net/gnupg/devel/84636#84636
>
> So this is fixed now in libgpg-error upstrema, see
> http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=f4f0da74f526d7e35cedbc2e93454df6440dbfa5
>
> I'll send v3 soonish with that patch back-ported.
>
> -Alexey

