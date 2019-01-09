Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 98F996B8AC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 10:02:15 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id y20so7621032qtm.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 02:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gNRrMv5xflM4VPsCYz/MI4r8i1A4iIhpRtTVqNdl2C4=;
	b=EVkwvmRAvomszZ+T/93s5s4y7fm5Li/3WIZ4C4BBv1jdSfbgEMxEIaF/uvsqa8Tw6V
	ZxPq0fHN9sqQAwf3gBxxDplbyDPOlPD6vy82hm0lWzy0bafD9eWmpe6MrUg9baCTV8UG
	vwZeV4NP3o3Pbnm+pRMIjZaZhzLff6hLOQavUyYW6rj2tdaIEjfhnehW8iFQoHHfUOMC
	k05szUBlP+islQVo4CpZNQASP9R+6olMDKXMpUZJxg3sC/4mHpyV8b6YS2WTLt/oJ8rt
	Q1u67AArbA3/qQYZpQrRWLcsiGF0z3AWz+jovZa88ig4BJJkQyuUGnnfBk/qnFKCuBAt
	d0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gNRrMv5xflM4VPsCYz/MI4r8i1A4iIhpRtTVqNdl2C4=;
	b=q0ifNqBWW8uSquiCkLWgs+oXRIKfavAIdJTDz9HZyFaP3H2XvGK/hoMPBOXzkrw9Ig
	RbxBy629TGCxmRkkKG14+QPUPzIzu4ATWqc1qHfGlBvEO2FNin0KVVNDsJyX36gZuhiG
	oItWkDO6QLfVfS2g79MCIB3cad93DWEwcweLRHni/UX8bC27sjwN8zbfqvJ10NU+VVFQ
	EitBLp1ZFCC5JNtGoJMY3KOAoBfvPZ9vI1Otv+e+/OxO0fND8RW6Q7RWq81yrwX3j3E5
	jbQo1yzS7QNB0Pezw8kiSiY7ak8BNQ8UBYPVpjnOuTDgNqN5LdMcXngzLfR8XbU64PKJ
	NoDw==
X-Gm-Message-State: AJcUukeJj3BEHJTv/XtFCs2rBTb9e76nfbrSBCfU6nTWCoPyHQLmQivs
	6j4N5AXs2YoZxl90DQbm6XZDTFmQlced/Xk+QrY=
X-Google-Smtp-Source: ALg8bN4+D0DeWQKYuAer2UVLRdMk45mAxce5+8+0NdW0Z4/vJKmKOtqQ3nAGYZNWPsOEqzF9KNLwfsw3l0gmyeKu8sE=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr5152059qva.50.1547028136084; 
	Wed, 09 Jan 2019 02:02:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1546961583.git.alex.kanavin@gmail.com>
	<CAMKF1spfq3brB-L+YCWY7joFC41KshZZwLzQcha3wEO3otBiQw@mail.gmail.com>
	<CANNYZj_gZFZpJaLkSSeabMDkFAw2oO+vM80H_q6o9cBsKaeycg@mail.gmail.com>
	<CAMKF1sp8BCRZfmBbamqobM-CoqKMG5CoWevqTAM1c83GJb+gWA@mail.gmail.com>
In-Reply-To: <CAMKF1sp8BCRZfmBbamqobM-CoqKMG5CoWevqTAM1c83GJb+gWA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Jan 2019 02:01:50 -0800
Message-ID: <CAMKF1srNzA0UVK+UpKtkNBi2V3S2oAWSC3WZEnJsp8sVNhtmjQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Reimplement perl recipe using perl-cross and update perl to 5.28.1
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
X-List-Received-Date: Wed, 09 Jan 2019 10:02:15 -0000
Content-Type: text/plain; charset="UTF-8"

Here is run for qemumips/musl

http://errors.yoctoproject.org/Errors/Build/74739/

The perl related fails are
postgresql
openipmi
adduser


On Tue, Jan 8, 2019 at 11:15 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Jan 8, 2019 at 10:56 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Tue, 8 Jan 2019 at 19:49, Khem Raj <raj.khem@gmail.com> wrote:
> > > There were several recipes in extended layers such as
> > > meta-openembedded which failed
> > > in last attempt, have someone considered the failures that I reported
> > > last time ?
> > > maybe Richard can stage it in master-next and we can give it another shot.
> >
> > Are you sure you are not confusing this with an alternative attempt to
> > upgrade perl by Jens Rehsack?
>
> yes, I thought the problems were related to perl version rather
>
> >
> > I did test meta-oe, and identified one recipe (adduser) that needs
> > adjustment. I'll post the patch as soon as this is merged. If you can
> > test meta-oe once more against the latest version of my patches, I'd
> > appreciate.
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/perl-sanity
> >
>
> thanks for doing so. I think meta-perl is another interesting layer
> that you can try
> if not yet tried.
>
> > Alex

