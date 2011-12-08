Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYZ2h-0006h5-NH
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 09:09:23 +0100
Received: by lahd3 with SMTP id d3so572119lah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 00:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Skrt4VFT9Ii8ujli+xSG0K1ruk6UluBk8aLYdJ6otec=;
	b=XT6MeXq66Un7bX5CtL/30RyitSymdsbKYr/ND8r/Ti7VA6z5dP7/jQVWcYGWc58V7H
	VvePeK7hSsz9+hA8izW7x01Sgh0DEaSoS+AvbgSKTZA+clUa7AE+CounSDVkV1uXoutu
	UP1RDTyjXbDO86e2ZUAKTuj4IfvTa6cJN/mPo=
Received: by 10.152.106.115 with SMTP id gt19mr1198980lab.27.1323331354392;
	Thu, 08 Dec 2011 00:02:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Thu, 8 Dec 2011 00:02:03 -0800 (PST)
In-Reply-To: <1323303124.971.2.camel@ted>
References: <CA+chaQfBfNs57Be9N-T1QzfZ=aXzDMN7QjKeKV8ZGnULORZjng@mail.gmail.com>
	<1323174430-24886-1-git-send-email-Martin.Jansa@gmail.com>
	<20111207211956.GA6351@sakrah.homelinux.org>
	<1323303124.971.2.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Dec 2011 00:02:03 -0800
Message-ID: <CAMKF1sqLd9rzf7f0mK6=MPsL2tW1Q6O70jbp1r_04Srgc9td6A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ppl: fix libgmp paths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2011 08:09:23 -0000
Content-Type: text/plain; charset=UTF-8

>> RP thoughts ?
>
> native.bbclass already sets STAGING_DIR_HOST correctly to be empty. It
> looks wrong but its correct when you think about it since the installed
> binaries are at their final location where we intent to execute them (in
> ${prefix}).
>

OK in this case then I think we are better of using
--with-gmp-prefix=${STAGING_EXECPREFIXDIR} here which should work for
target/native/nativesdk
variants


> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


