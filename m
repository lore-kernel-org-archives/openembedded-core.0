Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB288601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 14:17:01 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id e1-v6so19881357wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 07:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mEeETCPw2Lynla+VyIWEJ32i+35LqqFT9jgqPzyd4Mk=;
	b=T0dfkllLcW006um8g2vrkeV61yCXTvbZqwIIYqfjJHh2GEveLgakpT4pYGi1iMLfr0
	on9CxAowhZxPYRXrsMi0bZn0Wsbv1Ao6Ol95pATPQ5/rfy3QEDIHFbdAt+lfAoQbh456
	Vog19UQj7Sdz25AQrvdJGEzOkdjzwEUQBYpi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mEeETCPw2Lynla+VyIWEJ32i+35LqqFT9jgqPzyd4Mk=;
	b=KVGSJ51RKrv0qPjYTok44beXhoSOIle31sN++wm5Mcs3+V0bCORIk/pP5JFxchzxL+
	qhNcb/ksUddN4NSFHGMAQQLFXN2C+5pLmUJ1qFfstjLzMlleDYqve5TxQ3NjgZ1ujZht
	J25gxRhzfePtY/0+Ltk0VtAwQbuIGBBrFgEserZWWO5y16RYyJIyIH+EBU/XmldeSpZu
	jnwngk7m1FAYdorMY+Ss60+NS7yVQu71rwwWuIsCPeqO0XJNrojumxx9kI64iv+uFYpz
	QRKXxOL4QBczm7Bm8ABwNrVVu6VxTtOi2qARTlKYJHFHKr209n6UjCHogBeWDsXC6Jwf
	mr3w==
X-Gm-Message-State: ABuFfohWwID8QdT+EguiBKQMlZx6zGNu+D5T2c4N8fUGZckQChl8MNaj
	MfeinEhrjGf2Eh1eXvrDJTpi4Djh6cQ=
X-Google-Smtp-Source: ACcGV614cN3Cw/7EaXXLmIOuPD/j4q4SIKHA2Flarwo5z38qpq86jVp275EUdRV0THKKHG+VK710nw==
X-Received: by 2002:adf:bb41:: with SMTP id x1-v6mr8472209wrg.24.1537798622414;
	Mon, 24 Sep 2018 07:17:02 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b74-v6sm23222746wma.8.2018.09.24.07.17.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Sep 2018 07:17:01 -0700 (PDT)
Message-ID: <761eabf569f5df7dd1599acf22dbcc2279136523.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mikko.Rapeli@bmw.de, bruce.ashfield@gmail.com
Date: Mon, 24 Sep 2018 15:16:59 +0100
In-Reply-To: <20180924135527.GL9430@hiutale>
References: <20180924072539.GE9430@hiutale>
	<CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
	<20180924121927.GI9430@hiutale>
	<045ad825c6999fe4876a7aa90cb427ca2d0d8c87.camel@linuxfoundation.org>
	<20180924132013.GJ9430@hiutale>
	<36b0c47b199a55e4c385f437aad964980c20dd61.camel@linuxfoundation.org>
	<20180924134234.GK9430@hiutale>
	<aeea3a8ffd2dac5f295e4357a3058505546fa1dd.camel@linuxfoundation.org>
	<CADkTA4MfAESbzUV99QR8gCWLaC-R18wuR8fTbS7aWaZWzhttYA@mail.gmail.com>
	<CADkTA4O_nCQTD-3UrCqk95HYj=XvjqduaCkUR5d6FKeUyBNPmw@mail.gmail.com>
	<20180924135527.GL9430@hiutale>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: allow exporting files from kernel recipes to sysroot
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
X-List-Received-Date: Mon, 24 Sep 2018 14:17:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-09-24 at 13:55 +0000, Mikko.Rapeli@bmw.de wrote:
> It would be nice for kernel.bbclass to help creating the custom
> kernel specific -dev package with headers, and it would be nice to
> have a kernel-headers.bbclass to help users to find them by adding
> the path to default include paths for the recipe. And while writing
> wishlists, would be nice to support multiple kernel recipes per
> machine. We forced a second recipe by cloning the kernel and other
> bbclasses and added a different prefix...

FWIW multiple kernels is a long desired feature and I'd be happy to see
a patch which allows the kernel classes to be configured to build a
second kernel with a different package namespace.

The kernel-headers class may be ok too and simplify the documentation
process, particularly if the subdir to put the headers in was
configurable.

Cheers,

Richard


