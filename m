Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id B8CFB6BD4E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 21:24:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t27so31817205wra.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 13:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=MFxTe+h3wh+5YNRvT+OQnfCT38VChBkrPMZIoWkb1N4=;
	b=aYogx7g/NijW/X2F3/eWObqjpwl9NDHEm6FO83sKqSyAKL2AsRybk6LqV7sXM6ajGu
	BhsoPwtGuhbAYFV+Z1pdqwOJG6ZCeqU1HOz/WhkDGVqXEkyUhGLK2Ivw3jwd7kofPmXg
	8VFyCSFRjgf9bZworW6EBJNr7gE0BqoKv97ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MFxTe+h3wh+5YNRvT+OQnfCT38VChBkrPMZIoWkb1N4=;
	b=eDquGvv5d9t/QuNX9UVwe0lWnH70VsDjrdealM1Uy3bQUJ2uy67lsvfsXylkYdzY+A
	Wcljo7sxJOrp36hWF6B83rRljdt1VdHYjHFU9Plrsxj9TmPRTurjrUjUC1pth9lRbsgf
	MX2nB7OcsyQqWvEp0MX23B5ToaDRa4uUI1R/HlH2WRKu2sjsFVwW9skidRrQ2LydOHVk
	Tc3rmwtDQXdGb1ooNmoH5E+j34HU+zh9oIc6YePxuoEfAVutbpkRSMbtYt4bqfB1n69z
	XNMmo9sBDuxqnSk0YFnUmny0A+0sQEvQwJH8bbDG5h4KMgfROVbxoExXNtLqA+yWixOI
	lMbw==
X-Gm-Message-State: AJcUukcUZP0tXbWyv8a1qH/lo9FeeqAZaz/1J1zmsJjq/n4jWKZrZzhZ
	8A4GUiuTCYAjVAemtdfEswIv6g==
X-Google-Smtp-Source: ALg8bN4QV26TRFvurJ2G+mrbVY/7U0CLx3sHBul7BuRgXthS/B61MckDkKQCTGfuUv7RpepG/4oUqQ==
X-Received: by 2002:adf:f984:: with SMTP id f4mr39856129wrr.234.1546464241360; 
	Wed, 02 Jan 2019 13:24:01 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	143sm51800482wml.14.2019.01.02.13.24.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Jan 2019 13:24:00 -0800 (PST)
Message-ID: <269a8e278b182ff55dc88913edc4848e4d0dc436.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mark Asselstine <mark.asselstine@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 02 Jan 2019 21:23:58 +0000
In-Reply-To: <25783268.MQFnVprAOB@yow-masselst-lx1>
References: <1545320094-21504-1-git-send-email-mark.asselstine@windriver.com>
	<25783268.MQFnVprAOB@yow-masselst-lx1>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] man-pages: use alternatives to resolve crypt.3 conflict
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
X-List-Received-Date: Wed, 02 Jan 2019 21:24:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-01-02 at 13:39 -0500, Mark Asselstine wrote:
> On Thursday, December 20, 2018 10:34:54 AM EST Mark Asselstine wrote:
> > From: mark asselstine <masselst@yow-cube2.wrs.com>
> > 
> > To fix:
> > 
> >   Error: Transaction check error:
> >     file /usr/share/man/man3/crypt.3 conflicts between attempted
> > installs
> >     of libcrypt-doc-4.4.1-r0.core2_64 and man-pages-4.16-
> > r0.core2_64
> > 
> > This issue came about after commit 59be9254df9f [libxcrypt: Upgrade
> > to
> > 4.4.1 release].
> > 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> 
> This issue is still persisting. Any reason for this not being picked
> up yet?

Vacation and being human :)

Its queued in -next, I thought I'd picked it up previously...

Cheers,

Richard


