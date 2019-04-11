Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
	[209.85.210.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8234C7D960
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 15:36:02 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id s24so5581515otk.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 08:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Qdhi9e1S+ujC5n0wtmDwEV6ME/JeFyN8XAcrefDdv7s=;
	b=mGwH7IriCtxdrcshB9qu50IFv7oNXRO658ANh3hQ+HxqLRyAdLbot8g2WpWl/ZJbBi
	Mj1HvmSzJB2dI9A491cdLt0thzwMunegY29a9B7ZO/LlGmqF9T2m7eUvBPRfeSXNRY46
	dvrS5mzVX7GwbUQwvYTrx70HZdncrQWk0NkaSoLg2JRGBGWeMb/aXr6HbZxkrgs1UIw+
	67xKmC2uLh+KSKf75vsOs9gtA28RlZlwESMvzDHQB2XyA3+vSyER2+xManker/oej9p0
	jMrZv/XLc7ozlvWEy821kzOS1r6MhCTaA6UWmqWp9M00N93qIVNRwYjRJORRei2+kw4D
	2otA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Qdhi9e1S+ujC5n0wtmDwEV6ME/JeFyN8XAcrefDdv7s=;
	b=knmKRo0hXRny2JYq4VS+rIqA+HNZwrINyjiYqs3wlytwerEWMM0JH5jGcUPbk7kNvb
	eXg69uagfVmOST+X5L3H6v9S2Csh92HKOl65jF+fk8YRAVKdNySeIrHRmbIhoAzb3Etv
	R94yPvAeKGNgDnHOPkzTMNgoGEWT7o7CsopjPsaIVsVoT8JNR8Sy1PZQGOm8+P6OcM7D
	4VbSaPY6vPMpkRizy1V241onvtU5qvKD0srYJyYzDT+l0b/BtwFCLJRR15y41mJXHFAf
	NvdPKqKXoftjasEOaRn5aDXb8h+TWjNvk+7QmL46StJrQP1lUvbrx/r3Q4cIcbx6SqYQ
	girA==
X-Gm-Message-State: APjAAAXR+vV8lrJwRHbE5nU7mCV1Ab+rWI+ko/3ShllyN2PWtscoD/0g
	WlUYnsHR2CMiWwR1tXVvsZ+DJy/RGTwS9clwhxA=
X-Google-Smtp-Source: APXvYqzMYgJGa8wCcQzI602+EWhuQAS7mDTNfKX2EbSpNmrxUeI/NoulUdkMWBlMjuzlx2HF09ggikzsDXyk0j7ztVk=
X-Received: by 2002:a9d:68cb:: with SMTP id i11mr32956275oto.237.1554996963406;
	Thu, 11 Apr 2019 08:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190410215402.20055-1-jason.wessel@windriver.com>
	<CANNYZj8K=irJAXpTtFtaNiQ2V+dFpSPT-ikfTgK5e0TECCv_fQ@mail.gmail.com>
	<3e65af20-d2ad-603a-d121-a5982c0ae69e@windriver.com>
	<CANNYZj94F69Ske57dARqP__Yk5iiutjaqxcens6tR84sfVMF+w@mail.gmail.com>
	<847b6274-fa84-c76b-ee52-b4f884d63c0a@windriver.com>
In-Reply-To: <847b6274-fa84-c76b-ee52-b4f884d63c0a@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Apr 2019 17:35:51 +0200
Message-ID: <CANNYZj9k0qM+O9+mVmHf1JM6MR3Cd5xbuhfZFWTqXcW+DnXb2w@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>,
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection.bbclass: Disable writing to $HOME/.cache/g-ir-scanner
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
X-List-Received-Date: Thu, 11 Apr 2019 15:36:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Apr 2019 at 17:25, Jason Wessel <jason.wessel@windriver.com> wro=
te:
> > Generally because generating introspection data is disabled for native
> > packages, as a matter of policy (do not build something which is
> > unused and untested).
> >
> > If you could add
> > EXTRA_OEMESON_append_class-native =3D " ${GI_DISABLE_FLAG}"
> >
> > to the gdk-pixbuf recipe, and re-test (without your fix, to be extra
> > sure) that g-ir-scanner is not invoked and nothing shows up in its
> > cache, I would appreciate.
>
>
> Thank you for the explanation.  I think the problem is more widespread th=
an just gdk-pixbuf, now that I have a slightly better idea about what we ar=
e looking for.  My build is not even complete and I can see there are three=
 additional places the g-ir-scanner is creating .cache entries.
>
> /poky/build% grep -r /usr/bin/g-ir-scanner tmp/work/*/*/*/temp |awk -F/ '=
{print $4}' |sort -u
> atk-native
> at-spi2-core-native
> pango-native
>
>
> Is it the case the bbclass file should be altered to set this variable fo=
r the -native, or does each package need to be modified individually?

I think Andreas's patchset that was recently posted (and is currently
in master-next) takes care of this in a general way, where you don't
have to go and fix every recipe. The unfortunate bit is that meson
does not have a standard flag for enabling/disabling introspection,
but we found a way to deal with this that is as generic as possible.

If you try with master-next, would be good to know.

Alex

