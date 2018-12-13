Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 107D76C49C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 16:19:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l9so2588524wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 08:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=zmy0PRdBYBNyOqs0t8is0REJ34LVjliBzoWnLIT+q0A=;
	b=B8NgGMC1YNuzJ1UXaq4WqAfCxQcf8YnnuEH2X8IQZfqwfOGwrsXFqa7qCC2oppjdZB
	1Tth+o+ACZmU4K0mr1H8oYy/EX3sQmbg4sCNxhJG8rQW5UCoEoQxSUb71PwNCqYsrlxY
	I1hhjKYbUBjFt2CbuXu06sPrXF2PXP5H1ZAOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zmy0PRdBYBNyOqs0t8is0REJ34LVjliBzoWnLIT+q0A=;
	b=VqoWHLYDUEqgA/2wmPzgOI4NoCf8q5KiU7TakvuQj/OtCmk50guIimLDOh0lWVZD1+
	hXDXmc5sn5Dd3pmKaHoTEvAoJpwysHQjb+kuD3sEomB8dXqv7NjJqrduis1m/WHwDrEu
	PKhZnMza7755kZfHatXxWmMXaG0Oz/ITBp+sup6ttZJagx9+LX1SaelHjFGaH/7chEMK
	e2e8NfyK2hmJpl4Sa8z7JxeJcbporxqILuM6XhAwRcZXxjQDmefQKpjjAkGA63gD4b9g
	doiESPPurS2CUvNUTdkEbdxvny3mi36jGY7TkfxR53tVO0/WermvuOMbqdO29jwRXNZW
	4uPw==
X-Gm-Message-State: AA+aEWaIz6Z8fFESZSg3JBqLgiqX5o6A6ryS7Brgw89L6W9ob+ptdcuR
	tHBxsgRq4zReReboD3CC92m4NA==
X-Google-Smtp-Source: AFSGD/WNg2fPE+axabJB894jQobta2hnd7jR0D2xes486uPmsEVj0XBrUCGEKQmj5zNosviuXzK9GQ==
X-Received: by 2002:a5d:548d:: with SMTP id h13mr20755628wrv.80.1544717973654; 
	Thu, 13 Dec 2018 08:19:33 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id h17sm901648wrt.59.2018.12.13.08.19.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Dec 2018 08:19:32 -0800 (PST)
Message-ID: <17edc46703e7423f1a730bdea6cc3f0e1877d9d6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Thu, 13 Dec 2018 16:19:30 +0000
In-Reply-To: <CAPybu_0YGwMPD1N4kfN0KUb6snAowee6MfN2+tJNVaHqrUddrA@mail.gmail.com>
References: <CAPybu_0YGwMPD1N4kfN0KUb6snAowee6MfN2+tJNVaHqrUddrA@mail.gmail.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Subject: Re: Multiconfig and native recipes
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
X-List-Received-Date: Thu, 13 Dec 2018 16:19:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-12-13 at 16:19 +0100, Ricardo Ribalda Delgado wrote:
> Hi
> 
> I have a setup with 3 multiconfigs
> 
> If I try to build:
> bitbake  multiconfig:*:erlang-native
> 
> Bitbake executes 3 tasks on the same workdir
> tmp/work/x86_64-linux/erlang-native/
> 
> which of course crashes. Is this expected behaviour? a bug? I have a
> wrong config?
> 
> Thanks!

You haven't said how your configurations were different.

With multiconfig you have to use it responsibly and a little caution. 

It sounds like you're using the same TMPDIR for these builds but the
builds are differently configured. That wouldn't be expected to work.
The builds can only share TMPDIR if the configurations are compatible
with each other (same DISTRO type config, different MACHINE for
example).

Its hard to be specific without the configuration though.

Cheers,

Richard







