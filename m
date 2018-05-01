Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8D6C262133
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 01:56:14 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id k17-v6so9121361oih.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 18:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=ZoBMdXcDlzVjOVwS7gRw5fseqfG3egcvVQm+5vRgbVA=;
	b=BNjOYhX6RWh2DOOVWJHBicEQ1aatTztfv6RC/t1G4ZjZzpsSphP6IyXgOWz5aDStG5
	cpmusdREuGuuB7oOYXQy4IC3jsoJj0MFbzSnsVFa6hZrjNOS2I9i8scvOTyQf8piKyLS
	MKxtcGZq/kIehUd9QrZFCz/XZqfboCm5Avl/yJ/uqs5uVatLyjCisTZGI+JioHZNwied
	nwsSAPnUeF4hO2GYI5FnNpcQfr4p2McG9jIKVibe7GJ/JBVkGHJWE9LlkfVBK37MXPXC
	zX161TydVKt65eKlwlyyX2AzKG5JvI/lX47wnI9BHRevkqE8CfGsBDWxDUpLtc/KgSDl
	TpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=ZoBMdXcDlzVjOVwS7gRw5fseqfG3egcvVQm+5vRgbVA=;
	b=WHVaolLv8dwNKIYqNfA8xLjONqVmpjIbLWtvmMvaLwjM9xzLVJUyofifkIHNW4A9JB
	5DBK8FP4NFuPhfsSVynQMd3ecB50oIUiN+2ZtppccesLVwvB29piaGwGcmhcnbqA0EV0
	5XCTTEzylFIgmtXVUuEo/ga9+s6ub3yzCBvg/7p6Kzv6azHHly5embWFvy6V/FWFX0AP
	VsBRct4FDnl8BDoMFZMfoolkp48lOwis1H+7QbC2scPUdD5uo07suwLPAz1vbEnsN3OS
	zt+dIf/hgASTI3NSuOWAGq2/iYDzIa3ptNMgNOkM8Ipz3deUP3rljW1sMeN3CjWJ0bBF
	Lb7g==
X-Gm-Message-State: ALQs6tCUcotUd84rsk8/bJt81BD1nZROo6qThimTbDnJsatqe7AB8zKY
	NQPPxXCNX6MSpEjJ60TlCeGdD5kj
X-Google-Smtp-Source: AB8JxZolYQY41hMc0JBuH4MNnsTYXUhXlNk8C6zSyPkhYuCGoGjEY5sbobHaSq5/kxQTwvCfbeTwgg==
X-Received: by 2002:aca:6986:: with SMTP id
	e128-v6mr8301515oic.181.1525139775022; 
	Mon, 30 Apr 2018 18:56:15 -0700 (PDT)
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com.
	[74.125.82.170]) by smtp.gmail.com with ESMTPSA id
	n50-v6sm5675500otb.14.2018.04.30.18.56.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Apr 2018 18:56:13 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f170.google.com with SMTP id g7-v6so11681096otj.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 18:56:12 -0700 (PDT)
X-Received: by 2002:a9d:2963:: with SMTP id
	d90-v6mr9277406otb.168.1525139772443; 
	Mon, 30 Apr 2018 18:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <d89b39f665a14c63b0821c1ad600da72@SOC-EX01V.e01.socionext.com>
	<8cc34667-5bb3-9642-40e2-d56b28f56646@prevas.dk>
	<32a348ed6176434db8178d29d7e1f183@SOC-EX01V.e01.socionext.com>
	<5ca366ed-3108-4a56-caaf-06b4f136d259@denx.de>
	<627e0fde-f97f-5c49-bc1a-325e7baa9072@linux.intel.com>
	<0802e876-fda0-d8d2-9dca-18ba8cbe073e@denx.de>
	<f6d2cd6a-4206-3a2c-1854-4ff12bd35df7@linux.intel.com>
	<CAP9ODKqTV4g2ze+zw9KPqkiQ_LUQ7NTfWUzN-xvKvwE64Qkisg@mail.gmail.com>
	<20180430202522.GK31362@bill-the-cat.ec.rr.com>
	<CAP9ODKrSENfuyMmvuyFMaAXfsr-Dd8dzM1X1pRp5m_5ys_3x2Q@mail.gmail.com>
	<20180501002531.GL31362@bill-the-cat.ec.rr.com>
In-Reply-To: <20180501002531.GL31362@bill-the-cat.ec.rr.com>
Date: Tue, 01 May 2018 01:56:00 +0000
X-Gmail-Original-Message-ID: <CAP9ODKom9X+0+3Oe2WW_HViQ4oAdae+b6x5s96Dj6U9KbixRzA@mail.gmail.com>
Message-ID: <CAP9ODKom9X+0+3Oe2WW_HViQ4oAdae+b6x5s96Dj6U9KbixRzA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Marek Vasut <marex@denx.de>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Tue, 01 May 2018 01:56:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 30, 2018 at 9:25 PM Tom Rini <trini@konsulko.com> wrote:

> On Mon, Apr 30, 2018 at 08:29:56PM +0000, Otavio Salvador wrote:
> > On Mon, Apr 30, 2018 at 5:25 PM Tom Rini <trini@konsulko.com> wrote:
> > We use our dtc-native. As we do for all other recipes (but few
exceptions)

> Then you should also be doing swig-native, if I recall the other parts
> of this thread (or the other one?) correctly.

Yes, we should ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

