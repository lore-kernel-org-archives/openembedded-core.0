Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 68766601F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 17:50:55 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id i2-v6so17908330uah.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 10:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b/jMiXebDYoTf/FXjcUkUqKwZ21SD0cDsibZgvSvkpQ=;
	b=hVxJUg4UvoY3PtxpRLRS3tz2FcPUcqoqmaO9bvfDKTvWIRqAuILKC1H/9653JVSad1
	jbKRAbAD+czNQbjaHmpA7jdyr0IRmWRFXEiX5p/YKkdL/D7aAfbWcstdLGL4Wd7l7bIp
	LJqyiKvKBKJ+FJMEp43byXps14Xju/kxsILYVJIf5Xi3yDFyhAEEe7aJ7Y3syUDzHQzu
	Bo4uKmt89iZhs3SxJMe7uMCmpcPYcdKEG06gcFG6qK8SvTs/sakaFx7ryu4ONmrEPLIf
	EbIKNHL+oxscRcLbcVFFtjeuK0qPOSMn+7e7VuzruAxeQ1THcpzeYep9kfBRvhTsiRuK
	icAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b/jMiXebDYoTf/FXjcUkUqKwZ21SD0cDsibZgvSvkpQ=;
	b=BIzZMxFMf2zPS3vuUsrx9o7dAoyGEk0BAF2e/Nh6DC3HKCBQN95ABk45mSqBwZwkq+
	z1dV1noU1sMJTNkFJs7tx/zSjA/iuvdxgVNS7z9K77C54pZBrUptyqFBn8QQmyqqS93P
	kBnTcyYzVkhLqn7Dg/XgremkwlvVo5R0T1ogLCFMp/wgwfG6U92U5UpapfI42QleV8gr
	VsnLcnKUql5qhn6hwabF+djA5vgINh6wbHIduqVt5UaHQbXWyRixQlEhdhuwA5T6UcMd
	FV1qEitUEAUT19aTCJIavjyF2onii6aNLGM2K9t1Aj+CY9iyUqClFKRZYyfGK9j9249I
	i+ug==
X-Gm-Message-State: ALKqPweWzIY6xuj74wRE6KeGrrLYM7bAGwBIaXrFUXolKe/lXIVpeBkN
	TQGsja1fE/b+sZuuzGUrmrPjvjWzOl3aOsXwxf0=
X-Google-Smtp-Source: ADUXVKIORR+Qz3ivKViZsUnTpW3vjxUFJ0pZm90xXVKdBTHykgWWjBVpnEpcb4rEsGwI13VgRfxsXgtFMrhssGjME9A=
X-Received: by 2002:a9f:3352:: with SMTP id
	a18-v6mr7935746uac.38.1527875456042; 
	Fri, 01 Jun 2018 10:50:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 10:50:55 -0700 (PDT)
In-Reply-To: <CAHUNapRpokvfA2v+xJKYXzHLE3gSR+3oLQ32_2-+u=t0jHiPJA@mail.gmail.com>
References: <20180531200659.28877-1-twoerner@gmail.com>
	<CAJ86T=XTDOZYzdUTBLSO39XeBu6QhV0U5+U=iGd_hM0OwBXH_Q@mail.gmail.com>
	<CAHUNapRaJVnECsz3rU2CV265xOJLMPUARfsHZGn-CnY_Kn4j3Q@mail.gmail.com>
	<CAJ86T=W3ju53TA-za4LMYXKtEqvLvj9B=DjMO+Tu=nsnG7Jehg@mail.gmail.com>
	<CAHUNapRpokvfA2v+xJKYXzHLE3gSR+3oLQ32_2-+u=t0jHiPJA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 1 Jun 2018 10:50:55 -0700
Message-ID: <CAJ86T=WoFagzccAfpJEE0LcTPV-WNopz2+7dDTVViQbiEbdVjA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [devtool][PATCH] devtool deploy-target: optionally specify package
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
X-List-Received-Date: Fri, 01 Jun 2018 17:50:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 1, 2018 at 7:58 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Thu, May 31, 2018 at 11:07 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Thu, May 31, 2018 at 7:23 PM, Trevor Woerner <twoerner@gmail.com>
>> wrote:
>>
>> I wonder whether the default behaviour should just be to not deploy
>> files from the -dev package?
>>
>
> That would certainly be an improvement. But it still wouldn't make sense to
> copy over the -staticdev or -doc packages either. Maybe a better default
> behaviour would be to not copy over the -dev, -staticdev, -doc, -dbg, and
> -locale packages?

Right. The list of packages to blacklist by default would need some
thought and it's probably more than just the -dev package.

> Or better yet: just copy over the core packages, not any
> of the core-<something> packages? I'm guessing bitbake has a list somewhere
> of these -somethings?

The core packages can be named almost anything, so blacklisting the
packages which shouldn't be deployed is going to be easier than
whitelisting core packages which should be deployed.

> I wouldn't be surprised if the current behaviour exists simply because ${D}
> is already there and ready to go. My tweak extends the behaviour to send
> another already-there directory: ${PKGDEST} + <package>.
>
> If we were to go this route (i.e. being more selective about which packages
> are sent) do you think this should be the new default behaviour, or should
> the existing default behaviour be preserved and a flag used for this tweak?

I was thinking maybe to exclude -dev packages etc by default and
provide a new command line option to over-ride that and deploy
everything (ie a new command line option gets you back to the current
behaviour).

I don't know whether there's a common use case in the devtool workflow
which relies on -dev packages etc being deployed and would be broken
by that change in behaviour though.

>> >> Are the going to be problems if users want to deploy more than one
>> >> package (or switch between a full deploy and a package) and don't
>> >> deploy and undeploy in the right order?
>> >
>> >
>> > In my patch I added a --package option to "devtool deploy-target" but
>> > not to
>> > "devtool undeploy-target". devtool keeps track of what files were
>> > uploaded
>> > by creating a per-package list on the target itself (in /.devtool). When
>> > you
>> > undeploy a recipe, it simply looks for this recipe file on the target,
>> > reads
>> > the files listed there, and undeploys each of the files in that list.
>> >
>> > Therefore, mixing and matching deploys and undeploys amongst recipes
>> > don't
>> > interfere with each other.
>> >
>> > I checked at the time, but I'm not 100% sure now, but I believe if one
>> > deploys two packages from one recipe, the on-target file gets appended.
>> > But
>> > now I'm not 100% sure, so I'll verify this tomorrow (thanks for the
>> > reminder). As such, under my scheme, you can deploy recipes and packages
>> > at
>> > will, but then only undeploy the whole kit and caboodle in one go; given
>> > a
>> > recipe name to undeploy, whatever it finds in the on-target record will
>> > get
>> > undeployed.
>> >
>> > I think any developer will find this reasonable behaviour (but maybe
>> > not?).
>>
>> If that's how it works then it seems reasonable to me.
>>
>
> Unfortunately this morning's investigation shows this is not the case. When
> a recipe is deployed to the target, the on-target script looks for evidence
> of this recipe having already been deployed. If that is the case, it
> undeploys the previous deploy before deploying this deploy. That is very
> good behaviour since it catches the cases where the file list might change
> between deployments. But with my tweak as-is, if the user deploys two
> packages from the same recipe, the first one will be undeployed and only the
> second one will remain deployed; this is not reasonable.
>
> Therefore a v2 will be necessary. The question is, which route do I take?

