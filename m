Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S24NO-0006Ho-Iy
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 18:28:42 +0100
Received: by vcbfl13 with SMTP id fl13so1256905vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 09:20:15 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.220.156.139 as permitted sender) client-ip=10.220.156.139; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.220.156.139 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.220.156.139])
	by 10.220.156.139 with SMTP id x11mr9126856vcw.18.1330363215842
	(num_hops = 1); Mon, 27 Feb 2012 09:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+KiNY9vUSsBPR4ChVRVJHBw3MKyi+nJqqeMQ2a3VyIk=;
	b=G/I7Bb4rhKfI92f1unaKSKHMb3T6MxauGpdSOk6aOLHFnF3zeevre0wS1/w1cr6QYT
	AJ9u28qOqIvXUQL2iKiJNrtelGaihhml77m1PL6/1Jl4i4jR4yFFHqq5XS6/azZE6eS3
	e47JroqnUnUfbxWa0EVsKYWJLizDBVpRweuWk=
MIME-Version: 1.0
Received: by 10.220.156.139 with SMTP id x11mr7382783vcw.18.1330363215795;
	Mon, 27 Feb 2012 09:20:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Mon, 27 Feb 2012 09:20:15 -0800 (PST)
In-Reply-To: <1330362610-12851-1-git-send-email-obi@opendreambox.org>
References: <1330362610-12851-1-git-send-email-obi@opendreambox.org>
Date: Mon, 27 Feb 2012 14:20:15 -0300
X-Google-Sender-Auth: Z9Q-ndZnytbOR8FVtsnklv7JLpM
Message-ID: <CAP9ODKr1faEWrO877gfeMkutp8_STOvNp81iA00uiC0w46A1qQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4.inc: depend on tiff
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
X-List-Received-Date: Mon, 27 Feb 2012 17:28:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2012 at 14:10, Andreas Oberritter <obi@opendreambox.org> wr=
ote:
> * Fixes the following error with qt4-embedded-4.8.0 and possibly others:
>
> | ../../../gui/image/qtiffhandler.cpp:48:20: fatal error: tiffio.h: No su=
ch file or directory

Please bump INC_PR.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


