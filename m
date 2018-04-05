Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 31DAB75081
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 19:43:24 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id b20so31996686iof.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2018 12:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ug78Sog5xO9+JtRdBrrCE3esgwSXKfTL+RHDk/1jYKw=;
	b=qHMFsgQXlN6S3v+PMn6r+SCigdAh3MHOMp8pSj2OVPbL2esHsX8iFy33qDFbHGGz8t
	G5gQ0RexdczIdBUaug8JGekreDSekdwyi3PofuFIZOx4EnWsnepTI8xrep+zFIbiA1tj
	rjOSwYi5XvuvNNIQc3V5Be3LaaajFjodfEoF/3/yrdo++ZwvXMWjBmKj/OW9QkUVBQrM
	Af95CPs2/oLNDqbuNv+BGOp5jSF5p83+4wA/8FW8ufGUizEIlQNsw+V7pBGA+SsaqHCl
	+7cV5cQn9It1JigBhmOnpzna0z+A87xIt2A1cWeq6xO8ZaEZjdC+d5DC7lJ/L5b1gv6o
	FsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ug78Sog5xO9+JtRdBrrCE3esgwSXKfTL+RHDk/1jYKw=;
	b=cSg7AODg3YpMwOKg5iSTn4Lhu+y08vHli/XrDa1G18jrO4fJSxJBPyDvKonHbDkXtA
	bpV38XvH9P1CC0VuRtdP0OOYm3Ysi2oFHRhmrZtyo1yEkrgGdKOpR5KLk470ED+l8dOj
	x5lsiKSfK3xBYyQIRdTkfTefi9vvU9/YojWw+TXvoHQjfMENdJq/FF7agNumJHncw6Aw
	gZlzCtMVnIqpWuv72vmAhB/9fzFL2qjygkwBRjNWiK8UG/Rf+U72nyeWMeGHkJCkAYv/
	T/kF4rncC3zL0DlFpcdPq0729pI0uZpxqb1HpXbozmc+bio1T0WFiAhLoYQTzvk0JQok
	4LWw==
X-Gm-Message-State: AElRT7FMFxiZLBF3y6u0KUOrbe3eTxEgnHLSLMfSVZj+YdJ6e823iziZ
	9qCaNYnvam7GYvict+0TzaI=
X-Google-Smtp-Source: AIpwx4+FBH8RuDI3DkdVcK//st8XHm1MaQ5N+9eU57e9PkolRIkXmxFXSC++R8y1WWORuOKUl8X5XQ==
X-Received: by 10.107.149.208 with SMTP id x199mr19349492iod.196.1522957405839;
	Thu, 05 Apr 2018 12:43:25 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w133-v6sm1837759itc.1.2018.04.05.12.43.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 05 Apr 2018 12:43:25 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1522957404.2760.26.camel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Thu, 05 Apr 2018 14:43:24 -0500
In-Reply-To: <1522947905.11431.438.camel@linuxfoundation.org>
References: <1522947905.11431.438.camel@linuxfoundation.org>
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Subject: Re: master branch and stabilisation
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
X-List-Received-Date: Thu, 05 Apr 2018 19:43:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-04-05 at 18:05 +0100, Richard Purdie wrote:
> We're trying to focus on getting a good 2.5 release. We've had around
> 80 upgrades to recipes on the list after the freeze and basically the
> maintainers like Ross and myself are damned if we do and damned if we
> don't.
> 
> I usually try and ignore them at this point in a release. This then
> upsets people as they don't get feedback and makes my life horrible
> when I eventually try and round them up.
> 
> Instead I've tried pulling them into master-next. So far so good but
> I
> thought I'd better see how much of a mess the branch is in.
> Conclusion
> is at least 3 different failures, some of which I can't even easily
> figure out the patch causing it.
> 
> So I now get to spend my time trying to figure out which patch broke
> what so I can report back on it and make the branch build again by
> dropping the broken patches.
> 
> This means I'm trying to do full on day to day development as usual
> as
> well as trying to sort release issues like the imminent fedora28
> issue
> I should be paying attention to instead.

I've got a build running on in a Ubuntu 16.04 container to try and
reproduce the bug you were seeing with the new uninative. I'll see if I
can get anywhere on that. If nothing else, it will get more data points
and extra testing on the change

> 
> So, a question, what do people want me to do?
> 
> Cheers,
> 
> Richard
> 

