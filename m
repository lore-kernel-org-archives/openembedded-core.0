Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id E6BE17E6CD;
	Tue, 11 Jun 2019 20:57:18 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id u19so11100023ior.9;
	Tue, 11 Jun 2019 13:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=XWjASOP9p5voiaJepeaFW0w2VvMOG/CrZJJlxBwzZYg=;
	b=j3R8U5l7Luu3AYBtuwJXXU4yqDB+Qz3E/QVQLhU4kOWnUrjo8ANmFqMT6WYVk+p9p2
	9uU6S/V+NUMb2mzDD0xSIfMr7lWoHYKL2k4JHUXYG8VXWzfCDJeqAHOyyhecFLmzLt0y
	zNRusF9FCGlatRK2zdGXl2dwzvC23QdOIwp3HdphN2SY1m/zbl4FDHut6v3Ap9pRlInl
	K7IDNh/NVC0gqkOreMu/EkFdWEmxe8wWDBJLXSCU0C5NXtU7R15VUMnPvTfFbcj9SaeE
	GPMPZQA8Na0x0Ln3hk8Iwbjb32MNE37XYUTydTRLKTWg2c3k14jTidRxOhtyDjqYfk3w
	olSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=XWjASOP9p5voiaJepeaFW0w2VvMOG/CrZJJlxBwzZYg=;
	b=SHgvmaQ0KoEdACM55SlaLYrE2aD9hYv/IjBkZ7QSCXMTbvH0bfybljfx/foxqRDOXR
	wyD52VwysH6PZY7ptadc4BPsOoH1p5f5sG6kNos8G9E27HFUABOyXrMWoKhB74MZUrk7
	4639Tefolmr/ugPnv4D4nKn0EYTatEL6xryyad/7mwqwPiTiVledGd7CD9tWzOJMIUp3
	N3zgRGpObPOlPYI0FeXg4b0HU7zKTpP3xTVzA/4OzLjfZkVLttzFyDJxLbI6QGnjI+dx
	NSIF8CuFLIReCexm7I+xgw4pPdrLcziwP2B+5xtiSBr9YklbfvXlbnqASxGvdISpgkEh
	eQpA==
X-Gm-Message-State: APjAAAUI8wXOW5wp3eJWD1VjaXS+roe7o6bSVudwWqhdrVKZ33brMriQ
	sp6Ng/deqwjvSolMYnU58XzKAhi2
X-Google-Smtp-Source: APXvYqxNelEUcy+1mZ0+GSdrDsZ8jfnUzxQkTa6loqRW3BLzDGDRrRhpe33dbzQsMdNdKhwAXlf/1w==
X-Received: by 2002:a05:6602:96:: with SMTP id
	h22mr124719iob.149.1560286639508; 
	Tue, 11 Jun 2019 13:57:19 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	n21sm4926284ioh.30.2019.06.11.13.57.18
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jun 2019 13:57:18 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Philip Balister <philip@balister.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <A084970538D2234B96D99D06FA9D974FC37CEE23@ALA-MBD.corp.ad.wrs.com>
	<9d4f1478-434d-1671-7039-417f1d624ac0@balister.org>
Message-ID: <3e53b535-a287-df96-3399-593c32ac3e26@gmail.com>
Date: Tue, 11 Jun 2019 15:57:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9d4f1478-434d-1671-7039-417f1d624ac0@balister.org>
Subject: Re: [yocto] Yocto Project DevDay NA 2019 - Extend your Embedded Linux Conference Experience
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
X-List-Received-Date: Tue, 11 Jun 2019 20:57:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Both of the registration links take me to the ELC registration page.... 
is there a way to register outside of the ELC registration? We lost our 
confirmation numbers due to a mix up in the ordering process and can't 
change our registration anymore :(

On 6/10/19 7:21 AM, Philip Balister wrote:
> FYI
>
> -------- Forwarded Message --------
> Subject: [yocto] Yocto Project DevDay NA 2019 - Extend your Embedded
> Linux Conference Experience
> Date: Tue, 4 Jun 2019 19:39:08 +0000
> From: Volosincu, Andreea S <andreea.volosincu@windriver.com>
> To: Yocto list discussion <yocto@yoctoproject.org>
>
> Hello Everybody,
>
> The registration for the Yocto Project DevDay NA 2019 is now open. Join
> our knowledgeable and engaging instructors to learn about creating
> custom-build Linux distributions using the Yocto Project infrastructure
> and tools, across multiple architectures.
>
> Date: Tuesday, August 20, 2019
> Time: 9:00 am - 5:00 pm
> Location: Hilton San Diego Bayfront
>
> There are two ways to register - by adding it your ELC registration or
> on the separate registration page.
>
> Register now.
> <https://www.yoctoproject.org/yocto-project-dev-day-north-america-2019/>
>
> Best regards,
> Yocto Project Advocacy Team
>
>
>

