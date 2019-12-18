Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id B56957FF00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 19:49:01 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id e10so2638183edv.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 11:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vhiDux1NbeqtzsWNAK2SXAHRvV0nZ2fA7jDd1FS9iSM=;
	b=p8T1VRWYzpi3LK0Qu4x8S4kE6Y/F3wdiMBO/kVUS3j1xjYmD0WUj4C6YzyNa2YZVbU
	nLweoyPU/3nE8g54TJpOtMkZySb9jY/rrYqbA9wod4kz4IaParZtqxmTD0akY5/bRypw
	NK//9QXfJrMF+kLtTEkLAI6QTq1JSVpKHHH9K1SqeIw9JjPYh6ECGIHNnpSafxurjVOn
	qfYd8h4FPHCnnHzy582EFeWVoD+EnggB7lPNkBih0ikyX30d6LICy8oTg2J9pXg34jvK
	jAakJnX4ilHh0UBHSQfP74TEjrp7sJ5cyakgt9v9le8Ih9vIAqlRE9E+322z1r0RM+2U
	Ncww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vhiDux1NbeqtzsWNAK2SXAHRvV0nZ2fA7jDd1FS9iSM=;
	b=C2y0p0hz3Knbmi/evPoSMkrWFMfaNzNAu8hs70/wjOUPRj7vzU9SSnO09J4/bXqsle
	UZuSfMn3zdPzo1GkGq8ZUjneinSjUb1je2ncDM6EhMbim8w4b98JcCiz51Tst3hEU9S8
	GEGt5TwMgis68Jt06D1YlqGmFuX7d3hrHW+y69Tdy3ja70J6Fj4jdB1hdGOLcRxuMMnF
	MFh9ZvTl5Mi/B2c792jcRq6aPSTEEYa4IsWIcvfcE89Yvrl97tYa/HgFYFXO3jXjYQA9
	8IKCIo74LMDpFAoUgf39HKhuzAqqBeYZFJP9j/EXUsw4YWAGyakDdVETp2rtmnlOKoM5
	fbCw==
X-Gm-Message-State: APjAAAV1zlPXioeS6Z5K4FLfJ5RsGVVec54RE/I3bp6rOm2hQ6Earbby
	Ipf5EG1FOAG8rtEneThj1E+H/P9MWBvpaLOWpvk=
X-Google-Smtp-Source: APXvYqyE+MPwmRhrOafDzf8a2U8HYoumDW7B/LRYHCk9NrWbJZcqxZYkhpG+RLyzUDZN2Rz5xZlxs6L8S+3/UnPd4iU=
X-Received: by 2002:a17:906:538c:: with SMTP id
	g12mr4782526ejo.101.1576698542235; 
	Wed, 18 Dec 2019 11:49:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576677592.git.bruce.ashfield@gmail.com>
	<fa2bc2d58f4a1cf9de5322b6aacf1362aa47e044.1576677592.git.bruce.ashfield@gmail.com>
	<8722bcef-d607-b061-394e-5585bfde7dab@gmail.com>
In-Reply-To: <8722bcef-d607-b061-394e-5585bfde7dab@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 18 Dec 2019 14:48:51 -0500
Message-ID: <CADkTA4Pc1Q7c-zW1udQryVOsvgga74wfQd=O=sc_jiDmdyzA4w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] linux-yocto-dev: bump to v5.4+
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
X-List-Received-Date: Wed, 18 Dec 2019 19:49:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 18, 2019 at 2:11 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 12/18/19 6:07 AM, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > index 163f280560..3b5c9ddc59 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > @@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
> >  SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> >  SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> >
> > -LINUX_VERSION ?= "5.3-rc+"
> > +LINUX_VERSION ?= "5.4-rc+"
> Why is this not 5.5 ? 5.4 is the next stable and @ 5.4.5

Check the date on the commit ;) I had sent this much earlier in the
year and it fell through the cracks.

-dev will be 5.5 shortly, once I've sorted out the mips64 boot issue
with 5.4 (and if you check linux-yocto-dev, it is already 5.4.5)

Bruce

>
> - armin
> >  LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
> >  PV = "${LINUX_VERSION}+git${SRCPV}"
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

