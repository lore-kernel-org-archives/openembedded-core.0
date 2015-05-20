Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id AD3F3601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 13:46:00 +0000 (UTC)
Received: by padbw4 with SMTP id bw4so67838235pad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 06:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=tNVoEtNCdnUFS/n+Eau8QHMjvY1Ige0FOfPjpfL+kUw=;
	b=v0ZU2uMY2vOeh1hMdw+y2O+0naI5GrHVTfKzKNJLdAEFQKF+1Sx8qMZaJbd354eEoS
	RlmUrGv30Env/9fnv7Hf8csVg44FZDlzvVm8qP9KyWiz5PPqcWamZwQOt/iBoTrGg4HI
	s17WY0VgYHoDRH3+4Qq7c1ta+z3fb5IV0vDCACulYa2eLf1X6VM/v/a6w1SsMUp9E4+o
	nmGdhRAPPeZoJjAK1zsp3OJLTtkDjlmfjD6QVNjdrFPP1ihvk/V+3+YklcPnXqNvKQGk
	YB7rGqW8By+gZp+nyB7hMi0Gsdr37i3axQoZlJroKWyJHkx+dsrIGlCAQOX5/TiJQmh4
	voBQ==
MIME-Version: 1.0
X-Received: by 10.66.101.9 with SMTP id fc9mr63046759pab.37.1432129561398;
	Wed, 20 May 2015 06:46:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Wed, 20 May 2015 06:46:01 -0700 (PDT)
In-Reply-To: <CALbNGRSeZ7CZtbJd2U6iGu+ARgT3hi9CdC5xO7iwwipk89D=4A@mail.gmail.com>
References: <CALbNGRRq94M86hm=0y8ZR7+5RXDMCJkXPxGREzAOjNQLerNkPw@mail.gmail.com>
	<20150518080138.GD9407@jama>
	<CALbNGRReeZHBXDo2C4tRTHfdCwSfS5QxpKdGWpsZJbgAGGCYdw@mail.gmail.com>
	<CAP9ODKqpnGVrBNh9PekyZJJBzRnjs9mfELM3afHTmT=0UDEegw@mail.gmail.com>
	<CALbNGRSnxG0ZmFH2sAFL0B3uEy3mi97t30fSnn2JCSyFLr9Pdg@mail.gmail.com>
	<CAP9ODKp1-e6oiv6oKUJ5aTPjYMBJL9YtF+16Gt=cooC+4LEdYw@mail.gmail.com>
	<CALbNGRQPU2ToHpwcD6GA+TOz4zS2sJV8dXgbZsufn=9Pg-Pn3Q@mail.gmail.com>
	<CAP9ODKo3MhRR_2OW4Xgg6GMkdV-ykD3AvrRRQU9n0pF1xqh4rQ@mail.gmail.com>
	<59DAE1C4-3DB3-44B8-A036-927EBD67C212@gmail.com>
	<CALbNGRTA-rPDinuWqDzdRK=jmY6wYJ_Li_NGCkoO52G-t+U1+A@mail.gmail.com>
	<CALbNGRSeZ7CZtbJd2U6iGu+ARgT3hi9CdC5xO7iwwipk89D=4A@mail.gmail.com>
Date: Wed, 20 May 2015 10:46:01 -0300
X-Google-Sender-Auth: 1zWTIf5BSXfD2UZF2LPYUPvvMwo
Message-ID: <CAP9ODKr9ntS+W8DZuSXrN_V_sg-=CVAHCESULeUdUNki2jSMGg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: trouble related to oe-core update
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
X-List-Received-Date: Wed, 20 May 2015 13:46:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2015 at 5:34 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, May 19, 2015 at 10:54 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> Would like to get a solution for this and see 2 ways to go in imx-base.in=
c:
>
> 1. allow thumb:
> <snip>
> # Float-Point setting
> # handled by software
> # DEFAULTTUNE_mx6 ?=3D "cortexa9t-neon"
> # handled by hardware
> DEFAULTTUNE_mx6 ?=3D "cortexa9thf-neon"
> </snip>
>
> 2. if thumb2 is not allowed (why?):
> <snip>
> # Float-Point setting
> # handled by software
> # DEFAULTTUNE_mx6 ?=3D "cortexa9-neon"
> # handled by hardware
> DEFAULTTUNE_mx6 ?=3D "cortexa9hf-neon"
> ARM_INSTRUCTION_SET =3D "arm"
> </snip>
>
> Opinions?

OE-Core does not seem to enable thumb2 by default so I don't think we
ought to change the default here. However I do agree in extend the
comment and provide an example so it is easier for people to do this
when needed.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

