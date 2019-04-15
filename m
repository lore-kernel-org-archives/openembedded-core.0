Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2C87D95C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:15 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id z6so5913217wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Yct0cRsP9g22il5bXx2ZThdJ+VyzCrexT6zKdwF25vM=;
	b=KdCeLsl00YY8ytmEgdWazQAn5xuzcSe/xWjB9IxSNzo6qepqhXxCGbLVlFrfrt6ywC
	CaVQMODyiM5n+3ZgcnCbBd2Vt0sOS+xXXoW47qDKn7Vik5P2aTjzfoH+cleEBHdiudr8
	0fFSmg2CCp88O93XX9pg1RSNaihRHaxcSvfoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Yct0cRsP9g22il5bXx2ZThdJ+VyzCrexT6zKdwF25vM=;
	b=o/1ZUQHjpA2B1Sv/vXUr/T49ouNv03PjNCo1sy5hwXFeOe4depaGE/swh5ymDnVH2P
	9G1wc6jITviF+MWoBRnrTo/6SuE1xlSPJpLPdXR1VYokJRBELlyitbKt06WOst/jY45V
	ezAZPQGs3nPa0u/EqE48eUcBt/vH0oH9tFp6mtiLPUwklhyn4Mpi4y124RKIVV+ozAof
	d3yEDd9tFroj6L24gxEGd9hgYeh4JQBUSyu5nRtWsmKd4B4k2+clKGIOVT1ktXezTvoN
	Y8a5CCUvJ8zEvxQxWsuczeWWm7lJQIjiWZnyTixvNJrpK4HAP3ryEfBy70aJbsEx7Btq
	Oz8w==
X-Gm-Message-State: APjAAAV5ghvXXKoA0u3NnJBDQryki+JImi4ckFmC6/HK+6K8a+FVIRnX
	x/xMWbNSCfj1pfHYsrosdTY9Pyvyro8=
X-Google-Smtp-Source: APXvYqxrp7wRA6hh1ANvzlrfwshpzV4C9F3DwDDPQuILMYIfH6s3s8G03miahXfSib7EFARfzrCVvw==
X-Received: by 2002:a1c:1dc3:: with SMTP id d186mr16442757wmd.64.1555325716337;
	Mon, 15 Apr 2019 03:55:16 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n6sm25631796wmn.48.2019.04.15.03.55.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Apr 2019 03:55:15 -0700 (PDT)
Message-ID: <ee713999139dd8576b9529685c5654850eb12bed.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 11:55:14 +0100
In-Reply-To: <1555308778-9316-1-git-send-email-yi.zhao@windriver.com>
References: <1555308778-9316-1-git-send-email-yi.zhao@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] harfbuzz: update SRC_URI[md5sum] and SRC_URI[sha256sum]
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-15 at 14:12 +0800, Yi Zhao wrote:
> The previous md5sum and sha256sum are not correct.
> See: 
> https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.4.0.tar.bz2.sha256
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/recipes-graphics/harfbuzz/harfbuzz_2.4.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I wanted to understand why this was. I've looked into it and upstream
re-released the tarball.

I've updated the commit message with more details and queued it in
-next.

Cheers,

Richard


