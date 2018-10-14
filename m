Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E0CA5600BC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Oct 2018 12:13:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q5-v6so18053598wrw.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Oct 2018 05:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SwuOfn5hNq8q5ImGSSYz5WwnhxEl/FIHFpywHdStpu4=;
	b=II/oiO67GtrRkuz9hHRRWKLRsWWDaH1pXrvMdkAeQD1zRrrVUgmIw+mBVZPtmoJQMD
	0yfiwtX23rAAO9/OPB52YzJa7aN1JB/vnOH4Akl6GNT/H/flget5tUHFQfFO+VrDK/q8
	G8dxaP054d0bVYt8YkuCQbbDF11Dq88XishZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SwuOfn5hNq8q5ImGSSYz5WwnhxEl/FIHFpywHdStpu4=;
	b=fQE+ptrXek/XrDQNnSjbVGBdtyIcK7iPMbMqEhqDUdZplGVFvvCC8QwG16QNjAG7jm
	RNc6jJ81CzUEYQmegLJITVB4v65GLxOhYmrIe9Bd8FE+62Vhs9Wl8OBJTOD7VW99P6ip
	kNhNzzDbeUkaqyZ9VEM+0DgJFHU+xkLf2yS2jC0368Ousrcf8oyNlkJ4o21ZA+FANlNw
	ljyzWNRf3tlT4mw1k3JDReHjtUWyb2LlPF+nBoWZIcYhfJPIKsCW4ljxRoMv6rAMTRfn
	KYbrzwqzNqfIiS4JFvi70zg59DdFCDSxW6OmhLBw1UH1ASHpKICMOWwkTT6c148Btph4
	ocKw==
X-Gm-Message-State: ABuFfojlEujGBUyX2YGbjDCVseQZry3/pFrIEHxbAcB9aPtGDHxdstCT
	TIp0gqzFEZNbSVatRCR5Cyx9FA==
X-Google-Smtp-Source: ACcGV63T2PjVt2cohY17H5KKL+gQbSiopXWG4FvLV/OVcs3rSK8ZHynI6frT0zedxFFrR+82xmOHKw==
X-Received: by 2002:a5d:6a11:: with SMTP id
	m17-v6mr11509963wru.192.1539519212463; 
	Sun, 14 Oct 2018 05:13:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z185-v6sm10745242wmz.47.2018.10.14.05.13.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 14 Oct 2018 05:13:31 -0700 (PDT)
Message-ID: <222cc541963bb49d39f851eee3f8e6ca86808f9c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 14 Oct 2018 13:13:30 +0100
In-Reply-To: <CANNYZj9jJK9twMhWxZeEft1PuRMMY=BFr5+5QJj3Low+KRVd3g@mail.gmail.com>
References: <153917392546.324.13433409263803938064@git.openembedded.org>
	<20181010121845.987A72351DE@git.openembedded.org>
	<CA+chaQcmGLJaOi7xPZR90gekFSyrKRb89ZfRbf6-U43xOmh6qQ@mail.gmail.com>
	<CAJTo0LbRn6aPQg=dY2186S7vqJFrzK24y9V7hte7kZRGgXbhcg@mail.gmail.com>
	<CA+chaQfMOrF8NWwHww6zJDjL2KaJvn2uPa0Xbz2ipHLSG9ooTQ@mail.gmail.com>
	<f50185f96f49dd8e3e094549bcccdb9c100adbd0.camel@linuxfoundation.org>
	<CA+chaQcLQSmXABciMyrUvnVrBoqLqr+jYH+tXV8oOgCGhFrSFA@mail.gmail.com>
	<bda03d36ae78dfbe63c48b2747d223e5e1e1ec18.camel@linuxfoundation.org>
	<CANNYZj9jJK9twMhWxZeEft1PuRMMY=BFr5+5QJj3Low+KRVd3g@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 02/09: glib-2.0: add missing locale dependencies to PN-ptest
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
X-List-Received-Date: Sun, 14 Oct 2018 12:13:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-10-14 at 13:40 +0200, Alexander Kanavin wrote:
> This is probably related to this issue?
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12913

I don't think it is, no, other than both involving the remove
operator...

Cheers,

Richard


