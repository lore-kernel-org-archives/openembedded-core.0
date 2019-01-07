Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 827B06C492
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 14:31:44 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t6so589929wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 06:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=eWIJ2Yv1YY6Y0qZUvfELRXJiGCi5CSvTedrVw2pG0Yw=;
	b=H7JIe3lngV5F4GdBkBGxyGzTaqziacraC5h8H32zvyW3NA3hebG3rpBIOja64BHEVG
	sr/o7aPrhbEyZBahRkPBXVAFFITdwMaD/p34TtAWNGMskyLrI1uo4rhs0FhX5txbXKL1
	GcFqbLa6CQAykSMb3ake5Rrmi28wTanHLjZuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=eWIJ2Yv1YY6Y0qZUvfELRXJiGCi5CSvTedrVw2pG0Yw=;
	b=DDj/PZoKJqCvJIP6qLNx6QMbhaexPDhoF+daunWa6OfWX6OpNejrbiOAfB/NTg1LoV
	Dh1K3okzVk+v72GQuvbHnPGSXJ50EZuawRzxs+22pp7U4fE95bQj6kEFE4s6xhniwJH7
	6VlCOJWPF6SlRKz/RrBXrIc/eDvwSBS1xIx3TRz+0A9Jvai84MYfqfjk69o4kRAINwzf
	fe2FWS2t1jD87k4/optbjovBg2VcbJ82t14lmZJPzhJ64ruOGt0rwP5BVSr0967S7Lvj
	vfwZJxT6EKOT4Ou1Q4H+oPmfaqpqqrqCth65mOeFcc2KYsF6bAnI/wUnPBYuJRRWA/B5
	yzxA==
X-Gm-Message-State: AJcUukf03eJlWKX/wpJuJRksAPoN8ZiAQo52ANkfuIMMVLHhsJrdn9Mt
	+tct3n5z1fOYoGkhIrNSSV9BWg==
X-Google-Smtp-Source: ALg8bN462W6WJKQPPeDfbyjrzu481Hh4Pm+YbWAFe7uYqt3e4ik6A+uIrBh/c09vnfBE4jL6muy2vA==
X-Received: by 2002:adf:a58a:: with SMTP id g10mr51682176wrc.3.1546871505195; 
	Mon, 07 Jan 2019 06:31:45 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o8sm46479755wrx.15.2019.01.07.06.31.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 07 Jan 2019 06:31:44 -0800 (PST)
Message-ID: <51ef24c85d664b08aa7a26d4537df4b02026bd54.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, =?ISO-8859-1?Q?Andr=E9?= Draszik
	<git@andred.net>
Date: Mon, 07 Jan 2019 14:31:43 +0000
In-Reply-To: <CAPbeDC=vBTFU6G+CjKUwe_CjhqHqyN6mKxU3t+cr+aw+Wu+5DA@mail.gmail.com>
References: <20190106181350.25386-1-jacob.kroon@gmail.com>
	<20190106181350.25386-2-jacob.kroon@gmail.com>
	<7561c555f243ddaaa45bdd28eed97394c35d67e5.camel@andred.net>
	<CAPbeDC=vBTFU6G+CjKUwe_CjhqHqyN6mKxU3t+cr+aw+Wu+5DA@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 2/2] buildhistory: support generating md5sum of files
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
X-List-Received-Date: Mon, 07 Jan 2019 14:31:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-01-07 at 10:38 +0100, Jacob Kroon wrote:
> On Mon, Jan 7, 2019 at 12:09 AM André Draszik <git@andred.net> wrote:
> > I don't know what the intended use-case of the md5 files is, but
> > could
> > sha256 or similar maybe be more appropriate?
> 
> I thought it would be a good idea to store some sort of checksum of
> files in the
> buildhistory when doing reproducible builds, so that it is easier to
> detect
> when a rebuild produces changed files, but perhaps there is some way
> to do
> this already that I am missing ?
> 
> But I have no real motivation for choosing md5, other than that I
> assumed it would be less
> cpu intensive than sha256, and the fact I'm not too worried about
> collisions.

I used to lean that way as well however there is a fair bit of
negativity associated with *any* use of md5 so I'm tempted to say use
sha256 as we don't know how these checksums may be used in the future.

I'd note there is some overlap here with the sstate hash equivalency
work where we build a hash representing a tasks complete output. Can
you reuse any of the functions there?

Cheers,

Richard


