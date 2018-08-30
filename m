Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 69581793CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 10:45:41 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id p84-v6so14589052oic.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=BTSYMadms6yFpsLaesOGPlKYQsKdZIreM9xc7fVpB9E=;
	b=CiMeSgDw0XzoigybNWvkz4TTQeVTuHDD7Lqz64UKXUI63hemhCIXDTGqCfJ5pgbOV7
	VMQE57XtE6wSXQKNxuigRPLG5+k683xpzFMlmudBddhWpzhkXMHIwB+hVig+57BiVG1X
	loKiggVgn/+CUl/3/Aiz6uoBQBQet+epu1tTSa8hAPEzBqKvvWsbKP3Xnj6h7jnJMz/7
	x3hIl18I1d4YxSBGDfqUy/05m90SdeDd1HN2SzDtHvAf7lg+ckQCHf9f3IFqRALSfRZc
	sE53dQj+hCTUB0/YZhjniuSqZeNMecBfsBYIzO9mCOqSmHeoCVZm+q19OiwLYv23aOeM
	LqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=BTSYMadms6yFpsLaesOGPlKYQsKdZIreM9xc7fVpB9E=;
	b=nDFupQni/YUMUWWQbyp9ZjtpR1DTVkIWqvjC2k7yRQ7txQOi/d5UKtY+vHjMzuAZVR
	OQqu4Daj1/mmwptVWu5gnf+3s3iYmXFEMR0ppJwndvs8qfDxkMbnvml4/Hk62LItDVGS
	eQ1ePNpj4mIw7KCDdhsihoyVFZolAwRCpInql0wcxNDnfCp+z3LRJuWkfbc9rtjbARLN
	ADM6ltgisduHjksJ87D+vYJtrqthdj6ol6ms40Q2/YjQuL2l7ZhJqd+ekkvfKTxLSDw5
	Jv5q/RRnsOjcxmwSzYR4bJQ0SHo1mhHpf/F6N6LKF4UJTFkQ4yhyO4GwkYLOnr4Vw+Yc
	n+PQ==
X-Gm-Message-State: APzg51DRL1D6k5m9pFbwKVQ0C/Np6H8L0EqU4Tv4cOI5k+FJFfMi9Ovr
	vkZt4itc6eX6CSO/bdMeEIX5pkvwjRB4gpGFbiYcjg==
X-Google-Smtp-Source: ANB0VdZtf1SwpECf/XAUB4C/mF5jZ1S9TXt9ZFozsc3iqMLMY3NFz6joN67DFm1Ky49cnThZ3SbqRHKbjXfYQxeu6No=
X-Received: by 2002:aca:f488:: with SMTP id
	s130-v6mr2002066oih.269.1535625942310; 
	Thu, 30 Aug 2018 03:45:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:454b:0:0:0:0:0 with HTTP; Thu, 30 Aug 2018 03:45:41
	-0700 (PDT)
In-Reply-To: <fcb8bc41a5f65715b41f2c9461cdd434467e6ad4.camel@linuxfoundation.org>
References: <20180828221954.3214-1-schnitzeltony@gmail.com>
	<66aa21df8fa33f677b8a65150da5af2f98c22268.camel@linuxfoundation.org>
	<CALbNGRS2x76WRxtbNu417m8p5OVcF8pt1F7L3pUoUQ0PLvjTnw@mail.gmail.com>
	<fcb8bc41a5f65715b41f2c9461cdd434467e6ad4.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 30 Aug 2018 12:45:41 +0200
