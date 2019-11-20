Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id B016B7F833
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 19:27:22 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id l38so166189uad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 11:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rHTVrQGKwgUC66ztZYmdCygo0tsZIoOqZny+P2ziq0M=;
	b=i9SOC1YVo8xFfIO0J5L4tJCwU0Kb04oz0uxDTGsSs0IFndZNgM13r5DyV9UFAmL87U
	0I4PAw6SlkduhU4qcgVb2x55VD6retYc/KuN9HVv3IJoiojd+ScqjwV46mgujAQfOLsa
	EcYkA30Re2NzWDvQEWr+8CWXXAn9MhcgAa8s1DEpLnLHkHH+CDVL5PKd5Aq8bBc2YLUd
	XSibOLVMGbO92SmLdGtvY5Y/rd+ejv1vp+Sb+dRwy09t/GRftWsbkz7iY80RxkxgY5ZY
	5QCkPwEl3ki3uKmNhia7pV5R63oScYGbXTVcHfbJKTjKQQ6zGDmc4Fk0L//UgQn40DXP
	bHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rHTVrQGKwgUC66ztZYmdCygo0tsZIoOqZny+P2ziq0M=;
	b=i939xsf++fUQrQvaDMJhah68HNNEygywn3p+wLerQwqNuMXlXTU5F6kwfAv12a2Ohv
	6jF3dEq12avjDq9yGbVTCl1qP87Hm5TA9vQnYlk9XMmwHtfXRzaw5/WA2igQwSh9dfzw
	F4eUu/Iahaa/yCHyR+8G6GyXFnvSBeASrw2hWv58mdM8u4pcj+r69k10DuF2R1TYtrHs
	RIvy3CsA7lJoiPJ9/VDfMR2HksH8d2akymJmVfaYN6gEanjAPEgODo637tDY4+aEI+Vj
	h3c/Yh0H37I/dPqgE4V0DvQwabnw9PZwRu4dg+Do50D02PG6VBMI8W8KD3nfY55wuKkv
	L8EA==
X-Gm-Message-State: APjAAAXjgI6xO1BzISlgW/ICEPd2NcTN85zNRtDvaqghlueZ8lsLF/0n
	fbOJuTvuIRgriRfiplniM6BLmFFIOBop/lZW6W0=
X-Google-Smtp-Source: APXvYqwkCPnd/E7PMLEaahtZ9LX/+ZbYtyw6uD0lbQNFqNFRs1CeUAJEhQgonVvCpwHEL3S3L/6tnF2F22ErvDy0tBI=
X-Received: by 2002:ab0:6903:: with SMTP id b3mr1741573uas.106.1574278043317; 
	Wed, 20 Nov 2019 11:27:23 -0800 (PST)
MIME-Version: 1.0
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<5c9cb09a-e0b3-f43b-36cd-bc9a7df2dd6c@kernel.crashing.org>
	<CAD0U-hLzTxYw3F-tPbj5m1+iqW+2PZcU5n4bE1sxL9KxGmuVUw@mail.gmail.com>
	<31b224ae-8e1a-943c-0554-684557ef33bc@kernel.crashing.org>
In-Reply-To: <31b224ae-8e1a-943c-0554-684557ef33bc@kernel.crashing.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 20 Nov 2019 11:27:11 -0800
Message-ID: <CAJ86T=XhxLih7d6cdXc8-1ZOKhHXTU6quzHnt+G4Oa3qhSFypw@mail.gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to backport openssl to Sumo
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
X-List-Received-Date: Wed, 20 Nov 2019 19:27:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 20, 2019 at 11:09 AM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
> On 11/20/19 1:06 PM, Ryan Harkin wrote:
> > On Wed, 20 Nov 2019 at 18:36, Mark Hatle <mark.hatle@kernel.crashing.org
> > <mailto:mark.hatle@kernel.crashing.org>> wrote:
> >
> >     You know that 1.0.2 and 1.1 APIs are not compatible?  So you will need to update
> >     everything that needs OpenSSL to understand the new API.
> >
> >
> > So far, we're only using it in a shell script to sign an image and later verify
> > the image, so I've assumed, perhaps naively, that the API changes won't matter...
>
> Correct, but there may be other components of the system that could be using the
> API that you are unaware of.  On a system as old as Sumo, you will need to take
> precautions to ensure that ONLY the 1.1x version is being used.  (There may be
> an openssl10 for compatibility that will need to be blacklisted.)
>
> >     For CVE fixes, typically you would patch 1.0.2p, or update to the latest
> >     (1.0.2t) as you go.  (If you have an OSV, this should be part of the services
> >     that they offer you.)
> >
> >
> >     In my opinion, 1.0.2 will be around for at least another 4-5 years due to the
> >     number of people actively using it in the world.  Until 1.1/3.0 (won't be a 2.0
> >     from what I read) exists and has a FIPS-140-2 support available -- people will
> >     continue to use 1.0.2 and maintain it as necessary for security.
> >
> >     As an FYI:  http://git.yoctoproject.org/cgit/cgit.cgi/meta-openssl102/
> >
> >     This version is for thud, warrior, zeus and master.  It is intended to be
> >     maintained until either 1.0.2 is no longer maintainable -- or the FIPS-140-2
> >     needs have been met by OpenSSL.
> >
> >
> > Great, that looks like a better option anyway, assuming it has the latest fixes
> > I need, and doesn't give me the same build problem.  Thanks for pointing it out.
> > I'll give it a go.
>
> It's better to work with the Sumo version for your needs.  I just posted that as
> an example of openssl 1.0.2 being needed still by others, even as oe-core/Yocto
> Project have changed their defaults.

If you want an up to date openssl 1.0.2 recipe which is compatible
with Sumo, you can find one here:

  https://github.com/armcc/meta-plumewifi

I'm only actively testing it with OE 1.6 (Daisy) and OE 2.7 (Warrior)
but it should work for all versions in between (and if it doesn't I'll
accept patches or try to fix it).

