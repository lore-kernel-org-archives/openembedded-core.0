Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3D97016E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 10:37:01 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 109so4400733uat.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 03:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=9L+Xzeli08UjnIW2WZAKcphrG3ErTGRLyZZShw+Gb5w=;
	b=Ik7a0aquBtcoqeUe4+zZOfN7r+xz2+JqfQpWVMb3dhPQ9UZjmt6a0m2VCFJznEhW6J
	9uVsGTuu4y1rcC6wek4OS36YjHPPfRzPQqZlK9+IiQkir8X+aO348JVDwriSwEkGQ3xb
	tLgXIH6dLJbvuBbyNwLT1yQ2O7gFm1Gn6KHiQ8Dc12A2Ic9KD5FbpyR5KKq3ehDB4yZM
	TymKBHBiqX9gN/FNrNFIWA8PnsQPPKihEQOYGkLnB+tRqdFDcWE5D6Dm9+5zWdxix/i4
	suMLbXqqekFqzmp5sY2o52oWEERPQmWZ1TZkmlpsbMKnFLr253rBYiBpH2Jm2Y2ERWUm
	wxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=9L+Xzeli08UjnIW2WZAKcphrG3ErTGRLyZZShw+Gb5w=;
	b=NdnQLC9lrB6aqkAEWxaGPty4VGJaraeOFi5DfZVfTVJ3XVL9HXsv4BfV9fN0oc8zOR
	tI8HxECixaCAPgADLWZkiTPO9WKF+pK7vORsxDe6TG7fLE2/sCZHyofKlbDKHAwvW1x+
	HmgQN4vOSihnbfWwWHKRjFryafRPB1hOqbm/WONHwr1zMfw3MOaj9TLWyuGoB25wV/bf
	awEe/tiOBJ2Y55hVFYw9pPhRoiiMOHLxlyquEeW1/0DS8yJ7u/AA7Aml+kRY30I/QeYm
	QO2weaZmts8gOwGnf1Er0opQZq7Tl3nDo1lEv3mTvRxgWjyWXzEu0xZ6ZIUjyBr4xHzw
	STbg==
X-Gm-Message-State: AEkoouukuxC+u0+DJjzxTZOugNrTuA+/lczip0Mu+uCePM6r9kozxw7rSyw0wo4fZq3VDA==
X-Received: by 10.176.67.6 with SMTP id k6mr39072700uak.96.1470652621916;
	Mon, 08 Aug 2016 03:37:01 -0700 (PDT)
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com.
	[209.85.217.170])
	by smtp.gmail.com with ESMTPSA id 72sm2574526uad.5.2016.08.08.03.36.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Aug 2016 03:37:00 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f170.google.com with SMTP id 35so246291410uap.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 03:36:58 -0700 (PDT)
X-Received: by 10.176.64.72 with SMTP id h66mr45665585uad.97.1470652617196;
	Mon, 08 Aug 2016 03:36:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.138.78 with HTTP; Mon, 8 Aug 2016 03:36:56 -0700 (PDT)
In-Reply-To: <917684eb0fc505f6b575ac815188baa7f685cdaf.1470643735.git.maciej.borzecki@rndity.com>
References: <917684eb0fc505f6b575ac815188baa7f685cdaf.1470643735.git.maciej.borzecki@rndity.com>
Date: Mon, 8 Aug 2016 07:36:56 -0300
X-Gmail-Original-Message-ID: <CAP9ODKohXDNzKeWrkcAC7yT5AKJYqCvFBcXkJx0dD7OwO5bcTA@mail.gmail.com>
Message-ID: <CAP9ODKohXDNzKeWrkcAC7yT5AKJYqCvFBcXkJx0dD7OwO5bcTA@mail.gmail.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ca-certificates: remove -- separator
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
X-List-Received-Date: Mon, 08 Aug 2016 10:37:02 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 8, 2016 at 5:11 AM, Maciej Borzecki
<maciej.borzecki@rndity.com> wrote:
> Options and directory separator -- slipped past the patch removing
> Debianims, thus resulting in failures on hosts running Fedora.
>
> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Also, this should be backported for Krogoth no?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

