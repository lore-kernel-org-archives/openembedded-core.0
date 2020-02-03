Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id C6B4560C0D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 21:33:45 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id dc19so17626460edb.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 13:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=knVc/E7O0qZZnMNTLW25K6ipLr9Pq47cGjpKr8hlRaQ=;
	b=ueoBVNjTjvB5gDkXMI0V7L3uM9PapV/WNiZIZPnh5jekapKniGU3FSoNcHa1698qWg
	6yXNjbVUgwiwB1tY2he6rakfR6NXqvVw1axlF6SiQRMOFex0w3TZ+VI8ZJE2Ho8ylA3S
	b06dp+si2SukQJ5gP3uae/toG91QRmnpPI7AlKrtoBJc3Rt1ZiBMeUtRTYnUXgjDElnK
	DXgD4MnRlfz5pdboNSKlr6KmcD0PorLgq9BfMqprMqcfGDkFyETLMfTB5UHmrzDrf49v
	p28jrZe6JtOENMquvu4R26qvWq7Ct+kkITcK1jxAipxBGl6GUyUmoCV9L00cEM2u9EEw
	rHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=knVc/E7O0qZZnMNTLW25K6ipLr9Pq47cGjpKr8hlRaQ=;
	b=evCn1u5lJYmoZRBCSY/BQwNhbdI5teiklcu5bV/3pHNhS5Wb9VivE8VlgEwJ1c96iz
	/DsciRa+91di84/jxAMJFoCYWyRz8wbBjzqYl1w1oJ1umcoDRAUlHBXkEMPx6bbbNdOD
	0pOns4leoXZzNtjBqMu/sVms6JYc7kcaeMl0MRln+XEPf6rVTVsdzgnnhnkF55TTqQzd
	+CNcLpHreqoy9Hg6vQTtzixVIofs1sFWu9Dc2L1mjjQ+1UtJNVBf1jL3R/Fwm4tD52ZQ
	b5NigQMOBO+H0QKugno+EGgSOyh7Pq/ePkufsbvJkHsRFRzFABhe9saGjbAVmqmdf0m2
	ZKkQ==
X-Gm-Message-State: APjAAAXTTkBstMUSMemEqTpg2slsclT14AmHFWjlt4n1IR9ZD2WlmBZP
	beXm5uiszixnoRmvpMg0+d9dnQrSYrY9dTCVmoE1quxQ
X-Google-Smtp-Source: APXvYqwaSDsK8aK+zDCNqcEXLEJGE5DXQF1u9gAlkbbMp7HJT5BvY+mvy9C7sAHVWsx9ht9CTe65ZfoSS0nwRtbo828=
X-Received: by 2002:a17:906:5787:: with SMTP id
	k7mr23507893ejq.37.1580765623406; 
	Mon, 03 Feb 2020 13:33:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
	<e6b6484beb730f63714567d89da06834fbbbbd3c.1580248809.git.bruce.ashfield@gmail.com>
	<CAMKF1so3M-Zza8Oz54Z=pXmykU4686nKWL3JLK8f-bBde-ueiA@mail.gmail.com>
	<CA+chaQehJEiOLysVA8Sf86tGJ-cVmr+Z7FsPt0LGHLEMQLzEtQ@mail.gmail.com>
	<CAMKF1srWkwKOAeP2+nxmuyMCO40zZ6Q5U9s04i8fhoFyLXPr9A@mail.gmail.com>
	<CADkTA4PO7OL0MsE39imy+C9R1gGSLJyBGGRiYWs05w3oJuAMdA@mail.gmail.com>
	<20200203173753.dcrz2qokzecl4bsx@jama>
	<CADkTA4N5N1eFQWaUgqh89hrLf-OgHzDiYNvyBjU9HaCjLt9zvQ@mail.gmail.com>
In-Reply-To: <CADkTA4N5N1eFQWaUgqh89hrLf-OgHzDiYNvyBjU9HaCjLt9zvQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Feb 2020 16:33:31 -0500
Message-ID: <CADkTA4OnX+O3wfE9nkVTB4zjn40ZN6BsTetQXDWtLHBxsU3TxA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-yocto: introduce 5.4 recipes
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
X-List-Received-Date: Mon, 03 Feb 2020 21:33:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2020 at 12:51 PM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> On Mon, Feb 3, 2020 at 12:37 PM Martin Jansa <martin.jansa@gmail.com> wro=
te:
> >
> > On Mon, Feb 03, 2020 at 12:11:31PM -0500, Bruce Ashfield wrote:
> > > On Mon, Feb 3, 2020 at 11:45 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > >
> > > >
> > > > On Mon, Feb 3, 2020 at 8:42 AM Martin Jansa <martin.jansa@gmail.com=
> wrote:
> > > >>
> > > >> It fails to build with gold enabled (ld-is-gold in DISTRO_FEATURES=
)
> > > >>
> > > >> First olddefconfig fails with "gold linker 'x86_64-oe-linux-ld' no=
t supported" and then it fails with a bit misleading error about oldnoconfi=
g (which is called only when oddefconfig fails) and then the whole log repe=
ats itself again, whole log.do_configure.4075 follows:
> > > >
> > > >
> > > > Since it=E2=80=99s a kernel piece I think asking for gold might be =
out of scope perhaps
> > > >
> > >
> > > Yah, there's not much we can do to fix that, but I suppose it could b=
e
> > > detected in the bbclass and a better error thrown ?
> > >
> > > > I have staged a fix in master next which helps a bit with eg mips I=
 had to disable bpf
> > >
> > > Is that the one with the missing header for on-target module build ?
> > > If so, i have a similar patch here.
> >
> > Do you have a fix for do_kernel_configcheck as well somewhere?
> >
> > I'm seeing a lot of warnings in default linux-yocto build for
> > qemux86-64 and the log.do_kernel_configcheck starts with long list of
> > missing python since python was removed from HOSTTOOLS.
> >
>
> I do yes.
>
> But it is only local, since I'm @ FOSDEM and have terrible access, and
> have been spending my extra time bisecting the remaining boot /
> runtime issues with 5.4
>
> I'll try and get some of the independent fixes out tonight before I
> travel tomorrow.

I didn't realize that my other series had merged, or I would have had
my commits cleaned up and ready to go sooner. Sorry about that.

I just sent the fixup for basic python3 functioning .. I have a couple
more correctness patches, but I don't have time to clean them up
tonight. But with what I sent, it should at least call python3 and
won't immediately thrown an error.

Cheers,

Bruce

