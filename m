Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2D39C7E621
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 20:50:41 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t16so15660812wra.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 13:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=LXwmT36vXzcZBWvQRBbXol+GVQaQrntfrRKvQEz5cmA=;
	b=Rz06xVe8TDXAMHGzN91dTgXuHn96j9Mxmm+XIwhGde8ZNuhBJnjwJiAFN+aTnTDgYO
	Loo/OsJNlXCEAGAK9aKmuPrmKxlIVOxrytxWEo1UdcQsJo/jegBIg3LjIcLYCn24H8bq
	pRlGQd/VlRHFKljaoi4z9uWQ6mv8GQDB0GhJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LXwmT36vXzcZBWvQRBbXol+GVQaQrntfrRKvQEz5cmA=;
	b=i3k1ly8H5poFysN07AKs9ATscw5K4YHHNvRKhysGTS+Oeljc8sbc4JrPEOzKvPHIvr
	e9kPt7q1ADy317L33YlYnhG+WKs2Gwk6I/0k9xmgYB3ng+qsppnLR03hcugDiXsJSnKb
	H8HO/l9ZzPfrfja3QhA1HnWaIM5yCcJdRhBml3LV2aOyKKtIEP8lMZBQy3SmPR4zwYi7
	nWd7e4StRQf43xqRbukzdRzTpQhWXFuZA4gwB6sAo6/VKo0vUDNPDhPccO9lIxtJHeg6
	222VJe96NbaNzu2sH3Z2reZ9Oh7ly67k9+vTcUdRyNqshIdmciHOe+4QRgt6PscsJgM7
	wrmg==
X-Gm-Message-State: APjAAAV6/3wZmv2N6CScnlYEdQWGQqWTbHNPKSgIgDWOBKC9f0ENK22Z
	BW/e8/ZM4+C8ba2vt++Uma+U1w==
X-Google-Smtp-Source: APXvYqxVkKiG7OsAk/5dmpb4Jm3NI+kgH7U+zrisfv5jN+F4ovdcXhg2XS/UZhspjZWiDEGgYRtGhA==
X-Received: by 2002:a5d:404d:: with SMTP id w13mr3945089wrp.253.1565643041859; 
	Mon, 12 Aug 2019 13:50:41 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z1sm107105343wrp.51.2019.08.12.13.50.40
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 12 Aug 2019 13:50:40 -0700 (PDT)
Message-ID: <af18d5171f0ee3f44d8bb3396335d5ed2f029157.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Aug 2019 21:50:39 +0100
In-Reply-To: <CANNYZj9GsfTokbQG0LW4pBiY6tPQ1Dhv8oiED3VZoyNQuzaLJw@mail.gmail.com>
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
	<94b692a828bbf5230f56afbc401bf9d66660283b.camel@linuxfoundation.org>
	<CANNYZj-t2TSN4dMpfEgU_k_dDqHRLeqNSYWi-=uUK2BH09-tMA@mail.gmail.com>
	<CAMKF1squwmc8-sm+JMM6gU5oyHSKHv7ejRoOokTdb4Nd-SEk2A@mail.gmail.com>
	<CAMKF1soSXrDEHu+0v7v052EpCfXwu=+_ysWiwDcd=HY7oaBU8Q@mail.gmail.com>
	<CANNYZj81jgzZP0VNSbpA6RVh=JDc7748XszNEOJ9Dz+qf+8hmQ@mail.gmail.com>
	<CAMKF1sqRZGqR7pquRdqjfqs0=PAKB_5C2W6p_uwM9uTHZeD2GQ@mail.gmail.com>
	<CANNYZj9GsfTokbQG0LW4pBiY6tPQ1Dhv8oiED3VZoyNQuzaLJw@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Mon, 12 Aug 2019 20:50:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-08-12 at 21:50 +0200, Alexander Kanavin wrote:
> On Mon, 12 Aug 2019 at 21:01, Khem Raj <raj.khem@gmail.com> wrote:
> > Richard, another issue I saw was slowness in world builds when I
> > had this enabled I was on master-next for both core and bitbake. It
> > was spending a lot of time in ensuring the build is not needed so
> > much that the build took almost same time than the build with
> > out it where the build without it will build everything.

Were you using the patch in meta-yocto master-next or your own?

There is definitely a server connection problem with the hashserver
right now but if you used the setting in meta-yocto master-next you'd
probably only ever see timeouts which would be unbearably slow.

> 
> world builds seem to have regressed (preparation time wise) even
> without having hash equivalency. Just oe-core is bearable, but adding
> meta-oe layers makes it spent many minutes after initializing tasks
> but before any tasks actually begin.

Is that with master or current master-next?

I'm curious if master-next is better or worse...

To be honest I'm worrying more about correctness right now.

Cheers,

Richard


