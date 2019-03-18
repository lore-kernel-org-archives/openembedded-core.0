Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A1C2271E5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 10:50:30 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t124so12192970wma.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 03:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=UlgieGaWMIxKApsMO/+cugMvmetvoDuJ8L47bMZXbB0=;
	b=eIIXcJqsgIs2cDCrIpaD7Fn4/GsvnPamGYnkUTWn/IlFUlltpI+0gbukrpt+5DeEox
	+v6Wxk3TqnEIndDpRbm9pzvYEvD4WMkV2W6fCv6UeMA0oAjqfaYiaFIqja+bYLTs0sRT
	CA+ER34lUwPUeMcCHYseHFVT6xMZetnuD+kk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=UlgieGaWMIxKApsMO/+cugMvmetvoDuJ8L47bMZXbB0=;
	b=i3UtcMsT6ShLxkkyBeTpt9gGF9lAXv17d5E7o2UR5wySITfg0/jSXo/IN5GxtzMnWv
	1QidkSp895I9Tj092XiN8LZAXwIV4g6+J/ZxhaUPGYVyexS1tM4rnUG1cHplBPR0WvQM
	4tcWM94Yf2DUmcrJR7pAkkZTkcVnqQ5lijU8B3Bx2oOyAOyMGPvyzIqF9xlTQHAfRA4F
	X7gVcymQ3EYc5bwZpFChiZMAPqiCgRZwdjz/PdLyOIcsAzuwnJ6k1i0UBmBvfvLuXmlQ
	k7Ofv0saRo8fbbCQhEHOAm4b1vlotCLTpn19JK1CMwezj050E1JXZfUijVvG7mG8RR8a
	bwIA==
X-Gm-Message-State: APjAAAWOxpDokKDMo5+Xn81Vdl2LwVQhEQIMeuwx7ejwiqoCho0Xq06F
	c9xxznW8tBlRZw5mN1KR8alWig==
X-Google-Smtp-Source: APXvYqy0SbLRMEZkVXlHxkTSJZmQ1Z3N+k3T53VrYrpUjSFt2X/rpKDgQugVl2WAw6HWZJC+aJXUQw==
X-Received: by 2002:a1c:4d08:: with SMTP id o8mr10923431wmh.18.1552906231298; 
	Mon, 18 Mar 2019 03:50:31 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id a2sm8737607wrr.60.2019.03.18.03.50.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Mar 2019 03:50:30 -0700 (PDT)
Message-ID: <507b5142dffe5d03bf21cc3bb0192c45a7203881.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>, =?ISO-8859-1?Q?An=EDbal_Lim=F3n?=
	<limon.anibal@gmail.com>, Leonardo Sandoval
	<leonardo.sandoval.gonzalez@linux.intel.com>, "Paul Eggleton
	(paul.eggleton@linux.intel.com)" <paul.eggleton@linux.intel.com>
Date: Mon, 18 Mar 2019 10:50:29 +0000
In-Reply-To: <CANNYZj-=F+Gu8ndkPyZc_Xm0u5NbtQKPpFQFhknxo16tB2=ppA@mail.gmail.com>
References: <ec5b47cb57324ee89e4f18785264d97e@XBOX04.axis.com>
	<CANNYZj8he2xQbDLksx-qqPJSie9mW3=ttvxAxpD_9ANLJtBO8A@mail.gmail.com>
	<CANNYZj-=F+Gu8ndkPyZc_Xm0u5NbtQKPpFQFhknxo16tB2=ppA@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Where are the mails from patchwork (was: RE: [PATCH] [PATCH] openssl:upgrade to 1.1.1b)
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
X-List-Received-Date: Mon, 18 Mar 2019 10:50:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-18 at 10:52 +0100, Alexander Kanavin wrote:
> Sorry, Leonardo is the correct person, and if not him, then Paul.

I did notice this had gone missing a while ago and asked Michael to
look into it. It appears the system is running and sending out mails
but those mails don't arrive back to the mailing lists or patch
senders. Michael has other distractions right now which have priority
over this.

Anibal/Leo no longer work on this and we're struggling for maintainers
for various subsections of the project, this is one of them which
compounds the problem. Having tests of this would be ideal but those
take time investment to develop.

Its not a good situation but we will get to figuring this out, I
suspect just not as soon as would be ideal.

Cheers,

Richard



