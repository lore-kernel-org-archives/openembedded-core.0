Received: from mail-ob0-f170.google.com ([209.85.214.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UcfFq-0007H3-RT
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 19:12:43 +0200
Received: by mail-ob0-f170.google.com with SMTP id er7so2273279obc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 09:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=xOsddqJJNNzHtA0trGV8neC6plkwTdjw4TLktO4ySYE=;
	b=nRn/KkBZcOwh+/+h3V+JKalni2JKqt1hIBsn5f88C4rCNtSebznqTynCCxBDys2iuh
	04t9S03S/yf0JSA7X09qvNunE6BZxtV3i4r3UNPwARqOFetBHeFtc33neqHrcEgbJQE+
	++xU7ix1kxH9xOZPFHU7Xn3ZNqaCFlnHoJAieP4UehW5Z84qft4/OoX17ZUsREngXGnW
	IaQhiaEHK10W1P7v4rTkqB9CF3ZW+0xBJUUBzj4nawv6TZDes27aKQ4WOXuoydV4o/kh
	gWTeCYUixWs+IQQ1d3OR3LczkFuQl7JMukhEFeKrY2AUzAhdo4Ydq9Z7kJB3LohcUnEC
	39Mg==
MIME-Version: 1.0
X-Received: by 10.60.135.102 with SMTP id pr6mr13463964oeb.138.1368636868972; 
	Wed, 15 May 2013 09:54:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Wed, 15 May 2013 09:54:28 -0700 (PDT)
In-Reply-To: <5193B925.6010607@r-finger.com>
References: <518A6B25.5000108@r-finger.com> <3057509.dy5Cs7AUqs@helios>
	<519372F1.6050902@r-finger.com> <5543572.N8ppyBn6lW@helios>
	<5193B925.6010607@r-finger.com>
Date: Wed, 15 May 2013 13:54:28 -0300
X-Google-Sender-Auth: KoxXV0GESghiroTwKh-wSRl-tvA
Message-ID: <CAP9ODKoi9ZPDdZTYJ6wfqAdofQeBWCmZAEuMzKQCFkHBYyYkeA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Wed, 15 May 2013 17:12:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 15, 2013 at 1:34 PM, Tomas Frydrych
<tf+lists.yocto@r-finger.com> wrote:
> Hi Paul,
>
> On 15/05/13 15:09, Paul Eggleton wrote:
>> Can you not just get the appropriate changes into the BSP layers
>> so that when you add the BSP on top of OE-Core it does just work "out of the
>> box"?
>
> What you are really saying is that the onus of maintaining working
> clutter packages should be on the BSP maintainers. I have already
> explained previously in this thread why I don't think this is going to
> work out in practice, so I am not going to repeat myself again.
>
>
>> If clutter is taken out of OE-Core this becomes even harder because then
>> BSPs can no longer bbappend clutter or cogl (if that is indeed what is
>> required in order to enable machine-specific functionality) without fiddling
>> around with BBMASK or keeping the appends in yet another separate layer so
>> they don't impact other BSP users who aren't building Clutter.
>
> The BSPs would not need to do anything regarding clutter, no bbappends,
> meta-clutter would be self-contained in this regard.
>
> I don't think there is any point in bothering the list with this
> discussion any further, we have gone around the circle more than once.
> The whole point of the proposal was to make maintaining, using and
> supporting the clutter packages easier for everyone, but it seems I
> underestimated how important Clutter is to oe-core, and I am already
> looking forward to this newly discovered importance being translated
> into user happiness before too long. :)

I'd prefer we keep meta-clutter working until it happens ;-)

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


