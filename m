Return-Path: <marek.vasut@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE17746AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 22:07:35 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id f14-v6so26473304wre.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 15:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mFO2707513a2arBkncz6UjnX/wEctyQatZC9id3rlpg=;
	b=WzIqJiWqG2KAxthpWdPDmzMzELldZTDABZlokU0WzZz+/wRnLBTDwWbU26o+fiV0S3
	+DTROvcJG7Zq0Xj/+0GaYGHO+o/UJDO58C6Mt5vpKvhPM/Yi+Wau63RuXE5OAGwAxSP1
	m3PXOLI/W7+IZnly7H7WO2MoqNbiuI5Nd9f0mwFC9V4UkzYulvaI1Eu7kdico9t4o0Kf
	xvqQCqetlxfTF1yLb2lxGaUharWa+knY7PozkESrZIkP4Mfp5i1G+smmdm0zuYJzEbja
	fKOK/Dq3mHgIKFzoY0U739aeQb64RbbCb3xjB6F+K5cs2R58J4Mu3QIK/s228jnxfu/S
	hiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mFO2707513a2arBkncz6UjnX/wEctyQatZC9id3rlpg=;
	b=R7fx8lc+CZljo0KrKuzwWTdSi2T8ryCTSno4qkx4Uh9/RqVZT13vPb5ca6H8NGN6qj
	8wXqEOpqq6bKxj2WTbmmJUUWbnnQAdm6WFXEmS7s7RIiYsoWseZAaDDDp1RJ473bTmOi
	TJbJHqg65lN0ynBbJ+6o15h55+yyUKeS4etv01mHxo4g2CUQpphrmlIpU3UKTHjV7yMf
	r+u6VGAnVWBLxwG++3IQ+AxO42XRba9qYjszNSJrG+IMVwpDqPfASGk0GsgJuY8iNC70
	GG2GeGq5KfinkfV8/s3qm08wK57FUkM7GMc7qYfx0+hzgJEtjLQzy1pGvroDlfsVQoa6
	hsUw==
X-Gm-Message-State: ALQs6tAcQuizcTJYPgprRevTRARZTtZgQvVcDQKopaq4OKDcgjPVyRCo
	KNVdyypCtpqIbVToAsPNzzQ=
X-Google-Smtp-Source: AIpwx4+rno67HuXEFjcTPnpBYpswXANewBrVL2adkR6D0NA/HgD4i9btZpHh2a9iielgLyY1/8oIiw==
X-Received: by 10.28.182.70 with SMTP id g67mr2846770wmf.88.1524262056246;
	Fri, 20 Apr 2018 15:07:36 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-107-50.net.upcbroadband.cz.
	[86.49.107.50]) by smtp.gmail.com with ESMTPSA id
	b10-v6sm2345452wrn.42.2018.04.20.15.07.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Apr 2018 15:07:35 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <CAJTo0LYPdtHXqbKR5nm_EVzQ07Pju476n3Tahxp_zf=STW=LRw@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <9b3314e3-2749-ce60-eede-a9cccec4e6ed@gmail.com>
Date: Sat, 21 Apr 2018 00:07:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYPdtHXqbKR5nm_EVzQ07Pju476n3Tahxp_zf=STW=LRw@mail.gmail.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: State of Sumo
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
X-List-Received-Date: Fri, 20 Apr 2018 22:07:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/20/2018 11:57 PM, Burton, Ross wrote:
> Hi,
> 
> We'll hopefully be firing the 2.5 RC build on Monday, so I did a build
> today to see where we stand. As is typical we got two new failures on
> the autobuilder...  My test build included the pseudo bump which
> caused an almost complete rebuild, which is a great way to shake out
> intermittent failures.
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12704
> Go appears to be using the target CFLAGS when using the host compiler,
> with predictable failures when the host is old and doesn't support new
> flags.
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12705
> u-boot build failure

Is there any chance you can tar-up the whole U-Boot build dir and make
it available, so it could be debugged ?

-- 
Best regards,
Marek Vasut