>
> Bruce
>
> >
> > DEBUG: Executing python function do_kernel_configcheck
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > /usr/bin/env: 'python': No such file or directory
> > [mismatch (291)]: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/ke=
rnel-source/.kernel-meta/cfg/mismatch.txt
> >    There were hardware options requested that do not
> >    have a corresponding value present in the final ".config" file.
> >    This probably means you aren't getting the config you wanted.
> >
> > WARNING: [kernel config]: specified values did not make it into the ker=
nel's final configuration:
> >
> > ---------- CONFIG_MCORE2 -----------------
> > Config: CONFIG_MCORE2
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc-64/common-pc-64-cpu.cfg
> > Requested value:  CONFIG_MCORE2=3Dy
> > Actual value:     # CONFIG_MCORE2 is not set
> >
> >
> > ---------- CONFIG_ATA -----------------
> > Config: CONFIG_ATA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_ATA=3Dy
> > Actual value:     # CONFIG_ATA is not set
> >
> > Config: CONFIG_ATA_ACPI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_ATA_ACPI=3Dy
> > Actual value:
> >
> > Config: CONFIG_ATA_SFF
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_ATA_SFF=3Dy
> > Actual value:
> >
> > Config: CONFIG_ATA_BMDMA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_ATA_BMDMA=3Dy
> > Actual value:
> >
> > Config: CONFIG_ATA_PIIX
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_ATA_PIIX=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_ATA_ACPI -----------------
> > Config: CONFIG_ATA_ACPI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_ATA_ACPI=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_ATA_SFF -----------------
> > Config: CONFIG_ATA_SFF
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_ATA_SFF=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_ATA_BMDMA -----------------
> > Config: CONFIG_ATA_BMDMA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_ATA_BMDMA=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_ATA_PIIX -----------------
> > Config: CONFIG_ATA_PIIX
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_ATA_PIIX=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_PATA_SCH -----------------
> > Config: CONFIG_PATA_SCH
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_PATA_SCH=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_INPUT_MOUSEDEV -----------------
> > Config: CONFIG_INPUT_MOUSEDEV
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_INPUT_MOUSEDEV=3Dy
> > Actual value:     # CONFIG_INPUT_MOUSEDEV is not set
> >
> >
> > ---------- CONFIG_INPUT_EVDEV -----------------
> > Config: CONFIG_INPUT_EVDEV
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/input/input.cfg /OE/build/oe-co=
re/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4=
/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_INPUT_EVDEV=3Dy
> > Actual value:     # CONFIG_INPUT_EVDEV is not set
> >
> >
> > ---------- CONFIG_INPUT_TABLET -----------------
> > Config: CONFIG_INPUT_TABLET
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_INPUT_TABLET=3Dy
> > Actual value:     # CONFIG_INPUT_TABLET is not set
> >
> >
> > ---------- CONFIG_HID_WACOM -----------------
> > Config: CONFIG_HID_WACOM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_HID_WACOM=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_RTC_CLASS -----------------
> > Config: CONFIG_RTC_CLASS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_RTC_CLASS=3Dy
> > Actual value:     # CONFIG_RTC_CLASS is not set
> >
> >
> > ---------- CONFIG_RTC_DRV_CMOS -----------------
> > Config: CONFIG_RTC_DRV_CMOS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_RTC_DRV_CMOS=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_SERIAL_8250_PNP -----------------
> > Config: CONFIG_SERIAL_8250_PNP
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_SERIAL_8250_PNP=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_PARPORT -----------------
> > Config: CONFIG_PARPORT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_PARPORT=3Dm
> > Actual value:     # CONFIG_PARPORT is not set
> >
> > Config: CONFIG_PARPORT_PC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_PARPORT_PC=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_PARPORT_PC -----------------
> > Config: CONFIG_PARPORT_PC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_PARPORT_PC=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_PRINTER -----------------
> > Config: CONFIG_PRINTER
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_PRINTER=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_HID -----------------
> > Config: CONFIG_USB_HID
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_USB_HID=3Dy
> > Actual value:
> >
> > Config: CONFIG_USB_HIDDEV
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_USB_HIDDEV=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_HIDDEV -----------------
> > Config: CONFIG_USB_HIDDEV
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_USB_HIDDEV=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_SERIAL -----------------
> > Config: CONFIG_USB_SERIAL
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_USB_SERIAL=3Dy
> > Actual value:
> >
> > Config: CONFIG_USB_SERIAL_CONSOLE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_USB_SERIAL_CONSOLE=3Dy
> > Actual value:
> >
> > --
> > Config: CONFIG_USB_SERIAL_GENERIC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_USB_SERIAL_GENERIC=3Dy
> > Actual value:
> >
> > Config: CONFIG_USB_SERIAL_FTDI_SIO
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_USB_SERIAL_FTDI_SIO=3Dy
> > Actual value:
> >
> > Config: CONFIG_USB_SERIAL_PL2303
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_USB_SERIAL_PL2303=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_SERIAL_CONSOLE -----------------
> > Config: CONFIG_USB_SERIAL_CONSOLE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_USB_SERIAL_CONSOLE=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_EZUSB_FX2 -----------------
> > Config: CONFIG_USB_EZUSB_FX2
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_USB_EZUSB_FX2=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_SERIAL_GENERIC -----------------
> > Config: CONFIG_USB_SERIAL_GENERIC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_USB_SERIAL_GENERIC=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_SERIAL_FTDI_SIO -----------------
> > Config: CONFIG_USB_SERIAL_FTDI_SIO
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_USB_SERIAL_FTDI_SIO=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_SERIAL_PL2303 -----------------
> > Config: CONFIG_USB_SERIAL_PL2303
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_USB_SERIAL_PL2303=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_I2C_I801 -----------------
> > Config: CONFIG_I2C_I801
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_I2C_I801=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_IDE -----------------
> > Config: CONFIG_IDE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_IDE=3Dy
> > Actual value:     # CONFIG_IDE is not set
> >
> > Config: CONFIG_IDE_GD
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_IDE_GD=3Dy
> > Actual value:
> >
> > Config: CONFIG_IDE_GD_ATA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_IDE_GD_ATA=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_IDE_GD -----------------
> > Config: CONFIG_IDE_GD
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_IDE_GD=3Dy
> > Actual value:
> >
> > Config: CONFIG_IDE_GD_ATA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_IDE_GD_ATA=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_IDE_GD_ATA -----------------
> > Config: CONFIG_IDE_GD_ATA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_IDE_GD_ATA=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BLK_DEV_PIIX -----------------
> > Config: CONFIG_BLK_DEV_PIIX
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_BLK_DEV_PIIX=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_SATA_AHCI -----------------
> > Config: CONFIG_SATA_AHCI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_SATA_AHCI=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BLK_DEV_FD -----------------
> > Config: CONFIG_BLK_DEV_FD
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_BLK_DEV_FD=3Dm
> > Actual value:     # CONFIG_BLK_DEV_FD is not set
> >
> >
> > ---------- CONFIG_EEPROM_AT24 -----------------
> > Config: CONFIG_EEPROM_AT24
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_EEPROM_AT24=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_NVME_CORE -----------------
> > Config: CONFIG_NVME_CORE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_NVME_CORE=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BLK_DEV_NVME -----------------
> > Config: CONFIG_BLK_DEV_NVME
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_BLK_DEV_NVME=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_NET_CORE -----------------
> > Config: CONFIG_NET_CORE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_NET_CORE=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_ETHERNET -----------------
> > Config: CONFIG_ETHERNET
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_ETHERNET=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_NET_VENDOR_3COM -----------------
> > Config: CONFIG_NET_VENDOR_3COM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_NET_VENDOR_3COM=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_TYPHOON -----------------
> > Config: CONFIG_TYPHOON
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_TYPHOON=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_NET_VENDOR_BROADCOM -----------------
> > Config: CONFIG_NET_VENDOR_BROADCOM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_NET_VENDOR_BROADCOM=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_TIGON3 -----------------
> > Config: CONFIG_TIGON3
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_TIGON3=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_BNX2X -----------------
> > Config: CONFIG_BNX2X
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_BNX2X=3Dm
> > Actual value:
> >
> > Config: CONFIG_BNX2X_SRIOV
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_BNX2X_SRIOV=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BNX2X_SRIOV -----------------
> > Config: CONFIG_BNX2X_SRIOV
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_BNX2X_SRIOV=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BNXT -----------------
> > Config: CONFIG_BNXT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_BNXT=3Dm
> > Actual value:
> >
> > Config: CONFIG_BNXT_SRIOV
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_BNXT_SRIOV=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BNXT_SRIOV -----------------
> > Config: CONFIG_BNXT_SRIOV
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_BNXT_SRIOV=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_NET_VENDOR_ATHEROS -----------------
> > Config: CONFIG_NET_VENDOR_ATHEROS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_NET_VENDOR_ATHEROS=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_ATL1 -----------------
> > Config: CONFIG_ATL1
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_ATL1=3Dm
> > Actual value:
> >
> > Config: CONFIG_ATL1C
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_ATL1C=3Dm
> > Actual value:
> >
> > Config: CONFIG_ATL1E
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_ATL1E=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_ATL1C -----------------
> > Config: CONFIG_ATL1C
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_ATL1C=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_ATL1E -----------------
> > Config: CONFIG_ATL1E
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_ATL1E=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_ATL2 -----------------
> > Config: CONFIG_ATL2
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_ATL2=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_ALX -----------------
> > Config: CONFIG_ALX
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_ALX=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_NET_VENDOR_INTEL -----------------
> > Config: CONFIG_NET_VENDOR_INTEL
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_NET_VENDOR_INTEL=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_NET_VENDOR_AMD -----------------
> > Config: CONFIG_NET_VENDOR_AMD
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_NET_VENDOR_AMD=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_PCNET32 -----------------
> > Config: CONFIG_PCNET32
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_PCNET32=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_NET_VENDOR_REALTEK -----------------
> > Config: CONFIG_NET_VENDOR_REALTEK
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_NET_VENDOR_REALTEK=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_8139CP -----------------
> > Config: CONFIG_8139CP
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_8139CP=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_8139TOO -----------------
> > Config: CONFIG_8139TOO
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_8139TOO=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_R8169 -----------------
> > Config: CONFIG_R8169
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_R8169=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_NET_VENDOR_DLINK -----------------
> > Config: CONFIG_NET_VENDOR_DLINK
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_NET_VENDOR_DLINK=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_DL2K -----------------
> > Config: CONFIG_DL2K
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_DL2K=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_NET_VENDOR_MARVELL -----------------
> > Config: CONFIG_NET_VENDOR_MARVELL
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_NET_VENDOR_MARVELL=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_SKGE -----------------
> > Config: CONFIG_SKGE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_SKGE=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SKY2 -----------------
> > Config: CONFIG_SKY2
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_SKY2=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_JME -----------------
> > Config: CONFIG_JME
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
> > Requested value:  CONFIG_JME=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_FB_MODE_HELPERS -----------------
> > Config: CONFIG_FB_MODE_HELPERS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
> > Requested value:  CONFIG_FB_MODE_HELPERS=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_CONNECTOR -----------------
> > Config: CONFIG_CONNECTOR
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
> > Requested value:  CONFIG_CONNECTOR=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FB_UVESA -----------------
> > Config: CONFIG_FB_UVESA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
> > Requested value:  CONFIG_FB_UVESA=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_DRM_CIRRUS_QEMU -----------------
> > Config: CONFIG_DRM_CIRRUS_QEMU
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
> > Requested value:  CONFIG_DRM_CIRRUS_QEMU=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_WIRELESS -----------------
> > Config: CONFIG_WIRELESS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_WIRELESS=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_WLAN -----------------
> > Config: CONFIG_WLAN
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_WLAN=3Dy
> > Actual value:
> >
> > --
> > Config: CONFIG_WLAN_VENDOR_ATH
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_WLAN_VENDOR_ATH=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_MAC80211 -----------------
> > Config: CONFIG_MAC80211
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_MAC80211=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_CFG80211 -----------------
> > Config: CONFIG_CFG80211
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_CFG80211=3Dm
> > Actual value:
> >
> > --
> > Config: CONFIG_CFG80211_WEXT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_CFG80211_WEXT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_ATH_COMMON -----------------
> > Config: CONFIG_ATH_COMMON
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_ATH_COMMON=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_WLAN_VENDOR_ATH -----------------
> > Config: CONFIG_WLAN_VENDOR_ATH
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_WLAN_VENDOR_ATH=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_ATH5K -----------------
> > Config: CONFIG_ATH5K
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_ATH5K=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_ATH9K -----------------
> > Config: CONFIG_ATH9K
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_ATH9K=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_WEXT_CORE -----------------
> > Config: CONFIG_WEXT_CORE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_WEXT_CORE=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_WEXT_PROC -----------------
> > Config: CONFIG_WEXT_PROC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_WEXT_PROC=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_CFG80211_WEXT -----------------
> > Config: CONFIG_CFG80211_WEXT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_CFG80211_WEXT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BCMA -----------------
> > Config: CONFIG_BCMA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_BCMA=3Dm
> > Actual value:     # CONFIG_BCMA is not set
> >
> > Config: CONFIG_BCMA_HOST_PCI_POSSIBLE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> > Actual value:
> >
> > Config: CONFIG_BCMA_HOST_PCI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_BCMA_HOST_PCI=3Dy
> > Actual value:
> >
> > Config: CONFIG_BCMA_DRIVER_GMAC_CMN
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BCMA_HOST_PCI_POSSIBLE -----------------
> > Config: CONFIG_BCMA_HOST_PCI_POSSIBLE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BCMA_HOST_PCI -----------------
> > Config: CONFIG_BCMA_HOST_PCI_POSSIBLE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> > Actual value:
> >
> > Config: CONFIG_BCMA_HOST_PCI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_BCMA_HOST_PCI=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BCMA_DRIVER_GMAC_CMN -----------------
> > Config: CONFIG_BCMA_DRIVER_GMAC_CMN
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_CRC8 -----------------
> > Config: CONFIG_CRC8
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_CRC8=3Dm
> > Actual value:     # CONFIG_CRC8 is not set
> >
> >
> > ---------- CONFIG_CORDIC -----------------
> > Config: CONFIG_CORDIC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
> > Requested value:  CONFIG_CORDIC=3Dm
> > Actual value:     # CONFIG_CORDIC is not set
> >
> >
> > ---------- CONFIG_PARTITION_ADVANCED -----------------
> > Config: CONFIG_PARTITION_ADVANCED
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
> > Requested value:  CONFIG_PARTITION_ADVANCED=3Dy
> > Actual value:     # CONFIG_PARTITION_ADVANCED is not set
> >
> >
> > ---------- CONFIG_FB_EFI -----------------
> > Config: CONFIG_FB_EFI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
> > Requested value:  CONFIG_FB_EFI=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_EFI_VARS -----------------
> > Config: CONFIG_EFI_VARS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
> > Requested value:  CONFIG_EFI_VARS=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_EFI -----------------
> > Config: CONFIG_EFI_VARS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
> > Requested value:  CONFIG_EFI_VARS=3Dm
> > Actual value:
> >
> > Config: CONFIG_EFI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/=
work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg=
/efi.cfg
> > Requested value:  CONFIG_EFI=3Dy
> > Actual value:     # CONFIG_EFI is not set
> >
> > Config: CONFIG_EFI_STUB
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/=
work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg=
/efi.cfg
> > Requested value:  CONFIG_EFI_STUB=3Dy
> > Actual value:
> >
> > Config: CONFIG_EFIVAR_FS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/=
work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg=
/efi.cfg
> > Requested value:  CONFIG_EFIVAR_FS=3Dy
> > Actual value:
> >
> > --
> > Config: CONFIG_EFI_EARLYCON
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/debug/printk.cfg
> > Requested value:  CONFIG_EFI_EARLYCON=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_EFI_STUB -----------------
> > Config: CONFIG_EFI_STUB
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/=
work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg=
/efi.cfg
> > Requested value:  CONFIG_EFI_STUB=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_EFIVAR_FS -----------------
> > Config: CONFIG_EFIVAR_FS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/=
work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg=
/efi.cfg
> > Requested value:  CONFIG_EFIVAR_FS=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_HPET_EMULATE_RTC -----------------
> > Config: CONFIG_HPET_EMULATE_RTC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
> > Requested value:  CONFIG_HPET_EMULATE_RTC=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_HPET -----------------
> > Config: CONFIG_HPET_EMULATE_RTC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
> > Requested value:  CONFIG_HPET_EMULATE_RTC=3Dy
> > Actual value:
> >
> > Config: CONFIG_HPET
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
> > Requested value:  CONFIG_HPET=3Dy
> > Actual value:     # CONFIG_HPET is not set
> >
> > Config: CONFIG_HPET_MMAP
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
> > Requested value:  CONFIG_HPET_MMAP=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_HPET_MMAP -----------------
> > Config: CONFIG_HPET_MMAP
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
> > Requested value:  CONFIG_HPET_MMAP=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_X86_MSR -----------------
> > Config: CONFIG_X86_MSR
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/x86_base.cfg
> > Requested value:  CONFIG_X86_MSR=3Dy
> > Actual value:     # CONFIG_X86_MSR is not set
> >
> >
> > ---------- CONFIG_X86_CPUID -----------------
> > Config: CONFIG_X86_CPUID
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/x86_base.cfg
> > Requested value:  CONFIG_X86_CPUID=3Dy
> > Actual value:     # CONFIG_X86_CPUID is not set
> >
> >
> > ---------- CONFIG_X86_CHECK_BIOS_CORRUPTION -----------------
> > Config: CONFIG_X86_CHECK_BIOS_CORRUPTION
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/x86_base.cfg
> > Requested value:  CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> > Actual value:     # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> >
> >
> > ---------- CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK ---------------=
--
> > Config: CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/x86_base.cfg
> > Requested value:  CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_SMP -----------------
> > Config: CONFIG_SMP
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/smp_64.cfg
> > Requested value:  CONFIG_SMP=3Dy
> > Actual value:     # CONFIG_SMP is not set
> >
> >
> > ---------- CONFIG_SCHED_SMT -----------------
> > Config: CONFIG_SCHED_SMT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/smp_64.cfg
> > Requested value:  CONFIG_SCHED_SMT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_NR_CPUS -----------------
> > Config: CONFIG_NR_CPUS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc-64/common-pc-64-cpu.cfg /O=
E/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta=
/configs/v5.4/standard/cfg/smp_64.cfg
> > Requested value:  CONFIG_NR_CPUS=3D64
> > Actual value:     CONFIG_NR_CPUS=3D1
> >
> >
> > ---------- CONFIG_IA32_EMULATION -----------------
> > Config: CONFIG_IA32_EMULATION
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc-64/common-pc-64-cpu.cfg /O=
E/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta=
/configs/v5.4/standard/cfg/x86_64.cfg
> > Requested value:  CONFIG_IA32_EMULATION=3Dy
> > Actual value:     # CONFIG_IA32_EMULATION is not set
> >
> >
> > ---------- CONFIG_COMPAT -----------------
> > Config: CONFIG_COMPAT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/x86_64.cfg
> > Requested value:  CONFIG_COMPAT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_UNWINDER_ORC -----------------
> > Config: CONFIG_UNWINDER_ORC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/x86_64.cfg
> > Requested value:  # CONFIG_UNWINDER_ORC is not set
> > Actual value:     CONFIG_UNWINDER_ORC=3Dy
> >
> >
> > ---------- CONFIG_UNWINDER_FRAME_POINTER -----------------
> > Config: CONFIG_UNWINDER_FRAME_POINTER
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/x86_64.cfg
> > Requested value:  CONFIG_UNWINDER_FRAME_POINTER=3Dy
> > Actual value:     # CONFIG_UNWINDER_FRAME_POINTER is not set
> >
> >
> > ---------- CONFIG_X86_AMD_PLATFORM_DEVICE -----------------
> > Config: CONFIG_X86_AMD_PLATFORM_DEVICE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/amd.cfg
> > Requested value:  CONFIG_X86_AMD_PLATFORM_DEVICE=3Dy
> > Actual value:     # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> >
> >
> > ---------- CONFIG_MICROCODE_AMD -----------------
> > Config: CONFIG_MICROCODE_AMD
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/amd.cfg
> > Requested value:  CONFIG_MICROCODE_AMD=3Dy
> > Actual value:     # CONFIG_MICROCODE_AMD is not set
> >
> >
> > ---------- CONFIG_X86_MCE_AMD -----------------
> > Config: CONFIG_X86_MCE_AMD
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/amd.cfg
> > Requested value:  CONFIG_X86_MCE_AMD=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_PCI -----------------
> > Config: CONFIG_PCI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg /OE/bui=
ld/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/conf=
igs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/work-shared/qemux=
86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/buil=
d/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/confi=
gs/v5.4/standard/features/pci/pci.cfg
> > Requested value:  CONFIG_PCI=3Dy
> > Actual value:     # CONFIG_PCI is not set
> >
> > Config: CONFIG_PCI_MMCONFIG
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/pci/pci.cfg
> > Requested value:  CONFIG_PCI_MMCONFIG=3Dy
> > Actual value:
> >
> > Config: CONFIG_PCI_MSI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/pci/pci.cfg
> > Requested value:  CONFIG_PCI_MSI=3Dy
> > Actual value:
> >
> > Config: CONFIG_PCIEPORTBUS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/pci/pci.cfg
> > Requested value:  CONFIG_PCIEPORTBUS=3Dy
> > Actual value:
> >
> > --
> > Config: CONFIG_PCI_IOV
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/pci-iov/pci-iov.cfg
> > Requested value:  CONFIG_PCI_IOV=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_PCI_MMCONFIG -----------------
> > Config: CONFIG_PCI_MMCONFIG
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/pci/pci.cfg
> > Requested value:  CONFIG_PCI_MMCONFIG=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_PCI_MSI -----------------
> > Config: CONFIG_PCI_MSI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/pci/pci.cfg
> > Requested value:  CONFIG_PCI_MSI=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_PCIEPORTBUS -----------------
> > Config: CONFIG_PCIEPORTBUS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/pci/pci.cfg
> > Requested value:  CONFIG_PCIEPORTBUS=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_HOTPLUG_PCI -----------------
> > Config: CONFIG_HOTPLUG_PCI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/pci/pci.cfg
> > Requested value:  CONFIG_HOTPLUG_PCI=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_PCI_IOV -----------------
> > Config: CONFIG_PCI_IOV
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/pci-iov/pci-iov.cfg
> > Requested value:  CONFIG_PCI_IOV=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_MMC -----------------
> > Config: CONFIG_MMC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/mmc/mmc-base.cfg /OE/build/oe-c=
ore/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.=
4/standard/features/mmc/mmc-sdhci.cfg
> > Requested value:  CONFIG_MMC=3Dy
> > Actual value:     # CONFIG_MMC is not set
> >
> > Config: CONFIG_MMC_SDHCI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
> > Requested value:  CONFIG_MMC_SDHCI=3Dy
> > Actual value:
> >
> > Config: CONFIG_MMC_SDHCI_PCI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
> > Requested value:  CONFIG_MMC_SDHCI_PCI=3Dy
> > Actual value:
> >
> > Config: CONFIG_MMC_SDHCI_ACPI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
> > Requested value:  CONFIG_MMC_SDHCI_ACPI=3Dy
> > Actual value:
> >
> > Config: CONFIG_MMC_SDHCI_PLTFM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
> > Requested value:  CONFIG_MMC_SDHCI_PLTFM=3Dy
> > Actual value:
> >
> > Config: CONFIG_MMC_RICOH_MMC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
> > Requested value:  CONFIG_MMC_RICOH_MMC=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_MMC_SDHCI -----------------
> > Config: CONFIG_MMC_SDHCI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
> > Requested value:  CONFIG_MMC_SDHCI=3Dy
> > Actual value:
> >
> > Config: CONFIG_MMC_SDHCI_PCI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
> > Requested value:  CONFIG_MMC_SDHCI_PCI=3Dy
> > Actual value:
> >
> > Config: CONFIG_MMC_SDHCI_ACPI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
> > Requested value:  CONFIG_MMC_SDHCI_ACPI=3Dy
> > Actual value:
> >
> > Config: CONFIG_MMC_SDHCI_PLTFM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
> > Requested value:  CONFIG_MMC_SDHCI_PLTFM=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_MMC_SDHCI_PCI -----------------
> > Config: CONFIG_MMC_SDHCI_PCI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
> > Requested value:  CONFIG_MMC_SDHCI_PCI=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_MMC_SDHCI_ACPI -----------------
> > Config: CONFIG_MMC_SDHCI_ACPI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
> > Requested value:  CONFIG_MMC_SDHCI_ACPI=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_MMC_SDHCI_PLTFM -----------------
> > Config: CONFIG_MMC_SDHCI_PLTFM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
> > Requested value:  CONFIG_MMC_SDHCI_PLTFM=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_MMC_RICOH_MMC -----------------
> > Config: CONFIG_MMC_RICOH_MMC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
> > Requested value:  CONFIG_MMC_RICOH_MMC=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_EHCI_HCD -----------------
> > Config: CONFIG_USB_EHCI_HCD
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb/ehci-hcd.cfg
> > Requested value:  CONFIG_USB_EHCI_HCD=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_EHCI_ROOT_HUB_TT -----------------
> > Config: CONFIG_USB_EHCI_ROOT_HUB_TT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb/ehci-hcd.cfg
> > Requested value:  CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_OHCI_HCD -----------------
> > Config: CONFIG_USB_OHCI_HCD
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb/ohci-hcd.cfg
> > Requested value:  CONFIG_USB_OHCI_HCD=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_XHCI_HCD -----------------
> > Config: CONFIG_USB_XHCI_HCD
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb/xhci-hcd.cfg
> > Requested value:  CONFIG_USB_XHCI_HCD=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_INPUT_TOUCHSCREEN -----------------
> > Config: CONFIG_INPUT_TOUCHSCREEN
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/input/touchscreen.cfg
> > Requested value:  CONFIG_INPUT_TOUCHSCREEN=3Dy
> > Actual value:     # CONFIG_INPUT_TOUCHSCREEN is not set
> >
> >
> > ---------- CONFIG_TOUCHSCREEN_USB_COMPOSITE -----------------
> > Config: CONFIG_TOUCHSCREEN_USB_COMPOSITE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb/touchscreen-composite.cfg
> > Requested value:  CONFIG_TOUCHSCREEN_USB_COMPOSITE=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_USBNET -----------------
> > Config: CONFIG_USB_USBNET
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_USBNET=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_NET_DRIVERS -----------------
> > Config: CONFIG_USB_NET_DRIVERS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_NET_DRIVERS=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_KAWETH -----------------
> > Config: CONFIG_USB_KAWETH
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_KAWETH=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_PEGASUS -----------------
> > Config: CONFIG_USB_PEGASUS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_PEGASUS=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_RTL8150 -----------------
> > Config: CONFIG_USB_RTL8150
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_RTL8150=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_RTL8152 -----------------
> > Config: CONFIG_USB_RTL8152
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_RTL8152=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_NET_AX8817X -----------------
> > Config: CONFIG_USB_NET_AX8817X
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_NET_AX8817X=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_NET_AX88179_178A -----------------
> > Config: CONFIG_USB_NET_AX88179_178A
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_NET_AX88179_178A=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_NET_CDCETHER -----------------
> > Config: CONFIG_USB_NET_CDCETHER
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_NET_CDCETHER=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_NET_CDC_EEM -----------------
> > Config: CONFIG_USB_NET_CDC_EEM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_NET_CDC_EEM=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_NET_CDC_NCM -----------------
> > Config: CONFIG_USB_NET_CDC_NCM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_NET_CDC_NCM=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_NET_DM9601 -----------------
> > Config: CONFIG_USB_NET_DM9601
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_NET_DM9601=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_NET_SMSC75XX -----------------
> > Config: CONFIG_USB_NET_SMSC75XX
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_NET_SMSC75XX=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_NET_SMSC95XX -----------------
> > Config: CONFIG_USB_NET_SMSC95XX
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_NET_SMSC95XX=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_NET_MCS7830 -----------------
> > Config: CONFIG_USB_NET_MCS7830
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_NET_MCS7830=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_NET_RNDIS_HOST -----------------
> > Config: CONFIG_USB_NET_RNDIS_HOST
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_NET_RNDIS_HOST=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_NET_CDC_SUBSET_ENABLE -----------------
> > Config: CONFIG_USB_NET_CDC_SUBSET_ENABLE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_NET_CDC_SUBSET_ENABLE=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_NET_CDC_SUBSET -----------------
> > Config: CONFIG_USB_NET_CDC_SUBSET_ENABLE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_NET_CDC_SUBSET_ENABLE=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_NET_CDC_SUBSET
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_NET_CDC_SUBSET=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_ALI_M5632 -----------------
> > Config: CONFIG_USB_ALI_M5632
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_ALI_M5632=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_AN2720 -----------------
> > Config: CONFIG_USB_AN2720
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_AN2720=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_BELKIN -----------------
> > Config: CONFIG_USB_BELKIN
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_BELKIN=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_ARMLINUX -----------------
> > Config: CONFIG_USB_ARMLINUX
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_ARMLINUX=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_KC2190 -----------------
> > Config: CONFIG_USB_KC2190
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
> > Requested value:  CONFIG_USB_KC2190=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_E100 -----------------
> > Config: CONFIG_E100
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/buil=
d/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/confi=
gs/v5.4/standard/features/intel-e1xxxx/intel-e100.cfg /OE/build/oe-core/tmp=
-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/stand=
ard/features/intel-e1xxxx/intel-e1xxxx.cfg
> > Requested value:  CONFIG_E100=3Dy
> > Actual value:
> >
> > Config: CONFIG_E1000E
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/buil=
d/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/confi=
gs/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
> > Requested value:  CONFIG_E1000E=3Dy
> > Actual value:
> >
> > Config: CONFIG_E1000
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/buil=
d/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/confi=
gs/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
> > Requested value:  CONFIG_E1000=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_E1000E -----------------
> > Config: CONFIG_E1000E
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/buil=
d/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/confi=
gs/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
> > Requested value:  CONFIG_E1000E=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_E1000 -----------------
> > Config: CONFIG_E1000E
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/buil=
d/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/confi=
gs/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
> > Requested value:  CONFIG_E1000E=3Dy
> > Actual value:
> >
> > Config: CONFIG_E1000
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/buil=
d/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/confi=
gs/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
> > Requested value:  CONFIG_E1000=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_IGB -----------------
> > Config: CONFIG_IGB
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/igb/igb.cfg
> > Requested value:  CONFIG_IGB=3Dy
> > Actual value:
> >
> > Config: CONFIG_IGBVF
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/igb/igb.cfg
> > Requested value:  CONFIG_IGBVF=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_IGBVF -----------------
> > Config: CONFIG_IGBVF
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/igb/igb.cfg
> > Requested value:  CONFIG_IGBVF=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_IRQ_REMAP -----------------
> > Config: CONFIG_IRQ_REMAP
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/x2apic/x2apic.cfg
> > Requested value:  CONFIG_IRQ_REMAP=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_X86_X2APIC -----------------
> > Config: CONFIG_X86_X2APIC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/x2apic/x2apic.cfg
> > Requested value:  CONFIG_X86_X2APIC=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_ISDN -----------------
> > Config: CONFIG_ISDN
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_ISDN=3Dy
> > Actual value:
> >
> > Config: CONFIG_ISDN_CAPI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_ISDN_CAPI=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_ISDN_CAPI -----------------
> > Config: CONFIG_ISDN_CAPI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_ISDN_CAPI=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_BT_6LOWPAN -----------------
> > Config: CONFIG_BT_6LOWPAN
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_BT_6LOWPAN=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_BT_RFCOMM -----------------
> > Config: CONFIG_BT_RFCOMM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_BT_RFCOMM=3Dm
> > Actual value:
> >
> > Config: CONFIG_BT_RFCOMM_TTY
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_BT_RFCOMM_TTY=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BT_RFCOMM_TTY -----------------
> > Config: CONFIG_BT_RFCOMM_TTY
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_BT_RFCOMM_TTY=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BT_BNEP -----------------
> > Config: CONFIG_BT_BNEP
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_BT_BNEP=3Dm
> > Actual value:
> >
> > Config: CONFIG_BT_BNEP_MC_FILTER
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_BT_BNEP_MC_FILTER=3Dy
> > Actual value:
> >
> > Config: CONFIG_BT_BNEP_PROTO_FILTER
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BT_BNEP_MC_FILTER -----------------
> > Config: CONFIG_BT_BNEP_MC_FILTER
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_BT_BNEP_MC_FILTER=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BT_BNEP_PROTO_FILTER -----------------
> > Config: CONFIG_BT_BNEP_PROTO_FILTER
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BT_CMTP -----------------
> > Config: CONFIG_BT_CMTP
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_BT_CMTP=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_BT_HIDP -----------------
> > Config: CONFIG_BT_HIDP
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_BT_HIDP=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_BT_LE -----------------
> > Config: CONFIG_BT_LE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_BT_LE=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BT_BREDR -----------------
> > Config: CONFIG_BT_BREDR
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
> > Requested value:  CONFIG_BT_BREDR=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_6LOWPAN -----------------
> > Config: CONFIG_6LOWPAN
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/6lowpan/6lowpan.cfg
> > Requested value:  CONFIG_6LOWPAN=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SERIAL_8250 -----------------
> > Config: CONFIG_SERIAL_8250_PNP
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_SERIAL_8250_PNP=3Dy
> > Actual value:
> >
> > --
> > Config: CONFIG_SERIAL_8250
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/=
build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/c=
onfigs/v5.4/standard/cfg/8250.cfg
> > Requested value:  CONFIG_SERIAL_8250=3Dy
> > Actual value:     # CONFIG_SERIAL_8250 is not set
> >
> > Config: CONFIG_SERIAL_8250_CONSOLE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/=
build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/c=
onfigs/v5.4/standard/cfg/8250.cfg
> > Requested value:  CONFIG_SERIAL_8250_CONSOLE=3Dy
> > Actual value:
> >
> > Config: CONFIG_SERIAL_8250_PCI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/=
build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/c=
onfigs/v5.4/standard/cfg/8250.cfg
> > Requested value:  CONFIG_SERIAL_8250_PCI=3Dy
> > Actual value:
> >
> > Config: CONFIG_SERIAL_8250_NR_UARTS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/8250.cfg
> > Requested value:  CONFIG_SERIAL_8250_NR_UARTS=3D4
> > Actual value:
> >
> > Config: CONFIG_SERIAL_8250_RUNTIME_UARTS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/8250.cfg
> > Requested value:  CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> > Actual value:
> >
> >
> > ---------- CONFIG_SERIAL_8250_CONSOLE -----------------
> > Config: CONFIG_SERIAL_8250_CONSOLE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/=
build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/c=
onfigs/v5.4/standard/cfg/8250.cfg
> > Requested value:  CONFIG_SERIAL_8250_CONSOLE=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_SERIAL_8250_PCI -----------------
> > Config: CONFIG_SERIAL_8250_PCI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/=
build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/c=
onfigs/v5.4/standard/cfg/8250.cfg
> > Requested value:  CONFIG_SERIAL_8250_PCI=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_SERIAL_8250_NR_UARTS -----------------
> > Config: CONFIG_SERIAL_8250_NR_UARTS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/8250.cfg
> > Requested value:  CONFIG_SERIAL_8250_NR_UARTS=3D4
> > Actual value:
> >
> >
> > ---------- CONFIG_SERIAL_8250_RUNTIME_UARTS -----------------
> > Config: CONFIG_SERIAL_8250_RUNTIME_UARTS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/8250.cfg
> > Requested value:  CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> > Actual value:
> >
> >
> > ---------- CONFIG_SERIAL_CORE -----------------
> > Config: CONFIG_SERIAL_CORE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/8250.cfg
> > Requested value:  CONFIG_SERIAL_CORE=3Dy
> > Actual value:
> >
> > Config: CONFIG_SERIAL_CORE_CONSOLE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/8250.cfg
> > Requested value:  CONFIG_SERIAL_CORE_CONSOLE=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_SERIAL_CORE_CONSOLE -----------------
> > Config: CONFIG_SERIAL_CORE_CONSOLE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/8250.cfg
> > Requested value:  CONFIG_SERIAL_CORE_CONSOLE=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_AGP -----------------
> > Config: CONFIG_AGP
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg
> > Requested value:  CONFIG_AGP=3Dy
> > Actual value:
> >
> > Config: CONFIG_AGP_INTEL
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg
> > Requested value:  CONFIG_AGP_INTEL=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_AGP_INTEL -----------------
> > Config: CONFIG_AGP_INTEL
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg
> > Requested value:  CONFIG_AGP_INTEL=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_DRM_I915 -----------------
> > Config: CONFIG_DRM_I915
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg
> > Requested value:  CONFIG_DRM_I915=3Dm
> > Actual value:
> >
> > Config: CONFIG_DRM_I915_ALPHA_SUPPORT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg
> > Requested value:  CONFIG_DRM_I915_ALPHA_SUPPORT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_DRM_I915_ALPHA_SUPPORT -----------------
> > Config: CONFIG_DRM_I915_ALPHA_SUPPORT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg
> > Requested value:  CONFIG_DRM_I915_ALPHA_SUPPORT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_BLK_DEV_SD -----------------
> > Config: CONFIG_BLK_DEV_SD
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/scsi/disk.cfg
> > Requested value:  CONFIG_BLK_DEV_SD=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_VIDEO_CLASS -----------------
> > Config: CONFIG_USB_VIDEO_CLASS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_VIDEO_CLASS=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV -----------------
> > Config: CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA -----------------
> > Config: CONFIG_USB_GSPCA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA=3Dm
> > Actual value:
> >
> > --
> > Config: CONFIG_USB_GSPCA_BENQ
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_BENQ=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_CONEX
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_CONEX=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_CPIA1
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_CPIA1=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_ETOMS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_ETOMS=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_FINEPIX
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_FINEPIX=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_JEILINJ
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_JEILINJ=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_JL2005BCD
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_JL2005BCD=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_KINECT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_KINECT=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_KONICA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_KONICA=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_MARS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_MARS=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_MR97310A
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_MR97310A=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_NW80X
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_NW80X=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_OV519
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_OV519=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_OV534
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_OV534=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_OV534_9
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_OV534_9=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_PAC207
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_PAC207=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_PAC7302
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_PAC7302=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_PAC7311
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_PAC7311=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SE401
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SE401=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SN9C2028
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SN9C2028=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SN9C20X
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SN9C20X=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SONIXB
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SONIXB=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SONIXJ
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SONIXJ=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SPCA500
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SPCA500=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SPCA501
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SPCA501=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SPCA505
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SPCA505=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SPCA506
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SPCA506=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SPCA508
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SPCA508=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SPCA561
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SPCA561=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SPCA1528
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SPCA1528=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SQ905
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SQ905=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SQ905C
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SQ905C=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SQ930X
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SQ930X=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_STK014
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_STK014=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_STV0680
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_STV0680=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SUNPLUS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SUNPLUS=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_T613
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_T613=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_TOPRO
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_TOPRO=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_TV8532
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_TV8532=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_VC032X
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_VC032X=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_VICAM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_VICAM=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_XIRLINK_CIT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_XIRLINK_CIT=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_ZC3XX
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_ZC3XX=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_M5602 -----------------
> > Config: CONFIG_USB_M5602
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_M5602=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_STV06XX -----------------
> > Config: CONFIG_USB_STV06XX
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_STV06XX=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GL860 -----------------
> > Config: CONFIG_USB_GL860
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GL860=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_BENQ -----------------
> > Config: CONFIG_USB_GSPCA_BENQ
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_BENQ=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_CONEX -----------------
> > Config: CONFIG_USB_GSPCA_CONEX
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_CONEX=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_CPIA1 -----------------
> > Config: CONFIG_USB_GSPCA_CPIA1
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_CPIA1=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_ETOMS -----------------
> > Config: CONFIG_USB_GSPCA_ETOMS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_ETOMS=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_FINEPIX -----------------
> > Config: CONFIG_USB_GSPCA_FINEPIX
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_FINEPIX=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_JEILINJ -----------------
> > Config: CONFIG_USB_GSPCA_JEILINJ
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_JEILINJ=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_JL2005BCD -----------------
> > Config: CONFIG_USB_GSPCA_JL2005BCD
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_JL2005BCD=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_KINECT -----------------
> > Config: CONFIG_USB_GSPCA_KINECT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_KINECT=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_KONICA -----------------
> > Config: CONFIG_USB_GSPCA_KONICA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_KONICA=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_MARS -----------------
> > Config: CONFIG_USB_GSPCA_MARS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_MARS=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_MR97310A -----------------
> > Config: CONFIG_USB_GSPCA_MR97310A
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_MR97310A=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_NW80X -----------------
> > Config: CONFIG_USB_GSPCA_NW80X
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_NW80X=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_OV519 -----------------
> > Config: CONFIG_USB_GSPCA_OV519
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_OV519=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_OV534 -----------------
> > Config: CONFIG_USB_GSPCA_OV534
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_OV534=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_OV534_9
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_OV534_9=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_OV534_9 -----------------
> > Config: CONFIG_USB_GSPCA_OV534_9
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_OV534_9=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_PAC207 -----------------
> > Config: CONFIG_USB_GSPCA_PAC207
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_PAC207=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_PAC7302 -----------------
> > Config: CONFIG_USB_GSPCA_PAC7302
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_PAC7302=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_PAC7311 -----------------
> > Config: CONFIG_USB_GSPCA_PAC7311
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_PAC7311=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SE401 -----------------
> > Config: CONFIG_USB_GSPCA_SE401
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SE401=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SN9C2028 -----------------
> > Config: CONFIG_USB_GSPCA_SN9C2028
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SN9C2028=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SN9C20X -----------------
> > Config: CONFIG_USB_GSPCA_SN9C20X
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SN9C20X=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SONIXB -----------------
> > Config: CONFIG_USB_GSPCA_SONIXB
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SONIXB=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SONIXJ -----------------
> > Config: CONFIG_USB_GSPCA_SONIXJ
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SONIXJ=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SPCA500 -----------------
> > Config: CONFIG_USB_GSPCA_SPCA500
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SPCA500=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SPCA501 -----------------
> > Config: CONFIG_USB_GSPCA_SPCA501
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SPCA501=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SPCA505 -----------------
> > Config: CONFIG_USB_GSPCA_SPCA505
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SPCA505=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SPCA506 -----------------
> > Config: CONFIG_USB_GSPCA_SPCA506
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SPCA506=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SPCA508 -----------------
> > Config: CONFIG_USB_GSPCA_SPCA508
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SPCA508=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SPCA561 -----------------
> > Config: CONFIG_USB_GSPCA_SPCA561
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SPCA561=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SPCA1528 -----------------
> > Config: CONFIG_USB_GSPCA_SPCA1528
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SPCA1528=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SQ905 -----------------
> > Config: CONFIG_USB_GSPCA_SQ905
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SQ905=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_GSPCA_SQ905C
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SQ905C=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SQ905C -----------------
> > Config: CONFIG_USB_GSPCA_SQ905C
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SQ905C=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SQ930X -----------------
> > Config: CONFIG_USB_GSPCA_SQ930X
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SQ930X=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_STK014 -----------------
> > Config: CONFIG_USB_GSPCA_STK014
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_STK014=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_STV0680 -----------------
> > Config: CONFIG_USB_GSPCA_STV0680
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_STV0680=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_SUNPLUS -----------------
> > Config: CONFIG_USB_GSPCA_SUNPLUS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_SUNPLUS=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_T613 -----------------
> > Config: CONFIG_USB_GSPCA_T613
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_T613=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_TOPRO -----------------
> > Config: CONFIG_USB_GSPCA_TOPRO
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_TOPRO=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_TV8532 -----------------
> > Config: CONFIG_USB_GSPCA_TV8532
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_TV8532=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_VC032X -----------------
> > Config: CONFIG_USB_GSPCA_VC032X
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_VC032X=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_VICAM -----------------
> > Config: CONFIG_USB_GSPCA_VICAM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_VICAM=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_XIRLINK_CIT -----------------
> > Config: CONFIG_USB_GSPCA_XIRLINK_CIT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_XIRLINK_CIT=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_GSPCA_ZC3XX -----------------
> > Config: CONFIG_USB_GSPCA_ZC3XX
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_GSPCA_ZC3XX=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_PWC -----------------
> > Config: CONFIG_USB_PWC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_PWC=3Dm
> > Actual value:
> >
> > Config: CONFIG_USB_PWC_INPUT_EVDEV
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_PWC_INPUT_EVDEV=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_PWC_INPUT_EVDEV -----------------
> > Config: CONFIG_USB_PWC_INPUT_EVDEV
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_PWC_INPUT_EVDEV=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_VIDEO_CPIA2 -----------------
> > Config: CONFIG_VIDEO_CPIA2
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_VIDEO_CPIA2=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_STKWEBCAM -----------------
> > Config: CONFIG_USB_STKWEBCAM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_STKWEBCAM=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_USB_S2255 -----------------
> > Config: CONFIG_USB_S2255
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
> > Requested value:  CONFIG_USB_S2255=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SND_PCI -----------------
> > Config: CONFIG_SND_PCI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
> > Requested value:  CONFIG_SND_PCI=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_SND_HDA_INTEL -----------------
> > Config: CONFIG_SND_HDA_INTEL
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
> > Requested value:  CONFIG_SND_HDA_INTEL=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SND_HDA_GENERIC -----------------
> > Config: CONFIG_SND_HDA_GENERIC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
> > Requested value:  CONFIG_SND_HDA_GENERIC=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SND_HDA_CODEC_HDMI -----------------
> > Config: CONFIG_SND_HDA_CODEC_HDMI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
> > Requested value:  CONFIG_SND_HDA_CODEC_HDMI=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SND_HDA_CODEC_ANALOG -----------------
> > Config: CONFIG_SND_HDA_CODEC_ANALOG
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
> > Requested value:  CONFIG_SND_HDA_CODEC_ANALOG=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SND_HDA_CODEC_REALTEK -----------------
> > Config: CONFIG_SND_HDA_CODEC_REALTEK
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
> > Requested value:  CONFIG_SND_HDA_CODEC_REALTEK=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SND_HDA_CODEC_SIGMATEL -----------------
> > Config: CONFIG_SND_HDA_CODEC_SIGMATEL
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
> > Requested value:  CONFIG_SND_HDA_CODEC_SIGMATEL=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SND_HDA_CODEC_CIRRUS -----------------
> > Config: CONFIG_SND_HDA_CODEC_CIRRUS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
> > Requested value:  CONFIG_SND_HDA_CODEC_CIRRUS=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SND_HDA_CODEC_CONEXANT -----------------
> > Config: CONFIG_SND_HDA_CODEC_CONEXANT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
> > Requested value:  CONFIG_SND_HDA_CODEC_CONEXANT=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SND_HDA_CODEC_CA0110 -----------------
> > Config: CONFIG_SND_HDA_CODEC_CA0110
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
> > Requested value:  CONFIG_SND_HDA_CODEC_CA0110=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SND_HDA_CODEC_CA0132 -----------------
> > Config: CONFIG_SND_HDA_CODEC_CA0132
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
> > Requested value:  CONFIG_SND_HDA_CODEC_CA0132=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SND_HDA_CODEC_CMEDIA -----------------
> > Config: CONFIG_SND_HDA_CODEC_CMEDIA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
> > Requested value:  CONFIG_SND_HDA_CODEC_CMEDIA=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SND_HDA_CODEC_SI3054 -----------------
> > Config: CONFIG_SND_HDA_CODEC_SI3054
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
> > Requested value:  CONFIG_SND_HDA_CODEC_SI3054=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_DMA_SHARED_BUFFER -----------------
> > Config: CONFIG_DMA_SHARED_BUFFER
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DMA_SHARED_BUFFER=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS -----------------
> > Config: CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_MOUSE_PS2_SMBUS -----------------
> > Config: CONFIG_MOUSE_PS2_SMBUS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_MOUSE_PS2_SMBUS=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_VT_HW_CONSOLE_BINDING -----------------
> > Config: CONFIG_VT_HW_CONSOLE_BINDING
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> > Actual value:     # CONFIG_VT_HW_CONSOLE_BINDING is not set
> >
> >
> > ---------- CONFIG_I2C -----------------
> > Config: CONFIG_I2C_I801
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
> > Requested value:  CONFIG_I2C_I801=3Dy
> > Actual value:
> >
> > --
> > Config: CONFIG_I2C
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/=
build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/c=
onfigs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/tmp-glibc/wor=
k-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/featur=
es/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_I2C=3Dy
> > Actual value:     # CONFIG_I2C is not set
> >
> > Config: CONFIG_I2C_BOARDINFO
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core=
/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/s=
tandard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_I2C_BOARDINFO=3Dy
> > Actual value:
> >
> > Config: CONFIG_I2C_COMPAT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core=
/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/s=
tandard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_I2C_COMPAT=3Dy
> > Actual value:
> >
> > Config: CONFIG_I2C_HELPER_AUTO
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core=
/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/s=
tandard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_I2C_HELPER_AUTO=3Dy
> > Actual value:
> >
> > Config: CONFIG_I2C_ALGOBIT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core=
/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/s=
tandard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_I2C_ALGOBIT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_I2C_BOARDINFO -----------------
> > Config: CONFIG_I2C_BOARDINFO
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core=
/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/s=
tandard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_I2C_BOARDINFO=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_I2C_COMPAT -----------------
> > Config: CONFIG_I2C_COMPAT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core=
/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/s=
tandard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_I2C_COMPAT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_I2C_HELPER_AUTO -----------------
> > Config: CONFIG_I2C_HELPER_AUTO
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core=
/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/s=
tandard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_I2C_HELPER_AUTO=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_I2C_ALGOBIT -----------------
> > Config: CONFIG_I2C_ALGOBIT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core=
/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/s=
tandard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_I2C_ALGOBIT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_DRM -----------------
> > Config: CONFIG_DRM_CIRRUS_QEMU
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
> > Requested value:  CONFIG_DRM_CIRRUS_QEMU=3Dm
> > Actual value:
> >
> > --
> > Config: CONFIG_DRM_I915
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg
> > Requested value:  CONFIG_DRM_I915=3Dm
> > Actual value:
> >
> > Config: CONFIG_DRM_I915_ALPHA_SUPPORT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg
> > Requested value:  CONFIG_DRM_I915_ALPHA_SUPPORT=3Dy
> > Actual value:
> >
> > --
> > Config: CONFIG_DRM_VIRTIO_GPU
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/virtio.cfg /OE/build/oe-core/tmp-gli=
bc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/=
cfg/virtio.cfg
> > Requested value:  CONFIG_DRM_VIRTIO_GPU=3Dy
> > Actual value:
> >
> > --
> > Config: CONFIG_DRM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core=
/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/s=
tandard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM=3Dy
> > Actual value:     # CONFIG_DRM is not set
> >
> > Config: CONFIG_DRM_KMS_HELPER
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core=
/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/s=
tandard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_KMS_HELPER=3Dy
> > Actual value:
> >
> > Config: CONFIG_DRM_KMS_FB_HELPER
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core=
/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/s=
tandard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_KMS_FB_HELPER=3Dy
> > Actual value:
> >
> > Config: CONFIG_DRM_FBDEV_EMULATION
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_FBDEV_EMULATION=3Dy
> > Actual value:
> >
> > Config: CONFIG_DRM_FBDEV_OVERALLOC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_FBDEV_OVERALLOC=3D100
> > Actual value:
> >
> > Config: CONFIG_DRM_TTM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_TTM=3Dy
> > Actual value:
> >
> > Config: CONFIG_DRM_BOCHS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_BOCHS=3Dy
> > Actual value:
> >
> > Config: CONFIG_DRM_PANEL
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_PANEL=3Dy
> > Actual value:
> >
> > Config: CONFIG_DRM_BRIDGE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_BRIDGE=3Dy
> > Actual value:
> >
> > Config: CONFIG_DRM_PANEL_BRIDGE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_PANEL_BRIDGE=3Dy
> > Actual value:
> >
> > Config: CONFIG_DRM_PANEL_ORIENTATION_QUIRKS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_DRM_FBDEV_EMULATION -----------------
> > Config: CONFIG_DRM_FBDEV_EMULATION
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_FBDEV_EMULATION=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_DRM_FBDEV_OVERALLOC -----------------
> > Config: CONFIG_DRM_FBDEV_OVERALLOC
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_FBDEV_OVERALLOC=3D100
> > Actual value:
> >
> >
> > ---------- CONFIG_DRM_TTM -----------------
> > Config: CONFIG_DRM_TTM
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_TTM=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_DRM_BOCHS -----------------
> > Config: CONFIG_DRM_BOCHS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_BOCHS=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_DRM_PANEL -----------------
> > Config: CONFIG_DRM_PANEL
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_PANEL=3Dy
> > Actual value:
> >
> > --
> > Config: CONFIG_DRM_PANEL_BRIDGE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_PANEL_BRIDGE=3Dy
> > Actual value:
> >
> > Config: CONFIG_DRM_PANEL_ORIENTATION_QUIRKS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_DRM_BRIDGE -----------------
> > Config: CONFIG_DRM_BRIDGE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_BRIDGE=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_DRM_PANEL_BRIDGE -----------------
> > Config: CONFIG_DRM_PANEL_BRIDGE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_PANEL_BRIDGE=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_DRM_PANEL_ORIENTATION_QUIRKS -----------------
> > Config: CONFIG_DRM_PANEL_ORIENTATION_QUIRKS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FB_CMDLINE -----------------
> > Config: CONFIG_FB_CMDLINE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_CMDLINE=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FB_NOTIFY -----------------
> > Config: CONFIG_FB_NOTIFY
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_NOTIFY=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FB -----------------
> > Config: CONFIG_FB_MODE_HELPERS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
> > Requested value:  CONFIG_FB_MODE_HELPERS=3Dy
> > Actual value:
> >
> > --
> > Config: CONFIG_FB_UVESA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
> > Requested value:  CONFIG_FB_UVESA=3Dm
> > Actual value:
> >
> > --
> > Config: CONFIG_FB_EFI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
> > Requested value:  CONFIG_FB_EFI=3Dy
> > Actual value:
> >
> > --
> > Config: CONFIG_FB_CMDLINE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_CMDLINE=3Dy
> > Actual value:
> >
> > Config: CONFIG_FB_NOTIFY
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_NOTIFY=3Dy
> > Actual value:
> >
> > Config: CONFIG_FB
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg /OE/buil=
d/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/confi=
gs/v5.4/standard/cfg/efi-ext.cfg /OE/build/oe-core/tmp-glibc/work-shared/qe=
mux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/features/drm-boch=
s/drm-bochs.cfg
> > Requested value:  CONFIG_FB=3Dy
> > Actual value:     # CONFIG_FB is not set
> >
> > Config: CONFIG_FB_CFB_FILLRECT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_CFB_FILLRECT=3Dy
> > Actual value:
> >
> > Config: CONFIG_FB_CFB_COPYAREA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_CFB_COPYAREA=3Dy
> > Actual value:
> >
> > Config: CONFIG_FB_CFB_IMAGEBLIT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_CFB_IMAGEBLIT=3Dy
> > Actual value:
> >
> > Config: CONFIG_FB_SYS_FILLRECT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_SYS_FILLRECT=3Dy
> > Actual value:
> >
> > Config: CONFIG_FB_SYS_COPYAREA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_SYS_COPYAREA=3Dy
> > Actual value:
> >
> > Config: CONFIG_FB_SYS_IMAGEBLIT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_SYS_IMAGEBLIT=3Dy
> > Actual value:
> >
> > Config: CONFIG_FB_SYS_FOPS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_SYS_FOPS=3Dy
> > Actual value:
> >
> > Config: CONFIG_FB_DEFERRED_IO
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_DEFERRED_IO=3Dy
> > Actual value:
> >
> > Config: CONFIG_FB_SIMPLE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_SIMPLE=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FB_CFB_FILLRECT -----------------
> > Config: CONFIG_FB_CFB_FILLRECT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_CFB_FILLRECT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FB_CFB_COPYAREA -----------------
> > Config: CONFIG_FB_CFB_COPYAREA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_CFB_COPYAREA=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FB_CFB_IMAGEBLIT -----------------
> > Config: CONFIG_FB_CFB_IMAGEBLIT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_CFB_IMAGEBLIT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FB_SYS_FILLRECT -----------------
> > Config: CONFIG_FB_SYS_FILLRECT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_SYS_FILLRECT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FB_SYS_COPYAREA -----------------
> > Config: CONFIG_FB_SYS_COPYAREA
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_SYS_COPYAREA=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FB_SYS_IMAGEBLIT -----------------
> > Config: CONFIG_FB_SYS_IMAGEBLIT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_SYS_IMAGEBLIT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FB_SYS_FOPS -----------------
> > Config: CONFIG_FB_SYS_FOPS
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_SYS_FOPS=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FB_DEFERRED_IO -----------------
> > Config: CONFIG_FB_DEFERRED_IO
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_DEFERRED_IO=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FB_SIMPLE -----------------
> > Config: CONFIG_FB_SIMPLE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FB_SIMPLE=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_HDMI -----------------
> > Config: CONFIG_HDMI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_HDMI=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FRAMEBUFFER_CONSOLE -----------------
> > Config: CONFIG_FRAMEBUFFER_CONSOLE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg /OE/buil=
d/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/confi=
gs/v5.4/standard/cfg/efi-ext.cfg /OE/build/oe-core/tmp-glibc/work-shared/qe=
mux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/features/drm-boch=
s/drm-bochs.cfg
> > Requested value:  CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> > Actual value:
> >
> > Config: CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY -----------------
> > Config: CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_SYNC_FILE -----------------
> > Config: CONFIG_SYNC_FILE
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_SYNC_FILE=3Dy
> > Actual value:     # CONFIG_SYNC_FILE is not set
> >
> >
> > ---------- CONFIG_FONT_SUPPORT -----------------
> > Config: CONFIG_FONT_SUPPORT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FONT_SUPPORT=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FONT_8x8 -----------------
> > Config: CONFIG_FONT_8x8
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FONT_8x8=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_FONT_8x16 -----------------
> > Config: CONFIG_FONT_8x16
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
> > Requested value:  CONFIG_FONT_8x16=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_HYPERVISOR_GUEST -----------------
> > Config: CONFIG_HYPERVISOR_GUEST
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/hv-guest.cfg
> > Requested value:  CONFIG_HYPERVISOR_GUEST=3Dy
> > Actual value:     # CONFIG_HYPERVISOR_GUEST is not set
> >
> >
> > ---------- CONFIG_KVM_GUEST -----------------
> > Config: CONFIG_KVM_GUEST
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/paravirt_kvm.cfg
> > Requested value:  CONFIG_KVM_GUEST=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_PARAVIRT -----------------
> > Config: CONFIG_PARAVIRT
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/paravirt_kvm.cfg
> > Requested value:  CONFIG_PARAVIRT=3Dy
> > Actual value:
> >
> > Config: CONFIG_PARAVIRT_CLOCK
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/paravirt_kvm.cfg
> > Requested value:  CONFIG_PARAVIRT_CLOCK=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_PARAVIRT_CLOCK -----------------
> > Config: CONFIG_PARAVIRT_CLOCK
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/paravirt_kvm.cfg
> > Requested value:  CONFIG_PARAVIRT_CLOCK=3Dy
> > Actual value:
> >
> >
> > ---------- CONFIG_SCSI -----------------
> > Config: CONFIG_SCSI_VIRTIO
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/cfg/virtio.cfg /OE/build/oe-core/tmp-gli=
bc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/=
cfg/virtio.cfg
> > Requested value:  CONFIG_SCSI_VIRTIO=3Dy
> > Actual value:
> >
> > --
> > Config: CONFIG_SCSI
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/scsi/scsi.cfg /OE/build/oe-core=
/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/s=
tandard/features/scsi/scsi.cfg /OE/build/oe-core/tmp-glibc/work-shared/qemu=
x86-64/kernel-source/.kernel-meta/configs/v5.4/standard/features/scsi/scsi.=
cfg
> > Requested value:  CONFIG_SCSI=3Dy
> > Actual value:     # CONFIG_SCSI is not set
> >
> > Config: CONFIG_SCSI_DEBUG
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/scsi/scsi-debug.cfg
> > Requested value:  CONFIG_SCSI_DEBUG=3Dm
> > Actual value:
> >
> >
> > ---------- CONFIG_SCSI_DEBUG -----------------
> > Config: CONFIG_SCSI_DEBUG
> > From: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/=
.kernel-meta/configs/v5.4/standard/features/scsi/scsi-debug.cfg
> > Requested value:  CONFIG_SCSI_DEBUG=3Dm
> > Actual value:
> >
> >
> >
> > DEBUG: Python function do_kernel_configcheck finished
> > >
> > > Bruce
> > >
> > > >>
> > > >>
> > > >> make[1]: Entering directory '/OE/build/oe-core/tmp-glibc/work/qemu=
x86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> > > >>   GEN     Makefile
> > > >>   HOSTCC  scripts/basic/fixdep
> > > >>   HOSTCC  scripts/kconfig/conf.o
> > > >>   HOSTCC  scripts/kconfig/confdata.o
> > > >>   HOSTCC  scripts/kconfig/expr.o
> > > >>   HOSTCC  scripts/kconfig/lexer.lex.o
> > > >>   HOSTCC  scripts/kconfig/parser.tab.o
> > > >>   HOSTCC  scripts/kconfig/preprocess.o
> > > >>   HOSTCC  scripts/kconfig/symbol.o
> > > >>   HOSTLD  scripts/kconfig/conf
> > > >> scripts/kconfig/conf  --olddefconfig Kconfig
> > > >> scripts/Kconfig.include:39:  gold linker 'x86_64-oe-linux-ld' not =
supported
> > > >> make[2]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/k=
ernel-source/scripts/kconfig/Makefile:73: olddefconfig] Error 1
> > > >> make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/k=
ernel-source/Makefile:567: olddefconfig] Error 2
> > > >> make[1]: Leaving directory '/OE/build/oe-core/tmp-glibc/work/qemux=
86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> > > >> make: *** [Makefile:179: sub-make] Error 2
> > > >> make: Leaving directory '/OE/build/oe-core/tmp-glibc/work-shared/q=
emux86-64/kernel-source'
> > > >> NOTE: make HOSTCC=3Dgcc  -isystem/OE/build/oe-core/tmp-glibc/work/=
qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/include=
 -O2 -pipe -L/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoc=
