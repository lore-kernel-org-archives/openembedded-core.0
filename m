Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id B0DB66BCE7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 12:47:48 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so1433349lab.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 05:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=n3Byvq+gtOHY9eGgKz3tABCdUaW36Qag28SxscuW2oo=;
	b=t6GY8GNTDuvGemkTdQ/SVpC+4jtAsByeV7xWEaAhh+yHlzHVYRjxdu6yFdNR6RXz8o
	CdtGas3CeeIlQCpI6jJ4znsgqu2fZKVETCwnAJyuZwohGIgRtVCbF/87NL2tAXunDsNT
	DRPsqgDVaRsTa0fEPOgjtTCnH072/nWW1UyFkxLAr72FTNTdRKhw27o1yBwAeYICtKHh
	5GuOkEttRVVjpMkxln1eG9sY4IRFJQdTtPAlaxR6dHGDZ/2Gy68R7I5zucDkX6ou/xUH
	2/swqg1E2WVOgFzAp49s9h0obZhDvGGUCkcY2SudILdrDzVgEvOvXhuH08QCjHsl/Rb3
	DKWg==
MIME-Version: 1.0
X-Received: by 10.152.5.66 with SMTP id q2mr7894553laq.13.1377866868814; Fri,
	30 Aug 2013 05:47:48 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Fri, 30 Aug 2013 05:47:48 -0700 (PDT)
In-Reply-To: <CAOMwXhN=mJMrePAXftb8CX_WOshN=S6ufC3BaXwfjY9WYGat+A@mail.gmail.com>
References: <CAOMwXhN=mJMrePAXftb8CX_WOshN=S6ufC3BaXwfjY9WYGat+A@mail.gmail.com>
Date: Fri, 30 Aug 2013 08:47:48 -0400
Message-ID: <CADkTA4MAD8vB4EEdbSSfKSFuF4bRRmUxoft_y=VQLAZo3gb3Gw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Bug: 5089
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
X-List-Received-Date: Fri, 30 Aug 2013 12:47:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 30, 2013 at 7:45 AM, Laszlo Papp <lpapp@kde.org> wrote:
> Hi,
>
> there was this change which also goes undocumented. Unfortunately, this is
> causing a lot of headache for me, but I expect that for others, too.
>
> I would like to propose the default kernel and module name from:
>
> uImage--3.2.1...
>
> to:
>
> uImage-3.2.1...
>
> This would avoid a lot of work for people. I have been trying to fix issues
> for one day due to this which is unfortunate.
>
> Also, the double dash on its looks silly IMO. It should be either '-0-' or
> '-'. I prefer the latter for compatibility reasons, although someone could
> argue about that the former is more readable.

Having maintained several systems when the default name was changed
to include PE, it didn't cause any problems here. Both dependent recipes
and scripts picked up the change easily and convenience symlinks made
the -- or -0- not something that needed to be dealt with.

So I'm ok with either, since -- going to - won't cause any problems in my
small part of the world, but it would be another change in the filenames
on top of when PE was added in :)

Obviously opinions and impacts of the change vary,

Cheers,

Bruce

>
> I heard Jama's opinion about it on IRC. I wonder what others think?
>
> Cheers,
> Laszlo
>
> PS.: Note, this is a different proposal to the documentation update.
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

