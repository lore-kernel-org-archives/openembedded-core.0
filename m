Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QRUoB-0003gd-K1
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 21:40:55 +0200
Received: by fxm19 with SMTP id 19so3826285fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 12:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=181gnjoMcfU02/HvYLHYneCnZtTgBPu9xhAuYWBOc6s=;
	b=eXA5fBfCrwTSgxLCu/Xa01nvxRS7zW1EFvP78jstCdFWn4gjE0s55ILDILtj0Y32pq
	iPYi1j4hYDH56aVwRgXQAC55VxAxQMXFY6gKBnquyP2G849ndOltiN/9/eG8fqXTyw9B
	TETGJAr3/BdTsT6riV9maUEgakMtYHP7zcty4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Lj7yAM/8LfS+ESPdQ1OXHupkaxW1Je+Y9tq5o17pT6L4pHmdBPfeVO4EggCJePHdu0
	v0EK1zSLNlenZzQpW4pyE/SuPvxgYkwttZ5YxpOAQQPYaJ7ozu+r3fvCyeSHzDlIDjhB
	f6sI0jfglACG0OS3u3HxiPC6PstiRyeqxheCc=
MIME-Version: 1.0
Received: by 10.223.27.18 with SMTP id g18mr7318262fac.52.1306870666095; Tue,
	31 May 2011 12:37:46 -0700 (PDT)
Received: by 10.223.70.202 with HTTP; Tue, 31 May 2011 12:37:45 -0700 (PDT)
Received: by 10.223.70.202 with HTTP; Tue, 31 May 2011 12:37:45 -0700 (PDT)
In-Reply-To: <52C5B1F0-9BDF-46F7-A8BC-2AB020E0E47A@dominion.thruhere.net>
References: <53EA452E-5E40-471F-8AF7-BE8303945241@dominion.thruhere.net>
	<4DE34507.2090107@eukrea.com>
	<C74466A4-5C79-4E68-8D19-443498EF130E@dominion.thruhere.net>
	<4DE34B8D.5080907@eukrea.com>
	<52C5B1F0-9BDF-46F7-A8BC-2AB020E0E47A@dominion.thruhere.net>
Date: Tue, 31 May 2011 21:37:45 +0200
Message-ID: <BANLkTik8su=ArRUejSHVqHbbLv7-ZiR28g@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Any volunteers for fixing all the kernel version checks?
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
X-List-Received-Date: Tue, 31 May 2011 19:40:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On May 30, 2011 1:52 PM, "Koen Kooi" <koen@dominion.thruhere.net> wrote:
> Op 30 mei 2011, om 09:47 heeft Eric B=E9nard het volgende geschreven:
> > On 30/05/2011 09:33, Koen Kooi wrote:
> >> Op 30 mei 2011, om 09:19 heeft Eric B=E9nard het volgende geschreven:
> >>> On 30/05/2011 08:52, Koen Kooi wrote:
> >>>> As some of you might have seen already:
http://lwn.net/Articles/445223/ - linux 3.0 is going to happen.
> >>>>
> >>>> This means all the crufty "is it 2.4 or 2.6" checks are going to nee=
d
a rework :)
> >>>
> >>> Does supporting 2.4 kernels still makes sense in 2011 ?
> >>
> >> No, but I bet there are still checks present for that :) Or at least
references like modprobe.26.
> >
> > so can the fix be : remove any reference to the check and assume we are
using a 2.6/3.0 kernel ?
>
> That would get my vote!

My vote too.

I hope too be able too take a look at this, unless someone else has done it
by then. However, it'll be one or two weeks before I get the chance too loo=
k
into this. And then I won't be able to spend that much time on it, this out
might take a little while...

So it's quite likely that someone else will beat me to it.

Regards,
Anders

