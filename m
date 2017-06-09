Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7979371B86
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 17:11:05 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id q97so39870801wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 10:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LGyHIozzwR0eocilmURnClZ3Pl2rDQa5asVKcRjU9GM=;
	b=lS045zAnEHrsYVpokq90eWCPlDG95mxGdhpBlzEFTfgGwv4RNzXNHoVhEiw/3UuBt/
	Ae2nNI4c+fSnPz8M7lzQjn64Fkp7P0HgGV7n1t99Pj8F4Co2KpQUyBoOK+zbV3Y66IaW
	atDMoOoMZEPIwi40z94Q8PJwD0EffaCkElhnPpH7Vva+lmigm+9F+IP1W7ECuRlKLw4V
	Be8TBJjxXphPRKpt1gP7kJJs6q4lgGUu68r4+ylncdiG8G+03UkChurWisNPmq9ecjSP
	C8NBO5IDZ4lL8sFMmAA5WHDGacMz24g7J3tE/8m3eGuPdc2MwifK3eoyLfWHrp3pDJtv
	QaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LGyHIozzwR0eocilmURnClZ3Pl2rDQa5asVKcRjU9GM=;
	b=mE9QGRAFV3eztLDkJJsYilsInG8CQI2ppiK7EvGJ4VaHE0EYBJH5vq9Tn9g8Y65Ri9
	IjpmhSQkHJJUhgdj+ZjUd9DQNQcFZRC5Syfbsk+8yRgSjVfsbdJ5CftvLCbQDq4imJ0i
	119ZBTWJ351+lgX8rqEdm2PaQJfCn/zcJcJZaroE5uxerOA10kd8RfFU9h47CRVAKpmo
	+JCtOOoHow4Lx2PlBkbqxO/NfknhGnbRb9ekt9DMEp83fciYIEVrczLJ4OdiSQy0fg2G
	tQXakZ0bW4vYiq1oNQUYWU88GRSpJek2zowg4IynxrE2BEj/j590A1gfDkxrNG1WUaUs
	NAdw==
X-Gm-Message-State: AODbwcC10vF+vDTFox8aievHmNGCChTUQph8Yy/656l6zXLPm8PHNV+k
	4Qctz9vcgT9W0Max6Egu2N3k1ctqGw==
X-Received: by 10.80.143.227 with SMTP id y90mr34336301edy.131.1497028265912; 
	Fri, 09 Jun 2017 10:11:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Fri, 9 Jun 2017 10:10:35 -0700 (PDT)
In-Reply-To: <1497026309.2435.5.camel@iki.fi>
References: <cover.1496979431.git.raj.khem@gmail.com>
	<c0e598696af9be3f567751a8641effb08431a7d2.1496979431.git.raj.khem@gmail.com>
	<CAJTo0La6u=Tzzsow5ZYwqmWHY8RzyvgVqT=J4J9UpKy8uKbb9A@mail.gmail.com>
	<CAMKF1srdVU0p-e4gPJx5rNEhk4aQdsiELuz+-1AsD_tgG6b_Gw@mail.gmail.com>
	<1497026309.2435.5.camel@iki.fi>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Jun 2017 10:10:35 -0700
Message-ID: <CAMKF1soH0BshzDQorBw7mmXGCgCg_OF=uc5pX1q=J_-ZPqtGMg@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] pulseaudio: disable PIE flags when hardened flags are enabled
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
X-List-Received-Date: Fri, 09 Jun 2017 17:11:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 9, 2017 at 9:38 AM, Tanu Kaskinen <tanuk@iki.fi> wrote:
> On Fri, 2017-06-09 at 13:07 +0000, Khem Raj wrote:
>> On Fri, Jun 9, 2017 at 5:56 AM Burton, Ross <ross.burton@intel.com> wrote:
>>
>> >
>> > On 9 June 2017 at 04:41, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > > +SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
>> > >
>> >
>> > These tend to go into security-flags.inc, not the recipe.
>> >
>>
>> I know that's been the case but I think having a global file is error prone
>> its better to have it in recipe context since it can get attention at
>> upgrade time to test if this has been fixed in new release etc
>
> Do you mean that there's some bug in pulseaudio, and this is a
> workaround for it? Is the bug that there are textrels? Ross saw
> textrels in pulseaudio before (see the discussion starting at [1]), but
> I was unable to reproduce that. If you give instructions for
> reproducing the problem, I'll see if I can fix pulseaudio (until then
> I'm fine with having a workaround).
>

yes there is a bug lurking when compiling with hardening flags are turned on
so you can do something like

in local.conf

require conf/distro/include/security_flags.inc

then

MACHINE=qemux86 bitbake pulseaudio

it also happens on arm so qemuarm will reproduce it too.

some assembly code is probably missing using GOT relative accesses

> [1] http://lists.openembedded.org/pipermail/openembedded-core/2017-February/133215.html
>
> --
> Tanu
>
> https://www.patreon.com/tanuk

