Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 777BF6069C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:04:10 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b16so10316095wrq.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 02:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=kKtzM1KFMALiQOcOv/T4P6e4k72d0h3oq9TA5Ge+o/0=;
	b=F/3oqCao3T6R5GoTQ4QTfaMFXugALzg60Sq5E8+7gmNc0qPOPcpckZsnYs9aDJLepz
	NqJDJwUDFmhw4R61ErQ+8wvkaYWTqHvnlG8VV9mFJUhmxPGHBBoVxn+8rDx2WmatP/Sf
	bHOQkjgbpLHYUBGLf/CXtGKj7/f0nV6SU870Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kKtzM1KFMALiQOcOv/T4P6e4k72d0h3oq9TA5Ge+o/0=;
	b=mM6q/x788gLsldXmrQeEH1LAFeJVaJB5+kG7DPiux3Ang1i9QfDxqMh/Zq5RHo+jPX
	HowbZiyfNr9cHqpQaY1cHVOVH75354dvGDPruzfwG2gqXoMsrLZy4SQpFfbTfNFfSJsK
	AF8nC0d+Q8d07FBBjtxCbk2POdGihPeRQkTgesp8TEMjuit35Pod7nHjbF7zQHdBM+6s
	mwzfKHL09HnsQ2R3ZFzYXJ6LoT8Y3M97Z64Y9f5h10A4iI0ATBI1o5ZSlYpQNur+on+k
	IlG3MgGzCAzDxvgZeTVc0MZXOBDyL/1Z69c2hZFmU7g2vP7KNA8tJWfSAPw/QjIIaSaV
	ajLw==
X-Gm-Message-State: APjAAAWa9rTAeU5lIGWFpgIq+GRgnCzQmxirzy8EzEOWRbCdgSJzg2Tg
	2NzbxAasfoMqlc7CuSKeOqhqwA==
X-Google-Smtp-Source: APXvYqwyqnxYdp4VlJ5NCYOMiI8rOP0+WKekOfc3JEwG62s8wjSGAbXyPy7OGVLLZjlgJ0bKTPE97w==
X-Received: by 2002:a5d:5701:: with SMTP id a1mr23277999wrv.95.1565687051254; 
	Tue, 13 Aug 2019 02:04:11 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r16sm33037442wrc.81.2019.08.13.02.04.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 13 Aug 2019 02:04:10 -0700 (PDT)
Message-ID: <33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 10:04:08 +0100
In-Reply-To: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Tue, 13 Aug 2019 09:04:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-08-12 at 20:26 +0000, Peter Kjellerstedt wrote:
> Comparing that build to a corresponding do-nothing build with Thud,
> the time difference matches those three minutes where I have no idea
> what bitbake is doing now that it didn’t need to do before…
>  
> Hopefully these time degradations can be solved, because the current
> state of bitbake is barely usable. We also need to look into possible
> ways to improve the cooker output when it is running the setscene
> tasks so it makes some kind of sense again.

We talked on irc and you pointed at the commit things started to go
wrong. Just to summarise things for the benefit of the list, this is
some quick testing I did:

"bitbake -p; time bitbake core-image-minimal -n"

30.0s 6c7c0cefd34067311144a1d4c01986fe0a4aef26
30.6s a0d941c787cf3ef030d190903279d311bc05d752
40.3s 7df31ff36892c2f9c65326b06b4c70 
42.2s a0542ed3ff700eca35f9195f743c9e28bcd50f3e 
45.4s 9983b07fffd19082abded7c3f15cc77d306dd69c 
76.9s master-next

So basically the original changes showed a 25% hit but the performance
of -next is dire.

This is with no hash equiv server configured.

It will vary depending on the target used (numbers with -sato for the
above would be interesting for comparision) and how much was or is in
sstate, they type of sstate mirror configured and so on.

I really need to focus on getting the new code functioning correctly
before we attempt to optimise but if nobody tests the new code due to
performance problems we have a different issue. We also have a scaling
problem with the hash server itself I need to fix to stop the
autobuilder throwing weird errors. I'm therefore a bit challenged on
where to start with it all :/.

Cheers,

Richard




