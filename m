Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id 49B9F7D16D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 17:12:37 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id d24so1085919otl.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 10:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1pElSze4Iu6mEToGeZjMuFDaIR4WkV7/ndF6DiHU6pY=;
	b=hHF04Gx/9OVzFLkZo+VGpDwc6/3I0DYmuW10kSDVUgIYW5Z1eWtFM3tzd1x6Jgl46t
	gmT+iIwvCN/f/eLvAYMyDbx+7GfSi0RfIvxrhorevC/ldzD4YmiemJlib+H920jDSZRU
	scEV1ZXhEuLpPdOmzEnAjDlo4CC7LE9+XtVlnFxdcSQGu0h3awbZK6asp1Ut6QGMgkBU
	QmWVWjpiZJ3M9NUySAL5NHkdVTyujupfLPfsQREYsdECGyz8V6DJEDZaxg05q0OoAV14
	BfpeC61KKV2gh2MdV7ztbVvq2/CEX4/V5vJEWOxaD0/AjxxrES+iYABxw01m4ibe6Y52
	yw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1pElSze4Iu6mEToGeZjMuFDaIR4WkV7/ndF6DiHU6pY=;
	b=bf7bg4hFkRuYfpI1pBH272NcbW20E0oRmaaTvWndd55vRE5erOKSXkIDStp5G2Oqpz
	ms4/Hz6OB1Au5uCKn1whBUtKKI/W35dFLk5l/oKsOTaj0LNlh4WLa5Q6IldTUUJJg7vI
	AYNFc1YIHgVfOP/QdgxDFahMLtRji27lVvUnYNTbWZFQLJu67swBlmY3aDrVqNjQbx7q
	ZBI0LuT+VqNRuUMfPVYYwAU5rXtRdP1F/zgHZS10iWQa1sJZGQYaeDTZzwj6U4R1HIYS
	RSviQtFHIRlQeHe2qZyL3P1rQuV8i7GSNzatNiDCFNQCTFHLAmhnPyK9w3nlMtqYjQJW
	SrFA==
X-Gm-Message-State: APjAAAVJesiYFmr5XDy1pPIyFpw4F6L1mep5uChl8TxEOuGkqZi5Czcf
	RTuK/eVJUo7JHhRS0HgWiuJ6WmIACcmeyuqBP/A=
X-Google-Smtp-Source: APXvYqzXEaZAnPI/SaS4nUqWxpTjrn10L7aU78CuiW/UIu+L+cNVOKDbqQVnYaBVWLMTd2A21w4Dq1LWnbe1QRjRTXM=
X-Received: by 2002:a9d:68ce:: with SMTP id i14mr1610534oto.293.1553706758222; 
	Wed, 27 Mar 2019 10:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190312012245.25551-1-kai.kang@windriver.com>
	<CAJTo0LbfKpABuhzzEdfpYQ_UEHSV7cV4ffMQeUj6ZhtFZu-hmw@mail.gmail.com>
	<a3a1014e9307a7d44e84bf50d54c1454d731ebca.camel@linuxfoundation.org>
In-Reply-To: <a3a1014e9307a7d44e84bf50d54c1454d731ebca.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Mar 2019 18:12:26 +0100
Message-ID: <CANNYZj_nWdxTXYoD114g3Tdho0D-L1zjrLz0MQ97Y8LwedwdiQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] virglrenderer: requires distro feature opengl
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
X-List-Received-Date: Wed, 27 Mar 2019 17:12:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Mar 2019 at 23:35, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 12 Mar 2019 at 01:23, <kai.kang@windriver.com> wrote:
> > > +REQUIRED_DISTRO_FEATURES = "opengl"
> > > +REQUIRED_DISTRO_FEATURES_class-native = ""
> > > +REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
> >
> > I suspect you can drop the native/nativesdk overrides here, as
> > DISTRO_FEATURES is overridden in those builds.
>
> I suspect it is needed since we clear DISTRO_FEATURES to a small subset
> for native/nativesdk and hence opengl won't be present. If its not
> present, virglrenderer-native will then not build.
>
> We may need to rethink how we're using the native distro features.
> Maybe when you add virglrender-native, you need to add opengl to the
> native distro features? We could change qemu config based upon that?
>
> It would be good to confirm my above guess is correct...

I have reworked the patchset that enables virgl in qemu to make that
conditional to opengl in DISTRO_FEATURES, which also allowed the
suggested cleanups. Will post that in a moment.

Alex

