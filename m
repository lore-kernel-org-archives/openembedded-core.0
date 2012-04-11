Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SHxRO-0002SF-Ef
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 15:18:30 +0200
Received: by pbcum15 with SMTP id um15so1081666pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 06:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=DOSdEuHk/tc0R19Xf5UQdIqOn7CwgHvlcmCGv9NJkuo=;
	b=G8zRmERLn0eCWTpMwxtvtMJmom5r5NlvgOoIPpVaD0z1Iw/oOCY1ywc2UxSJOYzgi6
	PCG8JOqCZaxtps3xqrs0gH8VS6E87hAfYxC7Ek0K6TSi6VoYlkvF/u3uAehd8rcUKK9s
	JOW7+GpYH6bqJObeJUTwGSlhzQEJFNgrzB9QDoJHCvnNtjre85n9j8P/MBrXy6rVMa72
	PgQw5IUtMijxqhyAUD2R/wTax0LS4e72Kq8xGJKPqUdLb1Q1gkHHSeQGGoALOeatgPnu
	C1JrDG8SnUjfBuPuZQkWu/gs2QdXNsDkxmnWf3WW9iBaeuij+TvUefl8PuTZU1vlrNHe
	TDWw==
MIME-Version: 1.0
Received: by 10.68.201.98 with SMTP id jz2mr38007004pbc.97.1334149750564; Wed,
	11 Apr 2012 06:09:10 -0700 (PDT)
Received: by 10.142.180.4 with HTTP; Wed, 11 Apr 2012 06:09:10 -0700 (PDT)
In-Reply-To: <6585414.f7e2xNFMXD@helios>
References: <1333402513-26781-1-git-send-email-andrea.adami@gmail.com>
	<341D01DC-1752-407E-85E7-5DEB343AA7AB@dominion.thruhere.net>
	<CAAQYJAuc4542jJeisn=iaTo-GtPUpXvRKgrw20WhWVBCpoM4nA@mail.gmail.com>
	<6585414.f7e2xNFMXD@helios>
Date: Wed, 11 Apr 2012 15:09:10 +0200
Message-ID: <CAAQYJAsGkFkBnFXfWzcx6UTm12SY39=VU6SFKT_iTsxH6=wmtg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: generalize the check in touchscreen rule
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
X-List-Received-Date: Wed, 11 Apr 2012 13:18:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 11, 2012 at 2:55 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 11 April 2012 13:57:29 Andrea Adami wrote:
>> Finally, bluelightning reported that on ipaq h1940 the rule did not
>> match and added a .bbappend in meta-handheld.
>
> FYI this is because pressure support was removed from the driver. I don't know
> if there's ever hope of it coming back.

Well, there was a NACKed patch:

https://lkml.org/lkml/2011/6/23/817

Mark Brown:
"It seems much more sane to fix this in tslib, the kernel is not actually
reporting pressure meaningfully here and there's already BTN_TOUCH to
report if the pen is down."

Regards

Andrea

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


