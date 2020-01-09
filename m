Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5BFAB7FDA6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 22:27:40 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j42so9077169wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 14:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=oVm2kMlRZ7pHK4Nnw3qEw4kZDLWIzT8C5esK6PSUr7Y=;
	b=iYIjNWvMbJtm3M1ooITYcgDCcFnfBBqj84l4NRPg+95dNb6ovhwMRCfo/2eNKg65Yk
	QbWG4XvLvr6dUFhdwyWV7J3tLmOt+eHwQMUlx/ZwcwBKFegmA32LI9s7MsYvlVFg9LFw
	fi/yd/APBZ/uYA5yJQe51AO1j0HHeu1V9e7Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=oVm2kMlRZ7pHK4Nnw3qEw4kZDLWIzT8C5esK6PSUr7Y=;
	b=ifI/xI0J3mJZAMNn3LsWm1+Cbjy8JdJrw2RfIiEEkgylRxEhkrcnLgf8K7BW46wLBD
	UMghg0PkTxJ7BTXvQeYhFMkt7UL3VVRNkESJD7Wbt0oH+zgyU/TZVt1xQnvXvABQGMVb
	vEBaX+uhfe+WLfp1OdH1kt6LZNfJpKKLSV/fqQHtSPiHrYslwP0GVJBvqN9u3+CS1VVr
	APmviJsHxKQQ3y08SvyK0XVReKK0rZM160LnOEpmhQpULo+sZbLBlnpKPsSD+OtaGC1X
	+9NUXa56klvy6q8bHXcKvfJ2rx02DPVy+zcKNiK0k9c+Xf+o6TTvsveJyaR8zA1dRQyU
	cvUA==
X-Gm-Message-State: APjAAAXJdlJgvfxzOJfhqdw3a289VdBq0hPiwFX+Vz40YHw7+LM1+BYQ
	1RvZiad+csMhq20x+aeWf93mTrD57Y0=
X-Google-Smtp-Source: APXvYqyLViI10fY4ZDWPf+I6/RKddZ0rHYzNv59ZvlmCOvtklmpjMOJcqsDfSQl97vUEVypCE8uI0g==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr23842wrp.323.1578608860818;
	Thu, 09 Jan 2020 14:27:40 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a16sm9574315wrt.37.2020.01.09.14.27.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 14:27:40 -0800 (PST)
Message-ID: <9fe9f49a204728b0ad9168a45d357fc941ad63e0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Date: Thu, 09 Jan 2020 22:27:38 +0000
In-Reply-To: <CALbNGRRcKK-Y-xjqnV1ESxOnEa=vM+-1x4uH2JiMvxKOqnTVng@mail.gmail.com>
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
	<20200109202623.28936-5-schnitzeltony@gmail.com>
	<083170de5cdb826ab20f4384270b1f9553692e62.camel@linuxfoundation.org>
	<CALbNGRRcKK-Y-xjqnV1ESxOnEa=vM+-1x4uH2JiMvxKOqnTVng@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/11] bitbake.conf: add variables 'mimedir' and 'desktopdir'
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
X-List-Received-Date: Thu, 09 Jan 2020 22:27:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-01-09 at 23:21 +0100, Andreas Müller wrote:
> On Thu, Jan 9, 2020 at 11:15 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2020-01-09 at 21:26 +0100, Andreas Müller wrote:
> > > mimedir:
> > >    This is the path all mime information is stored at and
> > >    update-mime-database works with
> > > desktopdir:
> > >    All application .desktop files are stored here
> > > 
> > > Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> > > ---
> > >  meta/conf/bitbake.conf | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index 263d8aea4f..6fb4072f1b 100644
> > > --- a/meta/conf/bitbake.conf
> > > ++++++ b/meta/conf/bionf/bitbake.conf
> > > @@ -34,6 +34,8 @@ export datadir = "${prefix}/share"
> > >  export infodir = "${datadir}/info"
> > >  export mandir = "${datadir}/man"
> > >  export docdir = "${datadir}/doc"
> > > +export mimedir = "${datadir}/mime"
> > > +export desktopdir = "${datadir}/applications"
> > 
> > Do these really need to be exported to the environment for
> > everything?
>
> It is not mandatory. It is just that I wanted to avoid redundancies
> in insane.bbclass / mime*.bbclass. If adding exports is a problem I
> can remove that. Let me know

There are two issues here. One is that:

export mimedir = "${datadir}/mime"

and:

mimedir = "${datadir}/mime"

are quite different. The first one will place it in the environment of
every shell task. For makefiles, this is necessary for some variables
but in general its not and I'd prefer to clean up the shell environment
where we can rather than make it worse. I suspect you don't need the
export.

If we could move the setting of mimedir to mine.bbclass, that would
also be better since variables have an effect on parsing time. I can
see how wanting to share it between the two classes makes this trickier
though and I'm torn on that, I can see the problem.

Cheers,

Richard



