Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id D46896C584
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 20:22:05 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id s5so21363018oth.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 12:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=J5GTaWdTUO6VKDW59tHImWi1aHzt35NjymMdhZfSsY0=;
	b=wEomz35HvKoYhxhq31N7u6POJjxAruk1x92OorbYaK2NJTM8VuJ/xL5Fg0z8lLTS+i
	W9z7IcjTWzlS5Kr4cqDidjH6YsAsYhxtj4Na/tqw5qEsMulxeHG92444/mmxMFUbJx/F
	+fIY6WObq9ebUp8Sxns8l3X0YXhyha4oUHGej442vws+P95+Zg4p+7eLQmj3KGZyzJiv
	mpPQf/tKw7skLplvioQuzVC4wgv23vgoBUQ4XhraWwBLoR8JRAP4FFZboS5O2i1mq1G4
	lgv87RzTJ53fKMmzC63bwOkYFyszXuAYIsBTmnibaxzpZiwZusBeJ0/knuzr3S7AhKfW
	zaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=J5GTaWdTUO6VKDW59tHImWi1aHzt35NjymMdhZfSsY0=;
	b=NOoyk1VtckahRoI9/rfFFxyUEGdfHEumMxrY4usgntUfTV0bM11EbmpVjubglzgruO
	SjbU5qDmnf4TSey1xvoXvVduQ0xpdu1H2cvwlVizkYVldOWpAN4ITomlGb0xIMIpaO3y
	RE460hsdqNuR1lnLUhDUm0GJpBQAm1hf4eeP5iEr50Ez0t7qP0Z2/sQBPPTkS9r6amML
	qXSbdDATWDR+804P3JfsqYg3YwtoVPdEC/xWcSheLPFzKfBh/PAhqyMpTMCJO6FMB6mT
	TO379JnsuBkz52OAegINDLufABsLKL5FnnetF6bNAPptwEg9ZlfcDoeGEnAU6p66MHOz
	Cf0w==
X-Gm-Message-State: AA+aEWa7uq4r2mhr4iN6IfRgLHRWTT+nLs6duBqwiRMUs3wP+zrAIyuE
	Cdil8JGeJ3k/d136/IesrnT4Mh4YBWNGfQ==
X-Google-Smtp-Source: AFSGD/Wg0xQmGIaQR9mycsGLjCITVti8WKd6xuchNZ6tMi4w70TrWpR4TwBeGxpNJWt/Wpvzw7so8Q==
X-Received: by 2002:a9d:5549:: with SMTP id h9mr14234112oti.83.1543350125868; 
	Tue, 27 Nov 2018 12:22:05 -0800 (PST)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com.
	[209.85.167.179]) by smtp.gmail.com with ESMTPSA id
	e42sm2497661oth.36.2018.11.27.12.22.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 12:22:04 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f179.google.com with SMTP id x202so20477980oif.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 12:22:04 -0800 (PST)
X-Received: by 2002:aca:6c8d:: with SMTP id
	h135mr16660566oic.140.1543350123637; 
	Tue, 27 Nov 2018 12:22:03 -0800 (PST)
MIME-Version: 1.0
References: <20181127191255.39052-1-abrodkin@synopsys.com>
	<CAP9ODKq2NRaMcW3nY-cs-uBuKBG3xx7sAuzBoZtRheo-jz+7CQ@mail.gmail.com>
	<CAP9ODKo+3XpTqsVpUB3s2OhUuV2039J-RefKOBvDNVABQB18+w@mail.gmail.com>
In-Reply-To: <CAP9ODKo+3XpTqsVpUB3s2OhUuV2039J-RefKOBvDNVABQB18+w@mail.gmail.com>
Date: Tue, 27 Nov 2018 18:21:50 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqgND-OcXU8dwSneRsrgRCO-xCj3UX3JoNbuxCU=9rBtA@mail.gmail.com>
Message-ID: <CAP9ODKqgND-OcXU8dwSneRsrgRCO-xCj3UX3JoNbuxCU=9rBtA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	linux-snps-arc@lists.infradead.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-tools: Improve build preparation
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
X-List-Received-Date: Tue, 27 Nov 2018 20:22:06 -0000
Content-Type: text/plain; charset="UTF-8"

Hello all,

On Tue, Nov 27, 2018 at 5:52 PM Otavio Salvador <otavio@ossystems.com.br> wrote:
...
> Looking at this, I am wondering if folowing wouldn't be a generic
> solution capable of upstreaming:

I posted the proposed patch to U-Boot mailing list as RFC so we can
see what their feedback is about this approach.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

