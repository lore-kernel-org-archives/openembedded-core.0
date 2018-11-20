Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id E26F46C498
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 15:39:31 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id x19so3962156itl.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 07:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ibtZKAS27mYJR9/K06CAeCa1tobrijVJyqXLLd6iXvo=;
	b=DT3UxvwFpwK2e/cV01zTQreXDxYV+/SSZcVJWuVhtvX2gC+rALR86GnN9wzizf8xZf
	DoW43C3LzpMgRx7tjjiUHTDoqmyJKZF/0JftOCQrKZ6ctbTnHyZ+M5s1IEfs+gKc1KMY
	wMSiJ+26Q7VXnHtWz2xWKcUe67UmeaoCzz7VOEDkWt5eobVdp48P7Yu43ZVZ+GzV2urd
	+ET3As3pcj6P8GkLptbmigYgD5K+euU9UOhZSYD5k3ShFhLJNdJ0+gLoLamKB/uzt9vX
	iBqfSklhJu+S/wRSXNHY8k91Exdhdy8EXHp8dWbUiRueA6EuNELpHvHRZIsN5DYA05l5
	vR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ibtZKAS27mYJR9/K06CAeCa1tobrijVJyqXLLd6iXvo=;
	b=HG1h02pKJ6xklbTt+Vr+snXzBsOkntSZpVF4Fpco1VN8MwoARoZ5d+2mmCuGm8UdFS
	2PzQgMvd1xzc3Zz2QS8rgd605pvYrwRckGJK2rZwZ3dF+ZhIAoYyH8TW+gb+jO+g06k0
	Sm2QEO0TAmB4tdLLXMCL/mheCslE1Qftq25SynaIrpmND+v1amVNC/ACc5d04CnNMZOu
	+oHJL3S1EuGLcTzUYgU++qkD+ZVOXi/PBscGyu2knE1mJ9Tg+Gk5kfjTRM5mLpKZXCB+
	USUwd9Z7EUt+bMYwOkj+Y9Dpea4RMl4OVtcPJVMSTVX+myL9P6Dgl9vSNumDOMJFfM5l
	GKXg==
X-Gm-Message-State: AGRZ1gLqBv+7YnIM9nGa4H//jePqRrKS1w5hgVmhk9d7QuiYATpXI+N5
	TDSvj3E5nYnRugovQ2fyE+wBRJN/0Q7P/WQ4ZghQDg==
X-Google-Smtp-Source: AJdET5d2/kQm2Fu2tuLbes5j3dypJ0ADn9NNJtE3HRU7mNEkZVlFbrz3RQXx8mOmgpFIbJx5PE+2qvuQmwMwL9Tyss4=
X-Received: by 2002:a24:9142:: with SMTP id
	i63-v6mr2775749ite.130.1542728372862; 
	Tue, 20 Nov 2018 07:39:32 -0800 (PST)
MIME-Version: 1.0
References: <20181119100443.2882-1-abrodkin@synopsys.com>
	<1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
	<20181119190835.GO11247@bill-the-cat>
	<CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
	<153f5864c09a48adb8c976d8671f3c46@XBOX04.axis.com>
In-Reply-To: <153f5864c09a48adb8c976d8671f3c46@XBOX04.axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Nov 2018 15:39:20 +0000
Message-ID: <CAJTo0LY=m+Y8HXgypQ0Jk0N1=ke6eopXjEOeYWNENJ83CJO8ZQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>, alexey.brodkin@synopsys.com,
	OE-core <openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v3] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Tue, 20 Nov 2018 15:39:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Nov 2018 at 14:29, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Actually, why mess with an unnecessary meta package. Just use the
> empty ${PN} package for that. That works for the GStreamer packages
> as well these days (since commit 8e1009a3), even though they do it
> by depending on the meta packages for backwards compatibility.

Yes, please.

Having a u-boot-tools-meta will mean we're constantly explaining why
installing u-boot-tools either doesn't install anything, or produces
an error.

Ross

