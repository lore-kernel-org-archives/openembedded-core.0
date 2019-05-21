Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5839C7E25C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 16:15:18 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id y124so8919930oiy.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g3vgJr9WtX9bGe6rwfqQtp0fwgle+wkmq/KW31XYyhI=;
	b=TCNwJH6eoXXExUveHFany3TNmoiIZleT2WjCsa+Ew1gnSDspQoK/U33807uy9dDWUW
	hTuhicW2XS1jfzSfa9EayYDG5VZ1Lm436GCKxI/JdBiGhVzWk5JcWLvEP7bv1fhGEmVZ
	HWnjLxjUVFhOzI7DLTbY4GvIsCIoGWC/zHTWCuxgKuXqHlnaJplnZdAy+0qDj7XXONze
	p3j2AyRKus/0w97yQ13xr6Lv+4B3x015zMWlf3J5aesXBOwa3qGUIQKoPgbw48xVCn2d
	nZnzp9/5q+svxHcl+d3OHxAf+vVNyvSoyKJUBrotU/LfKG3T+4J0vK+7FYKtWTzy55zE
	kYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g3vgJr9WtX9bGe6rwfqQtp0fwgle+wkmq/KW31XYyhI=;
	b=lr8c4FjDw0HC4RxUJkBK3XpG+A2OjKF1SX/sj1QRqq6j38xgWsWJ4zCrV7D4BoMLVZ
	rnt577EMRrIlGxrkQQmRNecgMUN0fPa+Qir9Vl2wTc1AdoSXUddkde8UmCjAGUE265yh
	2ELpwGahNvrIsZHT6f6kMu9sRaUw5ow950wTqQyZxVgD1pJxmfW/+NsyEQgQ5O4WbvcU
	zb0nTLQX0NJsW4rqysgug06Ei/TX0iv0DAm8ikXsvUtj1QwWnYqkrhl94pUUji5RGY0s
	sM1agFDYONojkcKuSwjtF0uQytG3x/EF+CgPthCn3mxZnpVL5veOm10QCWAgOZHGNB19
	IrIw==
X-Gm-Message-State: APjAAAXHuJM+fkYJw7UFAXwStQQxvpjrS3aRjP68Cd0nKF5do1kOHLNm
	ayNsKumry2eRq3LYD5FQ9SsBE0XIqYh9/6pTt84=
X-Google-Smtp-Source: APXvYqwKhe7Zlm8Ps3POwSW208CdD9smf2PtoALCWZzut1uIwmoj8Y7EGzuL4blP1DPIuZY1nvLoPzwTP2vkH2yvkIM=
X-Received: by 2002:aca:d40b:: with SMTP id l11mr4178500oig.132.1558455318316; 
	Tue, 21 May 2019 09:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
	<20190520141125.10805-3-alex.kanavin@gmail.com>
	<6e8560511f994e0df99f20048fa7540c509cd960.camel@linuxfoundation.org>
In-Reply-To: <6e8560511f994e0df99f20048fa7540c509cd960.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 May 2019 18:15:06 +0200
Message-ID: <CANNYZj-B1+p7Tw4DYJs0g9E7dDY-Exk_RzcauM04f9+AxgCihg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/42] libmodulemd: upgrade 2.2.3 -> 2.4.0
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
X-List-Received-Date: Tue, 21 May 2019 16:15:18 -0000
Content-Type: text/plain; charset="UTF-8"

Yes - I just sent a patch for the issue. libmodulemd comes in v2 and
v1 flavours, and there was confusion about which one to link to
(libdnf needs v1, createrepo-c wants v2).

Alex

On Tue, 21 May 2019 at 16:41, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-05-20 at 16:10 +0200, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> > b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> > index 40715c06ee2..d7f486868b8 100644
> > --- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> > +++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> > @@ -7,14 +7,14 @@ SRC_URI = "git://github.com/fedora-
> > modularity/libmodulemd;protocol=https \
> >             file://0002-modulemd-v1-meson.build-do-not-generate-gir-
> > or-gtkdo.patch \
> >             "
> >
> > -PV = "2.2.3"
> > -SRCREV = "4c75c6f8b39ee57aebe8fd36ef84808e893048c0"
> > +PV = "2.4.0"
> > +SRCREV = "d0a3eda45e083e8fe8b329a2310a53abdbf1e4d6"
> >
> >  S = "${WORKDIR}/git"
> >
> >  inherit meson gobject-introspection
> >
> > -EXTRA_OEMESON = "-Ddeveloper_build=false -Dbuild_api_v1=true
> > -Dbuild_api_v2=false"
> > +EXTRA_OEMESON = "-Ddeveloper_build=false -Dbuild_api_v1=true
> > -Dbuild_api_v2=true"
> >
> >  DEPENDS += "glib-2.0 libyaml glib-2.0-native"
>
> I'm wondering if this caused:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/852
>
> ?
>
> I think its something in this series...
>
> Cheers,
>
> Richard
>
>

