Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id CFDD778536
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 13:15:23 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id v127so125998665itd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wA3x5zzNHD/g+fuxvtB1BNS62W0spE0ZizlAAWJlej4=;
	b=K4ZI9aHe40xbehP9nskuzH/ZFbGqxt+el1/Z1a917ytJezLvt2KXieAhALirBoYC6V
	hyh9nt/+Gd6sjCpvvP+VvFX5jntVSGB0Qsx8wv7BwXn+KvFhu8tbB56FQBvCrDepsNWO
	YjhAi1ClbXImHvOKlmOY+zkfoGfDC9dLvyMLtK4Bbfjqh5V/xPiRBaDKG+xRFhyNVI+M
	hpo3Db0V+8YLhwTo0rR9tveaeukXNLT6HGbelaiOLRD7tFQCju5BMOt0HdQ7jvRAFufl
	jOz5O1oQM0i8MKK3+pTCAKRGO2NUazJ8v2R5C6hyhe/2FpJ4QgdePm+wlU/OSOg8cZml
	COzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wA3x5zzNHD/g+fuxvtB1BNS62W0spE0ZizlAAWJlej4=;
	b=Ag7RKAN5m886ZU+z9xLwpQz7XqR/f5r1lPeRx7P6sWsq48L9yuDRabUn+I+qf/JGhS
	/AIS2XxfKSYOb6LhuOutEF8lRsQhXZvn5VHICOuWnlLYlw3Ca190VQsiTvm3i1Q7Orw1
	TN+CjDMlXLYsDs1tk/KE/TPy6JnKfUjybaj2MuAlQ+C2LepEz0HKt+XecudZIQ/XVO9D
	lPEf/FyTUugJZIQO8Lqt2y8RgZCKHXz013DBFvoJn7ADb17lhaVEkkQRQvnP3EJhlqbM
	ZASoSvuYvt7dSq8Rb5taIXlydkj5TmhOEPJVS0otG/kDd7rEcGHFMQ9iEiWghoGkEypy
	+GnA==
X-Gm-Message-State: AIVw111E1Q7aiK6dPcqHH9ZYNEiiHDktdi2Nq+lUd44JPFEA3k6Y/Qa9
	lHsmh6VaJiHmGVzlSqMfu0N9pXHYs7m0
X-Received: by 10.36.154.67 with SMTP id l64mr17349259ite.87.1501506924880;
	Mon, 31 Jul 2017 06:15:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Mon, 31 Jul 2017 06:15:04 -0700 (PDT)
In-Reply-To: <20170730001751.GB16135@bill-the-cat>
References: <1501348127-1506-1-git-send-email-drew.moseley@northern.tech>
	<20170730001751.GB16135@bill-the-cat>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 31 Jul 2017 14:15:04 +0100
Message-ID: <CAJTo0LZ_r3CnbkitR2DMvHKACK50jYWcjYMC73A8vcWmqtVa2Q@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: drew.moseley@northern.tech,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] documentation: Remove documentation of image_types_uboot.
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
X-List-Received-Date: Mon, 31 Jul 2017 13:15:23 -0000
Content-Type: multipart/alternative; boundary="94eb2c11489ee2bc4c05559cd26c"

--94eb2c11489ee2bc4c05559cd26c
Content-Type: text/plain; charset="UTF-8"

On 30 July 2017 at 01:17, Tom Rini <trini@konsulko.com> wrote:

> > diff --git a/meta-poky/conf/local.conf.sample.extended
> b/meta-poky/conf/local.conf.sample.extended
> > index 0560de8..331fdd1 100644
> > --- a/meta-poky/conf/local.conf.sample.extended
> > +++ b/meta-poky/conf/local.conf.sample.extended
> > @@ -168,9 +168,6 @@
> >
> >  # Additional image generation features
> >  #
> > -# The following is a list of classes to import to use in the generation
> of images
> > -# currently an example class is image_types_uboot
> > -# IMAGE_CLASSES = " image_types_uboot"
> >
> >  # The following options will build a companion 'debug filesystem' in
> addition
> >  # to the normal deployable filesystem.  This companion system allows a
>
> This is poky-centric and still applicable however.  Thanks!


 Can you resend this fragment to the poky list with a suitable commit
message please?

Ross

--94eb2c11489ee2bc4c05559cd26c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 30 July 2017 at 01:17, Tom R=
ini <span dir=3D"ltr">&lt;<a href=3D"mailto:trini@konsulko.com" target=3D"_=
blank">trini@konsulko.com</a>&gt;</span> wrote:<br><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">&gt; diff --git a/meta-poky/conf/local.co=
nf.<wbr>sample.extended b/meta-poky/conf/local.conf.<wbr>sample.extended<br=
>
&gt; index 0560de8..331fdd1 100644<br>
&gt; --- a/meta-poky/conf/local.conf.<wbr>sample.extended<br>
&gt; +++ b/meta-poky/conf/local.conf.<wbr>sample.extended<br>
&gt; @@ -168,9 +168,6 @@<br>
&gt;<br>
&gt;=C2=A0 # Additional image generation features<br>
&gt;=C2=A0 #<br>
&gt; -# The following is a list of classes to import to use in the generati=
on of images<br>
&gt; -# currently an example class is image_types_uboot<br>
&gt; -# IMAGE_CLASSES =3D &quot; image_types_uboot&quot;<br>
&gt;<br>
&gt;=C2=A0 # The following options will build a companion &#39;debug filesy=
stem&#39; in addition<br>
&gt;=C2=A0 # to the normal deployable filesystem.=C2=A0 This companion syst=
em allows a<br>
<br>
This is poky-centric and still applicable however.=C2=A0 Thanks!</blockquot=
e><div><br></div><div>=C2=A0Can you resend this fragment to the poky list w=
ith a suitable commit message please?</div><div><br></div><div>Ross</div></=
div></div></div>

--94eb2c11489ee2bc4c05559cd26c--
