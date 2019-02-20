Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 89B077CA2C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 17:50:37 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id i5so41574318oto.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 09:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OmNVxMJ+dBqTaNLVuOy0ih8ESWIIeWHe7bhcB7tm+Qk=;
	b=mEULmsjA7qJPkUIvxo4IFW33I/DqeBmfIq6q0J2FXBG0BTlvHU2/7CkZuBZUFDX9HG
	TkITPctOf09VLgl6t6wQtXNF2ZXn4GRTxt71QUzFbnX3omXIZITkf1Wm6cYGSTVARL/7
	zV40Ivj47d1t9FpOV/wETSH6YOQjKCqnJiSUCdUXZdttFzmEkLIJGVqwC5LkEJepfh3r
	Q+YKIXrNZKYdYDV9JcaPZhuvlgST/uvWuYucxIsKKFpz5vm7yYKePhVSGX56Caaral6Q
	ULPFM/5mpzK7YOu2yEHN3aS6fY2SYHMf5aD0TDv9YvNMIBnTbH0YJgRExQ241mwV6kK9
	pJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OmNVxMJ+dBqTaNLVuOy0ih8ESWIIeWHe7bhcB7tm+Qk=;
	b=fPmk/x5xGNKQ50GeTama6GPHlGnQiHMqzi7xd0ttIYM5fFw3PEHp+nQHrLTmE8rkRN
	yZ2XEiGgwydaaKqPiUmwFAK/xS69MrEOur70jVqViuhlMuK1wrc0g43a1ZUiZnF6B8O0
	gXqkO9TJfTlPl2hd29ETEAManpfcHCdLwWLxRPuzWZBJKInrJDSDNGMA6rvNXHdHwWBm
	UuJK61sf5D6na2pSUnz1xN2YTQuQ1YiftsXYWkHRFKcnUuDeDDTsWGgXsYpln35Hbjd2
	4GOs8G58HrLL5EvkdzyurPYzxmCoiMTLv/nJCXtDCxP+4Mebh6Kq66NybtuGYL3cXvPx
	Ls/Q==
X-Gm-Message-State: AHQUAuYkd25o6wETPTj36lVE0IOPVZUQh/3/qtIZXhV3IVlk2GqLljp1
	R2f1RCSKaOYOprmHcFIX2286rswCaa8UtZgd+ZM=
X-Google-Smtp-Source: AHgI3IYa1+ssv6NB9c0H6Uxh+Sr660IyR5lbSS9r6gZvHBw3Bz1k5eMjze8/w6MZckDKJtrosj/DFsp16mmuDlK0wLg=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr21726744otl.12.1550685038576; 
	Wed, 20 Feb 2019 09:50:38 -0800 (PST)
MIME-Version: 1.0
References: <20190220121544.9462-1-fabio.berton@ossystems.com.br>
	<20190220121544.9462-2-fabio.berton@ossystems.com.br>
	<CANNYZj9yLw3oYy0AK6ey2F85JTV9onR47fdxCpNTMjMsyg5R_A@mail.gmail.com>
	<6620040d80c34ea1a79f622e1ceea4c15f095f0b.camel@linuxfoundation.org>
	<CAP9ODKodjXx1qG4pVt85HrGgChcBupwqS28A_92xHB_vvfnhWg@mail.gmail.com>
In-Reply-To: <CAP9ODKodjXx1qG4pVt85HrGgChcBupwqS28A_92xHB_vvfnhWg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Feb 2019 18:50:26 +0100
Message-ID: <CANNYZj_YqMe3ujHuacoDsCZJTUnehSbWoGRJT=xn3-9WcRmByQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH v3 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Wed, 20 Feb 2019 17:50:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Feb 2019 at 18:35, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> > On Wed, 2019-02-20 at 15:47 +0100, Alexander Kanavin wrote:
> > > On Wed, 20 Feb 2019 at 13:16, Fabio Berton
> > > <fabio.berton@ossystems.com.br> wrote:
> > > > -DRIDRIVERS = "swrast"
> > > > -DRIDRIVERS_append_x86_class-target =
> > > > ",radeon,r200,nouveau,i965,i915"
> > > > -DRIDRIVERS_append_x86-64_class-target =
> > > > ",radeon,r200,nouveau,i965,i915"
> > > > +DRIDRIVERS_class-native = "swrast"
> > > > +DRIDRIVERS_class-nativesdk = "swrast"
> > > > +DRIDRIVERS_append_x86_class-target =
> > > > ",r100,r200,nouveau,i965,i915"
> > > > +DRIDRIVERS_append_x86-64_class-target =
> > > > ",r100,r200,nouveau,i965,i915"
> > >
> > > This produces:
> > > > configure: error: classic DRI driver 'r100' does not exist
> > >
> > > radeon has been renamed to r100 in meson builds, until then it should
> > > be still 'radeon'.
> >
> > Its getting a bit frustrating/tedious to kill all the builds and drop
> > the mesa patches again :(
>
> We are doing our best. It is unfortunate it ended being a
> "one-big-do-everything-together" patch. This should have been done in
> steps since the beginning.
>
> Fabio prepared the new version. We hope it finishes this patchset.

Before you submit any new version, here's another issue, not sure
what's causing it:
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/312/steps/7/logs/step1b
(line 14055 onwards).

'Steps' approach works when each step can be tested quickly. Running
tests on the autobuilder is an expensive, time-consuming operation
(both for the machines, and for RP dealing with the outcome), so those
rounds should be minimized. It is for this reason I did recent perl
and python major version upgrades and recipe rewrites both as single
mega-patches, and not as series - this ensured the minimum possible
amount of testing rounds. Fortunately I also didn't have to convince
anyone about it.

Alex

