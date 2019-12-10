Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 983BE7FC7A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 11:49:08 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id x1so18441918iop.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 03:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=31OHhbJ3NjXn1agIXLlnKNHuG49ipdi3yZ9wR3wMkF4=;
	b=rG0TX0D4GUXC4m8SlXeYoQGDOMBBve0U551bkjurMAwptYU8WAuK3BN+BMBQ+QGyfX
	3hxUcR61In9B32QIeTWsK8tStxjZhq40E4LwwDDk4PJevz5+ijUx5/xuPPYiobFSnZAP
	9Yq1bUNmwkQ6zesqBmb8WgXNsuIuFmjRI0laMx49qFlnUrPijvFM5a9RnZDM2xywcPIR
	6BVcl5S7mkDB+X+JJZPqu7MXdHVEPjMlujOFCrIPmD+qfmQvXAYzhBnESG364GS6XXDh
	UfD2DPirGOJw6ApjnPwMpBmpk5S8c+NnwGKRe9ykUv9AQhttS56y3ZO5fk5VQq/W+8+F
	GtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=31OHhbJ3NjXn1agIXLlnKNHuG49ipdi3yZ9wR3wMkF4=;
	b=s9syZNPN1MVsNUKPDgqAPl0842u/RFh3EvmNj7iZpnzCDJjKd4YYhu5lsHPgD+QCu5
	y75Ds7w6dB1wj/3V2mgKH3j4H38heU0qsZQ3PZNWSKHwmL40bWYB9W1rmTcsaqT31jlu
	1aKuPuDnfXrkUN/dcJ9tmeuVoxv5l71oVJD2gLhN66102hrvflJg/M0TGowfS8M/1z+A
	HZoijnPaZ8jHUXYjkQK7DYFCc6/Jmr6VPWCJ0AbAjflLUrUuqPPRBjMwp+qxCXGRQ8rN
	tGBt+nCTprLhZ3buha3clav7JUU79HEy9wWy1FaJ2J7fw/NhyyCdtnfwpxriQSCWMUnT
	SveA==
X-Gm-Message-State: APjAAAVhDOuiv4Zo3VJcui251+8GyPZtmRkUQG2I+95+HJcUqiWL5msQ
	0wppEI0+WfkEFZzowS/SbwAkrGFunMJPuTvoUsY=
X-Google-Smtp-Source: APXvYqzwSnR/S3nZwzQhlMqgODfVklC4pgKwCplzIAopL8cAgneUXBcpp7hD3u2Rv4/GBHgUlQ83SepP41EDueS3sCs=
X-Received: by 2002:a05:6602:2806:: with SMTP id
	d6mr25100532ioe.299.1575978549604; 
	Tue, 10 Dec 2019 03:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20191210093535.26762-1-kai.kang@windriver.com>
In-Reply-To: <20191210093535.26762-1-kai.kang@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 10 Dec 2019 12:48:58 +0100
Message-ID: <CALbNGRSAynsCJ-dzhg4RpKYEBwreG3P8wciz+pd2cO+P2YarDQ@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] base.bbclass: extend PACKAGECONFIG for conflict package configs
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
X-List-Received-Date: Tue, 10 Dec 2019 11:49:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 10, 2019 at 10:36 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> There are mutually exclusive PACKAGECONFIGs in recipes. Though it
> declares that package configs are exclusive, it can't prevent users to
> set them at same time. Extend PACKAGECONFIG to support specifying
> conflicted package configs.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
Did not test but I like it. Think there are more places exclusion can
be useful e.g meta-qt5/qtbase

Andreas

