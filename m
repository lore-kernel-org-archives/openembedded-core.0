Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id BB1037F4C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 20:57:58 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id t8so11225317lfc.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 13:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6PaOugh3VEEf6IUbT0nVpV3NkhB0ZjObKCkqGcprlkM=;
	b=YtYXt7OM/8e68nVmWFReHWwNBH681V6OxWW3hyDixDmOOSHfraL8ERgT9TWTbyyCWW
	eG3hIF/m813gGwF+qD19VIbleKfBfU1heIRqKiJfHvIYpGEkDbWlSASLQcuTqI933kPE
	3gpjrN5MMsMZhff6xmtOzWgAMwD+/AawY7+Ydq9aIL+6A4aER6KYozVyTJWjg0IfCvXL
	5wavv08Z9eJIj34WsQjTLix00enIyGNr4mAWsNnKlXh1zQGOQ1CU3A6eQcnj/AzBw9vt
	bFyVJU88haYeNDx2zpPDXYLepDO13+iWNjGqwQeFn/mX3FfGfMVGkUaAK02ZccyyRuPx
	XAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6PaOugh3VEEf6IUbT0nVpV3NkhB0ZjObKCkqGcprlkM=;
	b=eCoT7iRbcb0+MeeH2VHEAzYcirwVWCYeUI4CFMQIwzPVgARjfgo105edee5l/OdX8o
	+jwJEBFd85tL7HBZPzHBWmtBPmvi0zBojk1my2zoQNeBY1+D/SpfdYrW6a/gxCoBwGM+
	vIIYeVI7fljCuZfMuLqvs/JNuYMUdY/MxakTXzDycv7n7eGDDqztMwltHDtBL8kKNlti
	LCPbEiEk/FNSPrgB/ESAShdsWoev6CE9qGbz0AetzIxH2mICOOq7spXOHqxZjF+sBVRn
	PR0RLpbRNbK8gCf/r1Je5U61G8NkTwPdjG3RJDjBS2u0h7Acq/xc4Z05HE5ILME9+Kyf
	Pr6Q==
X-Gm-Message-State: APjAAAVhBXo6w6Rx6SeByUqJSs8pia8w7oV0XAa2+fZIFvrWLrrBOw/3
	CZGSdr48yLWPQrzhLkvP411Ns4JRRm5G4FmoVRY=
X-Google-Smtp-Source: APXvYqwxgvzwisUxM8ThhFaFcIlibbw7AgGSIfyrHA3logBZ3rrH8J99oDaSuc+kbHq71ud5JsFUJ+2TlDlJf9skfro=
X-Received: by 2002:a19:ac04:: with SMTP id g4mr16489276lfc.63.1571691478994; 
	Mon, 21 Oct 2019 13:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571688520.git.bruce.ashfield@gmail.com>
	<eb27cbf9e4e86187a79967546674a0156d722c16.1571688520.git.bruce.ashfield@gmail.com>
	<20191021202444.GB1500@jama>
In-Reply-To: <20191021202444.GB1500@jama>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 21 Oct 2019 16:57:47 -0400
Message-ID: <CADkTA4O1v-GZi-mkt866dpazowHsGZPrjwPuLi_Ry8vxZn8aqA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] perf: drop 'include' copy
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
X-List-Received-Date: Mon, 21 Oct 2019 20:57:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 21, 2019 at 4:24 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Mon, Oct 21, 2019 at 04:16:18PM -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > The copy of the kernel's top level include directory is not
> > required to build perf. We have both the linux-libc-headers and
> > perf's captured/copied headers for what it requires.
> >
> > The copy of the kernel's headers is leading us to multiple smaller
> > fixes to ensure that the various .h files are in sync. We can
> > remove the copy and all of the sync checks, and perf still builds
> > and executes correctly.
>
> Maybe reorder this before "[OE-core] [PATCH 3/6] perf: fix v5.4+ builds"
> as it removes most of what was possibly incorrectly added there (see 2nd
> review)
>

I left this here on purpose, since it is only RFC. The other patches
as they appear in the series are required to build against 5.4+, but
this is optional.

Bruce

> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 9 ---------
> >  1 file changed, 9 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> > index 191305969c..5f0ba7c180 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -106,7 +106,6 @@ EXTRA_OEMAKE += "\
> >  EXTRA_OEMAKE_append_task-configure = " JOBS=1"
> >
> >  PERF_SRC ?= "Makefile \
> > -             include \
> >               tools/arch \
> >               tools/build \
> >               tools/include \
> > @@ -248,14 +247,6 @@ do_configure_prepend () {
> >      # so we copy it from the sysroot unistd.h to the perf unistd.h
> >      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
> >      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/include/uapi/asm-generic/unistd.h
> > -
> > -    # bits.h can have the same issue as unistd.h, so we make the tools variant take precedence
> > -    [ -e ${S}/tools/include/linux/bits.h ] && install -D -m0644 ${S}/tools/include/linux/bits.h ${S}/include/linux/bits.h
> > -
> > -    [ -e ${S}/tools/perf/util/include/linux/ctype.h ] && install -D -m0644 ${S}/include/linux/ctype.h ${S}/tools/perf/util/include/linux/ctype.h
> > -
> > -    [ -e ${S}/include/uapi/linux/kvm.h ] && install -D -m0644 ${S}/include/uapi/linux/kvm.h  ${S}/tools/include/uapi/linux/kvm.h
> > -    [ -e ${S}/include/uapi/linux/sched.h ] && install -D -m0644 ${S}/include/uapi/linux/sched.h  ${S}/tools/include/uapi/linux/sched.h
> >  }
> >
> >  python do_package_prepend() {
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

