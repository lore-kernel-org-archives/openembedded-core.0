Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sy6PT-0003Zl-HU
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 21:22:43 +0200
Received: by eaad12 with SMTP id d12so639876eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=2VkGPMiQMzJ1peKiibF1oZ5ERWWgn89kUZaAUfGPNCU=;
	b=jg56AkdqFW1oDZAP4C/9mTs+As+N+25onTP0qX/l4r8m5PjOyge1pRdVReqtNLFGIP
	mUgAo/jiTxNndu3ByaTZOlAdPUSrds8WccSgbRXogZMxl5sCeRasZHe553Jl5s9QEb8b
	28CqURdYCKvYFnOuouMtIzArdHloQzPEPvgdfCukDjibSeFSynGLe3u6L/ivmSEGJ5uG
	YJH+RUwCsSAdRqb6AKw4AOzys/AGObl3qaEyAHZ6b+Nrs8UKHo17tN2ugU9xP3oKLeo8
	qVF0dBvxCDW7jZPgnEaM4/nSN8KYnNirhTQEf9mliJhCwRwqzhhnErzx5Y/ZG0oiOgzA
	Fu3Q==
Received: by 10.14.213.137 with SMTP id a9mr9892597eep.38.1344193859962; Sun,
	05 Aug 2012 12:10:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Sun, 5 Aug 2012 12:10:29 -0700 (PDT)
In-Reply-To: <CAP9ODKqyQ5HGMxWpzuDGE2XEdpm4pp0AuNM3Ld35u_N+3mPJLw@mail.gmail.com>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
	<CAP9ODKqyQ5HGMxWpzuDGE2XEdpm4pp0AuNM3Ld35u_N+3mPJLw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Aug 2012 12:10:29 -0700
Message-ID: <CAMKF1sqcLBQo0JrDEGXfkRCFXRXQ+fr8C974_HBoMyOcZDR7hA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/30] cleanup: use variables instead of hardcoded paths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2012 19:22:43 -0000
Content-Type: text/plain; charset=UTF-8

Javier

On Sun, Aug 5, 2012 at 11:16 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Sun, Aug 5, 2012 at 12:53 PM, Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
>> Also, I didn't increment the PR on the recipes since the modifications
>> don't introduce a semantic change on them.
>


thanks for doing this work. highly appreciated. However some distros
use flattened tree meaning no usr/
so for them it will be a packaging change. So as Otavio said, it will
need pr bumps.

> This is wrong; if the distro changes the variable value then it does
> change semantic. Please change PR on them.
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


