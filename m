Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id D28EC617EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 12:24:46 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id p8so2364323iln.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 04:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=GbJ2YjRRTDVyjtMt6+HtcofV3rDVoVr7aXlPr0VTdfE=;
	b=m8QCcenmtImpJmq1eFC/ppk4RGpCYkSAC+86tun8FKub7wq2haqvTKKje62wI+vSgh
	zmbMt7ffrOD/VHoB1TxyhjVYayySBPZQb33WW5WMRu3Z8x/Tn6TwIj7bHkbX4Hmsk4mE
	4XgkXAfWoe1d1V3Tb8mSiHLL2oBEYoZS/LgEDKjYdX5Aq96tZOxXCxy6vZF3Ca0Y9+U+
	WMlCs9LwXFiaHIH1oMFe5hjpAnBIjxuqOK74Upl+KN0FK2qfFw3VOib7eIBspYVvl4SQ
	Zq175Xvc3GVPpB+ZAGsnPIOWh3h2tZpa0YMruD2mM7lwwuwrBrhAtF0tyrxhh6k2JrpB
	OKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GbJ2YjRRTDVyjtMt6+HtcofV3rDVoVr7aXlPr0VTdfE=;
	b=AQe1n2Vpi44cw+X7eBv+y35fFUR2gH24ueUf2ARorZinUlQm9aK/QYqePJ6fj4UD+u
	rseCHj+1s9NLIntu6KRYJmEnTbq4QsD5WWa1IRQT++1Rixknpz9gd9jVM09/8dMyRnMF
	jvVErSxgKG/NoTkSPwoW9yfvvsZfYajUD06Zd20XM08vAqgfWaMW1Xg6YyIy/HtDU/Po
	fC9InHrOyD8TB9E52vV+EYk+Jfk5OQThkiZRuS2Fb3DiFL0yxryNZO+rRelO1MS3umSO
	arN0UBedsJJrbm0hmzsO2EE0X4m7wL8y4NpQ7q8VRlT5pbSDkND/W778tAByEag7aFSm
	e5ew==
X-Gm-Message-State: APjAAAW21gen+GTbN9WuamR6DG+hRt2PWHlEpkvoqpSFw47E7dQZUOmC
	n51wR7JT6flL1H56tQ6tPbutqJ1VQ3NusdH18xc=
X-Google-Smtp-Source: APXvYqytUY2poijPuxSZbMJIG9fMozrRGyABT+F2r/AzEDvnzaNSB75I9EcASyAjwtxRXXyrz7+na+WkcvbZYyimJBE=
X-Received: by 2002:a05:6e02:690:: with SMTP id
	o16mr69760728ils.267.1582633487820; 
	Tue, 25 Feb 2020 04:24:47 -0800 (PST)
MIME-Version: 1.0
References: <20200225054406.867243-1-raj.khem@gmail.com>
	<29622e48fc7ebf80aa002b2d1903f6d970af9d86.camel@linuxfoundation.org>
In-Reply-To: <29622e48fc7ebf80aa002b2d1903f6d970af9d86.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 25 Feb 2020 13:24:36 +0100
Message-ID: <CALbNGRRvG9BT3noMne1c4Xc7ALJjT5KT+3eZtaMun=bT5g772A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mime,mime-xdg: Conflict with allarch
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
X-List-Received-Date: Tue, 25 Feb 2020 12:24:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 11:21 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-02-24 at 21:44 -0800, Khem Raj wrote:
> > mime and mime-xdb classes add dependencies ( both runtime and
> > buildtime
> > ) on target packages, therefore recipes using allarch should not
> > inherit
> > mime/mime-xdg or vice-versa, this fixes subtle sstate mismatches
> >
> > [YOCTO #13805]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  meta/classes/mime-xdg.bbclass | 5 +++++
> >  meta/classes/mime.bbclass     | 5 +++++
> >  2 files changed, 10 insertions(+)
>
> Is this the right way to fix this? mime info probably is arch
> independent, so should we be whitelisting some of the dependencies?
>
> Cheers,
>
> Richard
>
Khem and I had a short discussion about this [1]. His first approach
was to remove DEPENDS. As far as I remember the deps were added to
avoid QA warning.

Honestly I never understood why these are spawned. If there is a fix /
workaround this could be reduced to rdeps which an be handled for
allarch.

[1] https://github.com/YoeDistro/openembedded-core/commit/5605a9cf78c3731e2=
cc055cd4f8cc88a0b3d7e26

Andreas

