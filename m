Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0B06D6F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 23:00:58 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id z7so1023195iti.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 15:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rAwyrKyPGYbf4jrEytfaVqbN0E8qqn7AYFBcbAhrluE=;
	b=O2xCGFI7ZNJ4Uepfdb9oIJHTftwqiT4k/+sH+uc9PCBEtc3hm9WARU2r59R/FnnfvP
	oJbe3stesXcVMhe5etghV2CKzvKejbOYn35koqsHJ4emy06XvPJ6ujjaRxkm70kyoBL6
	rbUFlEdnx061/qDNkLhamz1pf5dgmeJnpJmGP9TIRBlCBTafBjQme4mUJRgV0JWVp27n
	SSjPrxeKYh0z1LmlOVRh5XdtNSKMDKiDYCIsmCr3pAFbUQrmBvDkJdjvW1ldTUmjulZc
	ymkqJ3ITjoKngjoKZhssrLsEOSCF6XUBGospvF+MTpUmefYKkXDuPDaIgsmRQ687Q0MN
	sYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rAwyrKyPGYbf4jrEytfaVqbN0E8qqn7AYFBcbAhrluE=;
	b=F7OnWJgVCYHMqmhmQNVX18dMRixkQipA9OduT1AZ9tohfwPRp0r6WGr/K+ePiF4e+/
	7USQy+P0xG8ZdCsEJLR8w8wQ484y8+9VAMPammCPTJPaVobH3G7JLHDAoLKAhkmVKD49
	wqOjlyrwqjrXnSkYyu+RLYxjUfhS34dHY4uam9OpGJh3vT9xL4Wn/UErhknZK9lZV8oS
	lrJ8Na71KeOaLWFju8OrjkA2KYQRkEVBdlVN+DIdtwuP7TYUl4etHHaAra1E5lsdTmKy
	4rYFkf6T2Qt41+e0zZb+5SfoZ27ePKMdFshgsdu2YZsB6Dk1U+MhBDyrHjXZ17dnf7hE
	TxBw==
X-Gm-Message-State: AA+aEWYpk0Gf1UKjvoQXw6btN9+m7jSsXDi50L2FzWLe/we+ELcd4jGV
	5KOkiY3Hz47mURp6YP4JMg1XMsm0Szzf49p+CPRZPg==
X-Google-Smtp-Source: AFSGD/W0abeAeb8rNbv8rfHz9idG4scj5TEMyMotZfPYlmDuKi+4n6IvrUq6uEhEQ4YzyECccmI/G14cP6OHlmdYKgU=
X-Received: by 2002:a24:ce45:: with SMTP id v66-v6mr617880itg.26.1543618859160;
	Fri, 30 Nov 2018 15:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20181130215537.29981-1-JPEWhacker@gmail.com>
In-Reply-To: <20181130215537.29981-1-JPEWhacker@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 30 Nov 2018 23:00:47 +0000
Message-ID: <CAJTo0LaNDeDGKfG9p8s8PY1RQVEQg5uDk3rLqqNiPNFXO2fiaA@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/waf: Fix builds when B != S
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
X-List-Received-Date: Fri, 30 Nov 2018 23:00:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Nov 2018 at 21:56, Joshua Watt <jpewhacker@gmail.com> wrote:
> +B = "${WORKDIR}/${BPN}-${PV}"

That's the default, so redundant.

Does waf support out-of-tree builds sufficiently well that we can
default  - or even mandate - out of tree?  i.e. follow meson and
cmake, and just set B=$WORKDIR/build in the class.

Ross

