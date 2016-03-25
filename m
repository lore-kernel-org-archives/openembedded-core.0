Return-Path: <jefro.net@gmail.com>
Received: from mail-lb0-f195.google.com (mail-lb0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id B94BB6FF9D;
	Fri, 25 Mar 2016 20:37:59 +0000 (UTC)
Received: by mail-lb0-f195.google.com with SMTP id sx8so5783431lbb.3;
	Fri, 25 Mar 2016 13:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=SBiT3sfiSAA4fPsN5w4KdJs9jjbqCTaGJe215W0YQIc=;
	b=TGJVFTYXc2A2Hwy5ericUlJaBtHxXe4VBeTI2R4hhmpvoWdjR1cDwCk+hN+nC7qJX9
	uNq1XsroEbRfYcRL7909UVo39sE/2f7Hi4rPASZofVFSlV679TqV9ZczGGbVYy2mLlcs
	k8HAX3k69n1smNLyd3dJ2eZ4HP72AyO++Lwt+80v2H9StKO36zgYcasAXWqSpR/MNs2w
	GXwoYlJ4R7KYIeRgnz5WeqC/s0sXvg1spIlTyFCW0/67QSWPhoP2GD2bi/Bws9jFbMUO
	w04stw3WHgB9u799bQ6na1fnVd+2hiQLkoj8Ga2RWInYB1EmZ2evrLBQQSYpjVAANYG+
	umBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=SBiT3sfiSAA4fPsN5w4KdJs9jjbqCTaGJe215W0YQIc=;
	b=f+B9xiQFJWkuOEkDb6AoIsyCiZvF9+UNZYOuCtzROvszbGtPaCj/Goya9Rp5aRMvWD
	VGz4lBZMBezT4Ioy/KwXLtBt5qwdM68zF0fvNuh4QUayXoTTiEDh7OBlXTxtXeofshEX
	9mp1ki5pQrW3NFXlQC/W2ZT6wT2t4psGdXjNIbKvnW6y2w9xJcdMYdghvZqBkX55GIzU
	WuXPC/MflbQyCXclf3nppGmRBoYG4bMc5onc1lGmmJ0d9U++XieUqglrBAEjAsdmU8Oc
	NmLkJ88fkQ49Nq7VopHVYNGWVVHDDvaB8ICTJW2Y2bnJDbMxFINqwyg4Mh547gXzBoX5
	KlhA==
X-Gm-Message-State: AD7BkJKfrRj0xS1tjoa1dA+QCsVDMcO6ONhwchWmGQbRQ59shVOkEJaD2mqbpa599D50VhyDhaNrZMwtTA54Rw==
X-Received: by 10.112.171.33 with SMTP id ar1mr1983383lbc.54.1458938279398;
	Fri, 25 Mar 2016 13:37:59 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.112.55.101 with HTTP; Fri, 25 Mar 2016 13:37:39 -0700 (PDT)
In-Reply-To: <CAMZfsd43wWQTZGp=FWvHATXyvY2YQASaiSAWdeatS=hviPQ4uA@mail.gmail.com>
References: <56DEF97F.9070306@balister.org> <1458767514382.89578@seescan.com>
	<56F42DA1.4090902@balister.org>
	<1604312.a7pP1GrPCb@rjs-zotac.streifs.net>
	<CAMZfsd43wWQTZGp=FWvHATXyvY2YQASaiSAWdeatS=hviPQ4uA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Fri, 25 Mar 2016 13:37:39 -0700
X-Google-Sender-Auth: _uf6jhS78dBd5TE2Yd4mylNoK_o
Message-ID: <CA+YB3raXh6g-hNvZaqiVEv=cM0fH3oh=C0_2DbjRqYcoz15ePg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [yocto] OEDAM, April 8 in San Diego after ELC
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
X-List-Received-Date: Fri, 25 Mar 2016 20:38:02 -0000
Content-Type: text/plain; charset=UTF-8

Unfortunately, this OE meeting will be a business meeting followed by
a gathering for OE developers to help determine the direction of the
project and figure out who is doing what. It would not be ideal or
even interesting for beginners. Interested folks can sign up by adding
their name to the wiki at http://openembedded.org/wiki/OEDAM_2016

However, the Yocto Project Developer Day on Thursday of that week is
specifically designed as training for beginners and also interesting
presentations and labs for advanced folks.
https://yoctoproject.org/devday

I'd be happy to answer any specific questions on either event.

On Fri, Mar 25, 2016 at 1:32 PM, Ryan Elkholy, PhD, PE
<ryanelkholy@gmail.com> wrote:
> Is this something beneficial for beginners who are getting their feet wet
> in open embedded? Also, where do we register?
>
> On Thu, Mar 24, 2016 at 2:36 PM, Rudolf J Streif <rudolf.streif@gmail.com>
> wrote:
>
>> Since I happen to live in San Diego, I have been asking around for a
>> potential meeting room (unfortunately, I don't have an office with a
>> meeting room myself). I am currently working with the University of San
>> Diego and the Catamaran/Bahia Hotel. Can't promise anything yet.
>>
>> :rjs
>>
>>
>> On Thursday, March 24, 2016 11:10:41 AM Philip Balister wrote:
>> > We are up to fifteen now and as noted will have some off site attendees
>> > and late sign ups.
>> >
>> > Philip
>> >
>> > On 03/23/2016 02:11 PM, Fred Ollinger wrote:
>> > > I'm coming and I'm probably brining another person.
>> > >
>> > > I still have to make the wiki account which failed for some reason
>> before.
>> > >
>> > > Frederick
>> > > ________________________________________
>> > > From: yocto-bounces@yoctoproject.org <yocto-bounces@yoctoproject.org>
>> on behalf of Trevor Woerner <twoerner@gmail.com>
>> > > Sent: Wednesday, March 23, 2016 2:08 PM
>> > > To: akuster808; openembedded-devel@lists.openembedded.org;
>> openembedded-core; Yocto Project;
>> openembedded-members@lists.openembedded.org
>> > > Subject: Re: [yocto] [OE-core] [oe] OEDAM, April 8 in San Diego after
>> ELC
>> > >
>> > > On Wed 2016-03-23 @ 09:36:40 AM, akuster808 wrote:
>> > >> There are only 10 people signed up.
>> > >> Is that enough people to justify the expense room or even meet?
>> > >
>> > > I have no idea what the budget might be or what a room might cost.
>> I'll leave
>> > > it to those who do know to worry about the costs versus the benefits.
>> > >
>> > > In any case I certainly think it's still worth meeting. A smaller, more
>> > > focused group can sometimes get more done than a larger group.
>> Secondly, it's
>> > > my experience that more people always show up than sign up.
>> > >
>> > > With a project like this there will always be things to discuss, and
>> sometimes
>> > > a discussion goes better in person rather than online.
>> > >
>> > > Best regards,
>> > >         Trevor
>> > > --
>> > > _______________________________________________
>> > > yocto mailing list
>> > > yocto@yoctoproject.org
>> > > https://lists.yoctoproject.org/listinfo/yocto
>> > >
>> >
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Jeff Osier-Mixon
Open Source Community Architect, Intel Corporation

