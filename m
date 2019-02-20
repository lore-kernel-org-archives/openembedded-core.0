Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id D7A787CA9E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 21:26:32 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 98so42854103oty.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 13:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lR3Cq99O7PsbAi6DTvCK1BRHrrAkC02Bhr6p9VtVg7E=;
	b=tYbvgWh+GgZp9Ay8HnmDvq/qAOOH0woe2SeXBKLcgauhU/jV/CfazdS9VyekPIpKbI
	wR6bBsiBwleYqg4QoNBzmCPgm30gp5srvNu0JUH9UuxZYi1XlXzwYF4VnisRz1F9ntIY
	vm2DnM0vo4b2eoQLOmcDtPp+xMv5IkSfkR4ZFWVn3PeVKj+Z6Fpew53HMYMCC68zmbDD
	vmHEijjSw4YsaMuHpR5mCDeCUi21JjHgyeN3nngb2Ngk8AlGzU/jWf/Q7xkaw3DsOO9E
	k7FK9+yzf70Vs0OfjhRLu1AES6swVY4LaodSFISbTa/I/Tsyyrduogswb7hFULRSg1PS
	bKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lR3Cq99O7PsbAi6DTvCK1BRHrrAkC02Bhr6p9VtVg7E=;
	b=ea9y1q6jndhZLo+v7zkpK3cJeduOCvGcmBEYSm9OeaLAOJI/sDJRB7E7z9oqfir8xb
	am59+SnPp8+7B3o5RiFgGTT1cEHiMLxpLCRbFakMAjUvCV8l3h3k+wB+L9J/veyf3KVv
	iwzf+DAeyhCGIXi/4sTb2la78NJnRTy1TnkiuQo0PQ5s2cdKucM/7DAvuc7EHvWMvApi
	F4yab8pr0lhc3Ooq+HnmKg70sMuBoDrXNXB2ll/kJf3HXPl6AxrphacdtWsTqg8bUlpM
	/sIRX0YmDSuu4zS5ks5yymuEyQ8Ue1hP6PfsQswfk+sNPDCe/SV60f/zFiiIyfkS/nN/
	QUlQ==
X-Gm-Message-State: AHQUAuYdsouvlhi24AWN9ODOBLlFUGqsSgs3JTmSMz/nFPPfUsxPohj4
	NoVHhekdNuE5PDG+o784ReypsCrdun22iwcG4xw=
X-Google-Smtp-Source: AHgI3IYfbPwmIEIHKFU1+9xDi8+seQWX9GhbR6Hxi57BAIwAGnecKCvK5Cm8RT63DRKDPigHZnE64Vd0tDSxelU7xi0=
X-Received: by 2002:a9d:6c0b:: with SMTP id f11mr9151430otq.293.1550697993924; 
	Wed, 20 Feb 2019 13:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20190220135043.25837-1-alex.kanavin@gmail.com>
	<7e7bf60a91548dc0373fd53b32baa28f163cb86a.camel@linuxfoundation.org>
	<CANNYZj9PO4jPdkesW0t3hRUAx7Jo=m01G7a67EUChRjLfUS5sA@mail.gmail.com>
	<0c2edcb16a71826e1ab7486d76c8a6c35fbd66d1.camel@linuxfoundation.org>
In-Reply-To: <0c2edcb16a71826e1ab7486d76c8a6c35fbd66d1.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Feb 2019 22:26:21 +0100
Message-ID: <CANNYZj97qHcS=d5OLnpn-REHCFm3PGm3ksBHssRh=z2mmdK3_A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] pango: convert from autotools to meson
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
X-List-Received-Date: Wed, 20 Feb 2019 21:26:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Feb 2019 at 22:19, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > <richard.purdie@linuxfoundation.org> wrote:
> > > and I think we have a race:
> > >
> > > http://errors.yoctoproject.org/Errors/Details/229403/
> >
> > Somehow this link won't open here, but I think the race is this one?
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/310/steps/7/logs/step1b
>
> Yes, accessing the files whilst they're still being written?

Yes, there should be a fix for this in the latest patchset:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-loaders.cache-depend-on-loaders-being-fully-build.patch?h=akanavin/package-version-updates

Upstream has fixed this too, but hasn't made a release yet with the fix.

Alex

