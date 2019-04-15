Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 423787CD90
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 20:00:06 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y197so10195538wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=76SRhpxp2tbVKUXCLjhQDZ8qSG0yjXsQRDrrq5hV8yE=;
	b=HoVWoBsiI7x4hN1x5PLnd+BL6zp0GHCVfYNPT98AcCzlXKeyFXl9NWku543lauHDFu
	+xCMLElTQoQEeXD5bth6T4Xo2lHpOHuJLg+fGG7Xfs36jo4uYSO6Ij81miV++bQ3jvxy
	popyPqrTtm2AstKhapZ3AcoNcFTHYj9acajlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=76SRhpxp2tbVKUXCLjhQDZ8qSG0yjXsQRDrrq5hV8yE=;
	b=mWoGph9D87WjRFDbh+qLdiMqzfDsl0u3rtPgPAWwcHgGlA65qaJsEEevJcHCBjSzu0
	ObnDv1evdrzYpT8EJixYrcuUzqQQW/qBtcSvblRsR3w+BLcVjNBwTLdvve918is5N/qf
	le4l7m5Whyy+mX7y6aT6n+F+isvaYxnX2nFiXYSR+R50qL5ddbmCON9N8V3VSyBeXbqB
	vyzM0odUFXONmSouKkZuohwEnUFASMXdMJ/4+kCRpozTEDLO8wXPseFhpSDevOCc6xpb
	PzXH6137RNZPz3irTf/mpqT2QrcUXsMzk46HOtmqE2R6h4B0rtYiU0pWJnnvvhVD448A
	f0og==
X-Gm-Message-State: APjAAAX9b2fcTW8qVcdhXNJVEf8hcWUQhawr5g+lymj2xRK6rPbua/qc
	+hSq6fFht+PB7SSwKlDUzZaIchE1VQw=
X-Google-Smtp-Source: APXvYqyGQsAEc6tobIwckjy4IEMTzPSVPsplYgLBFSTP17aO5XNWAT8UuI7S5osFLdzbTW8NJzQV3Q==
X-Received: by 2002:a05:600c:ca:: with SMTP id
	u10mr24075689wmm.122.1555358407022; 
	Mon, 15 Apr 2019 13:00:07 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h2sm71946882wro.11.2019.04.15.13.00.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Apr 2019 13:00:06 -0700 (PDT)
Message-ID: <9f082ee8cc60cb098c60e8562d1c298142a04e5b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 21:00:05 +0100
In-Reply-To: <20190415105457.57067-5-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
	<20190415105457.57067-5-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 05/19] epiphany: update to 3.32.1.2
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
X-List-Received-Date: Mon, 15 Apr 2019 20:00:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-15 at 12:54 +0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../epiphany/{epiphany_3.30.3.bb => epiphany_3.32.1.2.bb}     | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/epiphany/{epiphany_3.30.3.bb =>
> epiphany_3.32.1.2.bb} (85%)
> 
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.30.3.bb
> b/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
> similarity index 85%
> rename from meta/recipes-gnome/epiphany/epiphany_3.30.3.bb
> rename to meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb

Fails on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/511

Cheers,

Richard


