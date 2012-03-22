Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SAhx1-0000cz-So
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 14:21:11 +0100
Received: by wibhj13 with SMTP id hj13so646823wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=+dsNF0joH8u4oGyXQiNUYvjRtGVpgmuHcZYv1Fl08EI=;
	b=TbGMIOs2IvjdBflQJLUwBKSf9a9pVTgigZBuchGb58Y1SDfMMYKcwV9QTkxazImmZb
	9PgZHM1EF+v1KC06ofUvfj5+8w84VDQUHcF7A2z6F3Ah31QL1qsrOkpTEBhmpxqLYeCW
	uKhYcWmZMHCqTUe76OZET24xAYoavn800cF10V0+VJDv0JRs0gO7nOCkfScmjGgWfDlX
	6ndeRv6duxeC/G0+fpTw/Jw+4Ok2RT4EZzSdXCpfTWmAV76kDOgvRxf6OCIKZjWWTNjC
	Z88VoXF4Yz1HdcYVYn8upgngoLljf/8cVnY1gWU/mra6INnOBWJUOkL6uebX+56HMOxg
	F2SA==
MIME-Version: 1.0
Received: by 10.216.143.91 with SMTP id k69mr4642016wej.65.1332421937155; Thu,
	22 Mar 2012 06:12:17 -0700 (PDT)
Received: by 10.216.38.135 with HTTP; Thu, 22 Mar 2012 06:12:17 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1203220909490.29951@oneiric>
References: <alpine.DEB.2.02.1203220701270.14555@oneiric>
	<CADkTA4O7=3AxSoTJLp-fTRXiv=T0ybrM3N6m0Ti8BkHsy7Y4Ww@mail.gmail.com>
	<alpine.DEB.2.02.1203220909490.29951@oneiric>
Date: Thu, 22 Mar 2012 09:12:17 -0400
Message-ID: <CADkTA4MasUGy_VbHQsF6We4yKGVQ+8gxNC7VhPjOjGOF+5QNfw@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Mar 2012 13:21:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 9:10 AM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
> On Thu, 22 Mar 2012, Bruce Ashfield wrote:
>
>> On Thu, Mar 22, 2012 at 7:05 AM, Robert P. J. Day <rpjday@crashcourse.ca=
> wrote:
>> >
>> > =A0perusing the file meta/classes/kernel-yocto.bbclass and saw the
>> > following snippet around line 287:
>> >
>> > =A0 =A0 =A0 =A0# nothing to do if SRCREV is AUTOREV
>> > =A0 =A0 =A0 =A0if [ "${SRCREV_machine}" =3D "AUTOINC" ]; then
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# restore the branch for builds
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0git checkout -f ${KBRANCH}
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return
>> > =A0 =A0 =A0 =A0fi
>>
>> You can completely ignore this, I've tossed it all out in pending
>> updates. But if you set AUTOREV and dump the SRCREV .. you'll see
>> that it actually is AUTOINC.
>
> =A0cheerfully ignored, except that the poky ref manual should be
> updated to reflect this.

I'll leave that to others to confirm, the above was my observation when wor=
king
on my meta-kernel-dev efforts. It may or may not be completely correct :)

Bruce

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
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


