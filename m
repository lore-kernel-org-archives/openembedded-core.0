Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id D493F6E688
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 09:44:13 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id z96-v6so7429205wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PiXsTavSoLRzlVvtuBZBbOZW3hvkQ8ibp5OgCgfTfmo=;
	b=Vm1eZPU1KqfC5folKLompcVpXJEww/TvhSJT5esacdagObTBP2E1NN7zN99L6va1AR
	LhqLXdrZ794sinW8mnkxZ2a5+hsnif0kflNrnCc7ytgs80akuqaeTrV1mEOATi/Ig0hz
	M4xXPlkO9QoQqDmHplJhUAeqdoVF7sUr/xBgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PiXsTavSoLRzlVvtuBZBbOZW3hvkQ8ibp5OgCgfTfmo=;
	b=jeLXsSXNH6HRbo430qAzxqSg2uK8gmrWOOVOUnTYj6FFP7KoEwjrpHNf4t0zjchKM/
	aFavhN8pDkufP3ee09U25LvwqPymnu4MZBsIOSukOXHQhPPotnJofkiqv43ofGklagub
	snNojoAqOUHTA1tJJRtMMtNFnkgiUHZbj3iaf2c/ArsXcHADDn24lyAYKztdVFfU/99I
	vXziqGDso3SEigacfu9j1BvF375v/+oiPnGODM2DegUs9OyGHeFGeUMEcJvtweapaRr0
	KFyNlyibkUJKnnOYhYAZKd0I3sDSaOiOQ4QLmAGKK1Q0mfzVZPjFmTzPY1DHDkaPv3fc
	pj0w==
X-Gm-Message-State: APzg51Ctwds3QSp83RWod6Wleu7ML+upffx9a4Z4dJ+UW5rEbDN45cLU
	M6JrNxC6UqOC9oKco9zF6bZWjw==
X-Google-Smtp-Source: ANB0VdZufdx1+VHvbQsOdropSFX+konEAgtLbMvMH8Pe96WpKgD/TTtpn1FJXJscUAAgm1dxBXAviA==
X-Received: by 2002:a5d:6aca:: with SMTP id
	u10-v6mr7181409wrw.44.1535622254457; 
	Thu, 30 Aug 2018 02:44:14 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v6-v6sm1456989wmc.43.2018.08.30.02.44.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 Aug 2018 02:44:13 -0700 (PDT)
Message-ID: <fcb8bc41a5f65715b41f2c9461cdd434467e6ad4.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Date: Thu, 30 Aug 2018 10:44:12 +0100
In-Reply-To: <CALbNGRS2x76WRxtbNu417m8p5OVcF8pt1F7L3pUoUQ0PLvjTnw@mail.gmail.com>
References: <20180828221954.3214-1-schnitzeltony@gmail.com>
	<66aa21df8fa33f677b8a65150da5af2f98c22268.camel@linuxfoundation.org>
	<CALbNGRS2x76WRxtbNu417m8p5OVcF8pt1F7L3pUoUQ0PLvjTnw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 30 Aug 2018 09:44:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-08-29 at 19:22 +0200, Andreas Müller wrote:
> On Wed, Aug 29, 2018 at 4:16 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2018-08-29 at 00:19 +0200, Andreas Müller wrote:
> > > The patch should increase performance for libsdl2 on GLES2 too.
> > > 
> > > Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> > > ---
> > >  ...01-GLES2-Get-sin-cos-out-of-vertex-shader.patch | 141
> > > +++++++++++++++++++++
> > >  meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb     |   1 +
> > >  2 files changed, 142 insertions(+)
> > >  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-
> > > GLES2-
> > > Get-sin-cos-out-of-vertex-shader.patch
> > > 
> > > diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-
> > > Get-
> > > sin-cos-out-of-vertex-shader.patch b/meta/recipes-
> > > graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-
> > > shader.patch
> > > new file mode 100644
> > > index 0000000000..621b7ea1a0
> > > --- /dev/null
> > > +++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-
> > > cos-
> > > out-of-vertex-shader.patch
> > > @@ -0,0 +1,141 @@
> > > +From c215ba1d52a3d4ef03af3ab1a5baa1863f812aed Mon Sep 17
> > > 00:00:00
> > > 2001
> > > +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com
> > > >
> > > +Date: Fri, 24 Aug 2018 23:10:25 +0200
> > > +Subject: [PATCH] GLES2: Get sin/cos out of vertex shader
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=UTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +The only place angle is activated and causes effect is
> > > RenderCopyEx.
> > > All other
> > > +methods which use vertex shader, leave angle disabled and cause
> > > useless sin/cos
> > > +calculation in shader.
> > > +
> > > +To get around shader's interface is changed to a vector that
> > > contains results
> > > +of sin and cos. To behave properly when disabled, cos value is
> > > set
> > > with offset
> > > +-1.0 making 0.0 default when deactivated.
> > > +
> > > +As nice side effect it simplifies GLES2_UpdateVertexBuffer: All
> > > attributes are
> > > +vectors now.
> > > +
> > > +Additional background:
> > > +
> > > +* On RaspberryPi it gives a performace win for operations.
> > > Tested
> > > with
> > > +  [1] numbers go down for 5-10% (not easy to estimate due to
> > > huge
> > > variation).
> > > +* SDL_RenderCopyEx was tested with [2]
> > > +* It works around left rotated display caused by low accuracy
> > > sin
> > > implemetation
> > > +  in RaspberryPi/VC4 [3]
> > > +
> > > +Upstream-Status: Submitted [4]
> > 
> > If I'm reading the logs correctly, this was actually merged
> > upstream so
> > the status would become Accepted or Backport?
> > 
> > > +[1] https://github.com/schnitzeltony/sdl2box
> > > +[2] https://github.com/schnitzeltony/sdl2rendercopyex
> > > +[3] https://github.com/anholt/mesa/issues/110
> > > +[4] https://hg.libsdl.org/SDL/rev/e5a666405750
> > 
> > Cheers,
> > 
> > Richard
> 
> LOL: V1 I tried 'Applied [4]'
> 
> and received patch failure message with the following hint:
> 
> > Valid status     Pending, Accepted, Backport, Denied, Inappropriate
> 
> [reason], Submitted [where]
> 
> My favourite would have been
> 
> > Accepted[4]
> 
> to state out clearly that '[4]' is oe-specific and not part of the
> original patch. If I read the hint correctly that would have caused
> another patch failure. So I chose Submitted.
> 
> So Accepted without []?
> 
> Sorry to ask such kind of questions...

I'd have thought Accepted should have a []. A quick grep shows other
patches which have that in the tree so I suspect that help text is
misleading...

Cheers,

Richard

