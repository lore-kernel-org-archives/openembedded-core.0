Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QOWkM-0006Aw-90
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 17:08:42 +0200
Received: by pwj9 with SMTP id 9so2692581pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 08:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=1aNcdkpyedzzSdfAVWfLluT5WZ8X4Uv3c88EgRXuMgs=;
	b=HvQwQaTyEBvY2MT7IKM96mE7T0MGxEvxYM7cyuFb5jmCBMf2qiapgvIVK5QS23MRrG
	Pdv0t0iRnOEmVdlYa5b9vTAhUNsDYkKdR17O4lzOuCZfjahr75XKkJPOogl9owzqObJT
	DkXjbIyVIFm+l8NU8+SZThg8Lu0QIxQ7sAQtw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=frFBd8BcwfwkQt3xQnIbIFNhmpkuSXRufs9zfkncgz7EOYME6XBq4BSg/Tw6UyM0FG
	XU2K1zYkh6HT+KjnLdRdmguysOVZ4OpGR6zUMcilzroT8Enlv3Vz3lH2D/eFbrtT9/6U
	71kvMtDkpzb1vwrBEq2jQD/uOTZ04Fqv/tqVI=
MIME-Version: 1.0
Received: by 10.68.5.227 with SMTP id v3mr2177741pbv.420.1306163137993; Mon,
	23 May 2011 08:05:37 -0700 (PDT)
Received: by 10.68.42.5 with HTTP; Mon, 23 May 2011 08:05:37 -0700 (PDT)
In-Reply-To: <30D0F892-6777-491B-A414-1C44EFDDAED2@dominion.thruhere.net>
References: <1304755709.30391.187.camel@rex>
	<BANLkTi=x2xuJaGGNSq4eT5Cp2wVW0NnhBA@mail.gmail.com>
	<BANLkTi=J5nGBSUVMLSfbJo+RpsMk-OCU9g@mail.gmail.com>
	<1304756644.30391.189.camel@rex>
	<BANLkTikVXbDNTE_Nt-ptxGjeQN5_RYcp-A@mail.gmail.com>
	<1304758267.30391.190.camel@rex> <1306161789.3424.856.camel@rex>
	<BANLkTi=X=KYL=7BQ+yRpaRE9D7QAUsQa1w@mail.gmail.com>
	<30D0F892-6777-491B-A414-1C44EFDDAED2@dominion.thruhere.net>
Date: Mon, 23 May 2011 11:05:37 -0400
Message-ID: <BANLkTin58EZ2_vCyEycS4pyw61bXEf1JcQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Unable to push to the repository?
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
X-List-Received-Date: Mon, 23 May 2011 15:08:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2011 at 11:02 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 23 mei 2011, om 17:01 heeft Cliff Brake het volgende geschreven:
>
>> On Mon, May 23, 2011 at 10:43 AM, Richard Purdie

>>> and its broken again once more :(
>>
>> Its fixed now. =A0The root cause has also been fixed, so I don't expect
>> this to be a problem in the future.
>
> Out of curiosity, what was the root cause?

Gitolite insists on creating the description file in the repo needed
for the CIA script.  In the past, this was created manually, and every
time we pushed a gitolite change, it got deleted because gitolite did
not know about it.  Now that we have told gitolite to create the
description file, everyone should be happy.  I added notes to
gitolite.conf to hopefully make this a little more obvious.

Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


