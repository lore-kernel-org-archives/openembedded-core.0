Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8EDA67BDED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 10:44:28 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y1so11784036wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 02:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Lsyk565NodAi6dfhvSiIeDdxgAygrw8lwltwI616TcU=;
	b=Q7DrOnx7MIYA+8SGZkJSCm19xcZCf8beMQYHdrwZkUufzbELE81tPkARkQ8hsSMpgR
	jy5CU3y7RlPTRbAGCKr4AkGMjYRHBpwxYuw4NFMqPhM59/qql2lXNXr4lAows0GXI2ld
	FVmo+nXUF7Yj7F+YeqXvgzuig/au8eatdWiTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Lsyk565NodAi6dfhvSiIeDdxgAygrw8lwltwI616TcU=;
	b=Yf5Std36P/FSAMM26e+PyFSP8ZepIplP5E7eb3ND0bD6vAWC/rsN7LnrPV+hh2vjPw
	2P0+r+CuKpBKWWHGzDiQlQz0I6MaVT4PqmZ3Y9Qsy+aKx0KRedwXjvvKSaKzoBT53dC2
	W++hA37KQcHJ3NBHzzCQIQ3v29twa3iL7xxmAbVPBatJNXe9aLwUt8Ot1q4MsvMsQ4F1
	5dE6z9omwBssrotgeVoR6y6oTMzjl9ZxDsoyQdeAFnIp6U0avy2Z3x+dxy5MdFnn5jfs
	slDmOH/fK/K1Ypo+jUNdKCStwnqOS/LGUo2U6rc4nJocCJzRKnz2RwRzi0R4QTssiKbX
	vcAw==
X-Gm-Message-State: AA+aEWZeQbEuOq1fBlm1gx9imKD+KQcSJcB60J/Y/I7o0aTX7DMZxtmI
	n91+Pp1cZ9h6nIRhAowNEzkSsQ==
X-Google-Smtp-Source: AFSGD/X2CAX5VPfAhODD4JZ4LYzQaVuJowQ27a/qEgLeBxVygTmBsBjkIdlB+oR78gaX64aRuWqh1g==
X-Received: by 2002:a1c:4955:: with SMTP id w82mr11681439wma.33.1545043469010; 
	Mon, 17 Dec 2018 02:44:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y185sm9376226wmg.34.2018.12.17.02.44.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Dec 2018 02:44:28 -0800 (PST)
Message-ID: <dee546f2355d673d9364e591d56a09be975fd36f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Serhey Popovych <serhe.popovych@gmail.com>, Andre McCurdy
	<armccurdy@gmail.com>
Date: Mon, 17 Dec 2018 10:44:27 +0000
In-Reply-To: <5ce44bd3-a1eb-a151-41e7-18dfc2789270@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
	<1544810082-22164-8-git-send-email-serhe.popovych@gmail.com>
	<CAJ86T=XQqr-3Jgg1xMPkHz0Qx_KwPxpv3d8xoeKuR5YcP-o00w@mail.gmail.com>
	<abe4d45b54c8d323e8d2f04ea01d04367a19beb2.camel@linuxfoundation.org>
	<5ce44bd3-a1eb-a151-41e7-18dfc2789270@gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/13] musl: Ensure GLIBC_LDSO symlink target does not exist on reinstall
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
X-List-Received-Date: Mon, 17 Dec 2018 10:44:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-12-17 at 11:49 +0200, Serhey Popovych wrote:
> Richard Purdie wrote:
> > On Fri, 2018-12-14 at 11:09 -0800, Andre McCurdy wrote:
> > > On Fri, Dec 14, 2018 at 9:57 AM Serhey Popovych
> > > <serhe.popovych@gmail.com> wrote:
> > > > Otherwise do_install task will fail on rebuild.
> > > > 
> > > > Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> > > > ---
> > > >  meta/recipes-core/musl/musl_git.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-
> > > > core/musl/musl_git.bb
> > > > index 9cc875c..4593cde 100644
> > > > --- a/meta/recipes-core/musl/musl_git.bb
> > > > +++ b/meta/recipes-core/musl/musl_git.bb
> > > > @@ -61,7 +61,7 @@ do_install() {
> > > >         oe_runmake install DESTDIR='${D}'
> > > > 
> > > >         install -d ${D}${bindir}
> > > > -       rm -f ${D}${bindir}/ldd
> > > > +       rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
> > > 
> > > The correct fix here is actually to remove this line entirely.
> > > The
> > > official ruling is that there should be no expectation that re-
> > > running do_install should work and patches to make it work are
> > > not
> > > acceptable.
> > > 
> > >   
> > > http://lists.openembedded.org/pipermail/openembedded-core/2018-September/273723.html
> > 
> > Lets be clear, re-running the do_install task *is* supported and
> > works
> > today. It is actually meant to work when re-run. do_install clears
> > out
> > ${D} at its start so we can assume in do_install functions that it
> > is
> > empty at the start of the function.
> 
> It seems do_install does not clear ${D} or I do something wrong:
> 
> $ bitbake core-image-sato
> <success>
> 
> <Adjust gcc/musl recipe and then run>
> 
> $ bitbake core-image-sato
> 
> ...
> /image/usr/lib64/libc.so
> /home/serhe/devel/git/openembedded-core/build/tmp-
> musl/work/ppc64p8le-oe-linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-
> r0/image/lib64/ld-musl-powerpc64le.so.1
> > > true
> > Traceback (most recent call last):
> >   File "/home/serhe/devel/git/openembedded-core/scripts/lnr", line
> > 21,
> in <module>
> >     os.symlink(target, linkname)
> > FileExistsError: [Errno 17] File exists: 'image/usr/lib64/libc.so'
> > ->
> '/home/serhe/devel/git/openembedded-core/build/tmp-
> musl/work/ppc64p8le-oe-linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-
> r0/imageNone'
> > WARNING:
> /home/serhe/devel/git/openembedded-core/build/tmp-
> musl/work/ppc64p8le-oe-linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-
> r0/temp/run.do_install.77856:1
> exit 1 from 'lnr
> /home/serhe/devel/git/openembedded-core/build/tmp-
> musl/work/ppc64p8le-oe-linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-
> r0/image/usr/lib64/libc.so
> /home/serhe/devel/git/openembedded-core/build/tmp-
> musl/work/ppc64p8le-oe-linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-
> r0/imageNone'
> > ERROR: Function failed: do_install (log file is located at
> /home/serhe/devel/git/openembedded-core/build/tmp-
> musl/work/ppc64p8le-oe-linux-musl/musl/1.1.20+gitAUTOINC+39ef612aa1-
> r0/temp/log.do_install.77856)
> ERROR: Task
> (/home/serhe/devel/git/openembedded-core/meta/recipes-
> core/musl/musl_git.bb:do_install)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2713 tasks of which 2703 didn't need
> to
> be rerun and 1 failed.
> 
> ...
> 
> > The only problem may be if you're manually re-running the
> > do_install
> > script in WORKDIR/temp. If you're doing that, you have other
> > problems
> > like the missing fakeroot environment to handle so the non-empty
> > directory is only one minor issue, you're missing other setup
> > pieces as
> > well.
> 
> I haven't play with do_install scripts in WORKDIR/temp. Only
> do_configure and do_build. But anyway thank for pointing for
> potential
> problems.

I just tried "bitbake musl", then "bitbake musl -c install -f" which
should have reproduced the above but it worked fine. Admittedly I was
using MACHINE=qemux86-64. Do those two steps break for you?

Something isn't adding up here and I'd like to get to the bottom of
it...

Cheers,

Richard





