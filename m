Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDmGF-00042W-C2
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 02:33:43 +0200
Received: by qcso7 with SMTP id o7so684355qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 17:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=W2+Cl5Z9KLdRxQrwwQTHooo2lFD/m2adJbtZNeVy8y4=;
	b=sSeJ4qgsh4Ai2TD/FmlNRJgydYqToWi+h8+12ywSbmwkZuQ3aGZ4n9E/+pQ7UBXGGJ
	ZdqWo3M6CV/qL0YyjUazUXuLIgvf3Fr71ubekN1RBd96SXY0ts7X5PLrX7xy0XvVlyNH
	n+W0vmCu87JdLHrQtw2VG1uU5rVsrl0wXOkLRdlncZBpKA6LYpzmbs5whlt56XK3znLR
	MwgIbEh9d2TUrpOH4qoUmJq8pyhZ86XEivBNXRlQEohLIX4LGcxeflX9i5iqjVy9G3tu
	R2BCY/Qd+0vfDhblIDNrV+d0mLPYZMXWqoChZT5ZX4NDI8u8qR1T0zrfsUooO7QZT0R9
	Y+8g==
Received: by 10.229.134.194 with SMTP id k2mr137086qct.125.1333153477487; Fri,
	30 Mar 2012 17:24:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Fri, 30 Mar 2012 17:24:17 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1203302010020.17135@oneiric>
References: <alpine.DEB.2.02.1203302010020.17135@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 30 Mar 2012 17:24:17 -0700
X-Google-Sender-Auth: AYRUV9sYcLN9fRHkw2PWT-lyZfE
Message-ID: <CABcZANmgkHrEitjH8mHjUx06kr8XY=+jwCoL0KMritHEbcYuew@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: why does "bitbake -e" check the license of a *non*-included recipe file?
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
X-List-Received-Date: Sat, 31 Mar 2012 00:33:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 5:17 PM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
> $ bitbake -e core-image-core
> Loading cache: 100% |####################################################=
##################| ETA: =C2=A000:00:00
> Loaded 1106 entries from dependency cache.
> ERROR: This recipe does not have the LICENSE field set (rday) =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| ETA: =C2=A0--:--:--
> ERROR: Unable to parse /home/rpjday/oe/oe-core/meta/recipes-core/images/r=
day.bb: Exited with "1"
> ERROR: Command execution failed: Exited with 1
>
> Summary: There were 3 ERROR messages shown, returning a non-zero exit cod=
e.
> $
>
> =C2=A0the recipe file "rday.bb" is not being included in any of the other
> images, so why should its lack of a license file cause that kind of
> problem?

It's a parse time failure, as opposed to during execution of an actual
task, and all recipes have to be parsed to operate against any recipe.
--=20
Christopher Larson


