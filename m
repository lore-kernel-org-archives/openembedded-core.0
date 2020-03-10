Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 164EF61B4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 01:11:27 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id a33so4056480uad.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 18:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7bB3GYyljujI0LOCo6QZCN5XcbGvK5kxqJBvj4JpcJI=;
	b=vQUcukUOmZqlPlxOgLkkJ/3l6wNhLRQjaJ8dS8MTtKhkrQiIC12rY2A5mDOvnyelXS
	eG6DHHvdODEh50clsUvjtU0rLRhoOn4+Cm0rK31epn2409EuoG59vTRxDWfAM4oiJyNK
	JF3mPDEVvP18W4Jeqv0Y9JpPg6ABRsIZ6No5Lirh3sh1kUcHtkM2ISvZmNq6TV4vVZgG
	6fMwNCEMcy3ZTysoKF2+89Ju9c7m7OgwwM/K3GLpnF6Gw50VhrH4OS8qHuqsJk6eNyNS
	MmPBhpB/5C82+5z4r4ygJO7MSt5ZqR42pJYNHclOs7bmGLRtQ10EQ2xmFAV/f+KwUvoN
	imjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7bB3GYyljujI0LOCo6QZCN5XcbGvK5kxqJBvj4JpcJI=;
	b=GwspUNYl+Ga7bUD0lFZJWhJkFtWvEmuF68aYAWsi15XTmao3pdr/8RiI32Nbd4Wccu
	tX46/FUWSdEEuKuewZhExXcS7QAQ7PVxT71dnmox889wD8oBPG4ZSHYQf0g/t1/zoxt/
	WyEF2hYKDSGPEomNrhphDBiR7XqcGk89GyB9Jbmc54PQUk2sGVHHK/w8s2ChF+pTyoRF
	V0NVUJJqwfhouvayWD+UHGb0q4stjo7Xu0OgZtIpcceoIM8bLw6Ot3xt42gFMZzazFwc
	r8+VtsyeFZD3g2UfZsh77+p2neyuBL9ZC9j5a3cbaviC9k7CjQfcVFdJx8/80NwzPSmm
	TXaA==
X-Gm-Message-State: ANhLgQ2PET3iG66gGtGRyeiJNpeO+sbF9cDhbT0vKYKUMwOj9Haz+IXH
	+dKL2LQHBk9g3r3fg6Gs1kbxovWBxBzex/IShG4=
X-Google-Smtp-Source: ADFU+vtkzm61DPf63k31EQU8cj/6QQdcrVsxEseV3q24AKhg39ChtZl/jaMVEEOG2g+BlgoeFsgkB0oNk18EnD5i99U=
X-Received: by 2002:ab0:2858:: with SMTP id c24mr10444016uaq.92.1583802688204; 
	Mon, 09 Mar 2020 18:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200309234454.1387958-1-raj.khem@gmail.com>
	<CAJ86T=VLYoXU732i1np59BjQVuQp=qy+DUHbQAiWhGgnvQBi6Q@mail.gmail.com>
	<07048b68-f3c4-5196-ec72-63a5aeddccd7@gmail.com>
In-Reply-To: <07048b68-f3c4-5196-ec72-63a5aeddccd7@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 9 Mar 2020 18:11:16 -0700
Message-ID: <CAJ86T=U2ZefKL-We+TKAOAc-7y51ZZWsRsUq34t4QBn7WP0rgw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ruby: Use arm32 for coroutines on 32bit-arm
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
X-List-Received-Date: Tue, 10 Mar 2020 01:11:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 9, 2020 at 5:33 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On 3/9/20 4:52 PM, Andre McCurdy wrote:
> > On Mon, Mar 9, 2020 at 4:44 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> in 2.7 [2] ruby enabled ucontext for coroutines on arm32 but it does not
> >> work for musl since it uses glibc specific functions e.g.
> >> getcontext/swapcontext/swapcontext also see [1]
> >>
> >> This patch reverts back to using arm32 implementation for coroutines on
> >> arm
> >>
> >> [1] https://bugs.ruby-lang.org/issues/16455#change-83442
> >> [2] https://github.com/ruby/ruby/commit/6c6bf9ffcbfeb8be9d9c342e7604b74ec819e88a#diff-7fccec8474e2184cd2518046bf39d54cL10
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta/recipes-devtools/ruby/ruby_2.7.0.bb | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta/recipes-devtools/ruby/ruby_2.7.0.bb b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
> >> index 268b4bebd9..884bb0ef44 100644
> >> --- a/meta/recipes-devtools/ruby/ruby_2.7.0.bb
> >> +++ b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
> >> @@ -25,6 +25,8 @@ EXTRA_OECONF = "\
> >>      --with-pkg-config=pkg-config \
> >>  "
> >>
> >> +EXTRA_OECONF_append_arm_libc-musl = " --with-coroutine=arm32"
> >
> > Generally any _arm over-ride should either be duplicated for _armeb
> > too (or the commit message should explain why the over-ride is
> > specific to little endian ARM only).
>
> its just that I did not test it on armeb, and its assembly piece which
> would need some testing on BE before it is enabled.

The default should be to keep arm and armeb in sync, unless there's a
clear reason not to. If you want to test big endian ARM then that's
great, but if you don't then just keeping the two targets in sync is
better than leaving big endian ARM unfixed _and_ untested.

> >>  do_install() {> >>      oe_runmake 'DESTDIR=${D}' install
> >>  }
> >> --
> >> 2.25.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

