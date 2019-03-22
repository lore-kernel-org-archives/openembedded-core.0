Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3084D7C5C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 11:44:08 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id h18so1854982wml.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 04:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=5ipMIRtg/R0f/cdZsx+pC5RdEuseK4wOSRTacjdMwD4=;
	b=HHM7JD1ZlZQK/QcDMSW2y5kr7/WeHGQe3zAcV+pu7nTDCG3pgQESzT3IIzcqaofxTB
	Fjrh0WrVTgdZ/g/cW5ML5uPSa6viRbwEHTLzr7GMl8t40J373AltWh+J40cvreFCRTpu
	Rzn+ruSXpal2CFpvo4EMdTFiw/ndykFHe6Ya4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=5ipMIRtg/R0f/cdZsx+pC5RdEuseK4wOSRTacjdMwD4=;
	b=sP4HYO2WW86Z5leAmPRuhisUpkWAgHbMFIU5TiCJdEA3/6KDrPuq+wvsy+KS/XPVdh
	BNt5Ou/46F0rVxzmWJIoUhOrZaOoQDmRuY9/yp1U0mqEbMPlG3zBkbHIT0lI6YiAFXeo
	G+fC/nfO9fRvq1IvbsP+L4pos+r9soam0AXjJRdMNUdpHVG9UdnMWwGyQgA30R3+97dC
	240CcgwqgSUrMjqf+zMYHojiFMGIbteiPlHVBBPFaiMFJ61ZHdZfeV0MVr/33bPf5jC1
	6/+XZhQALfxukocFGnPkWFtot6kfC+UmmOZSqC7cMJA3BaJG81ux3ctNdVKgazBkb0S4
	nqTg==
X-Gm-Message-State: APjAAAUQsJIugbsBWSoA+kO3lwElDnru7pv/iV0qd+dRFBT+e8n4O/Me
	mG9vJFFNAmaLEmlhef5bLEIERNqlufDhWg==
X-Google-Smtp-Source: APXvYqzXAK7W+KZ+JeUIRqew0HQa3HLG+R6uq5WM1cHUpwF0ydV8qITj7fzjjZ/1yM+n0QlQ6Gj6Gw==
X-Received: by 2002:a1c:4641:: with SMTP id t62mr2902233wma.53.1553255048894; 
	Fri, 22 Mar 2019 04:44:08 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n4sm11541381wrx.39.2019.03.22.04.44.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Mar 2019 04:44:07 -0700 (PDT)
Message-ID: <d42f9e5f5f57a33eb445c083017da4a9aabd1010.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2019 11:44:06 +0000
In-Reply-To: <20190320230557.7094-1-open.source@oleksandr-kravchuk.com>
References: <20190320230557.7094-1-open.source@oleksandr-kravchuk.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH] ninja: upate to 1.9.0
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
X-List-Received-Date: Fri, 22 Mar 2019 11:44:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-03-21 at 00:05 +0100, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com
> >
> ---
>  meta/recipes-devtools/ninja/{ninja_1.8.2.bb => ninja_1.9.0.bb} | 2
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/ninja/{ninja_1.8.2.bb =>
> ninja_1.9.0.bb} (92%)

Fails to build on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/423
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/424

Cheers,

Richard


