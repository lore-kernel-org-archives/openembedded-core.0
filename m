Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SUP61-0005DS-EM
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 23:15:54 +0200
Received: by vbbfr13 with SMTP id fr13so54154vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 14:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=okmXxE1SlXOarXgtuIBPYZlXwx6e+ThQSTcm+WC76vM=;
	b=QYn9quuSodjj2jI+QJbctu6o7NNepfPVOnlgtcd1tdtVc7mGGciXFeLT7UONtAz6Rb
	d/BFTL7PtO+/OeRq3jf63pyEzMAH0F+f5rsJnNGKT/yySZpJXrDaAHLSwwxGXHcSzfz3
	Kw8gjIboYXNETopZzqNa+akX/5l9Ihdbb8zac/TB6cGaYao0LxjQ4dUqagJUgWmfomgs
	FHlHsaUNtWfsa70bQylHmJUhkHhUSdaEQp0UQjOnFMFzQP/j1/bM/tmKC2/c6lxJdCVf
	9llJEq41x+d64+eHB0xLGfNlZ7GoGFBFpoW17GmmQTL2c9RmhurRDhVTHOfB7ViTlwUt
	aqug==
MIME-Version: 1.0
Received: by 10.220.115.81 with SMTP id h17mr243143vcq.66.1337115952463; Tue,
	15 May 2012 14:05:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.152.82 with HTTP; Tue, 15 May 2012 14:05:52 -0700 (PDT)
In-Reply-To: <CAMKF1sp-_t6J293dnycC6xxWDuregBoXq9ymh41Vz2zNDf_7eA@mail.gmail.com>
References: <cover.1337114347.git.otavio@ossystems.com.br>
	<1a12675b146fbaf56ff3e9505885c5f9f4ecbd26.1337114347.git.otavio@ossystems.com.br>
	<CAMKF1sp-_t6J293dnycC6xxWDuregBoXq9ymh41Vz2zNDf_7eA@mail.gmail.com>
Date: Tue, 15 May 2012 18:05:52 -0300
X-Google-Sender-Auth: AcU2Jk6saHz34Hu3fxIu4mYcaIU
Message-ID: <CAP9ODKrp3MF6jFfbhgAhu0Phiv4nBW+e4ADfyfY=gXoSo6LMkg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kmod: fix installation path of pkgconfig files
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
X-List-Received-Date: Tue, 15 May 2012 21:15:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2012 at 5:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, May 15, 2012 at 1:39 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> The pkgconfig files need to be installed in ${libdir} instead of
>> ${base_libdir}.
>
> Looks ok to me

As discussed on IRC we ought to move the .so file to ${libdir}; I am
busy at work fixing other stuff to support gcc 4.7 and cannot work on
that now but will look at it later.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


