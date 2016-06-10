Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 963466E668
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 13:49:37 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id d127so98061412vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 06:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=yS/j7rONi+iYgH1c7GEs3YQNqbnSpt7Qde9wFGprN84=;
	b=pfrHIna6SJw5ybwYcgClUcSThQlapNRmZgvSsxNXLeA5dWW0vzNo7e8wsp71YgieUT
	PMwMBo1HtKgo82ApGSA5Hthk+/xRzXBNLV2zm2VNSjHJ8XFvgg2kbF8+s9D7kDhKUuLN
	KdT6t2IzUMbzV79C/3PQG3ZiVY2JUupHFT68XZ9lgIW5t8eYxHVXhRakomtR/bE6Um2V
	QlCKCKG2PB7J4ygwLynx825h1hlLJo4yohWOSoB2cQxDDtMIVWLgEKOuSiMqCPq+AyZ1
	sP/qVzK4tIU6LJ2i95KgVNtPX+5GoJC3vG9vDbR9olqkxtsOjlOrWe8uKZZ/xySbNb5o
	zG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=yS/j7rONi+iYgH1c7GEs3YQNqbnSpt7Qde9wFGprN84=;
	b=I2NTXYtJgGKRjhdgoo5TLqP6+2nBuUPBYQVQPv/tBkp4CEyHwtN1FuFjMlEjcpyQ/s
	1c/CrMjCAHeVao8na+BFWRrnKo8jv6a4hKnGW2GuIOPx+H8uvpcGOKUYVKP+mT1ILWLI
	+K7xbJh6lCRS2i44EGgXtd7LGjv870bDkFmEStY/VJOO1IgyqjTvIT+yuq64PcGpe9ZJ
	riY5k+KwLeJfwoaEdq32b73bq2Q9JYOmxzKOMz/LLQCTxOt+1Ko4mdI7Yuz1inAHfaMl
	v44Tla0HFl+1xrfoRyTQ0y4TEAJL8Xi837kHyDln5dMlIMg2xiv2zAp7xLGSLUm3/O8G
	reWw==
X-Gm-Message-State: ALyK8tKbgiVqyTCIlICGFvaPp3ZkCbxgjJvWcXURfnnmm+HJ5jjRKu71SYVC3q+Q70ASyA==
X-Received: by 10.159.35.105 with SMTP id 96mr874622uae.31.1465566578481;
	Fri, 10 Jun 2016 06:49:38 -0700 (PDT)
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com.
	[209.85.213.50]) by smtp.gmail.com with ESMTPSA id
	k137sm532701vka.12.2016.06.10.06.49.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jun 2016 06:49:37 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f50.google.com with SMTP id d127so98060196vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 06:49:36 -0700 (PDT)
X-Received: by 10.31.8.77 with SMTP id 74mr847929vki.150.1465566576669; Fri,
	10 Jun 2016 06:49:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.189.21 with HTTP; Fri, 10 Jun 2016 06:49:35 -0700 (PDT)
In-Reply-To: <1465500426-27684-3-git-send-email-tom.hochstein@nxp.com>
References: <1465500426-27684-1-git-send-email-tom.hochstein@nxp.com>
	<1465500426-27684-3-git-send-email-tom.hochstein@nxp.com>
Date: Fri, 10 Jun 2016 10:49:35 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrgRgCYm=WkyL3cExs_-a4W+weJTa-RC5mypyMmbo+cNg@mail.gmail.com>
Message-ID: <CAP9ODKrgRgCYm=WkyL3cExs_-a4W+weJTa-RC5mypyMmbo+cNg@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] weston-init: Don't change XDG_RUNTIME_DIR if it already exists
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
X-List-Received-Date: Fri, 10 Jun 2016 13:49:39 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 9, 2016 at 4:27 PM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> In the case that XDG_RUNTIME_DIR already exists, the mkdir --parents
> at least does nothing, but the chmod could overwrite the desired
> file mode settings.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

