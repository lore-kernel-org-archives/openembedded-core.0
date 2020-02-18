Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5D3F16113E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 18:21:17 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id m16so25114360wrx.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 10:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=7hAmtyAbshVBCkjzQGdvuOhiT0d2KR4XcUOiRu/wLps=;
	b=DPC43u8ITlPprSEYEv1O1FbAGU5wc7CoQXI30KwLAGPabYHXoiGNQTeQ7HjoSmN9vl
	A0SALcf3Ug540zNr8QHzJngCy3Gm7QtQp+pYq04sk/3Q5bklH+odpkxyKzF3MvSGgBHM
	Evg/a+kqb2q0xNsM+thPksrFNIS3L4wJLLMfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=7hAmtyAbshVBCkjzQGdvuOhiT0d2KR4XcUOiRu/wLps=;
	b=I/2wOFgvPP1vzzHQ9Zetm64ChX28/C/8e/5Vn+d1FabyUR6WTGaF3JoYFN55TevlST
	C/z+lgPZhuZ+nnR7g7C4M8IvhktpMiXT4T9drHCuIKoLl79bR0bHJ1HWVOxC/3LzsyBv
	qmKEvx3F0UipINj6aHJeHbGmruIofAhQ7ck0hUSH8cdi71hCviJRu6Mr6kiDam6xoKag
	hGYAIS/MoEkAeCZ3pbRRUvKgDJ6+iCItDXfiquUi5l1W8fALAkAWDvhXREo8yljtDPI2
	1Sl04gCJDaMV57x8zpBZeJYuzuqJovhu5cvaV2uV5KZw+CiohVJv8XQY3H7Zrw4IWn66
	yU0w==
X-Gm-Message-State: APjAAAXiyPRYQRLZLRXvJz4J1oL76An+tCLBAC2G2Gp372uIaDe2lCT2
	JMxnZXvUuOsRyNRHOE4VbGTvmw==
X-Google-Smtp-Source: APXvYqzUFmraa4lE2EpA/Y1uOEutGgHm2K6W7Bi9CFE0y22SMOw4Q19nRcjJC/s9CtiggnshJaSfww==
X-Received: by 2002:adf:e448:: with SMTP id t8mr30050598wrm.224.1582050078694; 
	Tue, 18 Feb 2020 10:21:18 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id e1sm7144597wrt.84.2020.02.18.10.21.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 10:21:17 -0800 (PST)
Message-ID: <bcd830c7d9c83f927058294d806540c912dfa78a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Yocto discussion list
	<yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Feb 2020 18:21:16 +0000
In-Reply-To: <CANNYZj8GBXxLdM-TQ6TukuLMGPu167ZqL9f-nNmG21rrkMNJ_Q@mail.gmail.com>
References: <0b8a01d5e675$d2363e30$76a2ba90$@gmail.com>
	<CANNYZj8GBXxLdM-TQ6TukuLMGPu167ZqL9f-nNmG21rrkMNJ_Q@mail.gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: Yocto Project Status WW07'20
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
X-List-Received-Date: Tue, 18 Feb 2020 18:21:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-18 at 17:44 +0100, Alexander Kanavin wrote:
> On Tue, 18 Feb 2020 at 17:10, <sjolley.yp.pm@gmail.com> wrote:
> > With the git infrastructure issue updated, we now have centos8
> > workers added to the autobuilder.
> > 
> 
> What are the current plans for centos 7? 

Project members are keen to see support for centos7 retained.

I think we need to sort our buildtools plan, then we have more options
as we can use that on Centos7.

Cheers,

Richard


