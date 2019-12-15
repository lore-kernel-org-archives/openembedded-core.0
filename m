Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id C32287F7BC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:16:31 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b6so4419407wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 09:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=xw1rjnBnBhStyQ9pC6NKFt3nbMhdzdghazfnTLl4sIA=;
	b=NASTV4qxWfTJW4MWTeoZN5gjmJgDLicSGZQJXWMZP8CqltoTARRSk/aOLGjWzYOZ/H
	nCBORcfp8xUotfA/vYkeeFj9/p7v86Eo/K3GTiwPigqcxSL69TESDQSVYylUXg3kPmIC
	gWXhC6gg4Rr8GaJwRfJo9XhxCZkt3lFVGAOEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xw1rjnBnBhStyQ9pC6NKFt3nbMhdzdghazfnTLl4sIA=;
	b=mTuHlqqlbTkmY6JMWIjuc+BWNlbAHPIw6RpsJB7jPFC2M6BTS/bSZEAgoSEixqfe0F
	VAiiUIyQOj1JFvQwYh/9bHwqiQFLbsHD1XAmp6WCx8JqSGnG69rWBJCAJUVyo82PofIf
	0aGBKED7UCPNuL26EzCirrGyhk7yRfD3Ekuj783p2iinAMXevFEtc8AR4ntUDc+pMpD1
	89tUc8n7TZUzwPb+F0BSXMa0U/BVgLpENifVAQrpvjNYy1tsCNH4NWLrKGD309zNdMeH
	BCT6FE7WdeuLInCPr+Zl2/BKjZdO8bQz9bhsGRzHYownnNzHugG+a4PjSdP0zKTo5tYx
	2nlQ==
X-Gm-Message-State: APjAAAVzEB/3sybQuSPbp4Ypph9VQUqi1iEFCLvHfwo6Lb/AxqLc+rnh
	etgpQ0n+sgUTjry3WTsIH/cK+g==
X-Google-Smtp-Source: APXvYqyWrA1NAaARZ/OFQ5UigtjYJ6kGQdoRf5dqZCLR9dpilBUlH5jP1pYTZYp+RnUOc+1cwMlkpw==
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr17950639wrt.339.1576430192538; 
	Sun, 15 Dec 2019 09:16:32 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b10sm18497114wrt.90.2019.12.15.09.16.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 09:16:31 -0800 (PST)
Message-ID: <afbc6e41d1dd42e39b715bdc48a135f3a93ceb1c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Date: Sun, 15 Dec 2019 17:16:30 +0000
In-Reply-To: <CANNYZj8x+iQmMAhHkv4yNu8dWfv7VgoE4jW2D-8HnjVeOwYPgQ@mail.gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-20-alex.kanavin@gmail.com>
	<e4288403d08c96589c285bcb3fb5ccda219809a1.camel@linuxfoundation.org>
	<CANNYZj_Fj1KZoTDxsVzyJ_4Ya9KHOys9LsY1OQgm4UogC_xd-A@mail.gmail.com>
	<CADkTA4MyfWZfd-a9jqhTOHtFyM0RW2Mo5aDa48zy817=1g0WXQ@mail.gmail.com>
	<CANNYZj8x+iQmMAhHkv4yNu8dWfv7VgoE4jW2D-8HnjVeOwYPgQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/30] lttng-modules: update to 2.11.0
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
X-List-Received-Date: Sun, 15 Dec 2019 17:16:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-12-15 at 17:45 +0100, Alexander Kanavin wrote:
> On Sun, 15 Dec 2019 at 17:28, Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> > > Another problem is that devtool isn't able to upgrade the main
> > variant properly with this included. I'd rather split it it into a
> > different recipe, if someone confirms the need.
> > 
> > It is definitely needed.
> 
> Right, then I'll rework this patch to split the dev version into a
> separate recipe with a shared .inc.

Can we teach devtool to be able to handle this?

In the back of my mind I'd still like to get poky-bleeding back running
to try and get earlier warning of upstream breakage. 

This sets a precedent of disallowing devupstream in recipes which I
don't really like the idea of :/

Cheers,

Richard


