Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 68F1E7D00E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 15:57:42 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id t8so9047194otp.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 08:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=he+4EqDRHdZ6mC+nKEk/O+r77mXLIu2nQl9di0rKkaA=;
	b=a33idd4520bEWuJXMyPr90z1B0E2dKhYNjKWlcVP/PDkUaiukMGZO5yME8Xy+uEMzr
	C3YOEIS7BIgti6zziI2l2GKUFAw83NM2zj/6su6MQfPjjRbZy4wESrSiFiGqt2SfoMhP
	e9zXpS4wf7m+6b5f52JOiMBNq6xlg3G9mOrUU9fXHNOfKHiZs3t382oIEtxQ4tLcQPpx
	cpYls8kXQ52HN/8ppnerJXkvCOdydevtFnz5Om9oyIJHsNk+MPgWWW6L0yPrdos4LMlf
	kcx5trWvAFo81Dpw/NyW+8lLJ/CpbguMBfFeUnTqgCau2eJMhrX4i08e5yT9P7yqVBOC
	9X/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=he+4EqDRHdZ6mC+nKEk/O+r77mXLIu2nQl9di0rKkaA=;
	b=pqDeFv2iTpmtZMFmdjL9kX0OMjVt/tNeQGS15oYeKeL/Y/Rv7WZJ7kV521Bhozi++7
	3c2NHsPY2TOnIeLXOOAtRBO2oOyCWS/g0PteyrkloVqfAYTvzbs+/xvYR8ceH28R0XVe
	oyI8i4fBlbe8WGlA+YiI1jz9qri6hj51yVauIstExKc7cwmHbHbIeTUsj7GCVIJ8wyIN
	WQrIR6ztTvwiq4chRuzfw0q+c+aj09A/VFz3OBVgG/2S68lJYgjQrWy2mSMH8O3F2inI
	u5Hc50uv8V//bvUmhfJjeEfuuitF4Y8NmABzDISBWI7pldC8Lionj4Sbgg5Z4L3L8jh8
	I7EA==
X-Gm-Message-State: APjAAAUZDMt9JqejXNojgJlJz4LJhJgetUe12XvE63E60uTvlWZNHQZN
	tIWzL0b69pXUTLYJZ6wvMr3yqBkmYxkjwQmy/D5iucp18Mg=
X-Google-Smtp-Source: APXvYqxHCjgLs6LkycU10O7mE3U8Q5aa/7zkpU643YJIr/Ob4YMq00FObbnEE9OeL5fz3orFSb59ulW5xGolleMdQZ0=
X-Received: by 2002:a9d:62ca:: with SMTP id z10mr47093202otk.207.1554134263459;
	Mon, 01 Apr 2019 08:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190330224908.2108-1-open.source@oleksandr-kravchuk.com>
	<25e816bb8ab33d104be3feec92080bda3ee60f99.camel@linuxfoundation.org>
	<09ee1ada-c90a-c04d-5032-dcd94e7bb864@oleksandr-kravchuk.com>
In-Reply-To: <09ee1ada-c90a-c04d-5032-dcd94e7bb864@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Apr 2019 17:57:32 +0200
Message-ID: <CANNYZj9rmK_hmgT9gS_tbZpOdMepq_F58=ux_N5F1oY7zwy_KA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ofono: update to 1.28
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
X-List-Received-Date: Mon, 01 Apr 2019 15:57:42 -0000
Content-Type: text/plain; charset="UTF-8"

It does not look like a hard dependency.