Message-ID: <CALbNGRQPs4mX70TdFnaHeBiPqp2hKJyrj1R9nUfGDe7BghGyAQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libsdl2: Fix left rotated display for RaspPi/VC4/GLES2
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
X-List-Received-Date: Thu, 30 Aug 2018 10:45:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 30, 2018 at 11:44 AM,  <richard.purdie@linuxfoundation.org> wro=
te:
> On Wed, 2018-08-29 at 19:22 +0200, Andreas M=C3=BCller wrote:
>> On Wed, Aug 29, 2018 at 4:16 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Wed, 2018-08-29 at 00:19 +0200, Andreas M=C3=BCller wrote:
>> > > The patch should increase performance for libsdl2 on GLES2 too.
>> > >
>> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> > > ---
>> > >  ...01-GLES2-Get-sin-cos-out-of-vertex-shader.patch | 141
>> > > +++++++++++++++++++++
>> > >  meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb     |   1 +
>> > >  2 files changed, 142 insertions(+)
>> > >  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-
>> > > GLES2-
>> > > Get-sin-cos-out-of-vertex-shader.patch
>> > >
>> > > diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-
>> > > Get-
>> > > sin-cos-out-of-vertex-shader.patch b/meta/recipes-
>> > > graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-
>> > > shader.patch
>> > > new file mode 100644
>> > > index 0000000000..621b7ea1a0
>> > > --- /dev/null
>> > > +++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-
>> > > cos-
>> > > out-of-vertex-shader.patch
>> > > @@ -0,0 +1,141 @@
>> > > +From c215ba1d52a3d4ef03af3ab1a5baa1863f812aed Mon Sep 17
>> > > 00:00:00
>> > > 2001
>> > > +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gm=
ail.com
>> > > >
>> > > +Date: Fri, 24 Aug 2018 23:10:25 +0200
>> > > +Subject: [PATCH] GLES2: Get sin/cos out of vertex shader
>> > > +MIME-Version: 1.0
>> > > +Content-Type: text/plain; charset=3DUTF-8
>> > > +Content-Transfer-Encoding: 8bit
>> > > +
>> > > +The only place angle is activated and causes effect is
>> > > RenderCopyEx.
>> > > All other
>> > > +methods which use vertex shader, leave angle disabled and cause
>> > > useless sin/cos
>> > > +calculation in shader.
>> > > +
>> > > +To get around shader's interface is changed to a vector that
>> > > contains results
>> > > +of sin and cos. To behave properly when disabled, cos value is
>> > > set
>> > > with offset
>> > > +-1.0 making 0.0 default when deactivated.
>> > > +
>> > > +As nice side effect it simplifies GLES2_UpdateVertexBuffer: All
>> > > attributes are
>> > > +vectors now.
>> > > +
>> > > +Additional background:
>> > > +
>> > > +* On RaspberryPi it gives a performace win for operations.
>> > > Tested
>> > > with
>> > > +  [1] numbers go down for 5-10% (not easy to estimate due to
>> > > huge
>> > > variation).
>> > > +* SDL_RenderCopyEx was tested with [2]
>> > > +* It works around left rotated display caused by low accuracy
>> > > sin
>> > > implemetation
>> > > +  in RaspberryPi/VC4 [3]
>> > > +
>> > > +Upstream-Status: Submitted [4]
>> >
>> > If I'm reading the logs correctly, this was actually merged
>> > upstream so
>> > the status would become Accepted or Backport?
>> >
>> > > +[1] https://github.com/schnitzeltony/sdl2box
>> > > +[2] https://github.com/schnitzeltony/sdl2rendercopyex
>> > > +[3] https://github.com/anholt/mesa/issues/110
>> > > +[4] https://hg.libsdl.org/SDL/rev/e5a666405750
>> >
>> > Cheers,
>> >
>> > Richard
>>
>> LOL: V1 I tried 'Applied [4]'
>>
>> and received patch failure message with the following hint:
>>
>> > Valid status     Pending, Accepted, Backport, Denied, Inappropriate
>>
>> [reason], Submitted [where]
>>
>> My favourite would have been
>>
>> > Accepted[4]
>>
>> to state out clearly that '[4]' is oe-specific and not part of the
>> original patch. If I read the hint correctly that would have caused
>> another patch failure. So I chose Submitted.
>>
>> So Accepted without []?
>>
>> Sorry to ask such kind of questions...
>
> I'd have thought Accepted should have a []. A quick grep shows other
> patches which have that in the tree so I suspect that help text is
> misleading...
>
V2 with Accepted?

Andreas

