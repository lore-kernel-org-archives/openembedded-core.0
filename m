Return-Path: <psidhu@gateworks.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9582A6AC3E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 19:23:19 +0000 (UTC)
Received: by wiun10 with SMTP id n10so159005935wiu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 12:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/87Wbc5mkwTWL9Z0Qfi7aIE5Y6IUWjottEl8jqOm5Tk=;
	b=BBVAYzfUyuxK2AWNm0LSyYmMpeWJt+z+CY1zvM0Kh23WEfTWkTGanaJWlbWnVeELiG
	BRR+09mJgG3v32v07MhR38PYdorzabXTd3KfM4fLEJs0t9uQeymqbNngt20+O9VBdEry
	ThgoxofGfTF7xL3l9FteolFPFgDPd96RmXGTT8QzDaIVqwaw8XCLjM+2lPVGX46qm2mx
	XncRaCa/UyLpr1XqsFdSfEsB6MPA7ki/ZCGM6GJbAZp46QyirLSN6v1c0Jk2lScSv4xc
	bYNUan3YLqSnwB9NgYE/FCJ8ET21IIxzljt6j3q4gZ2bSXRIKvdWyoAYUwrHtkEJ3bq7
	ZJYg==
X-Gm-Message-State: ALoCoQkLKIRHSWO+Z63K17BFplWVmDK2dOY4rYhHXBTGVHH8JQ1DslcP+Vk81WwYQYshEoJbSmhZ
X-Received: by 10.194.21.8 with SMTP id r8mr1861104wje.60.1430853800636; Tue,
	05 May 2015 12:23:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.58.70 with HTTP; Tue, 5 May 2015 12:22:50 -0700 (PDT)
In-Reply-To: <CAP9ODKpua0=cpqyj9EF8+iNmFxDwcU7R+nCbpCCGoEPrdLUafA@mail.gmail.com>
References: <1429921942-19804-1-git-send-email-psidhu@gateworks.com>
	<1429921942-19804-2-git-send-email-psidhu@gateworks.com>
	<CAP9ODKpua0=cpqyj9EF8+iNmFxDwcU7R+nCbpCCGoEPrdLUafA@mail.gmail.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Tue, 5 May 2015 12:22:50 -0700
Message-ID: <CAD1M060TXfPiHXLzkq8vzx6-90HUyWDtmgxiisgHvDfPU9uA5Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: add support for multiple ubi sizes
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
X-List-Received-Date: Tue, 05 May 2015 19:23:20 -0000
Content-Type: text/plain; charset=UTF-8

ping.

- Pushpal

On Mon, Apr 27, 2015 at 5:36 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
>
> On Fri, Apr 24, 2015 at 9:32 PM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
> > Add new FSTYPE called 'multiubi'. This new type has the ability to
> > create multple ubi's, something that's extremely useful on boards that
> > can include varying flash sizes (e.g. 256MB vs 2GB).
> >
> > Because we don't want to reuse code, I extracted the mkfs and ubinize
> > commands out to a new function that will handle the creation of both
> > multiple ubi's, as well as the 'ubi' FSTYPE (so as not to break current
> > boards).
> >
> > Due to the single processes nature of the OE when doing it's
> > 'create_image', this new multiubi_mkfs function also creates it's own
> > symlinks as well as cleans up it's own cfg file.
> >
> > Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>
>
> It makes a lot of sense.
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

