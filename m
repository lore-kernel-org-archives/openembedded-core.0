Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 55D8371CA7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 19:48:01 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id o12so80711957iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 12:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=NKVsbRgxh16C2VJIy64vsGgfj0W8VhmzsHvTvtu+LpE=;
	b=KeSSXWaj0CYr0k1YZmQpwvySZKYCB5hJCSCvCLpzQtvkJYIJH4G7xV5DPl5BzsXoKX
	0aHs0BBNt/W/nNnY/S0w4zLONI+Y9FfWatbBFSEqPhn4NCEIPKzQEvdZB3U5NVCPkaor
	zOlH6I/Cg+wpERqj6LFLGuRRE5VOnBAllWKVQhINVvS3jj1IPaJeaemtY+MwaKNiBOd2
	OZEGVHu69NkWUI79nRV6EGnZ5MpVJ8iUL6/zn2XJvP7U4/KtnQVxbGqXDzgk/Ai221mR
	B0X1pQvuCkjMbZUwRh6Y6vJPbVCbN+eI5DlKwOlsiJqSi5iq05uLwEzw/j1cPTcVatAM
	vcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=NKVsbRgxh16C2VJIy64vsGgfj0W8VhmzsHvTvtu+LpE=;
	b=PmE1Vyr7lc+xsBx6hkWUpqoBcBfMorgB22PQy3pHkoW/vhSnT4M71n/6pI8V/0fvIP
	vKVTM4NN6DvdhmCg4ZZzKh2wGZqXLgLPdr19qI7csM4/7VMcfjcBlN17EhfJdY8i64KD
	Dc1BKlhle4fOjceZ9uitkE5IdGWod0l/TX6j+zb8UNQfa+NleH7lJQX6SvQOQeJUIq6M
	EVByLbzDcFF5U0uc7ESkXucI9Iv7dzRubkEmuP8ytoZDyRLdOITvic6uxZsp41lxoicH
	YF7z0ZkpolwQ3Fq35+8Ud2n13lYyKNrlNAOVOwAES+ANPaP3SrB6e9ksXRXVtZAI40XN
	DTzw==
X-Gm-Message-State: AODbwcAxQVMxPJ1alIZ2HhCRKxEy+YpOrbZrYiL7SdSFkqvLmJAGpufg
	4ld01nnwGIJXQo7s
X-Received: by 10.107.183.197 with SMTP id h188mr8024110iof.105.1494877682544; 
	Mon, 15 May 2017 12:48:02 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F79A.dip0.t-ipconnect.de. [93.232.247.154])
	by smtp.gmail.com with ESMTPSA id
	w16sm5623629iod.26.2017.05.15.12.48.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 May 2017 12:48:01 -0700 (PDT)
Message-ID: <1494877678.1179.263.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 May 2017 21:47:58 +0200
In-Reply-To: <CAMKF1srA7qkRJMtDgn6eNT8Fhs2dP6YUhJ3CMiNBFU+6ZdreZg@mail.gmail.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
	<e03ca7d9d2d8b290fe306da077e0fc74a6916efd.1494854721.git-series.patrick.ohly@intel.com>
	<CAMKF1spKnOnZfMoijNz5kQjE2=5OO3k4CUVK5d04id1B42JB2A@mail.gmail.com>
	<1494875908.1179.254.camel@intel.com>
	<CAMKF1srA7qkRJMtDgn6eNT8Fhs2dP6YUhJ3CMiNBFU+6ZdreZg@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 6/6] local.conf.sample: make debug-tweaks depend on IMAGE_MODE
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
X-List-Received-Date: Mon, 15 May 2017 19:48:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-05-15 at 12:34 -0700, Khem Raj wrote:
> On Mon, May 15, 2017 at 12:18 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > On Mon, 2017-05-15 at 08:50 -0700, Khem Raj wrote:
> >> On Mon, May 15, 2017 at 6:27 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> >> > Enabling "debug-tweaks" unconditionally, even if it is only in the
> >> > local.conf.sample file, runs the risk of that getting used in
> >> > production images.
> >> >
> >> > By checking the per-image IMAGE_MODE, the debug tweaks only get
> >> > enabled for images not meant for production.
> >> >
> >> > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> >> > ---
> >> >  meta/conf/local.conf.sample | 5 +++--
> >> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> >> > index 85c5e21..edadbb7 100644
> >> > --- a/meta/conf/local.conf.sample
> >> > +++ b/meta/conf/local.conf.sample
> >> > @@ -114,8 +114,9 @@ PACKAGE_CLASSES ?= "package_ipk"
> >> >  #                     e.g. ssh root access has a blank password
> >> >  # There are other application targets that can be used here too, see
> >> >  # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
> >> > -# We default to enabling the debugging tweaks.
> >> > -EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
> >> > +# We default to enabling the debugging tweaks unless an image is explicitly
> >> > +# requested to be built for production.
> >> > +EXTRA_IMAGE_FEATURES ?= "${@ '' if 'production' == d.getVar('IMAGE_MODE') else 'debug-tweaks'}"
> >>
> >> is IMAGE_MODE defined per image recipe ?
> >
> > Conceptually it is, although I guess it might get set globally in
> > practice.
> >
> > The class just defines the empty string (= no specific mode) as ??=
> > default. Then a distro's local.conf sample can define a weak ?= default,
> > probably "development" (similar to the current practice of enabling
> > debug-tweaks in local.conf.sample). Finally, specific image recipes
> > (like a core-image-minimal-development.bb which includes
> > core-image-minimal.bb) can force a fixed mode with
> > IMAGE_MODE_forcevariable = "development".
> 
> People use same distro with two different images for production and
> devcelopment and conrols are inserted via IMAGE_FEATURES
> with this change once effectively needs two different distros for prod and dev

Why that?

The production image recipe "foobar-image-production.bb" can use
IMAGE_MODE_forcevariable = "production"
and the development image recipe "foobar-image-development.bb" can use
IMAGE_MODE_forcevariable = "development".

Then whatever the user might configure in local.conf is ignored in favor
of the fixed recipe values. If there's a concern about using
_forcevariable: that could be addressed by configuring a global
IMAGE_MODE_DEFAULT ??= "" and an IMAGE_MODE ??= "${IMAGE_MODE_DEFAULT}"
in image-mode.bbclass and changing IMAGE_MODE_DEFAULT in distro or local
conf. Then individual recipes can set IMAGE_MODE =
"development/production" without having to fall back to _forcevariable.

Or do you mean that there's just one image .bb and traditionally
IMAGE_FEATURES were changed to switch back and forth? The same works
with IMAGE_MODE. The advantage over enabling or disabling dangerous
IMAGE_FEATURES is that users of a distro don't need to know about them.
They get the guarantee that (for a responsible distro) the dangerous
once will not get enabled by default for IMAGE_MODE=development.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




