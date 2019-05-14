Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 51B047DEA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 10:08:20 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id c5so18465817wrs.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 03:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=xrc5Ou7WNa3G+5LsrMZa3RD09g7vSSjh0yTyEvwKTns=;
	b=bw8dWBOeV0qj5yCvq41XYhI8qOcGiVP7rXy5ouVvC7QzFWTmiaeRD5YkvEVGK7y+K0
	iigufnnajdPhOuU8f0C8G+mYfa2A2z2f+ZBfO43l/RdnobQ0OdULC8pswH6LFY5qZ2WX
	Aagm4l2Mm7z3OyHwcarX3P15jLXLlx2jdgAPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xrc5Ou7WNa3G+5LsrMZa3RD09g7vSSjh0yTyEvwKTns=;
	b=uDBxtrLeQtuZ0M/0v/5FLZh9PVf94gYxlQ5PInpD4cMsbc9EBgbwxLCuI9LzLFXEWe
	pra98CipnKByZKU1uamdSZkW2ax3Vsaei6q7VNZq/rba31GJBDvQzSttNkP0cubgawdy
	etqMy10d5Owe1BkL6rMU8GVfUpQS89ybu8YWsYiJT6d9Qq1A+HlOGXNsgGKfgXHeYf9e
	uwQnHK7ZqV7wqe34BN+d3guKrPfJftvvGtZssEe8oxVSyn4O63buMD9n6+ODf7CAbkfr
	9ROVNeqlAckcFyAuAFne+XFkT0S+LE/z+us8f02nGWCG4zqqFgW8wFxITvSL69R0u1Jq
	+5YQ==
X-Gm-Message-State: APjAAAXbKs0FeFDQ5PdQmQkJNcWg1N+KVDl6SGNC9QT/P7XldpKKZsjr
	vJTXBlDL+IFU9nRNQLQgvzC3Qw==
X-Google-Smtp-Source: APXvYqxqa+wBA7sntQJEUjeJbo0TjkzbvNWpw1Kah4417tU7IpvAtntFzinMmqwk69MWONOLqfFd/A==
X-Received: by 2002:a5d:400b:: with SMTP id n11mr19577710wrp.123.1557828500904;
	Tue, 14 May 2019 03:08:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 19sm2420781wmk.3.2019.05.14.03.08.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 May 2019 03:08:20 -0700 (PDT)
Message-ID: <11653b239bb09ddb35bccb03f22ea47ec60cbf60.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 11:08:19 +0100
In-Reply-To: <20190513153303.50095-1-alex.kanavin@gmail.com>
References: <20190513153303.50095-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium
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
X-List-Received-Date: Tue, 14 May 2019 10:08:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-13 at 17:33 +0200, Alexander Kanavin wrote:
> This matches what the qemux86_64 is currently using, and
> will allow testing the instructions added in the meantime;
> particularly various SSE extensions are now enabled.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/machine/include/qemuboot-x86.inc | 4 ++--
>  meta/conf/machine/qemux86.conf             | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)

There is some kind of bad assumption somewhere in the sdk/mingw code:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/152

and another glitch somewhere in the SDK code:

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/588

I was also worried that:

http://git.yoctoproject.org/cgit.cgi/yocto-autobuilder-helper/tree/scripts/publish-artefacts
may need fixes but it looks like it might be ok.

Cheers,

Richard


