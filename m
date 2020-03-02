Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id DEDB561924
	for <openembedded-core@openembedded.org>;
	Mon,  2 Mar 2020 16:47:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r17so565782wrj.7
	for <openembedded-core@openembedded.org>;
	Mon, 02 Mar 2020 08:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=MSwYD8y9nH9u0TUrQVXAcr4eDj67EsnhWU2KNs/gAk4=;
	b=M2V6zFJMCYNwaYg8qCDXB7wA0/FYxoe7DU/tSmt1gYATjMhWSxegxmfHYqHGT3ZfxB
	vIOn/DN/KIp7zTV02m45fkiPGyE+0og2DE6Emv3Ma/ORkILlLJ1GuQkscZRDNYXfLbHQ
	LAhVZBXjynus/119KH2jmFHTzTw+zfD3mRess=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MSwYD8y9nH9u0TUrQVXAcr4eDj67EsnhWU2KNs/gAk4=;
	b=PpC/RRYCtjGlOcxL9I7kEHucoovDGMhbkgUd2CA99XrWDtmIsB0F9UdEvXR8GPXKrx
	KVLnjUX9MAXQme6w9UMDDzCX98DwxQWt7pgBnhmpIOAG0EjZQlFNkpPDQL4sG3y2m5NX
	4lAAFFgi0sN5WUM6yhQ9rsMxLk8jESzAvBKrs7EdMg+29sD9kISD3P0eIFQxxSf/BiU4
	vUavxVKJxRw7+k2fk2JUFVdBgOMXjbU/DafX84Rv/0qBS9myskGnC/bsoXgzjqTZVzEM
	KLz48QGzrTz0bY4mWDYG9UcVCouRFlvEFiabKkva/g/ZTJdWg3UH+G2BANohooVNiLXq
	EvqA==
X-Gm-Message-State: ANhLgQ1pM3CLg5RW3i1IIRj5mgBsg5hYYRGFopAyQnS4VWW0vkVOOAVW
	C6iqBZ5Yk2oYnlPTurabPePnmA==
X-Google-Smtp-Source: ADFU+vss1cyf7Guvl56Qyi7l7coV+coXbwN4bYYQ6W7wsoOP5R5LilOQHfIeuEpAeAoOp8a60EFsvw==
X-Received: by 2002:adf:f747:: with SMTP id z7mr523263wrp.2.1583167679353;
	Mon, 02 Mar 2020 08:47:59 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i7sm13618342wro.87.2020.03.02.08.47.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Mar 2020 08:47:58 -0800 (PST)
Message-ID: <df13465da1047d41fb47b19c7479a836b8b71245.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, openembedded-core
	<openembedded-core@openembedded.org>
Date: Mon, 02 Mar 2020 16:47:57 +0000
In-Reply-To: <c88b00fa-a513-c0a0-eb30-62cef90f66bb@gmail.com>
References: <e7b54a7b237a70346379df8483837a6b97ccc73f.camel@linuxfoundation.org>
	<c88b00fa-a513-c0a0-eb30-62cef90f66bb@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: M3 build status
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
X-List-Received-Date: Mon, 02 Mar 2020 16:47:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-02-29 at 07:38 -0800, akuster808 wrote:
> 
> On 2/29/20 5:13 AM, Richard Purdie wrote:
> > Just to quickly update everyone, a number of patches we probably
> > wanted
> > in 3.1 have had issues but have had the issues resolved and the
> > patches
> > have now merged. Thanks to all who dived in and helped with those!
> So no Bind update?

There is still time, please send an updated patch!

> > The patches/issues I'm aware of that are left:
> > 
> > * ltp upgrade (musl issue)
> > * util-linux upgrade (breaks wic test, probably simple fix)
> I can look at the two above but can't start until Sunday so if
> someone else grabs them today, have at it.

These are now done thankfully.

> > * coreutils ptest addition (blocked on libmodule-build-per 
> >   reproducibility issue)

Still not done.

> > * psplash systemd race (smurray may have a fix)

Still not done.

> > * autobuilder new branch handling for initial run test comparisons
> >   (open high bug with RP)
> > * tinfoil race (open high bug, struggling for owner)

Both done.

> > * LockedSigs intermittent test failure (RP has open high bug, no
> > clue 
> >   how to reproduce or why, total mystery)

Spent hours on this, limited success :(

> > * Intermittent selftest failure with SystemExit (High open bug,
> > Kai owns)

Still pending.

> > As ever, help with any of these welcome. We'll build M3 when a
> > majority of the above are ready.

Also, I've realised:
* there is a high priority pseudo issue assigned to me
* gcc buildtools tarball issue

+ the bind issue you mention

> So where are patches going doing this time that will be in after the
> release?

I try not to encourage people to send upgrade patches during
stabilisation as its a distraction for everyone and means fewer people
caring about the release. I have had to queue them in the past since
people ignore this and I may have to again depending on what people do
:(.

Cheers,

Richard






