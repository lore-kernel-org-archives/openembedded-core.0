Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBXnc-0002U4-8x
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 23:15:12 +0200
Received: by eaad12 with SMTP id d12so451569eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 14:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2dtGqryb7y6dWl1xEf/MKkRwPBL94dTuv4e52JKN/ZQ=;
	b=Esrf5Lgf8bChelg7M2f8Ti8Bx0WQ6IeEuJt9FSdxSxOkm7gTjLF1iUbuS+/gddybvA
	1OEPGkz9Uo/GLl5/D6GpBLI1HKsqh5W7hk0CywPMhaGMv3gAXYSwHIdeMHkp2arM3BqP
	anpjztxai6gHA1WNUB8Hxr5sBFJgqcFO2zknDzFgYzfrzwb3maotWyOMw5VJsC44yycg
	vQRCua8gm/B5P3PUGUkc56K4SYMITDtUL8Uu3zn7Ibv9rkQuDAUF2ewdWJvKcsTKeUnI
	wZYMPZDAQJUH7Zh+fWYnG8Ce1rAzQliKwP/fby0o1/yHwozFRgQgRJ7SicWCQZtdN9St
	0KOQ==
Received: by 10.14.173.131 with SMTP id v3mr22089248eel.15.1347397361035; Tue,
	11 Sep 2012 14:02:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 11 Sep 2012 14:02:10 -0700 (PDT)
In-Reply-To: <504F3E85.6030302@communistcode.co.uk>
References: <504F05A8.3000207@communistcode.co.uk>
	<504F36CA.9060007@windriver.com>
	<504F3E85.6030302@communistcode.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Sep 2012 14:02:10 -0700
Message-ID: <CAMKF1srgD9eXY+hxmzfXwT8L1WmFNQBHGgA9T5xNiiQb5GJZsg@mail.gmail.com>
To: ml@communistcode.co.uk
Cc: openembedded-core@lists.openembedded.org
Subject: Re: /usr/bin/python is needed by git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 21:15:12 -0000
Content-Type: text/plain; charset=UTF-8

> HI Mark,
>
> I sent a patch (see above) which added python as a dependency and that
> seemed to fix it. Whether or not this is the right fix I don't know...
> should git require the python binary to run? I really don't know much about
> it...


I wonder what needs python in git. Can you inspect ?

>
>
> --
>
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   http://www.embed.me.uk
>
> --
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


