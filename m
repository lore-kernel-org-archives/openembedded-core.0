Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Uc26k-00009k-RJ
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 01:24:43 +0200
Received: by mail-pb0-f47.google.com with SMTP id rr4so1570729pbb.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 16:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=a6iMdWFyhbxbwDuFZgxff3CP00LouN1hUWaxsYdSSDs=;
	b=edTulsahnEvgwFhzds77ndsf81vLOR9el8lqgZnrGF78ORIOuoEwRjOVLrrf7PY8N7
	GZYCWzTfJa0dyNMKS29343FOmBllE8NsarvQEwKayTTnafNDPT/DoJE1TuhrcM9USDPq
	UBaaZi7XoC7EAImrKGwi8CjeVjXtGcg0X7sNAziJ5rxPQis/F7FAGWdG+XhbR7JD4cKq
	5EofBHIv929yjYWp9bzbfDuj5O8Yphpjh77c1jk+vFLSNMdc+h/6uukJBPsGwTGOHm8t
	6iCnk/c2EbIqI4TI2GOqcz0AcYm639ODEb/BxioyrMU5ak371HxR4fvs62Jd21zW9DKl
	qa4w==
X-Received: by 10.68.202.7 with SMTP id ke7mr30785940pbc.82.1368486391696;
	Mon, 13 May 2013 16:06:31 -0700 (PDT)
Received: from vjalali-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id 10sm15531057pbr.45.2013.05.13.16.06.30
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 May 2013 16:06:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAHUNapRxc1m3fF10sFm2kXHSw=isw1cNbdK5e-2w7v99zsFZ5g@mail.gmail.com>
Date: Mon, 13 May 2013 16:06:31 -0700
Message-Id: <BEFE9967-7663-4545-8FD8-D5691D339E38@gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
	<A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
	<CAHUNapRxc1m3fF10sFm2kXHSw=isw1cNbdK5e-2w7v99zsFZ5g@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
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
X-List-Received-Date: Mon, 13 May 2013 23:24:49 -0000
X-List-Received-Date: Mon, 13 May 2013 23:24:49 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On May 13, 2013, at 3:50 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> On Mon, May 13, 2013 at 6:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> =
sysroots/x86_64-linux/usr/bin/mips64-angstrom-linux/mips64-angstrom-linux-=
gcc -v
>=20
> angstrom??!
>=20
> angstrom -> poky?

doesn't matter whatever your distro is.


>=20
> sysroots/x86_64-linux/usr/bin/mips64-poky-linux/mips64-poky-linux-gcc =
--version
> mips64-poky-linux-gcc (GCC) 4.7.2
> Copyright (C) 2012 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There =
is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR =
PURPOSE.

hmm ok so its 4.7=