configure.ac has:
AC_ARG_ENABLE([external_ell], AC_HELP_STRING([--enable-external-ell],

So you can make it a PACKAGECONFIG option, disabled by default. It's
fine to have oe-core packages conditionally depend on things in
meta-oe, if the condition defaults to disable.

Alex

On Mon, 1 Apr 2019 at 17:54, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> On 01/04/2019 16:13, Richard Purdie wrote:
> > On Sat, 2019-03-30 at 23:49 +0100, Oleksandr Kravchuk wrote:
> >> Deleted patch has been mainstremaed.
> >>
> >> Changelog:
> >> ver 1.28:
> >> - Fix issue with SIM initialization and Gemalto modems.
> >>
> >> ver 1.27:
> >> - Add support for handling SIMCom based SIM800 modems.
> >> - Add support for SIM lock state with xmm7xxx modems.
> >> - Add support for coexistence feature with xmm7xxx modems.
> >>
> >> ver 1.26:
> >> - Fix issue with AT callback handler and GPRS.
> >> - Fix issue with handling EUTRAN SMS only states.
> >> - Fix issue with handling MBIM strings on big endian.
> >> - Fix issue with missing char and SMS national language.
> >> - Fix issue with unsolicited notifications of +CGAUTH/+CGDCONT.
> >> - Add support for setting "none" authentication method.
> >> - Add support for SMS and phonebook with xmm7xxx modems.
> >> - Add support for voice features and Gemalto modems.
> >> - Add support for Bengali and Gujrati SMS alphabets.
> >> - Add support for 8 additional languages for GSM 7 bit
> >> - Add support for using internal Embedded Linux library.
> >>
> >> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com
> >> ---
> >>  meta/recipes-connectivity/ofono/ofono.inc     |  7 ++---
> >>  .../ofono/ofono/use-python3.patch             | 27 ---------------
> >> ----
> >>  meta/recipes-connectivity/ofono/ofono_1.25.bb |  9 -------
> >>  meta/recipes-connectivity/ofono/ofono_1.28.bb |  8 ++++++
> >>  4 files changed, 12 insertions(+), 39 deletions(-)
> >>  delete mode 100644 meta/recipes-connectivity/ofono/ofono/use-
> >> python3.patch
> >>  delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb
> >>  create mode 100644 meta/recipes-connectivity/ofono/ofono_1.28.bb
> >>
> >> diff --git a/meta/recipes-connectivity/ofono/ofono.inc
> >> b/meta/recipes-connectivity/ofono/ofono.inc
> >> index 0472414b19..37772121f8 100644
> >> --- a/meta/recipes-connectivity/ofono/ofono.inc
> >> +++ b/meta/recipes-connectivity/ofono/ofono.inc
> >> @@ -1,13 +1,14 @@
> >>  HOMEPAGE = "http://www.ofono.org"
> >> -SUMMARY  = "open source telephony"
> >> -DESCRIPTION = "oFono is a stack for mobile telephony devices on
> >> Linux. oFono supports speaking to telephony devices through specific
> >> drivers, or with generic AT commands."
> >> +SUMMARY  = "Open Source Telephony"
> >> +DESCRIPTION = "oFono is a stack for mobile telephony devices on
> >> Linux. \
> >> +oFono supports speaking to telephony devices through specific
> >> drivers, or with generic AT commands."
> >>  LICENSE  = "GPLv2"
> >>  LIC_FILES_CHKSUM =
> >> "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
> >>                      file://src/ofono.h;beginline=1;endline=20;md5=3c
> >> e17d5978ef3445def265b98899c2ee"
> >>
> >>  inherit autotools pkgconfig update-rc.d systemd bluetooth gobject-
> >> introspection-data
> >>
> >> -DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info"
> >> +DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
> >
> > ERROR: Nothing PROVIDES 'ell' (but /media/build1/poky/meta/recipes-
> > connectivity/ofono/ofono_1.28.bb DEPENDS on or otherwise requires it)
> >
> > OE-Core doesn't contain ell?
> >
> > The new dependency isn't mentioned in the changelog?
> >
> > Cheers,
> >
> > Richard
>
> Right, it's part of meta-openembedded. I did not think about this.
>
> What does the project usually do in this kind of situations, ports
> dependency to meta-oe or refuses package bump?
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

