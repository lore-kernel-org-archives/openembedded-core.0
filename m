Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 410DD76E70
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 16:27:31 +0000 (UTC)
Received: by ioc74 with SMTP id 74so29637479ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 08:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=qV+gwvsK7u6vwkXAUMV+xblriYW5iXruPSJw3mjed/E=;
	b=havqm0xzD2ZO+uYRPHZFYcclM/JZ39MgYC/qmnZdzHbfmqEwfULhupikqbOQk6Dcfk
	E3sgyM/2blm+Lwixdbvf3bBFpn1TjRuot8GjtQu4Poch+2chYZBucYOg3JX9/QccScbI
	jJzVt9Em7jzjaAIQoR/VbkAk2+wh8KwX1WmkkNEi1HU/gs6HqoLo3IFf5VPYaC2VWNi/
	iPvhJwTCuUo9vA3SRummbNG39u3UiEuauNUNimFpH0kCQzxr/0sVBkX5hv+ZGAax1rmO
	w0Q+c/cuXr0l1f0/igshrcZyG4IDc+j/uNuPOTSS6up45dsLAQJf0cVwvXeJPnNuW6Gc
	o+VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=qV+gwvsK7u6vwkXAUMV+xblriYW5iXruPSJw3mjed/E=;
	b=eukjD3kfZepriEC1VkVeNynlr/UiCb+EEb2zv56L8T1Fb+ngb44A8cslnsVR07vjZp
	TyeDIDCz3wFdGZDxIKHS/Jo81VXqaImfKxEpyEwkLeo/h7F/yjpYLumuhAKZRK41bslw
	/2do/h/12VwAHg+XKUBe4z9X6UkoDqG/0bTaIWFjeyAEEtsiCzFl01gjJkRE/4CkS544
	vTd0Lp1wkkBYgizaImw4VLQ4qbEwXTcfqoP9kuKnJ2lDqQUuceX+/JqMhguH101ahtiN
	HGQ8ireVZqF+vYPlnuj4hafMQ+OZNZeYesUgYtjlaiulbz3EBIn4mUBwruOs2GiYIdb2
	uRPg==
X-Received: by 10.107.1.83 with SMTP id 80mr10464272iob.83.1446740851878; Thu,
	05 Nov 2015 08:27:31 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Thu, 5 Nov 2015 08:27:12 -0800 (PST)
In-Reply-To: <37C467A4-7065-4F95-B666-94ABB1E7248B@gmail.com>
References: <1446734821-6011-1-git-send-email-mac@mcrowe.com>
	<37C467A4-7065-4F95-B666-94ABB1E7248B@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 5 Nov 2015 09:27:12 -0700
X-Google-Sender-Auth: OEuF7VhRnJ3KzR_JirhYr6d51pY
Message-ID: <CABcZANk1pdUdzYycZuOgPUoWMC4yXPFKUuL1umqiOmC6bKK-4w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Mike Crowe <mac@mcrowe.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf, module.bbclass: Support opting out of legacy EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 05 Nov 2015 16:27:32 -0000
Content-Type: multipart/alternative; boundary=001a113968d48ef0f20523cd9a50

--001a113968d48ef0f20523cd9a50
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 5, 2015 at 9:23 AM, Khem Raj <raj.khem@gmail.com> wrote:

> > On Nov 5, 2015, at 6:47 AM, Mike Crowe <mac@mcrowe.com> wrote:
> >
> > export MAKE = "make"
> > -EXTRA_OEMAKE = "-e MAKEFLAGS="
> > +EXTRA_OEMAKE_LEGACY = "-e MAKEFLAGS="
> > +EXTRA_OEMAKE = "${EXTRA_OEMAKE_LEGACY}"
>
> may be this should be a weak assignment.


That's the habit, but this is bitbake.conf. Anything a recipe does will be
long after this.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113968d48ef0f20523cd9a50
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 5, 2015 at 9:23 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; On Nov 5,=
 2015, at 6:47 AM, Mike Crowe &lt;<a href=3D"mailto:mac@mcrowe.com">mac@mcr=
owe.com</a>&gt; wrote:<br>
&gt;<br>
&gt; export MAKE =3D &quot;make&quot;<br>
&gt; -EXTRA_OEMAKE =3D &quot;-e MAKEFLAGS=3D&quot;<br>
&gt; +EXTRA_OEMAKE_LEGACY =3D &quot;-e MAKEFLAGS=3D&quot;<br>
&gt; +EXTRA_OEMAKE =3D &quot;${EXTRA_OEMAKE_LEGACY}&quot;<br>
<br>
</span>may be this should be a weak assignment.</blockquote></div><br>That&=
#39;s the habit, but this is bitbake.conf. Anything a recipe does will be l=
ong after this.<br>-- <br><div class=3D"gmail_signature">Christopher Larson=
<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaur=
us<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113968d48ef0f20523cd9a50--
