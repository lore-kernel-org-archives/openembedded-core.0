Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id E6BBD61612
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 14:58:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b17so9742402wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 06:58:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=FPeELa+/J8kxhboWV6INjhAWZrjRR61L0UzqAtAfjP8=;
	b=qAsPFZvYBlXigXpODJWFwfCBZ3BfPMdncQdxqMpxR0Xi9OeaScZ4m/TQVl5oInqNLO
	yaet51Un+4bT/rSnRlfrgjWDhPKOuvB8DdzXcQSptx7I8ZGv75tVYgPORsTaVNwmhXQi
	DEL18yu6/kla25x2UUgKxIXBRDNCJpkoPKCECTg6KzyYZSCRoXcG9sncX5ZtPqIiG4pr
	XSfZsekFhesDKU41x/WFhDwJiImEbdDQdmTNkBMh0GWaG8Ld/MbTx6SZebzpTcJcq2Kp
	81cdvZ01GBN3pdrxI5cgphm6iIsMFtobThbGTRoGxpY9g6hP8larrBxjPRCYuxMrrLqR
	+mUw==
X-Gm-Message-State: APjAAAW8KHHe/OZDvSXnh7D9r2P99e0vtIFsv19kbzJtilo/aagNylU/
	xiO741ImhO7kuN3YBcJndiGfJOgT
X-Google-Smtp-Source: APXvYqz6T6F7kHHqstSYytolnARDQlE1JZIQJFxEqoK7emhrcYyzCVLMsgAJKlaE5snSSDW/vGk2gw==
X-Received: by 2002:a1c:6a16:: with SMTP id f22mr21991141wmc.53.1582556302465; 
	Mon, 24 Feb 2020 06:58:22 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	p15sm18012872wma.40.2020.02.24.06.58.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 06:58:21 -0800 (PST)
Message-ID: <5639b75022c28419467aefb8de62c6ab24f9eae6.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Adrian Bunk <bunk@stusta.de>
Date: Mon, 24 Feb 2020 14:58:21 +0000
In-Reply-To: <20200224143155.GD27036@localhost>
References: <20200224125955.26771-1-git@andred.net>
	<20200224134022.GB27036@localhost>
	<6c0d874e887dc5a2355d236d77e8ec771ea729f9.camel@andred.net>
	<20200224143155.GD27036@localhost>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bitbake.conf: omit XZ threads and RAM from sstate signatures
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
X-List-Received-Date: Mon, 24 Feb 2020 14:58:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-02-24 at 16:31 +0200, Adrian Bunk wrote:
> On Mon, Feb 24, 2020 at 02:21:57PM +0000, André Draszik wrote:
> > ...
> > Once the artefact has been created, it doesn't matter anymore how it
> > was created, as long as the high-level options aren't being changed (like
> > an explicit compression level, checksum method, etc.)
> > ...
> 
> meta-poky/conf/distro/poky.conf:INHERIT += "reproducible_build"

I still maintain these are two different problems. I am not trying to fix
reproducible builds.

Cheers,
A.



