Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuXfh-0007rI-Nz
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 00:08:29 +0100
Received: by lahc1 with SMTP id c1so3532644lah.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 15:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=F4JcpzvWlOjOuuT+hpZ2FMKWqVn3k1QsVHE/zpcdG8U=;
	b=gsjm8mlpWHKwTkNsPRrWlKlhAczO+L+6mQYBcBzj9eX/UAvnO3dupqvIjwNE2lZxOa
	FknuUrjY9d/QVicTcRje2O/8FnzN/v1Q97EhldRSS3AnI7F+KFaIebea0bUm2gEWuHeh
	ddKRxLnd+OkKYhslzwM11hUB+79mfTHB7ntrQ=
Received: by 10.112.101.34 with SMTP id fd2mr5435782lbb.16.1328569228245; Mon,
	06 Feb 2012 15:00:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 6 Feb 2012 14:59:58 -0800 (PST)
In-Reply-To: <1328559652.2716.217.camel@x121e.pbcl.net>
References: <CAMKF1spO-FVweKU21EdHK-Rs5gc4qun=JRYnwMWc88SOSeQufg@mail.gmail.com>
	<CAMKF1soq=EaZ4KMb7McFcEjNyTVT2sMHPHvEr11+kL603iCOUQ@mail.gmail.com>
	<1408084.uBj8QddilE@helios> <1328543751.14363.11.camel@phil-desktop>
	<4F302D77.7030902@balister.org>
	<1328559652.2716.217.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Feb 2012 14:59:58 -0800
Message-ID: <CAMKF1soeEj0fd6QsQcmWtHBfYro4oOBM+VbHSTW-NhOOtCedOg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Duplicate recipes in meta-oe
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
X-List-Received-Date: Mon, 06 Feb 2012 23:08:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 6, 2012 at 12:20 PM, Phil Blundell <philb@gnu.org> wrote:
> And, given that the idea of a separate /usr does still have some
> currency in the Unix world, it doesn't seem unreasonable for oe-core to
> support it. =C2=A0But equally, where that support carries a cost, I think=
 it
> would make sense for there to be an easy way for DISTROs to opt out of
> it.

well said Phil I have always been in favor of doing something like
that instead of unconditionally ramming patches down the throats of
different packages to support it
since it does come with maintenance cost.


