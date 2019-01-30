Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id C078B6C132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 16:57:06 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id x10so227600wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 08:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=bD4mU8N+9Kx5Vm+hbkP70dnWF21jwDcOTYpDkqLCf6Y=;
	b=aK46sP9EcpEFjewlPMA2VlVcF+NCZmwN9DVwYLX5VjKQPwVUsLrLGQBAswt1aXKDDI
	ibf3o+AAGgLJI8OMiDgfa7oTInfH60ecI9+1Bg+y/x1Ep63hymnULPb+vcXBchxHvCXU
	sGpDCf1RFi+HPSkXHJOBdHdCa6TcJ2812s5EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bD4mU8N+9Kx5Vm+hbkP70dnWF21jwDcOTYpDkqLCf6Y=;
	b=rdybW6OamIhyj+TF2YhvIT5s7eI2tkAAJjT7+Wp1VmGAYjaaQNfVLliwsCkhe9Ebjy
	giXui6e4NXc9qC2Ps7q+vZ5V3Eusr1p5neXsWNQowyvtUa+Yv/FjcDnsZtmIckgfOpSQ
	yuW4Vp6w1kTnPt8TcIjhCITrKJ8+/1x0vJ9Dkl+H+KlFThMxGPosjdMuvZgnI+ifTlrH
	RlbOtyI/7ZtAP8gVYz4ZoA3Al1hCUZ+r1pVppS5oiYq/wjDuIBOGU3tpXxjVsM+OU9ch
	/Tlel0Dfph9vffBJqNd8s9gJnAnbD2IG8Iji6qZz5T1neF/VW9wUImkTxhlU5ycQhsnU
	AfyA==
X-Gm-Message-State: AJcUukfRDmXlq0hYYh+w7MoBXt9keMFKCf4kp5MRJaSlTcyreM23QGYq
	sNhQJChdXPX3zjFSI06BoMMuFfLRbWM=
X-Google-Smtp-Source: ALg8bN7QDVVVqQ6QblEtrvegpxTXv/8uR9VkpedAyN2AFPhKxwEjBM+Do2PGlL4tEVWbMewowksbew==
X-Received: by 2002:adf:8506:: with SMTP id 6mr32188752wrh.128.1548867427188; 
	Wed, 30 Jan 2019 08:57:07 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id c8sm2691372wrx.42.2019.01.30.08.57.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 Jan 2019 08:57:06 -0800 (PST)
Message-ID: <8af304706bdbad89ead4c22c5a81dc1c85c0f6a1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jan 2019 16:57:05 +0000
In-Reply-To: <9c52c249e8b3dcc2e0ef2f14ba04378bedc50a9b.camel@linuxfoundation.org>
References: <9c52c249e8b3dcc2e0ef2f14ba04378bedc50a9b.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: Help needed with ptest
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
X-List-Received-Date: Wed, 30 Jan 2019 16:57:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-01-28 at 11:39 +0000, Richard Purdie wrote:
> There are multiple areas that could do with help:
> 
> a) investigate/fix the timeouts
> b) improve the test results tool Ee Peng has posted to include ptest
> processing tools:
>  i) view the logs
>  ii) compare the results
>  iii) highlight timeouts 
>  iv) summarise durations
> c) Split logs into individual ptest runs instead of one block
> d) record the timings for the individual ptest blocks
> e) Add timeout status for tests into the json so we can explicitly
> test for it.

I've now got code to at least help with c/d/e above.

Just to update and document a few things:

a) openssl ptest is broken, it runs but doesn't report the results in
any form that works for us

b) there is a bug in ptest-runner which intermixes stdout and stderr.
Anibal has a patch which should merge shortly

c) lines can get corrupted when logs didn't end with a newline meaning
you'd see DURATION: at the end of a log line. Anibal knows how to fix
and should merge shortly

d) running with 256B memory is too low. This shows as the OOM killer
activating in dmesg. It doesn't show in the ptest runner logs. We
should add checking the logs to the ptest runtime test and increase the
memory for sato-sdk-ptest

e) adding more memory meant the test run took longer but completed more
tests

f) timing data for ptest for qemux86-64 "core-image-sato-sdk-ptest -c
testimage":
5656s for 256MB no SMP
6386s for 1024MB and -smp 4
6803s for 1024MB and no SMP

Cheers,

Richard



