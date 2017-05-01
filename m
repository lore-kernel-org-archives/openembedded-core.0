Return-Path: <andrei@gherzan.ro>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2F42C71DEF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 12:03:12 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id a103so113214078ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 May 2017 05:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eBr7lfbki1g4Zbj9k+uK1mmwp+Z7jiNDWen2TXnuOU8=;
	b=mVCx8pc4GQOQ0xnKTrH2KSyOMj/F2mOusuHUIEXVeYx8hayWRA/BrBooq1Ekna2qVP
	E4wRXWgS2U2/h7436cyp2n/e6wia9xEpKHerGTa5W0vvXpQFYAEHCiMF2B+etKhKpstp
	1g+I3t7C5zio4cEAg9xt92rfcN+VSvPHtHabwYJUIDzYJDgb4bDDLOS65Qzr1pJ2UR3B
	zXZaSZaTOy1ZNC8KHP+K1JQcCBnbZEPgnvRmA7gwa6hQwtnFydgY6JtrJDv5fLbjVAx6
	j7xPboOX5EUnte7/auyVsGIpv18kFl2Kpimjs5VCaCFW3+/R2lOu+pmwkE9KRHuUhIFw
	bchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eBr7lfbki1g4Zbj9k+uK1mmwp+Z7jiNDWen2TXnuOU8=;
	b=SmskarZMi1eLrkfaHWzm+1J9+HLYDCwbKVAQT7TWhgMplkFLoD/v2UyYpF54wRtfz2
	uHsaGaRX50zBjZpoABCqpjMvKc6L9L7CGXM0ZklRpnGKw6hYIof0Cs6gynHt7DrJa0vo
	Ryn+AXQ+beHwLjJqSDAgXbbMtqHvYLGWVRvxoSOA2iyIRwWQdJSORRJM7TVs8/aOBIx3
	OddW4vDs61UB3L3D7x4klssjB82yk0CAx2vfkaaoSa/JpmpXjkJwmiRJJcYTd1NJnRv7
	HuikRCc2gJonqckQmkAmCKZoIlkDUCrEYyhlj0XiU9abVMaSWcu+SdEGUEQFWBCGOQXv
	vYZw==
X-Gm-Message-State: AN3rC/6OEkY8cW2UZWTqBeqNpWutMzubpNhfQvVuIwXcMJ5I0eSgjA53
	T9kJLXRk+PzrNvuvj9a+FgPw5bRLWA==
X-Received: by 10.107.167.19 with SMTP id q19mr6787063ioe.110.1493640194191;
	Mon, 01 May 2017 05:03:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.27.207 with HTTP; Mon, 1 May 2017 05:02:33 -0700 (PDT)
X-Originating-IP: [31.52.113.35]
In-Reply-To: <CA+chaQfvm5xdNEhF=v05VnUPiLZFea2pZkZakgmAF_mCF4v07w@mail.gmail.com>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
	<CAK18fxHF1dPOAXSwFwtS0s_vaMo5--t4QS2dq8pBwbDPdFDmbw@mail.gmail.com>
	<CAC+thW0rVtEFKKoJChwLjK-2=aMmZuW5vRufJ9iaFXJt6JiEAg@mail.gmail.com>
	<1493635218.23535.34.camel@linuxfoundation.org>
	<CAP71Wjwwp9ca=4_V-U1NpnX+=5x1V82DS18FkxPAaL9qYknVow@mail.gmail.com>
	<1493638943.23535.36.camel@linuxfoundation.org>
	<2b56f841-8c90-64b7-b6d3-cf0c157451be@balister.org>
	<CA+chaQfvm5xdNEhF=v05VnUPiLZFea2pZkZakgmAF_mCF4v07w@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 1 May 2017 13:02:33 +0100
Message-ID: <CAK18fxHA0p6x7pwU_WAnpv7bvOCX6XXFP-QWLkAJhxQfVuKczQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-members@lists.openembedded.org, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [oe] OpenEmbedded 2017 General Meeting
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
X-List-Received-Date: Mon, 01 May 2017 12:03:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 1, 2017 at 12:59 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I had to change the password on the login, but then it worked for me.
>
> I've added Andrea and Andrei to the list.

Thanks Martin.

--
Andrei Gherzan

