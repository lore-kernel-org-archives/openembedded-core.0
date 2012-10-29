Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TSyta-0002qJ-SI
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 00:37:26 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so1892519bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 16:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=58nAMRgV5mYGwvuLFxBrCanFSsZJvlIbfQ1+BU7cH5c=;
	b=z/vg63XAvyVrBVA27pSRx3zUKBeUrUVZIC/T2JKSkMS7ZdPaSOtIRDUgkJHHODSnEe
	43oeiFzkR0fxeZURbJB10kImHz29R4mgA+1KYYEPdt93K9f+Szi4qDHq2mY331OL3X3F
	nDEHoYe5iyHnGaXqFldzPlzPR4pXiccfcNdm0u1LW9Ku1aWRWzkW93i+ETztVfjKXzIu
	c9o4Va/K13RSffvIgYPyuZ0yBEQ5V7j64dD8/EMEH92J6czNbqneWbXBYT5R0STLx/n7
	OmrRVYZDFpILC/RsohFiUTC0QpUu4BglL5gfIG0/6w7/1p1TXY01AZKv6fQqU4w+y/d1
	90/g==
MIME-Version: 1.0
Received: by 10.204.128.89 with SMTP id j25mr9755104bks.23.1351553032264; Mon,
	29 Oct 2012 16:23:52 -0700 (PDT)
Received: by 10.204.35.67 with HTTP; Mon, 29 Oct 2012 16:23:52 -0700 (PDT)
In-Reply-To: <CAAQYJAvPAht4KDRwcYUyTjYteQu7wiXbbE4JT8H2+rR7tv=KNw@mail.gmail.com>
References: <CAAQYJAtxfQDkODhaPZP1Z8honP1azA1B6PuQ_DfjtuB--8YnvA@mail.gmail.com>
	<CAAQYJAvPAht4KDRwcYUyTjYteQu7wiXbbE4JT8H2+rR7tv=KNw@mail.gmail.com>
Date: Tue, 30 Oct 2012 00:23:52 +0100
Message-ID: <CAAQYJAu+7f+HLBp5xTw8fQk7H5b91=pc5pbkvMB4wEXXhcCpEQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: devshell spawning twice
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
X-List-Received-Date: Mon, 29 Oct 2012 23:37:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Oct 28, 2012 at 1:59 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Sun, Oct 28, 2012 at 1:55 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
>> Since commit c76da87511d2668479745c2f18b8a9b8116c7489 (terminal: Add
>> support for running custom terminals.) screen opens also in the master
>> terminal, waiting for input.
>>
>> Reverting the patch fixes the funny behavior.
>>
>> This on Gentoo, using xterm.
>
> Sorry, is gnome-terminal on this host.
>
>>
>> Regards
>>
>> Andrea


Same happens using Ubuntu as build host: bitbake -c devshell foo
launched in uXterm does spawn two gnome-terminals.
This has also other bad effects on do_menuconfig task for linux-yocto.

I can confirm that reverting c76da87 fixes the things.

Andrea