to/5.4.15-r0/recipe-sysroot-native/usr/lib                         -L/OE/bu=
ild/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe=
-sysroot-native/lib                         -Wl,--enable-new-dtags         =
                -Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/qemux86_64=
-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/lib              =
           -Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-l=
inux/linux-yocto/5.4.15-r0/recipe-sysroot-native/lib                       =
  -Wl,-rpath,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoc=
to/5.4.15-r0/recipe-sysroot-native/usr/lib                         -Wl,-rpa=
th,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-=
r0/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-sh=
lib-undefined -Wl,--dynamic-linker=3D/OE/build/oe-core/tmp-glibc/sysroots-u=
ninative/x86_64-linux/lib/ld-linux-x86-64.so.2 HOSTCPP=3Dgcc  -E -C /OE/bui=
ld/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source O=3D/OE/build/oe-=
core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86=
_64-standard-build CC=3Dx86_64-oe-linux-gcc  -fuse-ld=3Dbfd -fmacro-prefix-=
map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.=
15-r0=3D/usr/src/debug/linux-yocto/5.4.15-r0                      -fdebug-p=
refix-map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0=3D/usr/src/debug/linux-yocto/5.4.15-r0                      -fd=
ebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linu=
x-yocto/5.4.15-r0/recipe-sysroot=3D                      -fdebug-prefix-map=
=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-=
r0/recipe-sysroot-native=3D  -fdebug-prefix-map=3D/OE/build/oe-core/tmp-gli=
bc/work-shared/qemux86-64/kernel-source=3D/usr/src/kernel oldnoconfig
> > > >> make: Entering directory '/OE/build/oe-core/tmp-glibc/work-shared/=
qemux86-64/kernel-source'
> > > >> make[1]: Entering directory '/OE/build/oe-core/tmp-glibc/work/qemu=
x86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> > > >>   GEN     Makefile
> > > >> make[2]: *** No rule to make target 'oldnoconfig'.  Stop.
> > > >> make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/k=
ernel-source/Makefile:567: oldnoconfig] Error 2
> > > >> make[1]: Leaving directory '/OE/build/oe-core/tmp-glibc/work/qemux=
86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> > > >> make: *** [Makefile:179: sub-make] Error 2
> > > >> make: Leaving directory '/OE/build/oe-core/tmp-glibc/work-shared/q=
emux86-64/kernel-source'
> > > >> ERROR: oe_runmake failed
> > > >> WARNING: exit code 1 from a shell command.
> > > >> ERROR: Execution of '/OE/build/oe-core/tmp-glibc/work/qemux86_64-o=
e-linux/linux-yocto/5.4.15-r0/temp/run.do_configure.4075' failed with exit =
code 1:
> > > >> make: Entering directory '/OE/build/oe-core/tmp-glibc/work-shared/=
qemux86-64/kernel-source'
> > > >> make[1]: Entering directory '/OE/build/oe-core/tmp-glibc/work/qemu=
x86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> > > >>   GEN     Makefile
> > > >>   HOSTCC  scripts/basic/fixdep
> > > >>   HOSTCC  scripts/kconfig/conf.o
> > > >>   HOSTCC  scripts/kconfig/confdata.o
> > > >>   HOSTCC  scripts/kconfig/expr.o
> > > >>   HOSTCC  scripts/kconfig/lexer.lex.o
> > > >>   HOSTCC  scripts/kconfig/parser.tab.o
> > > >>   HOSTCC  scripts/kconfig/preprocess.o
> > > >>   HOSTCC  scripts/kconfig/symbol.o
> > > >>   HOSTLD  scripts/kconfig/conf
> > > >> scripts/kconfig/conf  --olddefconfig Kconfig
> > > >> scripts/Kconfig.include:39:  gold linker 'x86_64-oe-linux-ld' not =
supported
> > > >> make[2]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/k=
ernel-source/scripts/kconfig/Makefile:73: olddefconfig] Error 1
> > > >> make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/k=
ernel-source/Makefile:567: olddefconfig] Error 2
> > > >> make[1]: Leaving directory '/OE/build/oe-core/tmp-glibc/work/qemux=
86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> > > >> make: *** [Makefile:179: sub-make] Error 2
> > > >> make: Leaving directory '/OE/build/oe-core/tmp-glibc/work-shared/q=
emux86-64/kernel-source'
> > > >> make: Entering directory '/OE/build/oe-core/tmp-glibc/work-shared/=
qemux86-64/kernel-source'
> > > >> make[1]: Entering directory '/OE/build/oe-core/tmp-glibc/work/qemu=
x86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> > > >>   GEN     Makefile
> > > >> make[2]: *** No rule to make target 'oldnoconfig'.  Stop.
> > > >> make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/k=
ernel-source/Makefile:567: oldnoconfig] Error 2
> > > >> make[1]: Leaving directory '/OE/build/oe-core/tmp-glibc/work/qemux=
86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> > > >> make: *** [Makefile:179: sub-make] Error 2
> > > >> make: Leaving directory '/OE/build/oe-core/tmp-glibc/work-shared/q=
emux86-64/kernel-source'
> > > >> WARNING: exit code 1 from a shell command.
> > > >>
> > > >> On Fri, Jan 31, 2020 at 10:37 AM Khem Raj <raj.khem@gmail.com> wro=
te:
> > > >>>
> > > >>> kernel-seltest fails now to build
> > > >>>
> > > >>> https://errors.yoctoproject.org/Errors/Details/308578/
> > > >>>
> > > >>> On Tue, Jan 28, 2020 at 2:14 PM <bruce.ashfield@gmail.com> wrote:
> > > >>> >
> > > >>> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >>> >
> > > >>> > This creates recipes for the v5.4/* branches of the linux-yocto
> > > >>> > reference kernel.
> > > >>> >
> > > >>> > preempt-rt, yaffs2, aufs5 and reference board specific patches =
are
> > > >>> > part of these branches. All major architectures: x86,x86-64,ARM=
,
> > > >>> > ARM64,ppc,mips and mips64 have been feature tested against this
> > > >>> > reference.
> > > >>> >
> > > >>> > 5.4 is a LTS release, and as such will receive -stable updates
> > > >>> > for the duration of upstream korg support.
> > > >>> >
> > > >>> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >>> > ---
> > > >>> >  .../linux/linux-yocto-rt_5.4.bb               | 44 +++++++++++=
++++
> > > >>> >  .../linux/linux-yocto-tiny_5.4.bb             | 32 +++++++++++
> > > >>> >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 54 +++++++++++=
++++++++
> > > >>> >  3 files changed, 130 insertions(+)
> > > >>> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.=
4.bb
> > > >>> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_=
5.4.bb
> > > >>> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.b=
b
> > > >>> >
> > > >>> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/=
meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > >>> > new file mode 100644
> > > >>> > index 0000000000..52f0e3b833
> > > >>> > --- /dev/null
> > > >>> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > >>> > @@ -0,0 +1,44 @@
> > > >>> > +KBRANCH ?=3D "v5.4/standard/preempt-rt/base"
> > > >>> > +
> > > >>> > +require recipes-kernel/linux/linux-yocto.inc
> > > >>> > +
> > > >>> > +# Skip processing of this recipe if it is not explicitly speci=
fied as the
> > > >>> > +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors wh=
en trying
> > > >>> > +# to build multiple virtual/kernel providers, e.g. as dependen=
cy of
> > > >>> > +# core-image-rt-sdk, core-image-rt.
> > > >>> > +python () {
> > > >>> > +    if d.getVar("KERNEL_PACKAGE_NAME") =3D=3D "kernel" and d.g=
etVar("PREFERRED_PROVIDER_virtual/kernel") !=3D "linux-yocto-rt":
> > > >>> > +        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virt=
ual/kernel to linux-yocto-rt to enable it")
> > > >>> > +}
> > > >>> > +
> > > >>> > +SRCREV_machine ?=3D "5d5d4070c5f8b10a4c6bda37e77071ce37f102d5"
> > > >>> > +SRCREV_meta ?=3D "a48522779fae4887c47268e5f650bf10c94a165c"
> > > >>> > +
> > > >>> > +SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=
=3D${KBRANCH};name=3Dmachine \
> > > >>> > +           git://git.yoctoproject.org/yocto-kernel-cache;type=
=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
> > > >>> > +
> > > >>> > +LINUX_VERSION ?=3D "5.4.15"
> > > >>> > +
> > > >>> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f423=
0826c0c6b8814"
> > > >>> > +
> > > >>> > +DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-na=
tive', '', d)}"
> > > >>> > +DEPENDS +=3D "openssl-native util-linux-native"
> > > >>> > +
> > > >>> > +PV =3D "5.4.15"
> > > >>> > +
> > > >>> > +KMETA =3D "kernel-meta"
> > > >>> > +KCONF_BSP_AUDIT_LEVEL =3D "2"
> > > >>> > +
> > > >>> > +LINUX_KERNEL_TYPE =3D "preempt-rt"
> > > >>> > +
> > > >>> > +COMPATIBLE_MACHINE =3D "(qemux86|qemux86-64|qemuarm|qemuarmv5|=
qemuarm64|qemuppc|qemumips)"
> > > >>> > +
> > > >>> > +KERNEL_DEVICETREE_qemuarmv5 =3D "versatile-pb.dtb"
> > > >>> > +
> > > >>> > +# Functionality flags
> > > >>> > +KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc f=
eatures/taskstats/taskstats.scc"
> > > >>> > +KERNEL_FEATURES_append =3D " ${KERNEL_EXTRA_FEATURES}"
> > > >>> > +KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc features/drm=
-bochs/drm-bochs.scc"
> > > >>> > +KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_=
kvm.scc"
> > > >>> > +KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravi=
rt_kvm.scc"
> > > >>> > +KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATU=
RES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> > > >>> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb =
b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > > >>> > new file mode 100644
> > > >>> > index 0000000000..a028b37548
> > > >>> > --- /dev/null
> > > >>> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > > >>> > @@ -0,0 +1,32 @@
> > > >>> > +KBRANCH ?=3D "v5.4/standard/tiny/base"
> > > >>> > +KBRANCH_qemuarm  ?=3D "v5.4/standard/tiny/arm-versatile-926ejs=
"
> > > >>> > +
> > > >>> > +LINUX_KERNEL_TYPE =3D "tiny"
> > > >>> > +KCONFIG_MODE =3D "--allnoconfig"
> > > >>> > +
> > > >>> > +require recipes-kernel/linux/linux-yocto.inc
> > > >>> > +
> > > >>> > +LINUX_VERSION ?=3D "5.4.15"
> > > >>> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f423=
0826c0c6b8814"
> > > >>> > +
> > > >>> > +DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-na=
tive', '', d)}"
> > > >>> > +DEPENDS +=3D "openssl-native util-linux-native"
> > > >>> > +
> > > >>> > +KMETA =3D "kernel-meta"
> > > >>> > +KCONF_BSP_AUDIT_LEVEL =3D "2"
> > > >>> > +
> > > >>> > +SRCREV_machine_qemuarm ?=3D "9eeafafc19278b5c5376ba1fd9eae2662=
6730458"
> > > >>> > +SRCREV_machine ?=3D "cdda35317561d2741b396efa623ace0bd2212c16"
> > > >>> > +SRCREV_meta ?=3D "a48522779fae4887c47268e5f650bf10c94a165c"
> > > >>> > +
> > > >>> > +PV =3D "5.4.15"
> > > >>> > +
> > > >>> > +SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=
=3D${KBRANCH};name=3Dmachine \
> > > >>> > +           git://git.yoctoproject.org/yocto-kernel-cache;type=
=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
> > > >>> > +
> > > >>> > +COMPATIBLE_MACHINE =3D "qemux86|qemux86-64|qemuarm|qemuarmv5"
> > > >>> > +
> > > >>> > +# Functionality flags
> > > >>> > +KERNEL_FEATURES =3D ""
> > > >>> > +
> > > >>> > +KERNEL_DEVICETREE_qemuarmv5 =3D "versatile-pb.dtb"
> > > >>> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/met=
a/recipes-kernel/linux/linux-yocto_5.4.bb
> > > >>> > new file mode 100644
> > > >>> > index 0000000000..9fbc47d79e
> > > >>> > --- /dev/null
> > > >>> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > > >>> > @@ -0,0 +1,54 @@
> > > >>> > +KBRANCH ?=3D "v5.4/standard/base"
> > > >>> > +
> > > >>> > +require recipes-kernel/linux/linux-yocto.inc
> > > >>> > +
> > > >>> > +# board specific branches
> > > >>> > +KBRANCH_qemuarm  ?=3D "v5.4/standard/arm-versatile-926ejs"
> > > >>> > +KBRANCH_qemuarm64 ?=3D "v5.4/standard/qemuarm64"
> > > >>> > +KBRANCH_qemumips ?=3D "v5.4/standard/mti-malta32"
> > > >>> > +KBRANCH_qemuppc  ?=3D "v5.4/standard/qemuppc"
> > > >>> > +KBRANCH_qemuriscv64  ?=3D "v5.4/standard/base"
> > > >>> > +KBRANCH_qemux86  ?=3D "v5.4/standard/base"
> > > >>> > +KBRANCH_qemux86-64 ?=3D "v5.4/standard/base"
> > > >>> > +KBRANCH_qemumips64 ?=3D "v5.4/standard/mti-malta64"
> > > >>> > +
> > > >>> > +SRCREV_machine_qemuarm ?=3D "637086def651a00b1274a80cd3ca740e2=
71eb0f9"
> > > >>> > +SRCREV_machine_qemuarm64 ?=3D "cdda35317561d2741b396efa623ace0=
bd2212c16"
> > > >>> > +SRCREV_machine_qemumips ?=3D "bfe04753d00b0f36848bb8204020b69d=
0e78f02a"
> > > >>> > +SRCREV_machine_qemuppc ?=3D "cdda35317561d2741b396efa623ace0bd=
2212c16"
> > > >>> > +SRCREV_machine_qemuriscv64 ?=3D "cdda35317561d2741b396efa623ac=
e0bd2212c16"
> > > >>> > +SRCREV_machine_qemux86 ?=3D "cdda35317561d2741b396efa623ace0bd=
2212c16"
> > > >>> > +SRCREV_machine_qemux86-64 ?=3D "cdda35317561d2741b396efa623ace=
0bd2212c16"
> > > >>> > +SRCREV_machine_qemumips64 ?=3D "81cd255c72add4dcf06603250869f7=
39bb4f05cb"
> > > >>> > +SRCREV_machine ?=3D "cdda35317561d2741b396efa623ace0bd2212c16"
> > > >>> > +SRCREV_meta ?=3D "a48522779fae4887c47268e5f650bf10c94a165c"
> > > >>> > +
> > > >>> > +# remap qemuarm to qemuarma15 for the 5.4 kernel
> > > >>> > +# KMACHINE_qemuarm ?=3D "qemuarma15"
> > > >>> > +
> > > >>> > +SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=
=3Dmachine;branch=3D${KBRANCH}; \
> > > >>> > +           git://git.yoctoproject.org/yocto-kernel-cache;type=
=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
> > > >>> > +
> > > >>> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f423=
0826c0c6b8814"
> > > >>> > +LINUX_VERSION ?=3D "5.4.15"
> > > >>> > +
> > > >>> > +DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-na=
tive', '', d)}"
> > > >>> > +DEPENDS +=3D "openssl-native util-linux-native"
> > > >>> > +
> > > >>> > +PV =3D "5.4.15"
> > > >>> > +
> > > >>> > +KMETA =3D "kernel-meta"
> > > >>> > +KCONF_BSP_AUDIT_LEVEL =3D "2"
> > > >>> > +
> > > >>> > +KERNEL_DEVICETREE_qemuarmv5 =3D "versatile-pb.dtb"
> > > >>> > +
> > > >>> > +COMPATIBLE_MACHINE =3D "qemuarm|qemuarmv5|qemuarm64|qemux86|qe=
muppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
> > > >>> > +
> > > >>> > +# Functionality flags
> > > >>> > +KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc"
> > > >>> > +KERNEL_FEATURES_append =3D " ${KERNEL_EXTRA_FEATURES}"
> > > >>> > +KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc features/drm=
-bochs/drm-bochs.scc"
> > > >>> > +KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_=
kvm.scc"
> > > >>> > +KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravi=
rt_kvm.scc"
> > > >>> > +KERNEL_FEATURES_append =3D " ${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", " cfg/x32.scc", "" ,d)}"
> > > >>> > +KERNEL_FEATURES_append =3D " ${@bb.utils.contains("DISTRO_FEAT=
URES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> > > >>> > --
> > > >>> > 2.19.1
> > > >>> >
> > > >>> > --
> > > >>> > _______________________________________________
> > > >>> > Openembedded-core mailing list
> > > >>> > Openembedded-core@lists.openembedded.org
> > > >>> > http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e
> > > >>> --
> > > >>> _______________________________________________
> > > >>> Openembedded-core mailing list
> > > >>> Openembedded-core@lists.openembedded.org
> > > >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

