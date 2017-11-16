Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF7971A0F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 11:50:29 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id x63so2383926wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 03:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WXLlyrlUjOtMESKhSi6tWxkigwAhk0K4AU6Q/Ux/liw=;
	b=TedfR5P8XzA1NwkYgctAZMA7Ys7CHNhgax/ru6+ZQaYHtMSKlocn+Zv56wjGBxapZV
	pQ6OWKLmqF0sguNj7Rfp4+kX/IG3G0OvWa/9GoYu7GaUKtSLDkBHUbuesEniKwjyrb0s
	FPf5HAGx9BVvv2O1NktwiOgNb/SUlGtUcZbG6QUcgoVAOn0RyH5fEdqyBBOEEna1mVsF
	5VboLiC81nl4mEFcuRFO4/x76pC/NwPT9o7Ls17z4ScgUH25RgeLWaxaEJJ7L33At9rC
	5J3a7FhHXorda2EQCAZynl6OeXXomqfJekNS6O57A3I8xOx33yPIVzr09Q26WGDZrt30
	8Epg==
X-Gm-Message-State: AJaThX5teTi0VhI+OqbL289M8H5ho/SA8ksiN9qL+giG6e2nyx4r7lsF
	VZdyqErf/0aJXVFpr9/pNIqpSpPM
X-Google-Smtp-Source: AGs4zMb0GmxSxMaZovSZUvo+1a5Q8r/k0ZvCTysqT0+joqXbEJlpPkV5GUa2Y8R65e+mujqbKoLl8g==
X-Received: by 10.80.173.56 with SMTP id y53mr2349663edc.202.1510833030737;
	Thu, 16 Nov 2017 03:50:30 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id p37sm950275eda.96.2017.11.16.03.50.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Nov 2017 03:50:30 -0800 (PST)
Message-ID: <1510833029.4049.77.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 11:50:29 +0000
In-Reply-To: <d0db7f059097d0271e5808dda280140ef49aae6f.1495183828.git.kai.kang@windriver.com>
References: <cover.1495183828.git.kai.kang@windriver.com>
	<d0db7f059097d0271e5808dda280140ef49aae6f.1495183828.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] bind: build with threads and update configure options
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
X-List-Received-Date: Thu, 16 Nov 2017 11:50:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-05-19 at 16:52 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Build without threads for bind is inherited from legacy openembedded.
> All libc's support proper threading on Linux now, so enable threads
> support for bind.
> 
> It is also need to disable static library build which cause package dhcp
> fail to build after enable bind threads support.
> 
> Options devpoll and epoll are configured to choose most preferable
> multiplex method for unix socket. The priorities are: epoll > poll >
> select. When set '--enable-epoll', it just defines a var and include
> header file that is available for cross compile. So use epoll for bind.
> 
> Add PACKAGECONFIG 'urandom' that could use /dev/urandom as random device.

I'd say using /dev/urandom should also be made the default.

Cheers,
Andre'


