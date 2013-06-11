Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id B4CA16A9A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:40:31 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id a13so6974396iee.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hjUvgT0GjqOTdRZCO6Voorrq7M17Ocx6kt2D2M0/uRs=;
	b=dKStuyKnI0+DczK4qI0E6dPiDLWqS/U8p/tK9xGwbKziysJ6Dtdb6I37Pg8gOixYwX
	Ihcbm3b6aLT5o4Sxwjg4CTcb84CuoerYRyR3RlZIbTO1KIrwt6rdt4PGC9bpn/68PNw3
	uihtmfAp30O9Qwd3uQxo/yOkMu627qpa/gNdPvT8qhlfUiS325c6CONbNNN0rarTKu/h
	9nChXyJ9gb4HdJNFa5uiAVfNc8MVtDl4LX3iUw2JpbYThplRaA1BRSQRfWJ0tX7grlZr
	cL4qHx5LTdU/5P39uctfSSWdt4YlyByOHhKWraK4giyafuw87DLMIRSfk1bE1iBXUd/r
	bSjQ==
X-Received: by 10.50.44.98 with SMTP id d2mr1293054igm.15.1370965232698; Tue,
	11 Jun 2013 08:40:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Tue, 11 Jun 2013 08:40:02 -0700 (PDT)
In-Reply-To: <1370964404.27750.83.camel@phil-desktop.brightsign>
References: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
	<E947360C-AE06-42E4-AD51-2DA926D1448D@gmail.com>
	<1370963003.27750.80.camel@phil-desktop.brightsign>
	<CAMKF1srGhvZLyhEZbYbFepZADbAKF1kJM2ObBEjc8OevQ5CCqQ@mail.gmail.com>
	<1370964404.27750.83.camel@phil-desktop.brightsign>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 08:40:02 -0700
Message-ID: <CAMKF1sp=uG4hOUrEgXjcni+e0e3+vXPwOqG9BExXigZBh0uRZA@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] get minimal rootfs to be even smaller
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
X-List-Received-Date: Tue, 11 Jun 2013 15:40:31 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 11, 2013 at 8:26 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2013-06-11 at 08:22 -0700, Khem Raj wrote:
>> On Tue, Jun 11, 2013 at 8:03 AM, Phil Blundell <pb@pbcl.net> wrote:
>> > Er, don't RRECOMMENDS always go into the build dependency list?
>>
>> if they do then whats the difference between DEPENDS and RRECOMMENDS
>> functionally.
>
> RDEPENDS are required and the package manager will insist they are
> always installed.  RRECOMMENDS are optional; you can uninstall them
> after the fact, and you can (with some package managers at least)
> declare them to be BAD_RECOMMENDATIONS which will be ignored.
>

yeah now I see the code build is going to build RRECOMMENDS automatically hmm.
Do BAD_RECOMMENDATIONS work with rpm ?

>> since now rrecommended packages will always be available and they will
>> always make into images.
>
> You say "now", but as far as I know it has always been thus.  If it
> wasn't then the set of packages that get installed in the image would
> depend on what things you happened to have lying around in your deploy
> directory, which would not be a very good thing.
>
> p.
>
>

