Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id E6B906B3EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 15:27:48 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id xb4so1877492pbc.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 08:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=lO7BTQ55ZUnRgcIfeuly/wmCSaPIjdvaFLUf37TIJa4=;
	b=vs8SCBITkwZVFIoaDknB4COVV7vzutPAUxSIz8LJCAghZaIzZfiMlqtZ7wp/tMQRw+
	gKWqicioNSqMzWsYv59x7Sc+9Nf6LxiycvfTqv6nfThPGS1I1yUX104XjxHiO2mrTn3Z
	upCQfG+Vl6XLeoQNVWRLB99OhLagf604LNktT0LeRhfLPaFNvwRq32rHVhl35QqSRIOC
	1VWLZbzI5qVtzz3g6bXopbg8y0kN5aeSE9C+f/JAycx1XpmS2MKFYI7Wi2rbXeBimJlH
	LPTZyJQ/oLyikm7EBWhpZVJ41/oVzDKjOmDPbJBkjnKrVODrqbGHH/OOLZkczyqKLQz0
	gdPQ==
X-Received: by 10.66.169.42 with SMTP id ab10mr76214510pac.14.1375198069575;
	Tue, 30 Jul 2013 08:27:49 -0700 (PDT)
Received: from ddeviny-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id sx7sm2280930pbc.41.2013.07.30.08.27.48
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Jul 2013 08:27:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1375197856.8017.7.camel@phil-desktop.brightsign>
Date: Tue, 30 Jul 2013 08:27:47 -0700
Message-Id: <825C7047-80C1-4FCF-B7F3-6F0895C41C36@gmail.com>
References: <1362529925-13211-1-git-send-email-obi@opendreambox.org>
	<1372758642-6302-1-git-send-email-obi@opendreambox.org>
	<1375197856.8017.7.camel@phil-desktop.brightsign>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH v3] chrpath.bbclass: strip common parent directories from rpath
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
X-List-Received-Date: Tue, 30 Jul 2013 15:27:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 30, 2013, at 8:24 AM, Phil Blundell <pb@pbcl.net> wrote:

> On Tue, 2013-07-02 at 11:50 +0200, Andreas Oberritter wrote:
>> Allows to use shorter TMPDIRs in corner cases, e.g. with native
>> perl modules, having a deep directory structure.
>>=20
>> The problem is that the original absolute rpath may be shorter
>> than the newly generated relative rpath.
>=20
> Can we not just fix chrpath to cope with the case where the new path =
is
> longer than the old one?  It seems a bit sad to require
> ever-more-convoluted workarounds for what is essentially a tool =
problem.
>=20

another option is to dump chrpath in favour of something which does it =
elegantly - patchelf
I had propsed patch set for that last year here

=
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/patche=
lf


> p.
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


