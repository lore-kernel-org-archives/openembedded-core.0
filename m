Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id CC7D17CBDF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 12:29:52 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a62so4210300wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 04:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=G4zxFHM4McxbJ0EPa8nQGMcxFUUpJ8RkDKRP4/APyHQ=;
	b=V0BgqWY2dkd7m7Vo2En57cVRzY8TCk/AgAdbjDQJd0k9TeT+QQOpORw04oAP1Uzz6q
	BHOucbVkwAgNSHWu5H16yeWv/BiutMkfp1VRQKwnYx18ut8zVXiYq02h1KOIka/ROwqP
	SN5pyPCooYgK1huotYe0TDzOTH66uIe1cbxvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=G4zxFHM4McxbJ0EPa8nQGMcxFUUpJ8RkDKRP4/APyHQ=;
	b=R0iomfi8OP2IyuYzqVLhxE8P0M7k1iTEVHBCPeScMKByptm1Frw96e1GSjEf1a5XKo
	ljo43lAqR0nBXj7z7pKQAE54VOjHrKZuvlco5fxCc2AMI2lSPvmXhNehGUTRcvHxDYiB
	530gZQkETj4XAN2ApSpJLx+nMLZrazkbo/BwEupJLfxrUx62KdTHRQ7sVQ1me88cTn3/
	ZQ4dM6OMlv8qVzUN9DgY5+I55o5X7Mw0DAJNTJh49CPX6+tJS7JbK1H3B5/qr6EoGXBE
	Kh6CN1qjBoE6V8crJTiBwBdazLR73R9w6t2fcnMoXS1lhaabXhj7a6Jjd/DsLLDpT5gG
	7tMw==
X-Gm-Message-State: AHQUAubmDpOq7vcpSi8bu8nRBIUM9680vXryEOWTfOK7kKgA5QBC8iZc
	Hx9txjYLA4TeEitEPyjHs8UlAw==
X-Google-Smtp-Source: AHgI3IYIDs6E6aamAKazMHZpABKcDc4tC2VmVx6JQGO7tggtkUlqDqDE+q/c5cDpXzBTXrAv1JUUVg==
X-Received: by 2002:a1c:2097:: with SMTP id g145mr5141723wmg.81.1550924993508; 
	Sat, 23 Feb 2019 04:29:53 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x12sm7273496wrs.84.2019.02.23.04.29.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 23 Feb 2019 04:29:52 -0800 (PST)
Message-ID: <6378eef56d799e4b91da708cc8fff92c0e4bc13e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 23 Feb 2019 12:29:51 +0000
In-Reply-To: <20190220201026.70803-3-alex.kanavin@gmail.com>
References: <20190220201026.70803-1-alex.kanavin@gmail.com>
	<20190220201026.70803-3-alex.kanavin@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] gdk-pixbuf: convert from autotools to meson
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
X-List-Received-Date: Sat, 23 Feb 2019 12:29:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-02-20 at 21:10 +0100, Alexander Kanavin wrote:
> Drop autotools-specific patches.
> 
> Rework jku's thumbnailer patch into meson configuration.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

We've seen it before but its happened again:

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/326

I went into the failed build directory and ran "bitbake core-image-sato 
-c testsdkext" and it succeeded so I'm not sure sure how we're going to
debug this one...

Cheers,

Richard


