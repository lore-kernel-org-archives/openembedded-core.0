Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id B8ACC7FE46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 11:23:37 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id y17so15568665wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 03:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=O98BbccVz+Ch39pfIXUn9aUnO66b28MIiZtS+LXjd/A=;
	b=PPrHzrrLJqmiHrngvK7sg9dvhYafXq6Es7sh+FadkpqwoWXbC3IKgxVTsV4q3pqKUc
	nhq54WYc2ZvNiPNEV1hcrk243za12wOPu8aWTYP62AMzTdE0oyqe8LfZGkxAWy2PZe6C
	KcK4tVNYvxv1iep9gOMSqPhPolJ7SzAoooN1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=O98BbccVz+Ch39pfIXUn9aUnO66b28MIiZtS+LXjd/A=;
	b=PavULsawuM/v+LOgnJy8HszdayX7wgRMoY2rUN5Of+C8rbE3nwr+yVYhzAmXS66Eg1
	oJiSemqJFDSSx1l0TPudkpxbuhWGlQvs8fyDYYtPP+6gGISSLMix3+HUtVsub9b8O50K
	Fmxd+NFT4QcdXzabCOzLx3bzrOwejByv4xGvn9jwK2bOQc+PFzDFJj0AtmhrB3uIh26B
	sgPYDdbjzdAw8qf6wGKvBeNRiy6kSqiiSKC5ZOXIHkU/AatwCLSleb2zPEXQxPBExhCo
	sxEgzFqxHlg7QfDNqrGcwqXOX/7PqzFouhSu7vmnuciraHoxIuglEBNX056XNF8/em8X
	TIyg==
X-Gm-Message-State: APjAAAWI/ZAPk2AHCF8hTgY0JAEUxoqDfy93Rxf8/+aXuu9v947qHB6O
	IMf3qUwGb2YHppb222torCRc2g==
X-Google-Smtp-Source: APXvYqxx3zdoZAJlDnQpKUPO3FLd3d3B6IC/pxpir05Sa5I9RPC3qU39orOhmHoKcXXsJOUZ5sDpIw==
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr27769058wrs.222.1580210618462;
	Tue, 28 Jan 2020 03:23:38 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id c9sm2562333wmc.47.2020.01.28.03.23.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 03:23:37 -0800 (PST)
Message-ID: <96b94d711272d36d7907dd7693afc3ccdc4c0fcf.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JH <jupiter.hce@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2020 11:23:36 +0000
In-Reply-To: <CAA=hcWQNSmRKEeu=YxGAMMSNFAmKff6t4AOdcX2MUtcVSz9BKw@mail.gmail.com>
References: <CAA=hcWS5w_QTmUMZBBMpj-H+iyBcqc=6h3RoZwdpVYU7gpyaMw@mail.gmail.com>
	<CAA=hcWQNSmRKEeu=YxGAMMSNFAmKff6t4AOdcX2MUtcVSz9BKw@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: Could oe-core be infected by virus?
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
X-List-Received-Date: Tue, 28 Jan 2020 11:23:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-01-28 at 21:56 +1100, JH wrote:
> I don't have Bluetooth, I don't need RPC, etc., yet the kernel
> initialized all those processes I have never defined and I don't
> need.
> Where those things defined to let the kernel to initialize them in
> boot process?
> 
> It is a small resource device, how can I get rid of those things I
> don't need? As I said, in older version of image, I have never seen
> those things, where are coming from?
> 
> Thank you.

Turn then off in your kernel configuration if you don't want/need them.

Cheers,

Richard


