Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QcbWl-0002RA-OB
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 13:04:52 +0200
Received: by pvf24 with SMTP id 24so2612421pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 04:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=kOfSxKyVz7NFqkIONlnGTCgfAnju3CGHRJqzmHYTESc=;
	b=Swfq+Onn0/H3e9AwZIg3rFi7gB34OpP3DrrKJYu9CTog66LEegxYi2AcQUBQxLpx/p
	GkcbU/yHvrH0/yvsitUkVRrGYu+vK9xxnon87sDTMlFEMWs3gA85vWf25xASAOEghlgR
	dytKBcSJaODO//DJWcjkqDwNRk5qKnzakai+Q=
MIME-Version: 1.0
Received: by 10.143.2.11 with SMTP id e11mr1349749wfi.365.1309517623165; Fri,
	01 Jul 2011 03:53:43 -0700 (PDT)
Received: by 10.142.142.18 with HTTP; Fri, 1 Jul 2011 03:53:43 -0700 (PDT)
In-Reply-To: <1309516055.7987.123.camel@desktop.home>
References: <1309453832.7987.33.camel@desktop.home>
	<1309472051.20015.465.camel@rex>
	<1309516055.7987.123.camel@desktop.home>
Date: Fri, 1 Jul 2011 12:53:43 +0200
Message-ID: <BANLkTi=ptn9KrXjdfzu62BWJ0XZPFtcGOQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Proposal: recipe feature switches
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
X-List-Received-Date: Fri, 01 Jul 2011 11:04:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<cut>

> Some worthwhile configuration can't be expressed in terms of high-level
> distro features (i.e.: usb, bluetooth, alsa etc...). =A0What about "I wan=
t
> SSL support, but NOT in library foo". =A0That case can't be covered by
> distro feature 'ssl'.

see  http://www.gentoo.org/doc/en/handbook/handbook-x86.xml?part=3D2&chap=
=3D2

"Declaring USE flags for individual packages"
Sometimes you want to declare a certain USE flag for one (or a couple)
of applications but not system-wide. ...
.."

>
> Embedded developers are going to need to configure packages for their
> own application, if we provide an interface to do it, then that has to
> be better than everyone inventing their own methods.

Why reinvent the wheel? See above.

<cut>

This discussion about flags/switches is recurring now and then. It's
becoming a classic :)
Now, the detractors have argued that those flags would be a nightmare
for people packaging feeds, with no way for the package manager to
detect those different recipes with the same name.

Are we still standing there?

Regards

Andrea


