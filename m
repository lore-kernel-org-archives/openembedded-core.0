Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id F407061170
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 00:04:01 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id n27so2449401vsa.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 16:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SZ7FEn00v1CVistwvbn1f5vfY3PSOx7o06N5zVRhZfc=;
	b=dX9iv4UzXwp3tpIYHLd7VpxtTil+tR/UHoO/z2UEjN1+g3vdFtF4jXYmSUBudFNs2o
	l1z4V8hYsUHhToz0PGScvM5eN4PgxzBo70z05qeaOrN9DQY9RcnuK+nLsY7gM00sWtwh
	0O61Vmw07jQoUmJPF4H/vDRLrXsR0YErJrA7hfVqlGPhi9yqUOZd03FtCkh9b3HuqNWd
	cDB0TzOYIXBGgk1UiCo+XqD51ZrdNHvSwxGICskvs1paGtfXPCu0UXUF3k0n3VgK9BbI
	DS6HpcPeGTpDoLvOm9ZojY6OTkv5QdEVPZGsIgH+0RYfTRZDicIUU8Cg4HnVYp7WH1J/
	z9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SZ7FEn00v1CVistwvbn1f5vfY3PSOx7o06N5zVRhZfc=;
	b=DbZHdZjUMBSKWIKlcB0FQJbUke4aLhSPO5fDvL5x7AHUARO5u5AUAHzrkNDaJvpc6S
	YHlMRHsQPWPDIl5aHu/ip/4B5eYThWUJAwU/oGB+AOer9NSYk2LMszdU2p5Tysp1Pbnj
	1jgBbH9WLfCYSoNGq6s/VeRZ+JMIJ9wVuZPaUVS1aib0cnVSAO1rLFt6JEd22XK+1Y72
	Hb7ord6mpdzH7vwGWns32QMX00p3EDT3ZtxA5lw5xKTQMQScMXPTD9GBW91yJKlHhNl6
	SjYY0i0qZncOeTNx9WhfVfICjozUe/rk8BYli6xUZqILeH1SLQnqHTql+pnJFJDt1xXB
	LIrA==
X-Gm-Message-State: ANhLgQ3Vq6RFLoRZzTR5dU9LYWcHxBArzF2fLv1VFPz4pgoL8BkF0XKl
	OXQ5uau2hLr+JdPXMPcooRrK0kxjpc3H0M6NPmQ=
X-Google-Smtp-Source: ADFU+vuukw2KyimwoED3H4CPa+g5yfdMSAtDcN+vq09S90PYxWVuWkxTzsxZvEKvuEi3s8FVGFJE7IdNStEBu5xLYbU=
X-Received: by 2002:a67:d60a:: with SMTP id n10mr3836476vsj.130.1583366642713; 
	Wed, 04 Mar 2020 16:04:02 -0800 (PST)
MIME-Version: 1.0
References: <20200304222447.1787-1-jpuhlman@mvista.com>
	<CAMKF1so0sueuAe73mCuHkU99s9a70EiXDg+5P3CpRE3hbAYicQ@mail.gmail.com>
	<CAJ86T=WvfFrSFakLWEXE=TTi1aw9zcVWdAxrAS7N7ZiDA1mvww@mail.gmail.com>
	<e097eb31-2f0e-cdda-cb5e-2484aeceadf3@mvista.com>
In-Reply-To: <e097eb31-2f0e-cdda-cb5e-2484aeceadf3@mvista.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 4 Mar 2020 16:03:50 -0800
Message-ID: <CAJ86T=U6NSoR-844usWLeUFtS8KyHeX8qaKiNdDH2pOZmP-zbQ@mail.gmail.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdbm: add depend on readline for consistent builds
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
X-List-Received-Date: Thu, 05 Mar 2020 00:04:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 4, 2020 at 3:48 PM Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
> On 3/4/2020 3:43 PM, Andre McCurdy wrote:
> > On Wed, Mar 4, 2020 at 3:22 PM Khem Raj <raj.khem@gmail.com> wrote:
> >> On Wed, Mar 4, 2020 at 2:25 PM Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
> >>> From: Jeremy Puhlman <jpuhlman@mvista.com>
> >>>
> >>> Whether readline is installed on the build host or not
> >>> influences the way gdbm builds. Depend on readline for
> >>> a consistent build.
> > It sounds like configuring with --without-readline would be a better solution?
> Its an either/or. I suggested both in the bug(13714) basically either works.

If both approaches work then an explicit configure option is preferred.

> >>> This fails to build on a system with readline, and using
> >>> the buildtools-extended installer.
> >>>
> >>> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> >>> ---
> >>>   meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 ++
> >>>   1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> >>> index 7e2efe3c9b..5326184181 100644
> >>> --- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> >>> +++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> >>> @@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f74
> >>>
> >>>   inherit autotools gettext texinfo lib_package ptest
> >>>
> >>> +DEPENDS_class-native += "readline"
> > Don't use += with an over-ride. It doesn't do what you might expect.
> Okay.
>
> --
> Jeremy A. Puhlman
> jpuhlman@mvista.com
>

