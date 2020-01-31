Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5C8CA60D0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 05:35:08 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id c5so4524308qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 21:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZYvh2yUrUROAVSijkfDJYvKMhC/zWebry+jB/2Uh5sI=;
	b=vab60jhPctdPZUvvFmLueg+xQ5KNvPiMBSGBAXqBqPGO4VVMR1s/NmuzIFTlKYSdFp
	kTDD5WiYgXfATllGlobT+TO1WJgaq40f4lS4qMvoE8YXOpiftjNNMvd5pRkihCfYkjD8
	lUBVBVyPWI0QefGOzfA9Y7Jdcmp0wIYtlGWyafRR+64JsinSa3Hz+Qac/u9yirbjfE5W
	fNHxDuVYlKPYzw2mQR8oIBJuk3nY28NYeVExdr0NEQUdZHszrQHW5LGshpHm1dkf3q6+
	UdySj2ZkogDcFR4VWwRORGHOU/FLfLiQplGCNnkrYYRnrj0dOlhVdGjTor+BhGg4VZCG
	AEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZYvh2yUrUROAVSijkfDJYvKMhC/zWebry+jB/2Uh5sI=;
	b=IETKGxJaqM4XhetyC90L8X+aiwvw5L4XI65MTQG/M+zQ1i+u85UBnsnhpfxfmER0iT
	JWEEAlSzJTIBVlODjcnWK7TXWGIVtMNep51RMqxhrjLk1TSnBaAjTmW8DjYN/+BxoDtb
	uYM/fJfRCCdKoQ2rJZpCjHe61K/5N9pdz8lOadm42KwUt+VQwJGLT3Wxxlso1RqwqvXL
	e2glUs5s4RF7uxTTHodq2nU3KGr5O8GkP8yXbpZUQUrxnuDjIyJ/3A8rz3WGEzm7cRSQ
	ZpZPrBiZDEXhMMKVgx9khKByljeJpaLia2gP8/O3XcmyZO6Dugw3V89bnMqCdmLYJgaM
	asgQ==
X-Gm-Message-State: APjAAAWw5MKa2VeNxdnH7Tk2JTEm3mg3JhmqcIi7HMJXZoSrEwEq6fwp
	N4+AyyEx+r79jHhZ5Dgyhk/VPABW9ViWd2ZWGVM=
X-Google-Smtp-Source: APXvYqxb/Nj0m7jE17Y5eYZYiXKv+EeB4VYdYNzxOd/I7SnTdMdZrrFam96BFG87bcRTVUb+d+rMnyX3L7ITyBfc+MU=
X-Received: by 2002:ac8:405a:: with SMTP id j26mr8991467qtl.88.1580448908957; 
	Thu, 30 Jan 2020 21:35:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
	<CAMKF1soahdfvfsi_-27Zm3QMsr_Mp__oZ8k22gVuUZJpvn1Q-Q@mail.gmail.com>
In-Reply-To: <CAMKF1soahdfvfsi_-27Zm3QMsr_Mp__oZ8k22gVuUZJpvn1Q-Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Jan 2020 21:34:42 -0800
Message-ID: <CAMKF1sosVW93VB4AyqQ1J0nB+Xw_SSYywXLf85pndOYtbNwX=w@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3][RFT]: kernel-yocto: v5.4 LTS kernel
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 28, 2020 at 5:58 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Jan 28, 2020 at 2:14 PM <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Hi all,
> >
> > I just wanted to send these to the list, so everyone could see the
> > reference kernel that we are planning for the upcoming release.
> >
> > I have other patches to drop 4.19, 5.2 and make this the default
> > kernel for the various reference platforms as well, but I'm not
> > sending them, since we still have two outstanding issues:
> >
> > 1) mips64 init is segfaulting after / during some self tests.
> >
> >    https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1520/steps/8/logs/step6c
> >
> > 2) x86 musl is getting a gpf on many commands:
> >
> >    https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1501/steps/8/logs/step1c
> >

I ran bitbake -ctestimage core-image-sato-sdk for musl/qemux86 and it
passed on master-next so perhaps
its fixed somehow ?

>
> musl now uses 64bit time_t for all 32bit platforms. So my hunch is in
> that direction. If you can point to
> an interactive reproducer that will help. I think stracing it will
> help identify the problem. all segfaults seems
> to be similar so it could just be one issue causing this all.
>
> > I've looked into both, and don't have any great ideas on how to debug
> > or fix them.
> >
> > So if anyone has ideas, or wants to poke at these, feel free to follow up.
> > But as of now, we still can't merge the v5.4 kernel as the reference due
> > to these remaining problems.
> >
> > Bruce
> >
> >
> > The following changes since commit ca3993cc4b13d4e661228cee6fb9448adfd0a4ba:
> >
> >   bitbake: tests/fetch: Allow wget upgrade tests to run against a local server (2020-01-22 15:56:39 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.pokylinux.org/poky-contrib zedd/kernel-oe
> >   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
> >
> > Bruce Ashfield (3):
> >   linux-yocto: introduce 5.4 recipes
> >   kern-tools: update Kconfiglib to latest (for 5.4+ kernel)
> >   kernel-devsrc: update to v5.4+
> >
> >  .../kern-tools/kern-tools-native_git.bb       |  2 +-
> >  meta/recipes-kernel/linux/kernel-devsrc.bb    |  8 +--
> >  .../linux/linux-yocto-rt_5.4.bb               | 44 +++++++++++++++
> >  .../linux/linux-yocto-tiny_5.4.bb             | 32 +++++++++++
> >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 54 +++++++++++++++++++
> >  5 files changed, 136 insertions(+), 4 deletions(-)
> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

