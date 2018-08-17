Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 11F527936D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 21:14:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y9-v6so8536101wma.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 14:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XVPNXTV7vDazWtQ3eOTyZ8DPpQIZRUb6hDxD1xT/d6w=;
	b=iNmOBGul6TRnCROGga6hKcfAtOIhGnkQLI7rAxl70HR8D9YW9BGwoO3ogoLFstMh5V
	EskwD/P3LBnBtbTVzOPL6GXTznHfQRhLDs6grphEypBHvT2XLnoLtP3EWnpNHmsgb/EI
	rqkQqFr09Kf6Q6YL0xbsPqmf0oIW86bH46vzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XVPNXTV7vDazWtQ3eOTyZ8DPpQIZRUb6hDxD1xT/d6w=;
	b=brxiDDVsnJlBtIWbrpFXMHXm2I4R9WIdSZj99VyoI1Fe1ZjFfMMKPAX4i8ZS+++6pw
	Ro1oVmSRsEjfUlzwbcTVtfRUSuILbQ/vvDpniBgSnJH6+5gR05yLfkuO1fvNrjzfYbKd
	45Blx8uN5PsOPoYasxv0GFFNM2rFgEECvyx47aNXWLF+3P8wfVgJGc1iXrn399YFPjDA
	KgXPfMlxgYNujURY8DhuRCTiwpXfDgWBjnXQowP02Z8OV/JM9InOKF/x/cETshozgGdN
	uD05yyhtXgXVm+l/WIWZROriYJxctpzBQ1b5lXXYUmlWMfiYVoFDTnwf5cspUU+xqDg4
	VFPA==
X-Gm-Message-State: AOUpUlEe1zVEonzu7G8m2y9y9DuhN8zxb7B9Zffx0ancZwbjyMUf38t+
	AH/P1RphCckX08pKyoM45tPQiQ==
X-Google-Smtp-Source: AA+uWPxEgqPLSj6ZeJodZSXUilRO85KrJ/Za9wUOWmGy0F2efAsK9kq/PtVhXb9Pyqz+N4d+RB83FQ==
X-Received: by 2002:a1c:af53:: with SMTP id
	y80-v6mr18907062wme.55.1534540496839; 
	Fri, 17 Aug 2018 14:14:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t70-v6sm3967175wmt.30.2018.08.17.14.14.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 Aug 2018 14:14:55 -0700 (PDT)
Message-ID: <d4b82bdbcbf9b984482f49ec0230646d45898270.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 17 Aug 2018 22:14:55 +0100
In-Reply-To: <CAJ86T=Xx=QwjS9ZpYyY78E_3sqd=_3JmncJJx6WpufoNQiwseg@mail.gmail.com>
References: <1534453421-28943-1-git-send-email-bruce.ashfield@windriver.com>
	<CADkTA4OrPcXQEZ+d1HEeNZBrJy_VcyJcv_7DmhnBddmLQPVYZg@mail.gmail.com>
	<3927163d00059d0559412175c903ba60ce383dcd.camel@linuxfoundation.org>
	<e8e403ab1cd0a3e4a5754d4d4079508946da0c3f.camel@linuxfoundation.org>
	<CAJ86T=Xx=QwjS9ZpYyY78E_3sqd=_3JmncJJx6WpufoNQiwseg@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Fri, 17 Aug 2018 21:14:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-17 at 12:46 -0700, Andre McCurdy wrote:
> On Thu, Aug 16, 2018 at 10:53 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2018-08-16 at 22:44 +0100, richard.purdie@linuxfoundation.o
> > rg
> > wrote:
> > > On Thu, 2018-08-16 at 17:08 -0400, Bruce Ashfield wrote:
> > > > I'm getting a strange install issue with x86 that I've never
> > > > seen
> > > > before, and that
> > > > part is unchanged from v3 to v4.
> > > > 
> > > > .. and then I realized that a file has changed in my builds,
> > > > since
> > > > I'm
> > > > working on 4.18.
> > > > 
> > > > This is worth testing on the autobuilder, but I will have a v5
> > > > that
> > > > adds a test for some
> > > > files that may go missing, and hence we'll have issues across
> > > > versions.
> > > 
> > > Thanks, I've added it into a build with a glibc and openssl
> > > change
> > > and
> > > set it away so its possible other issues may occur, we'll see how
> > > it
> > > works out...
> > 
> > The openssl change caused problems but I did spot qemumips64
> > failing:
> 
> What were the problems related to the openssl updates?

SDK sanity test failing where wget is failing to work:

https://autobuilder.yocto.io/builders/nightly-arm/builds/1285/steps/Running%20SDK%20Sanity%20Tests/logs/stdio

I've not definitively narrowed it down to openssl but it has to be one
of:

kernel-devsrc: restructure for out of tree (and on target) module
openssl: update 1.1.0h -> 1.1.0i
openssl: update 1.0.2o -> 1.0.2p
vala: refresh patch
glibc: re-package for libnss-db

Cheers,

Richard



