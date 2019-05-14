Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF9B6C135
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 03:22:11 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id j1so9397375qkk.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 20:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=M11EpIRwe2v1Az0nDp5T70prOntmcm8Hv21YN7XS77A=;
	b=ZG5v1k4/EA+4pybCzE8CaUq1V5gcmRREUGrZYL/hAT+s6+0gMHDRv7jX4voK8u6vZ0
	JqOqQGHFBXhhvkB2RMDlXBfN83Cz7dlDmHs1wimqiE6/mq+xW6DFWdj22DhzhguJkXou
	2FJW0EWBTr12DVG7ue7LHOYcAWEQegicqr3m/BV4aZtXWDan2MSGBOFPl+et9GA/LK6p
	CLlVrb5Dr/iFE7qqXGOPdHeQHfi0McQ26MOm7sEPZoArSzlYKRvVp4/FeX2r5UxQtr0S
	NgylmUaXf7X8oEPHFrduGT5KP+GMkRII5QrazfRsJwDLWUc8iKetT0C2Laj+7ILWnDGq
	T/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=M11EpIRwe2v1Az0nDp5T70prOntmcm8Hv21YN7XS77A=;
	b=IEePzKBCIc1673Rtr2YM3e7tOMNPr9qGAG3FIrG5ezOCA7dgx73CSN0xC0P1Ds92Us
	P/9+iubvDNo4V7fM0Qf1+1jl3UWlkcYF+z1PSuKYFN+KcKMEMX4E9ag7YJv5XTii4E5Y
	2T2P72SD0lKXpdyvy/Yrm+DZYEfL0ACxxLaK0aWJSwVsy3SU88QLGwe46t0LXEMOUYK4
	EtmB1nHsLOV4k3dgQ7DTbvSQCTrOhpQZxeYUJp171eec9aJBAjf9I0vhPa0qijSw7G33
	970Nz7/YvFRQl6LS2d2vlp/SJpkGrbkw7ne8oEisQiv72rsM6Pgmy9S6X6p/JVqtjxJ5
	3qpA==
X-Gm-Message-State: APjAAAV0MvC8Sz/Kf5hen53284I+lb6fVqcYvpyyV/4Rag8V36nS9wfm
	u6ch12Ln809xtS9USGIFhzjBKaqhspdgCyA9Vbw=
X-Google-Smtp-Source: APXvYqwOccDyWZ1Znhc9KfNBPMnQFsc9ydufKo4YNNOY/O/irCkoLn3wXHBsPPxuVSa+lmEB2bAI3289zAzOP9guUQM=
X-Received: by 2002:a05:620a:39b:: with SMTP id
	q27mr25342811qkm.223.1557804132592; 
	Mon, 13 May 2019 20:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190506175136.7594-1-raj.khem@gmail.com>
	<20190506182339.GA21306@localhost>
	<CAJTo0LY0O4Va07qZ+Nq+YXmkM7GXhSbB9e1bZ_P17vPuv657_g@mail.gmail.com>
In-Reply-To: <CAJTo0LY0O4Va07qZ+Nq+YXmkM7GXhSbB9e1bZ_P17vPuv657_g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2019 23:21:46 -0400
Message-ID: <CAMKF1sphAThZQNBwaNo3tP8v8G+cmimD8SiteCbgBEyQEL_q8g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 1/2] systemd: Fix build with gcc9
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
X-List-Received-Date: Tue, 14 May 2019 03:22:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

you are late to party but its already applied see oe-core/d5e999616e

On Mon, May 13, 2019 at 7:27 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> https://github.com/systemd/systemd/commit/c98b3545008d8e984ab456dcf797874=
18fcbfe13
> is the upstream fix, so lets use this instead.
>
> Ross
>
> On Mon, 6 May 2019 at 11:24, Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Mon, May 06, 2019 at 10:51:35AM -0700, Khem Raj wrote:
> > >...
> > > +gcc-9 has become a bit stricter and can check all kind of formatted
> > > +input/output functions which causes additional warnings when compili=
ng
> > > +networkd
> > > +
> > > +/src/basic/log.h:104:9: error: =E2=80=98%s=E2=80=99 directive argume=
nt is null [-Werror=3Dformat-overflow=3D]
> > > +         log_internal_realm(LOG_REALM_PLUS_LEVEL(LOG_REALM, (level))=
, __VA_ARGS__)
> > >...
> > > +         if (r < 0)
> > > +                 log_link_warning_errno(link, r, "Cannot %s IPv6 for=
 interface %s: %m",
> > > +-                                       enable_disable(!disabled), l=
ink->ifname);
> > > ++                                       enable_disable(!disabled),
> > > ++                                       (link->ifname) ? link->ifnam=
e : "<null>");
> > >...
> >
> > The fix doesn't look correct to me:
> > gcc says it "is null", so checking whether or not it is null doesn't
> > match the error message.
> >
> > If it is a compiler bug as was at some point mentioned upstream,
> > a better temporary workaround would be to stop making this an error
> > with -Wno-error=3Dformat-overflow (untested).
> >
> > cu
> > Adrian
> >
> > --
> >
> >        "Is there not promise of rain?" Ling Tan asked suddenly out
> >         of the darkness. There had been need of rain for many days.
> >        "Only a promise," Lao Er said.
> >                                        Pearl S. Buck - Dragon Seed
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

