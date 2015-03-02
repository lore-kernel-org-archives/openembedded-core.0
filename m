Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 106C572130
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 09:54:00 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id hy10so1022620vcb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2015 01:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=WkDM22l0fa0X+A6gMmaPkb1ojU9ukQdQZbmtemyEDF0=;
	b=Hio9heyqb9WGJUFKWtcfOIiapbSRVAA4Oeib38p5KHmcPB0Btm+Xj8k9HhYDWPMKE4
	Dv4XGGaJy/W/15DcidMl69cFzX0Nujl6wE72JQhEWSKYO3rT8UhTsURyPU0oOboEoJZ6
	+EhDY7dGSiP6aERYMjlsEsFJZRpIxapvbISPlQX4uD5RoffrHhqF6vlJu626AjZovkrD
	cEcwWNWLDLjYZG8GFzCaD5k/cPwsZDYwA5ReUSMWVAPeNnyRN7rFOMNqCtokxJ3qytYa
	01r9tyqYHwgxYZj/823adykDe5mNwzE9r+l5R4oJqpszbfB3vCKUSZH+4iwwCU1GborO
	gE9A==
X-Gm-Message-State: ALoCoQmVw27o8aDm7gvFjrvPFhxwGafxfp9Ae8Sch9OwV1+zLuQbIU5zJSdIlqPQzPwXKgLqB7FL
MIME-Version: 1.0
X-Received: by 10.52.135.241 with SMTP id pv17mr23905505vdb.25.1425290041728; 
	Mon, 02 Mar 2015 01:54:01 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.52.38.225 with HTTP; Mon, 2 Mar 2015 01:54:01 -0800 (PST)
In-Reply-To: <20150301213452.GI4094@piout.net>
References: <CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
	<CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
	<B0C68756-9FE4-459F-9DFE-753106847A87@dominion.thruhere.net>
	<CAOMwXhMDOma1N73M5n64G2T-FaH+Zevo2r8baenFsX9EZiFa5Q@mail.gmail.com>
	<CAJTo0LYuTsUkt8E0oTn0CGG+JFQhM67eCAHBRiX8W_1Fw67ErQ@mail.gmail.com>
	<CAOMwXhNqH76QKt9hsqpeOeRTBjKUix4e0GCy8PZVkrjCdm+OAA@mail.gmail.com>
	<20140321143939.GI3726@jama>
	<CAOMwXhO3q3ZWmJ3mc==FV=S3t9fa7of9+449KGjQt4v=FQ=RRA@mail.gmail.com>
	<CAOMwXhOtSitBvR=v0AVJbcK8HBsfxsU-4wrEkBd=tjX-UhEX1g@mail.gmail.com>
	<CAOMwXhMFK_cjS0i07rXUnoCy+2Mq-E7zzaZeHKk-vy3k6DMxEA@mail.gmail.com>
	<20150301213452.GI4094@piout.net>
Date: Mon, 2 Mar 2015 09:54:01 +0000
X-Google-Sender-Auth: ZWTZbZ-OBY9cQnIsM8vzvklOLMk
Message-ID: <CAOMwXhNY=MkB0+M7WHaSXud3mu697KU9xatzoXeCCr8Gw9O6aw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Mon, 02 Mar 2015 09:54:01 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 1, 2015 at 9:34 PM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> On 01/03/2015 at 13:48:11 +0000, Laszlo Papp wrote :
>> I finally decided to get this patch another go, even though still no
>> busybox daemon has LSB headers, but I would need to ask for some prime
>> example of LSB headers that I can start off with. Could anyone please
>> provide me a good example for that from the Yocto project? Thanks.
>>
>
> What about:
>
> ### BEGIN INIT INFO
> # Provides:          ntpd
> # Required-Start:    $network
> # Required-Stop:     $network
> # Default-Start:     2 3 4 5
> # Default-Stop:      0 1 6
> # Short-Description: NTP daemon
> # Description:       Network Time Protocol (NTP) is a networking
> #                    protocol for clock synchronization
> ### END INIT INFO
>
> See
> http://www.linuxbase.org/betaspecs/lsb/LSB-Core-generic/LSB-Core-generic/initscrcomconv.html

I forgot to mention that Martin Jansa gave me a good example
yesterday. But thanks anyway. It is helpful.

>
>
> --
> Alexandre Belloni, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

