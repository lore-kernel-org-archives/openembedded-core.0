Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id B4A7B614FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 15:38:09 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id e8so1078081wrm.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 07:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=r4bU69ShBKk3Sg+f/HoqJnzw0BC9+crpsuHEU0f0Kms=;
	b=VmKH/LT2RMMlNWjSxGM59ir+LWl/DLDnHh0hkiAFQZxdJEIf4FZB6sw3UD743aVrNG
	RPNKuCw9f2jebcZsj6MjDC/5kW5D9q9cKypEu1Vn1emWwuFHNtuQ7jGi6IoIzntCv7LG
	a8XPq0DTg+TglySXfx71q/nKwQCxlecaOubFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=r4bU69ShBKk3Sg+f/HoqJnzw0BC9+crpsuHEU0f0Kms=;
	b=Sa+KTiTq415dRH33/n5VZoKYAQaM03om1nvDe4fVyxx/q2YK2Ey87/Zn9VFf7B09mF
	/pKG3PZO7Rsd8IGB6WQ2n1FzT+BXDy+buB07Fp163QtBhPJBknH6Dep0xziBwBuLUXdQ
	bodrNr06CqkzyTjV73l+PX5Kn+v/hhOpxlRx16QAolpZ6w4R31uaDCxQJAQX96lOQrL4
	7C2droB9pGxAu7tkLkxV1yaZ6vg7KHs5jB+DNwb3/fx3QjqS7f4vsVT/dsE6iYdvsjrw
	MBBD33eZgyGkoArTVKEQG8QDQP1qz4U5N4b3xNV2AO+RW2Qevggl4V7xo0f7r38vwxWa
	7+eQ==
X-Gm-Message-State: APjAAAWRGyPXrhQmUwP8GrzQiLrtkCUdgvQR12pSrcbkVHNpJ4PkFq/V
	7Ndn/qlgOLkIFxXnHSJoT7FT/g==
X-Google-Smtp-Source: APXvYqzIrvxI6oDOSas6TX75O7+hvob+DfcUqv/aZuOzR6FucPZyedOGWBRSmVGrximuv4a0yFo50w==
X-Received: by 2002:a5d:4bd0:: with SMTP id l16mr38701201wrt.271.1582126690332;
	Wed, 19 Feb 2020 07:38:10 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 16sm289471wmi.0.2020.02.19.07.38.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 07:38:09 -0800 (PST)
Message-ID: <143f590b688ed8166a702873275c16f3c7217d52.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>, Anders
	Wallin <wallinux@gmail.com>
Date: Wed, 19 Feb 2020 15:38:08 +0000
In-Reply-To: <20200219152720.GM17818@joraj-alpa>
References: <20200218132054.20341-1-wallinux@gmail.com>
	<CANNYZj9nm0eqo0NtHhEJiw7nLbnYQ8r1aazXk6mGn83VXc9VNA@mail.gmail.com>
	<CAF2baFdCF-NVmUa=meNhAN5BDBqLcS4k7F+EBWtUA1ekY6OVBg@mail.gmail.com>
	<20200219152720.GM17818@joraj-alpa>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace2: added 2.0.1
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
X-List-Received-Date: Wed, 19 Feb 2020 15:38:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-19 at 10:27 -0500, Jonathan Rajotte-Julien wrote:
> On Wed, Feb 19, 2020 at 11:06:12AM +0100, Anders Wallin wrote:
> > Hi Alex,
> > 
> > I think it's better to use babeltrace2 since it's a new version of
> > babeltrace.
> > The dist packages uses babeltrace2 and the main application/program
> > is
> > called babeltrace2.
> > 
> > Jonatan; Do you have any comment on the naming?
> 
> Me?
> 
> Don't care much about the naming. The major issue here is the
> dependency for
> ptest of lttng-tools that depends on a "babeltrace" executable and
> not on the
> "babeltrace2" executable. Currently on our CI we create a symlink
> from
> "babeltrace2" to "babeltrace". This is something we plan on
> addressing shortly.

Let me try a different question. What is the ultimate intent here?

Will babeltrace and babeltrace2 coexist in the future or do you plan to
rename babeltrace2 -> babeltrace at some point?

There are some things where the namespaces are quite specific (python
vs python3, gtk(+) 2/3/4, qt) but they're fairly few and far between.

If babeltrace2 will replace babeltrace and become babeltrace, we
probably want to keep PN as babeltrace. If it will be known as
babeltrace2 always, we probably change PN.

Cheers,

Richard


