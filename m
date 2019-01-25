Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id D510F7C3BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 16:33:56 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id m8so5381309itk.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 08:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=3qmPto8ntIeMHqIWtjytB0K/BQ+lu8lR/fiz7/vqTUI=;
	b=D46YRu5G8YvZgqXqeEV/sv6wT/8eEmcEm1vbIPuWeyV3WTfMRhF/QWSHKCf1isv//M
	pLWfza1tndpmsBIsKaXT1fTSjQ0FCqE8zY5Ekt4ocpdiHRKOzl3ByYsysn5ja9y/GgIU
	cE5s8I+5LdfZWpbpRmTSwZT2B9cbo1qZvTsQHT8dIcXSd5g2rkJ2mrTsv1ZD4RzhQKiZ
	4/mspEyLqEssm8R08GkyqeEUpmCEr1jCrfWL0rCcYKJYDFdh6bQOylyp3G28EtisyLkL
	/WTpFm7EPJgNlBGFwOn+QZs1yIlV1k6h88QfIjqg9DDkDOJ4oAUcQv+0KdCD9nkb3hh0
	+Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=3qmPto8ntIeMHqIWtjytB0K/BQ+lu8lR/fiz7/vqTUI=;
	b=rUfUbTRlGG2UMud9RZZqT4+JxubCzwTgCOU+4FVnCEpCT0uo/UA265KDzVzM1qbkFq
	YKRNqEGPCpWWNA2NR6lg9PTO572QICpEpHr8vCGPJG+iXciblMY19RnDmr7NRy+LTFVz
	SP19oBCsuuV8NrLAmLJF0I6SPQ9s5nMM0MWUwAUmInO0+XB5apmRPN2vBDdah/wn5j7d
	l1w6pCkyhIcoDW7BRpZW14XeUxJbEMzEFivMKTCUHgndKzXHIlbbFhZWcF6mm9YdVM1Z
	q71fIU0kZyDhFsIAt6umwBcYGJR3kKRQQCVuFP7Rx5a27AuIKqfHw/q+9ujrvRK2gQUj
	D1Mg==
X-Gm-Message-State: AJcUukeNsxZyDhkmP1nJWs+XHingh1e7hHQnefzTZEYUsv8EY04KQJBb
	ExOJ6Z1DB1wN8dTnQigkqHs=
X-Google-Smtp-Source: ALg8bN7d4i+2nWqz6hVt3w4vvoNVO6hFcQc7Uu5EpaYWvRiTFz+AI5UIXRpQTTIs42BZrvBbtjptmw==
X-Received: by 2002:a02:1c41:: with SMTP id c62mr7034829jac.109.1548434037637; 
	Fri, 25 Jan 2019 08:33:57 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	h14sm10335111ior.41.2019.01.25.08.33.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 25 Jan 2019 08:33:56 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <d4217cbab239eee91390d3c1929cbf7856e71bdb.camel@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Date: Fri, 25 Jan 2019 10:33:55 -0600
In-Reply-To: <CANNYZj92Q=4HN+exKycMR5tnn+LjAbMEzqAx3B3dkxHjpQsixA@mail.gmail.com>
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
	<20190123161744.45763-4-alex.kanavin@gmail.com>
	<a7f352fbd50d0236a1623114364bb8bb4cb22eb1.camel@linuxfoundation.org>
	<CAJdd5Gbc3vb4YHioijMBXm5Y_w_aiVmi3Kz7_G6mi-BaJWLmzg@mail.gmail.com>
	<CANNYZj_3RJ5Hno-fCwMBccgYrTRSgLb6LZc6rGOovZ_9AD6FTA@mail.gmail.com>
	<c207a65d9262320feaf5d32ee7d906beee506102.camel@gmail.com>
	<12e06882b3c8cf4e17e0e6663dc8fa50c770d46a.camel@linuxfoundation.org>
	<CANNYZj92Q=4HN+exKycMR5tnn+LjAbMEzqAx3B3dkxHjpQsixA@mail.gmail.com>
User-Agent: Evolution 3.30.3 (3.30.3-1.fc29) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/10] lib/oe/package_manager: turn postinst_intercept warnings into failures for nativesdk
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
X-List-Received-Date: Fri, 25 Jan 2019 16:33:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-01-25 at 17:10 +0100, Alexander Kanavin wrote:
> On Fri, 25 Jan 2019 at 16:38, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > > There is a similar issue in multilib for target packages (a
> > > > warning
> > > > because qemu usermode support is missing):
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/214/steps/7/logs/warnings
> > > > 
> > > > I'm as well not sure how to handle this:
> > > > 1. Keep these two warnings as warnings so users see them in
> > > > their
> > > > local builds, but
> > > >  add some kind of string pattern to AB so it excludes missing
> > > > qemu
> > > > support and missing wine support warnings.
> > > > 
> > > > 2. Turn them into notes, which means they will go to the logs
> > > > only,
> > > > and users are not going to see them ever. On the other hand,
> > > > the
> > > > postinsts tend to
> > > > create things like font caches and similar, which should not
> > > > generally
> > > > be needed at compile time (which is what SDKs are for).
> > > > 
> > > > I'm leaning towards option two.
> > > 
> > > I was leaning toward keeping them warnings and then suppressing
> > > them in
> > > the cases where we know they don't work and are unnecessary
> > > (perhaps
> > > with a variable like POSTINST_INTERCEPT_${PN} = "0" ?)
> > > 
> > > That way if a user enables a package where it's not going to run
> > > and we
> > > haven't previously evaluated it to be OK, they will at least see
> > > the
> > > warning. I naively think this might help reduce the number of
> > > bugs
> > > filed, or at least make them easier to triage :)
> > 
> > I think this may be safer...
> 
> The postinst_intercepts are not executed per package (and accordingly
> can't be suppressed in that manner), they are run as a set of scripts
> available in scripts/postinst-intercepts/ during "populate_sdk" phase
> for an image. I have sent a patch where both specific failures are
> turned from warning to note (mingw, populating the target sysroot for
> nativesdk) - both should be actually okay to suppress, as
> a) mingw case never worked and has not been a problem as Joshua says;
> b) target nativesdk sysroot should not be a problem either, as it
> will
> be used just to build stuff, in a way similar to target Yocto builds,
> where those intercept scripts are not executed either, at least not
> until we populate a rootfs for the final image - and this has not
> been
> an issue for anyone. The scripts all create some kind of 'caches'
> which are only needed at runtime really.

I probably should have been a little more specific: I was thinking that
POSTINST_INTERCEPT_${PN} = "0" would prevent the creation of the
scripts at packaging time, not try and suppress them at rootfs creation
time. The idea would be to add that to relevant recipes with a
appropriate override in a .bbappend in meta-mingw. I'm not familiar
enough with multilib; is there a an appropriate override that could be
use there?

I think this would also have the advantage that mingw32 specific logic
in package_manager.py could be removed; we'll just suppress the
postinst intercept scripts in meta-mingw and any that aren't will
generate the typical failure warning.


> 
> Hope this helps,
> Alex
-- 
Joshua Watt <JPEWhacker@gmail.com>


