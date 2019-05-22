Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 575C97D8EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 11:21:04 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id l17so1724035otq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 04:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ChKWTaLPKmvwq8LdOSlcNnjb2hmKz9/JhLutLlc0kEs=;
	b=eKCSjOIL+3CkYCR/d6K+LoJIhOus9CrEexSswR/Dv1Ig5zjVKwCg5vtO4Behoco7WB
	OiIYTn8S3R+EGhcsa4aZYSmbZvQO9QWF0hoDjDb3Zq3UUV86UkJE6K3YgUduSZ843swy
	0xZKMZyd4yGzyXof4uWAzXoP1pcSWO5wGfw3P3+1YllozKyHQ8YjVhlLkA6sltRXXfYl
	7hYZ1TR/n63MNdI6oi2Ar/0V7ZjPG1x9BxuMs3wJwMgR8LqSvucszLrLBR/3pzQRel/o
	/ikKhGaSPwrVUt8Ibb9PDYDrlLEBWQnaStpF6+SSHu9flvJRJKMxdTyhC29vBlRpR1Gm
	ihAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ChKWTaLPKmvwq8LdOSlcNnjb2hmKz9/JhLutLlc0kEs=;
	b=tdK8Y0oB43/dpFTEnVtnP1j4OZIu3KfXP2L0xiaGNQZepG7+mMMerzr5ezM7CHtfWk
	sxMBHkFFOn+rNQDOnWg14fFxdj0vRunnm6O+OVaJ5b0qVoBkpKhkmi3N81lFvtugbW+0
	05ISNPIwxTlH+bIePhFdPnbvEFGD0+b3iKPJ4dkdPVwK4hrir9zce1VEiNl6kl9g/LPS
	SDT5JjaGB3ODbdsoTws+chE4FlTH8P6iQSxFCMEEgo4T4B6CSORFVHPYD5GzhVEEFSW4
	VCo9rmPW46eKN3Fu1koBun1wYyszya6qqYxRF4nGcBmbEu5XaqOADY2kbJZDdYyG+0ru
	TCVA==
X-Gm-Message-State: APjAAAVQHQVaK5Ph/fa7yEYkAW7LCpSXclh22t2beiA70JjI9hoCMD7C
	BejvQwUtrQcdvGQi8iWpmgqS/8eBRJj36BV+pGI=
X-Google-Smtp-Source: APXvYqxNwCI1OWtU1lZUpzRuVXqRB5v24+KjGRZXrYeeFLRO6hub5VMzlO5VCc9OInq/5XiacVj4RFgoN4pdguS/eds=
X-Received: by 2002:a9d:170e:: with SMTP id i14mr16973418ota.263.1558524065304;
	Wed, 22 May 2019 04:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190521161158.45329-1-alex.kanavin@gmail.com>
	<CAMKF1so7ASfBEknz4t727WGHvSOvJ2z=v87m0o=iZW4VdqFztw@mail.gmail.com>
	<CANNYZj8cSb0_7fRhG=bbizctTnaQg53hVwSzOu5WoWr9ywbMKQ@mail.gmail.com>
	<33700e11097f8b98ea98acfce06977e24c3bfb8d.camel@linuxfoundation.org>
In-Reply-To: <33700e11097f8b98ea98acfce06977e24c3bfb8d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 May 2019 13:20:54 +0200
Message-ID: <CANNYZj-v5GzbKcoX1_WF=nUosLPkXBT3tovmHvXZ2hFLocu0+g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libmodulemd: fix erroneous linking against v2 library when v1 was requested
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
X-List-Received-Date: Wed, 22 May 2019 11:21:04 -0000
Content-Type: text/plain; charset="UTF-8"

I'm not sure that would work, as at do_rootfs time both createrepo_c
(v2 user) and libdnf (v1 user) need to be present in the
sysroot-native, and so v1 and v2 files would clash at that point
(libmodulemd.so would be provided by both).

I am kind of hoping that libdnf would migrate off v1 to v2, and we
could then simply disable v1 altogether. So far it hasn't happened,
and libdnf update is now also blocked by the c++ code that older
compilers don't like, so I'd leave thing as they are for now.

Alex

On Wed, 22 May 2019 at 13:08, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-05-22 at 12:28 +0200, Alexander Kanavin wrote:
> > On Wed, 22 May 2019 at 04:04, Khem Raj <raj.khem@gmail.com> wrote:
> > > > +
> > > > + pkg.generate(
> > > > +-    libraries : modulemd_v1_lib,
> > > > ++    libraries : '-l:libmodulemd.so.1',
> > >
> > > shouldn't it be generating a separate package for v1 ?
> > > hardcoding linker paths seems a bit hackish here, is it going
> > > to generate a .pc file with .so.1 version ?
> >
> > The problem is that both v2 and v1 are installed into the sysroot; we
> > don't have a mechanism to choose one or the other via DEPENDS (unlike
> > desktop distros where you can install -v1-dev or -v2-dev package for
> > your build).
> > Then both v2 and v1 .pc files (without this patch) refer to
> > '-lmodulemd' which in our case always resolves to v2 library.
> >
> > Wth the patch the generated v1 .pc will look like this, while v2
> > continues to use the original '-lmodlulemd' in Libs:
> >
> > prefix=${pcfiledir}/../../../usr
> > libdir=${prefix}/lib
> > includedir=${prefix}/include
> >
> > Name: modulemd
> > Description: Module metadata manipulation library
> > Version: 1.8.10
> > Requires: glib-2.0, gobject-2.0
> > Libs: -l:libmodulemd.so.1
> > Cflags: -I${includedir}/modulemd
>
> FWIW I think if there were two different recipes we could select which
> was in the sysroot through DEPENDS?
>
> Cheers,
>
> Richard
>

