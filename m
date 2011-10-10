Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RDMKw-0003zr-11
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 22:20:34 +0200
Received: by bke11 with SMTP id 11so8951740bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 13:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=hBRWN7UblBn9VbK/IYTw05X+ZfqxTQNIFaylqw6mSEw=;
	b=o8aA/vm/x9ekhB8y3Heww3oOKQQeD8nm1kEEaV9/L9I0ARseksRbq2AR3OFL2bG5c7
	udpDOoApTD5r1F3r7Mjemy32QEN1JOX7WTLbe2C853+s1djd6jH7pByEujGp8KLSja0W
	1YdfYH5rmWBlZI/f24RXQFtzymnqCZ48zkqAY=
MIME-Version: 1.0
Received: by 10.204.129.74 with SMTP id n10mr7263075bks.59.1318277693169; Mon,
	10 Oct 2011 13:14:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.138.72 with HTTP; Mon, 10 Oct 2011 13:14:53 -0700 (PDT)
In-Reply-To: <CDD7988D-2486-484F-B1A5-347A38D64F01@dominion.thruhere.net>
References: <678AE8F3-DBF3-4315-83A5-AA2CA040C5D8@dominion.thruhere.net>
	<CAP9ODKq+9Bhu9A8jZhYH-uBVSWcncsNQvAxyNxLnG133J237iA@mail.gmail.com>
	<CDD7988D-2486-484F-B1A5-347A38D64F01@dominion.thruhere.net>
Date: Mon, 10 Oct 2011 17:14:53 -0300
X-Google-Sender-Auth: 7aqBstPGoeaK82U7bcvx94nLNUc
Message-ID: <CAP9ODKrz1nVjCyBAoWA_mcVwSmG7kgCBSTn2hkLksHW6sj1U+g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Multiple git repos in SRC_URI and/or git submodules support
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
X-List-Received-Date: Mon, 10 Oct 2011 20:20:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2011 at 17:01, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
>
> Op 10 okt. 2011, om 21:40 heeft Otavio Salvador het volgende geschreven:
>
>> On Mon, Oct 10, 2011 at 15:19, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>> ...
>>> I'm not going to do 1), 3) is unlikely, so I want to ask if 2) is alrea=
dy supported. I've seen various patches that add an 'unpackdir' or similar,=
 but I can't find any docs on it. Can someone enlighten me on the current s=
tatus of that?
>> ...
>>
>> Yes, this works. I have added support to SRCREV_FORMAT into gitpkgv too =
;-)
>
> So what's the magic param I need to pass to the fetcher to make this work=
?

Basic example:

SRCREV_main =3D "..."
SRCREV_core =3D "...."

SRC_URI =3D " \
  git://fooserver/git/foo.git;name=3Dmain \
  git://fooserver/git/foo-core.git;name=3Dcore;destsuffix=3Dgit/foo-core"
S =3D "${WORKDIR}/git"

SRCREV_FORMAT =3D "main-core"

Enjoy ;-)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


