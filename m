Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id D1D44606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:53:28 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 19so13250584ykq.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 05:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=S+C0TNOv9Wi6+u9VCFVKDtY+uBg0aF971SQCfpYE/gU=;
	b=bu+9IwymIcTLotcZ36pg+vwL85jzQzkU8CP0leXJlMI5TdZhtBP5UncBe+8GFxP7No
	RiX5qJFd/+q4Qah0F53u11LXnR2wnim5xDoqbEHp1j8PHC6oIkHLKAx65MpuytDRl6Oi
	6ClA1Slao9Y8c7DbDdAxfFyXLz7Hibv4pr+XBh+IyVjaH/4kcuBi+dEl/oqP9oEJq7uJ
	+sGw1neS9+VsHevRNCLDxiSqpjoZlXhxE4lmV/e9kKvy94KHLGgHwKqlokHlBoayTNPZ
	m3NTwx8CuyI+xTrx36PceEDovas1OHBmNqerbIOhMmFMS1TgHhrBzKisY/5uYCmJK5pe
	sX7g==
MIME-Version: 1.0
X-Received: by 10.170.209.85 with SMTP id a82mr17638147ykf.99.1424094809408;
	Mon, 16 Feb 2015 05:53:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Mon, 16 Feb 2015 05:53:29 -0800 (PST)
In-Reply-To: <20150214204810.GA4776@xiaoyu.lan>
References: <20150214204810.GA4776@xiaoyu.lan>
Date: Mon, 16 Feb 2015 11:53:29 -0200
X-Google-Sender-Auth: 20EK08SWavlsOCIkJ6Rs_eGp-9c
Message-ID: <CAP9ODKosZ3ZhV1NVOV29x3TtnxXqwqZX8g3vM63V_EfLG+Fgig@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Holger Hans Peter Freyther <holger@moiji-mobile.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: udhcpc 50default/simple.script and standard metric
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
X-List-Received-Date: Mon, 16 Feb 2015 13:53:29 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 14, 2015 at 6:48 PM, Holger Hans Peter Freyther
<holger@moiji-mobile.com> wrote:
> I want to use the multiple defaults route feature of the
> kernel but I want to install some routes that are more
> important than the link managed with dhcp. The only way
> I can think of is to change the "metric=0" to a "metric=10"
> in the mentioned file. For normal applications nothing has
> changed but it allows me to add another default route that
> is listed before the other default.
>
> Is there any objection to change the default metric to 10?

I don't see a problem as it gives more flexibility after all.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

