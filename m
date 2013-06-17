Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id A99286098F;
	Mon, 17 Jun 2013 00:14:24 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id q12so1560994vbe.13
	for <multiple recipients>; Sun, 16 Jun 2013 17:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=M1JUyf1P4/xiFlvkAjrvtORfFJhAmnEjLMLziyUkxQI=;
	b=BFo0f053cZ3T8N64KE/WH3bXt+Ueoj6kkkKssQ7kiYHudGt+06LJNqLqJ2llbsIhZU
	zO9dMyqiF98+0G8PsiDJ3oD2UL3n+pHQhFs/AvnDXRH7pf3vPsNvewaidm/HUHlDSVu/
	nxFNfLm/xMSJv+G0vJmD6pVzOz3mJwxhlBry1O14qxe/Kt+y9r4RCnQ29qB/u/CxUBtj
	s6Vyc65ueIpgvboheHDXz7FfeQmnfdSTTFEM242e7e7IQNE72orgWhVu0Xb7vwDgqZ6H
	RIT1fbAQUn1MRCJD8n+kOK/0CXvlIPBmorbZafmNugUNOm2IMRY9C932Y9EFbeH02BuD
	yqCA==
X-Received: by 10.220.162.200 with SMTP id w8mr2694675vcx.90.1371428065612;
	Sun, 16 Jun 2013 17:14:25 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Sun, 16 Jun 2013 17:13:45 -0700 (PDT)
In-Reply-To: <CANyK_8dActF1_nuvK29WMdr-Kh1DONoRXB2YMXqVj89AKmEWYg@mail.gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama>
	<CANyK_8dActF1_nuvK29WMdr-Kh1DONoRXB2YMXqVj89AKmEWYg@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 17 Jun 2013 01:13:45 +0100
X-Google-Sender-Auth: 4AtDQL2Oqm38tVsj03-y6D4M8eY
Message-ID: <CANyK_8c6qZ2cS1MdoLocVw5rEyTyKjXY525Prfhcp4R5pnq4dQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world
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
X-List-Received-Date: Mon, 17 Jun 2013 00:14:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 17 June 2013 01:02, Paul Barker <paul@paulbarker.me.uk> wrote:
>
> samba: builds for me, I'm not using gcc-4.8 though
> packagekit, gypsy, omgps: Reference deprecated/removed functions in glib
> tk: tcl is version 8.6 in openembedded-core so can't build tk 8.5 anymore
>
> I'm currently playing around with upgrading packagekit to a more
> recent version, will see how I get on. I'm busy with other work at the
> minute and openembedded work is just a side project for me so it may
> take a while...
>

... and just saw that Khem has posted fixes to most of these,
including packagekit, that just haven't been committed yet. Is it
still worth me trying to update packagekit or is there somewhere else
my effort would be better spent? I'm just looking for interesting bugs
to shoot at the minute...

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

