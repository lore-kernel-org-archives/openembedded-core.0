Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QDPWB-0003mD-65
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 01:12:07 +0200
Received: by pvc30 with SMTP id 30so502467pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 16:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=WHohii4Ahm9qopw+X4ZjOLEkmxoA/0XQvGBGsOGX7BI=;
	b=d/nvJwst87pq45ieACKG2SpyOWe0vvGL1y2eFqVxnict8d/zNqIXOeguoVHLjwLZss
	Re6FJ6KrJmh6P0RQtNX3XemR5aoDG9WASYYvZOENn+C56iLxaMeAnMBPwB8dl/fDj1RU
	HVzeQHU1oyGSJ+SKUzLz50F9oceXRN3TlMZ6I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BM74XyDsPAYyvpdaEJVS83g1qT42ESBNGOD+6UXVnXkTb+sWY83Kt6DqiK/z/+CACl
	hTBIjlq3TsEiZV9NM/fXtYYCdUOxHTA4Rw9bnGqphlAeIB+XIgg9O67rerZJEmtXdjyn
	GlzaLE8B3eYI75RH+cMcMRilYCESV1YqzNkrs=
MIME-Version: 1.0
Received: by 10.142.52.20 with SMTP id z20mr892388wfz.212.1303513778826; Fri,
	22 Apr 2011 16:09:38 -0700 (PDT)
Received: by 10.142.223.2 with HTTP; Fri, 22 Apr 2011 16:09:38 -0700 (PDT)
In-Reply-To: <1303413680.5518.359.camel@rex>
References: <201104211704.37707.paul.eggleton@linux.intel.com>
	<20110421165711.GA25621@xora-desktop.xora.org.uk>
	<D92FBC8F-FB70-4551-96DE-5B7AC333DB89@dominion.thruhere.net>
	<1303413680.5518.359.camel@rex>
Date: Sat, 23 Apr 2011 01:09:38 +0200
Message-ID: <BANLkTime-0+ye-PRrZW5F9zSu9WNvSERYg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
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
X-List-Received-Date: Fri, 22 Apr 2011 23:12:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

snip

>> >> If people agree that this is a good idea, the next question would be where to
>> >> host it - is this something that could be within the meta-oe repository?
>> >>
>> > Grabbing all of these barely supported machines into their own layer sounds
>> > like a good plan to me.
>> >
>> > Id suggest just hosting it on gitorious, if its inside OE then there is the
>> > magic assumption from the public that they should work (which is what happens
>> > now). Then people get really dissapointed when I tell them getting it to work
>> > is likely to be a hard slog.
>>
>> I agree with Graeme on the hosting bit. I also have all the devices you mentioned near my desk, so testing should be easy :)
>
> I'm going to disagree, this is exactly the kind of layer fragmentation
> I'd not like to see layers cause. Which website do I go to where I can
> see a list of layers that exist? Who is going to maintain that list? If
> its off on gitorious nobody will be able to easily find it.
>
> The easiest solution is if git.openembedded.org or git.yoctoproject.org
> can host the majority of the meta-* repositories.
>
> Equally, I don't really see why this can't be a specific meta- group in
> meta-oe. The README can clearly spell out what the expectations of the
> layer are...
>
> Cheers,
>
> Richard

I agree with Richard, for keeping it as meta- group.
About expectations, at least for Zaurus I don't see problems: vanilla
2.6.38 kernel, actual udev, imminent move to xorg-xserver if kdrive is
finally doomed.

Ipaq's seem suffering more bitrot...

Andrea


