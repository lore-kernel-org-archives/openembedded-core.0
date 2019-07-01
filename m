Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 24C846BC44
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 19:23:39 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id 190so9621417vsf.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 12:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6dNICNbUaa1sFLWm54pn5SLk84Kf4ikTMk6HhYkeI+8=;
	b=bgfC6s10mJuVQLMu/N+aA7k2IY7HBTFcl37zvcvtrTAUyQuU5Gr0bDR+Mpq53cwko3
	BK4B2jKMv3IqdCjQQTxWaksBpxLjdmfKplI/jGbPJG7YIbEFafmgX9lEmHevee8lmo4Y
	GezJiXP9kVwtA21lLi6KBRXDXO9FnkKUtx9vHjSrLfllhsmIG2zD8rLG10ezO0rgauNd
	s2U9b5RTzgxYtcGx+NJH7HBhzQB4+Pz2RzMp36qy6Bg9/CGNvbyuTjm/ddYpKe0bjsgJ
	uw+pg3H6njD0fawxTVDZXBvj2nz8LmyDa5Ec/ZsPqAqrZYdDEw/I4Of0sRFrDO50hEgy
	Ktig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6dNICNbUaa1sFLWm54pn5SLk84Kf4ikTMk6HhYkeI+8=;
	b=g5+4Cq7np1kfiQG5ljc8bDp2IExxn36jkRZG3BPobHvhiOp4ZBnFmfOL8IS3vxTNot
	8qY2OnakdFWwfRgcPeKbyxyUGwcxxgosKF1ZvHWisNJ95TIJseMDYilFEuaxv95X1tSq
	4i5WIv/xGGnuhuFSHYN6CIJujwMTrGqN6eFXWLfI0HXT0iBvqLEHBv4EMVGe0TAbjglI
	7QnY4zxcOo/mbsmndBBk8Kyd71InnCv76M0XnyDo4bVQA/d565lprBahlGJqOTK1bwId
	JNhGOy3ePcMY3hydXa/3MC0YLrrl1a6w8kxRuCqSCWsWHGuga/utfY0U7PuUVErdOz5z
	vAJA==
X-Gm-Message-State: APjAAAVCORsvIsJLnGiZ0EI6/6QWokzLOOmaToeJPdUG+pcPLmVpidNM
	KL84t5ko6geKM56cfdwz/+Oa82uEVTXsowV679k=
X-Google-Smtp-Source: APXvYqxmm5skIgacziJoPJRmHSmRIzjpf0qP+/oVPMh8+AkbM5+Rh/tsMi63vJQMSJYIi+yiueGZreRQhRKJMKh8x2c=
X-Received: by 2002:a67:b14c:: with SMTP id z12mr15111170vsl.11.1562009020884; 
	Mon, 01 Jul 2019 12:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190625131625.15658-1-mac@mcrowe.com>
	<ed1f167e12e6cc6f1031c2de0a5c6e439a7b6e49.camel@linuxfoundation.org>
In-Reply-To: <ed1f167e12e6cc6f1031c2de0a5c6e439a7b6e49.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 1 Jul 2019 12:23:29 -0700
Message-ID: <CAJ86T=UXpcAhAQ1WgwKNW69NBSGHRDvFGydU4FRX_4j=SCEZSg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mike Crowe <mac@mcrowe.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Stop exporting TARGET_ flags variables
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
X-List-Received-Date: Mon, 01 Jul 2019 19:23:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 30, 2019 at 3:00 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-06-25 at 14:16 +0100, Mike Crowe wrote:
> > Way back in
> > http://lists.openembedded.org/pipermail/openembedded-core/2014-April/210138.html
> > a few of us discussed not exporting TARGET_LDFLAGS. There seemed to be
> > support for this idea, and I modified our tree to not do so. I then seem to
> > have dropped the ball. :( We've been running like that for over five years,
> > and not observed any problems.
> >
> > It seems sensible to stop exporting TARGET_CPPFLAGS, TARGET_CFLAGS and
> > TARGET_CXXFLAGS too.
> >
> > I've successfully compile-tested core-image-minimal and core-image-sato for
> > x86_64 and qemuarm64 with these changes.
>
> FWIW I'm really happy to see this!

Yes, good too see this. Does it mean we're also now ready to address
(e.g. remove or poison?) these variables for -native and -nativesdk as
well? Or is that still considered too risky?

