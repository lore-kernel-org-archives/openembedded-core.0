Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJmMr-0008W6-Vg
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 14:48:50 +0200
Received: by wye20 with SMTP id 20so5198696wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 05:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=n2ixQ7avsdE/KBm3vnWlIFY8QKj+xsMXSkjKB0CCmtk=;
	b=IDd7oQNSQLY1nE/zKqzdci/UrDG3Z9pzFgtIx6O+PKd05G+c2P6XjnwoQs6vLS2X7L
	iKHVIo9dnItAt23Ozqx7WD3yGiroMrE/NXoRQ5KMUTrYY9Y8k0rYtG2wDpPatNUPuGl6
	/0JI6T08pUBDgY/IjokLK45PvwE8YDEtSfV6g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=a4ROUP3JZTdDAT4wWCpQZn/bM7DNdqoafK+zqE6NuXBbdvFPoiI5LeKSSqvNb8ADos
	Jo9K1k+wBOw/4tQm3a2mcNPTbpXRy9IdR6v3SMi7kEMiIJmRu89ck5l2EP1ROu/Gq269
	6CWmFQOAgv/BwF5TPbTbxw4oS8GaMqopnmrgw=
MIME-Version: 1.0
Received: by 10.216.221.22 with SMTP id q22mr1586145wep.37.1305031564095; Tue,
	10 May 2011 05:46:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Tue, 10 May 2011 05:46:03 -0700 (PDT)
In-Reply-To: <733146FF-622B-4EB5-9EDD-40C79CB4FE3C@dominion.thruhere.net>
References: <cover.1305004776.git.sgw@linux.intel.com>
	<118af5382d7c13327de95c46e4976ed7863ba3d0.1305004776.git.sgw@linux.intel.com>
	<1305017031.30391.247.camel@rex>
	<733146FF-622B-4EB5-9EDD-40C79CB4FE3C@dominion.thruhere.net>
Date: Tue, 10 May 2011 09:46:03 -0300
X-Google-Sender-Auth: fGcUozey6EILncptbdWOHi23o9Q
Message-ID: <BANLkTi=j7VD6fDQ1SFbGCVV5n2qDSLEMUQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 26/30] qmake_base.bbclass: add generate_qt_config_file task
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
X-List-Received-Date: Tue, 10 May 2011 12:48:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 06:20, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> And consider the case of building without MACHINE and distros having a di=
fferent staging layout. I know angstrom has one to enable parallel builds o=
f uclibc and eglibc.

In this case what we ought to use?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


