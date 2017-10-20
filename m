Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id C03477830E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 21:44:15 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id b85so12795193pfj.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 14:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=90rz+pf3KMtlLBExwnuzGGjAFCANhGYMsF23m5CNAZA=;
	b=CzTb+OHYKEQbCZcV4YjUM3MHlWmbJxcaVmCifcj8qvEiLuSxuBECt2agMSJY66WX/u
	7SgKDktUczK/CwMewNJ66A4LCq1TK/nETZgrqv8+lJ/rLYPcBHikOq//i974DGDG/i67
	ConLcbWzUE5jl3ZQ+Nu/FIMisH4RZwSbN0cSVH/RFTOrkV8cZn9KseLUCDMzIBqEVOb0
	UniC6vX7zu17/yGgg/b8O0Z5WTzVbrIHC0wFsQt5Ey6X+6reWysfpzqBJ95JDs9eBfVX
	xpg7qSuMtTHYuQjKjLHqganzSi13ruR0dHfyx4zpuOU8riwzQOxDwRmwPO93uWscwHcv
	NH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=90rz+pf3KMtlLBExwnuzGGjAFCANhGYMsF23m5CNAZA=;
	b=iLlN6KH2C7WJnelSbxSCiGUbyhNMJwgJZD+ZzsAILUB93w9LtQKXlZcVhpx51wVM72
	gqa75IhyUT1kjIUXl23U7lZkNXH0ipH8ueyXDzHxUCmdX1ZsUWrsifPfYu5PaI4ckbzw
	8unbXkCcd1ZW5T2QKVeBNtcHzi9+EMKJADTYuRSZWbvbmYFIpJoKSRMN0fDN9vJKJwKC
	Y5pFuT0IPFsSH7HwGNfLD/1sdUUkjml4VbQYVLNK8ygVVHKwpCUmWLJC7jwHaR/nOq8A
	e9Qsx4g8r8/hn/tVLa6gtqJdwomHSUMW/iM/Rx+taAFeCCpRug6s98xIda/OdRDYEyWj
	cK9Q==
X-Gm-Message-State: AMCzsaXVrmJaTR9B/AJ2SeRXTS1AVBduZAGJFL4UYfsTCWd+UF+EtQ0b
	8wqbZ4NVABYNvx3Q9GYGBjWlIQ==
X-Google-Smtp-Source: ABhQp+Q7AX6q/0HXy3PLc/LU/dvG+k6xLK5XelROSpw8L4rY9KDBPU8jzMN6zLoWlBcdOGM4EGLiEA==
X-Received: by 10.98.63.213 with SMTP id z82mr6059300pfj.10.1508535856675;
	Fri, 20 Oct 2017 14:44:16 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:3c1c:5a7c:8e6a:f70e?
	([2601:202:4001:9ea0:3c1c:5a7c:8e6a:f70e])
	by smtp.gmail.com with ESMTPSA id
	y206sm3050996pfb.155.2017.10.20.14.44.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Oct 2017 14:44:16 -0700 (PDT)
To: Konrad Scherer <Konrad.Scherer@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <c9dc44be-45fc-71b7-c488-d7b02e8beebf@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <b8ea045d-6f65-1e91-75f2-5b39619e899b@gmail.com>
Date: Fri, 20 Oct 2017 14:44:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <c9dc44be-45fc-71b7-c488-d7b02e8beebf@windriver.com>
Subject: Re: Wind River Continuous Integration project
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
X-List-Received-Date: Fri, 20 Oct 2017 21:44:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Konrad,



On 10/20/2017 11:18 AM, Konrad Scherer wrote:
>
> One of the common challenges of Yocto development is the setup and
> maintenance of a build cluster. If only there was a generic open
> source Yocto continuous integration project to make the setup and
> maintenance of build clusters easy...
>
> I have a working prototype and it's on GitHub.
>
> https://github.com/WindRiver-OpenSourceLabs/ci-scripts
>
> It is a set of scripts and docker images for building Yocto images
> using Jenkins and Docker. There are three main features that I think
> you will find interesting:
>
> 1) Multi-host builds using Docker Swarm. This provides an easy way to
> scale the build cluster from one to tens of machines. Docker Swarm
> makes this surprisingly simple.
>
> 2) Developer builds. This enables build testing of patches before they
> are committed to the main branches. It leverages the WR setup[1]
> program and a temporary layerindex to assemble a custom project that
> matches the developer's local project.
>
> 3) Toaster integration. A simple UI to dynamically expose the Toaster
> interface of all in progress builds.
>
> We are deploying this internally at Wind River and I hope that the
> oe-core community will be interested in collaborating on its development.

Thanks,  I will have to play with it. This may help stable branch
maintenance.

- Armin
>
> Please have a look and give it a try. All feedback welcome!
>
> [1]: https://github.com/Wind-River/wr-lx-setup
>


