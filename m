Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id CF8097C4DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 16:41:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 8so4522407wmo.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 08:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=9GSHwvuVAZcUVgpHI4wZYwOFEyFGpQo9Es53JzzE3AA=;
	b=SumcP8sE0AtEje21M+oQWp3fF3rQ+RVj4Xg9RXAH2A1gwy9vcGhj5buBcQzk7mOcYJ
	2jqt+T5/00ez2jay49ZjJPFsHnjFZYGArzwBUoKB5uTOWTDtar+mm+kIDtUKOdTZdbxT
	AL+uu34SOkOtb3gvgsARe7xCbJ0pTkVkdvzPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=9GSHwvuVAZcUVgpHI4wZYwOFEyFGpQo9Es53JzzE3AA=;
	b=qBqZfv+FNW+gODqvzNoW1i1WMp8cke0u1WAL8J3nnUmI0V8QB/CXEpIx4antgQrKMV
	h0k56QocFO2YhvYQGAz8U8bLmvZ1tqAi/4oi5DS6FyOVNB5KYmdB+muC75jZgSzJKNMB
	QzeoGkt8uJRleK8sg3Z2gafCt7DpCLEfETLmQYJdIwZD8iLybnZRefq4dGDgJIZDWfZF
	ICaxyaQvVlxWlq8TMPWMFaL1E4BcppcKyOMYj1ASfcGXw8SBX6K38u3Gfpnrj9aYGZtZ
	zjRlJ336cbIH64VrvioSZ34rufW/uWZkZqDikaHf86xQO4mHcYH0CeS9mrOUfXKZIazI
	qmQg==
X-Gm-Message-State: APjAAAUyghkme2lktDp6554IooX1TQs5frqzbAc09tF9/czTvEwONrra
	M2CKdHpfinypb9XxvJudrGN8A5YUV+E=
X-Google-Smtp-Source: APXvYqxHTkq4xbn3kI6ZOSBc8T524eCiBAgqwEai5jjN/IRzwpqlFyxY70H/M9iQxqsF6npM5R0+Vw==
X-Received: by 2002:a1c:5fc4:: with SMTP id
	t187mr11511424wmb.142.1574354507526; 
	Thu, 21 Nov 2019 08:41:47 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id a2sm4003682wrt.79.2019.11.21.08.41.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 08:41:46 -0800 (PST)
Message-ID: <870a198dc47ec63b0741ad8abe44b55378d2a818.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, Ross Burton <ross.burton@intel.com>
Date: Thu, 21 Nov 2019 16:41:45 +0000
In-Reply-To: <20191121153610.GA28013@localhost>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-8-alex.kanavin@gmail.com>
	<20191120194927.GA28030@localhost>
	<CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
	<20191120213844.ome6ota74rmgosy3@pbcl.net>
	<CANNYZj9uAs5wQPya6R9q3gfSQm_Xyu9xViGBxOQ2COKKbcYeWg@mail.gmail.com>
	<20191120223207.6cuuklpgrzuhqug3@pbcl.net>
	<CANNYZj93tJxTsCwS3cg3J=0WB--A0Af26Y=nO9fOdfNb9okRYg@mail.gmail.com>
	<20191120231812.GB3962@localhost>
	<238a39c7-b794-aaa0-1da6-4b585078f447@intel.com>
	<20191121153610.GA28013@localhost>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
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
X-List-Received-Date: Thu, 21 Nov 2019 16:41:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-21 at 17:36 +0200, Adrian Bunk wrote:
> There are also two higher level topics that should be discussed:
> 
> 1. Removal of maintainers.inc
> There is some nitpicking that every recipe needs a maintainer.
> For the package in question the maintainer is not involved in the 
> discussion, and doesn't seem to have been asked for support or
> asked regarding the suggested removal.

There are pros and cons to having it. Having people who help look after
specific recipes is appreciated. Some maintainers are more active than
others and people's free time varies. We found one of the corner cases
here, the fact there are some surprises no one.

If we remove it does the situation improve? I'd say not.

FWIW the number of recipes up to date has improved recently (or feels
to have) and the process does encourage people to send updates.

Reality is there are shades of grey. By that I mean that we are never
going to have a 100% definitive/defined process which works all of the
time in every case.

We're doing the best we can and I'm not sure this discussion is going
to be productive as I don't see a path where this discussion improves
things.

> 2. Who is responsible for fixing gettext breakages in meta-oe?
> Alexander or Khem?

or the wider community? They can certainly help.

Cheers,

Richard


