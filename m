Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QERId-0004rk-SI
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 21:18:23 +0200
Received: by ewy5 with SMTP id 5so759225ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 12:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=rl3QHKJBwgoOHDyfXnTgIA9buIFjhzBEdMou7iGONx4=;
	b=V9PSIZUTr5qCjlZgl9rgRDFecBnz5tmlOAyHA6Z0F9fcSuOPpWEV88sjbQM5QS6voK
	/p0TYimXFW2SkgZGe+oK7s/0HUseXd9CkRCTZvikl/Og6+14lk7yguIT0rlPIF0NjWKJ
	7ziMNg/WTDO4rqpM8ho8AhUll8AsR9oQvIyCQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=K7h6SVh23UyiegIvfg6Pu79UYEN0tNgpH3ow5GPYywptl+w/V/zFE5B7A6wkBkBq1m
	bjkUEPxuByU80ivHcTQP4v4IwGDRiVh7JT9ty6LNPuVTIAFuvNhGvX2qGCR7jO/CxCSf
	k89aNh9y1mCTcCRpZnFJxXGyEr0LEWlo8wyqo=
Received: by 10.14.5.4 with SMTP id 4mr1323887eek.205.1303758955255; Mon, 25
	Apr 2011 12:15:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Mon, 25 Apr 2011 12:15:25 -0700 (PDT)
In-Reply-To: <201104241025.03973.paul.eggleton@linux.intel.com>
References: <201104211704.37707.paul.eggleton@linux.intel.com>
	<1303413680.5518.359.camel@rex>
	<BANLkTime-0+ye-PRrZW5F9zSu9WNvSERYg@mail.gmail.com>
	<201104241025.03973.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Apr 2011 12:15:25 -0700
Message-ID: <BANLkTimnaz-Jg+ApLJ7=PiY6F36=9oKgVw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] meta-handheld
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
X-List-Received-Date: Mon, 25 Apr 2011 19:18:24 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 24, 2011 at 2:25 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Saturday 23 April 2011 00:09:38 Andrea Adami wrote:
>> I agree with Richard, for keeping it as meta- group.
>> About expectations, at least for Zaurus I don't see problems: vanilla
>> 2.6.38 kernel, actual udev, imminent move to xorg-xserver if kdrive is
>> finally doomed.
>>
>> Ipaq's seem suffering more bitrot...
>
> This is a problem, yes. Most of the iPAQs require 2.6.21-hh which is ancient
> and unmaintained and as we know presents difficulties with modern udev. Some of
> the iPAQs will work with mainline but many functions will be unavailable. This
> is something I hope can be sorted out - surely by now a lot of the "ip blocks"
> used within iPAQs and other PDAs are now in mainline already and all that's
> necessary is some plumbing...?
>
> Anyway, I'm concerned that if these machines get pushed out to some random
> repo it's only going to make things worse. I think we can mitigate the
> concerns about people rushing in only to find that the level of support for
> their device is less than they hoped simply by being crystal clear about each
> device's status in documentation (e.g. a wiki page), something which we have
> not been good at recently. (Am I volunteering to maintain this information as
> well? Naturally :) )
>

we can host it on its own repo and not under meta-openembedded
umbrella. As long as it is maintained its good


> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre (UK)
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


