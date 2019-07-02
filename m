Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0FB7EB21
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 11:50:47 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v14so17456261wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 04:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=wfXxUOHO0Sd7mLxwirqZ7v1vPEJv/84PGE1Ezq0GIrc=;
	b=EbETeJYXdxNl8n3uuX6pi2HNHmVG8bzLXjz65xGMtsm2y2wkK730ZzbBdpndpDKgdl
	Kuzbsrzh4oXrvzwkbxTDz2PAw0MJtT7HHEN7HNM1lgfpEH+fmgbeCjJ+n1R3wuWYEZPy
	JY2hOr1UXNDcEG5NaPNPjbXScFlmfAxg896cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=wfXxUOHO0Sd7mLxwirqZ7v1vPEJv/84PGE1Ezq0GIrc=;
	b=hkYfNkjA8iC1Es08uWpaoEgoJXWg8HyQ/VLyJE9WOFEpSTwnyJFHE4d6tLu/3IX3kn
	CDT93VfqHVOj8RUW8uuOpIATF6GPJ2LlQmHOZnoAwjQhG4NT5258qoSIuo4TGL2zJOpy
	CDAe5vlTmDKilhpXBTqmjQfvEOyUd3I8y09clvuq7apLPp32J1vmq6lrNnr2NbNR95x9
	4Kuldc4iv/HWOrngAcP6F4zReY6LN69YSN8/241c4mkhS9n+K2itsGbZ7l0frIhRih02
	MH9P9TrS5KFHILWgQZsITraKLZ24qnZbmiqCIl7APSqUumQwCJIEI/giRMgx9zW0SnKu
	zuUg==
X-Gm-Message-State: APjAAAVncefbnLV4HC9bJK/UOAxQvfG3QhP9fk3AW9Tp5LDtq8bPfdxj
	N/Xs6A1KPZB394JAC2rv3hS979SvVRE=
X-Google-Smtp-Source: APXvYqyBFH06CfF2kJE4yHtgJ+IYZcM0e2IUkoEl3S0zqPbT7r7KoYiSpie/ihnzJiNj4MHw7PwDWg==
X-Received: by 2002:a5d:430c:: with SMTP id h12mr23579590wrq.163.1562068248063;
	Tue, 02 Jul 2019 04:50:48 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id h11sm851527wro.73.2019.07.02.04.50.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 04:50:47 -0700 (PDT)
Message-ID: <e5646e3f0882cebdfbb57721d9547aa3ee0c593d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Jul 2019 12:50:46 +0100
In-Reply-To: <20190701185227.26040-1-open.source@oleksandr-kravchuk.com>
References: <20190701185227.26040-1-open.source@oleksandr-kravchuk.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] ifupdown: update to 0.8.22
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
X-List-Received-Date: Tue, 02 Jul 2019 11:50:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-07-01 at 20:52 +0200, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com
> >
> ---
>  ...t-rely-on-dpkg-architecture-to-set-a.patch |  8 ++--
>  ...efn-fix-inverted-checks-for-loopback.patch | 45 +++++++++------
> ----
>  ...{ifupdown_0.8.16.bb => ifupdown_0.8.22.bb} |  2 +-
>  3 files changed, 26 insertions(+), 29 deletions(-)
>  rename meta/recipes-core/ifupdown/{ifupdown_0.8.16.bb =>
> ifupdown_0.8.22.bb} (96%)

Fails on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/777

| main.c: In function 'expand_matches':
| main.c:700:40: error: 'FNM_EXTMATCH' undeclared (first use in this
function); did you mean 'FNM_NOMATCH'?
|   700 |     if(fnmatch(pattern, ifa->ifa_name, FNM_EXTMATCH))
|       |                                        ^~~~~~~~~~~~
|       |                                        FNM_NOMATCH

Cheers,

Richard


