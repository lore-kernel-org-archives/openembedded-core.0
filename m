Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SAhss-0000Vp-5G
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 14:16:54 +0100
Received: by wgbdr12 with SMTP id dr12so1177945wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 06:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=aZNf1YaT33RbdXBGpuurfcP0QVRcqdvFKaXKqJ54Auw=;
	b=u3nfbTMQ/AnJNj+2yP+rujLwVeewZI0BgsfqLDncAMze20H1STEYs5XLQ36FY7R4VK
	4sLTYFIzicC+oOyaTOuii+Fnq8oh4vIhpHf+TcJiKQgo+7C7iFcFGGujOJaI3Kq83bF1
	JOBVtBskoVFOZz5Db3S7vIcVnRZYUZEaFefSC3l0i5A9SEnE8wcUtNnQNbXs/QpmRSzX
	Y35TIjJuCUAYrE8ilNXRBzSiQDjGDJn/YDltwhuVjbO5wRtIPqc9WQhaHiTjPjnBkeMP
	VkOoFGzY7YB0JpCozG7iusK0QjE8By7clU2hXybyT3StJqxKWUZEm8d2lCt+AGnA+VJW
	YoZA==
MIME-Version: 1.0
Received: by 10.216.143.91 with SMTP id k69mr4633058wej.65.1332421679402; Thu,
	22 Mar 2012 06:07:59 -0700 (PDT)
Received: by 10.216.38.135 with HTTP; Thu, 22 Mar 2012 06:07:59 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1203220701270.14555@oneiric>
References: <alpine.DEB.2.02.1203220701270.14555@oneiric>
Date: Thu, 22 Mar 2012 09:07:59 -0400
Message-ID: <CADkTA4O7=3AxSoTJLp-fTRXiv=T0ybrM3N6m0Ti8BkHsy7Y4Ww@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: AUTOREV vs AUTOINC?
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
X-List-Received-Date: Thu, 22 Mar 2012 13:16:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 7:05 AM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
>
> =A0perusing the file meta/classes/kernel-yocto.bbclass and saw the
> following snippet around line 287:
>
> =A0 =A0 =A0 =A0# nothing to do if SRCREV is AUTOREV
> =A0 =A0 =A0 =A0if [ "${SRCREV_machine}" =3D "AUTOINC" ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# restore the branch for builds
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0git checkout -f ${KBRANCH}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return
> =A0 =A0 =A0 =A0fi

You can completely ignore this, I've tossed it all out in pending updates.
But if you set AUTOREV and dump the SRCREV .. you'll see that it
actually is AUTOINC.

Cheers,

Bruce

>
> the comment doesn't seem to match the test -- "AUTOREV" as opposed to
> "AUTOINC". =A0just an observation.
>
> rday
>
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 Ottawa, Ontario, CANADA
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0http://crashcourse.ca
>
> Twitter: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 http://twitter.com/rpjday
> LinkedIn: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 htt=
p://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


