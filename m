Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id A733A7CC5F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 12:43:50 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i5so4177005oto.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 04:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fJdtTiBeylz1Wq8VYhDRH467sHFCWgtRdppCNEsOcSo=;
	b=r0a1pSeYuTANhVfZJ8ve2WfIMkXohqzN5weonetOGtmFGpljKWKgj3WxqgQOCPhZp6
	wFbJSOoLbvGbUTQusJMIlkYCIYIYUv1cmSHlVEqUD+fxCetTrsMdlBkCcVAyVg8YuTuH
	mUyFVJAKO52OfkdbqKBJlZs9Yx2xVZRM/uCIYmeWx85+vJWe59zly1+idUp/odlZUJ5u
	LtmIh910xaEuDggz8gSB/XOKliTNPk3lqizBwvUyBfefnCvSpU5eXn4WePTcWyRpAM0+
	0K4wgxFL1EC/RezjjLdeRtPSjb8R1Kp77NLQgYwJ9+ZTOxHLgoJCEaj3Qy+FgC+WqrDT
	qF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fJdtTiBeylz1Wq8VYhDRH467sHFCWgtRdppCNEsOcSo=;
	b=inuOsVFzN/ZXEWixL4D8fvMdC6TG4ZUHdMiaGSj1RdYNxym24W18xOgXX2K2u0Phc8
	ObNc2Rhs3ve+JHqCKpnn0/BrWqTzrrvZF5VfvoAtEWmNPzcixBz58pEJj3l4mjMTDwxD
	o0dqAbMUUvs/g98/gr8CL6ZsIAUCY2UluDFXqFJY7pRqVF62eImHyElElx68jqPMJcNq
	sPnckOM1WSYIHR55SPgyzwdDIoPiBbflJzFDyCgFIonLo0sMqfoKdj7nKrcpcIQ7Yq9R
	6PAVyHoad3da4jVa2xbdmssDgqr94cMJJOn4yetI0qixwPIX6E/RtuOlpvbcqRY2llHU
	7gAA==
X-Gm-Message-State: AHQUAub8b0Zg/o5P7UB5uVyBdV6gbcnd8qsjSOKF1/01dfwULhYxrury
	7vlbERWSH9FMBTzLsaCSKMVm8LgmrBRSnv5LoHU=
X-Google-Smtp-Source: AHgI3Ia9sLyaDTmTMJIb/GrItWCFtLEIxVSGFUOSeSehffvXStUHUFtEeoGDhWMYgGMhFvi5MS20S7g+CAX9lQtLF1g=
X-Received: by 2002:a9d:d0e:: with SMTP id 14mr6178608oti.360.1550925831538;
	Sat, 23 Feb 2019 04:43:51 -0800 (PST)
MIME-Version: 1.0
References: <20190222141650.46895-1-alex.kanavin@gmail.com>
	<20190222141650.46895-2-alex.kanavin@gmail.com>
	<b83e9ffe50071e4cc3cca2633c328f323e5834a6.camel@linuxfoundation.org>
In-Reply-To: <b83e9ffe50071e4cc3cca2633c328f323e5834a6.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Feb 2019 13:43:39 +0100
Message-ID: <CANNYZj_jHdtzR6LuWMmUs6wGsNi=XTw4acPaJQAdv8nR5ANidQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glib-2.0: restore API docs generation
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
X-List-Received-Date: Sat, 23 Feb 2019 12:43:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 23 Feb 2019 at 13:05, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-core/glib-2.0/glib.inc | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> > index 4d7fdeebbbd..6305f553b4a 100644
> > --- a/meta/recipes-core/glib-2.0/glib.inc
> > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > @@ -31,6 +31,12 @@ LEAD_SONAME = "libglib-2.0.*"
> >
> >  inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages distro_features_check
> >
> > +GTKDOC_ENABLE_FLAG = "-Dgtk_doc=true"
> > +GTKDOC_DISABLE_FLAG = "-Dgtk_doc=false"
> > +
> > +EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
> > +                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
> > +
> >  # This avoids the need to depend on target python3, which in case of mingw is not even possible.
> >  # meson's python configuration pokes into python3 configuration, so this provides the native config to it.
> >  unset _PYTHON_SYSCONFIGDATA_NAME
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/326/steps/7/logs/step3b

This one I was able to reproduce - patch sent.

Alex

