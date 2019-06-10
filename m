Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 551A17E3EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 12:57:20 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a15so8386334wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 05:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=jacFPqAEHmCBhem4qjijqVHt/rkoPjzQwaiwDGoSvdQ=;
	b=dQR4O9eQYyantElO/E1tXiXC17LQS9zKwACRyDIQ3OAbrl+Ih9mBvhmWVG9WocSbsN
	gEPj8TelPeu8ivLoZtvYJWer6f/4UBZUlIaRHX3HzFNpPWhEM1t8WaCquBTPRCgQsbqR
	zSezA6o9v+yEQfplT90pT0m+D0CB0aEQ5mjMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jacFPqAEHmCBhem4qjijqVHt/rkoPjzQwaiwDGoSvdQ=;
	b=fUTAIHAzh3yfYIESdytBSetdaLPHGfktOq4lDIV1yBzC17GckmpUG7y9cj/Dwg0WpK
	cTpOlqm+nM3NSPmdpIS5bP0RNxWznIgZ7bHQp36jJfIDe5BR2eQzj51/cI1xJX+OQySP
	Tqz9bLIYObrZCylkQLIIVssCnKNYod76tcBLZdQgWOmjAINv05eu/2rG70eBaCaF4u3d
	25fO/NaS5tM3oDPh1hCfuJLXnJMGix6EdzTj4mcseXuW9JPk/Na6vw6uGwxy453TVO00
	G9OhYE6D46ntJwXb2kbyWZ4j4kwqO4MPBqwOy3nQCwNqtCPVmZJvheFsvN0mVfU82W3l
	aeWQ==
X-Gm-Message-State: APjAAAVtvzm0wW2O3sgpkUAOEk5DzRTt/enJevz0v6tAG5MV3FCP7Z1u
	93MTVeyGZ2dJxvM8BSfCl6Pmjw==
X-Google-Smtp-Source: APXvYqy3cqU1Uf7A9Wf/5YcuJmjUzxXXPPEcXWEeVNRhTKfqu9TMWhLV3mlRykFLAOSyVitdN0rWoA==
X-Received: by 2002:a1c:35c9:: with SMTP id
	c192mr13833102wma.147.1560171440993; 
	Mon, 10 Jun 2019 05:57:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t7sm9999957wrn.52.2019.06.10.05.57.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 10 Jun 2019 05:57:19 -0700 (PDT)
Message-ID: <e30db71defc820ff96e770b71c60071573737353.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2019 13:57:18 +0100
In-Reply-To: <4cf0eb7936f1e27033202312d5e4f27e27266641.camel@linuxfoundation.org>
References: <20190607121954.116898-1-alex.kanavin@gmail.com>
	<20190607121954.116898-3-alex.kanavin@gmail.com>
	<2d919bbd6f607604f8315c95e1154c169fd2c5da.camel@linuxfoundation.org>
	<2c3427c3986a8fe363e6a99f3d78a136c79efd61.camel@linuxfoundation.org>
	<4cf0eb7936f1e27033202312d5e4f27e27266641.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] gtk+3: update 3.24.5 -> 3.24.8
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
X-List-Received-Date: Mon, 10 Jun 2019 12:57:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-06-10 at 13:32 +0100, Richard Purdie wrote:
> On Mon, 2019-06-10 at 12:47 +0100, Richard Purdie wrote:
> > On Sat, 2019-06-08 at 10:05 +0100, Richard Purdie wrote:
> > > On Fri, 2019-06-07 at 14:19 +0200, Alexander Kanavin wrote:
> > > > Rebase 0003-Add-disable-opengl-configure-option.patch
> > > > 
> > > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > ---
> > > >  ...-Add-disable-opengl-configure-option.patch | 41 ++++++++++-
> > > > --
> > > > --
> > > > --
> > > > --
> > > >  .../gtk+/{gtk+3_3.24.5.bb => gtk+3_3.24.8.bb} |  4 +-
> > > >  2 files changed, 23 insertions(+), 22 deletions(-)
> > > >  rename meta/recipes-gnome/gtk+/{gtk+3_3.24.5.bb =>
> > > > gtk+3_3.24.8.bb}
> > > > (84%)
> > > 
> > > I retested with the date/time on the workers fixed and this
> > > series
> > > present. We saw:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/693
> > > 
> > > so I think there might be something not quite right with opengl
> > > disabled (the main difference to nodistro I can think of?)
> > 
> > Its now in master:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/687
> > 
> > so I think there is some kind of parallel make race in the new
> > gtk+?
> > 
> > The autobuilder is proving very tricky to read at the moment and
> > intermittent bugs are making it into master :(
> 
> I've realised the error wasn't:
> 
> Failed to open file “./gdk.gresource.xml”: No such file or directory
> 
> but
> 
> > glib-compile-resources --target=bloatpad-gresources.c --
> sourcedir=../../../gtk+-3.24.5/examples/bp --generate-source
> ../../../gtk+-3.24.5/examples/bp/bloatpad.gresources.xml
> > (glib-compile-resources:91029): GLib-ERROR **: 02:42:13.583:
> > creating
> thread 'gmain': Error creating thread: Resource temporarily
> unavailable
> > make[3]: *** [bloatpad-gresources.c] Trace/breakpoint trap
> 
> which sounds like a parallelism issue :/. Question is which resource
> we're running out of...

Looking at that machine, max user processes is 4096 which I think we've
had issues with in the past.

Cc'ing Michael.

Cheers,

Richard


