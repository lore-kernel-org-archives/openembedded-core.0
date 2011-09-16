Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R4c8p-0001uo-Ty
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 19:23:55 +0200
Received: by wwf27 with SMTP id 27so4304552wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 10:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=JTlLIJPjSxkirLzMbHLj9C8+xo3w4QeuVG4L3J60RSc=;
	b=RD5hxCwDxiwsuqYXoLHyqQhCaTM/7nFmNDHDcMCJIzkoqm1UrBf9lw9C+tWJe9b0wj
	B2aYHWo9ic1sdgewZjIMHoVV8zKmWVbwmT2KmIRC0n/ikb3wE9XjWztMnQVQkVyhpjMR
	SGXnhe0PhPfsB+fVr5wag3Piu/xw2zou/j3Z0=
MIME-Version: 1.0
Received: by 10.216.188.65 with SMTP id z43mr1498840wem.15.1316193523195; Fri,
	16 Sep 2011 10:18:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.138 with HTTP; Fri, 16 Sep 2011 10:18:43 -0700 (PDT)
In-Reply-To: <201109161816.28057.paul.eggleton@linux.intel.com>
References: <1316177653.20858.23.camel@ted> <1316191921.20858.43.camel@ted>
	<CAP9ODKrdQNa09B7o_Vv6h=OJwuBU_CWRMVnYRmCU_4gOMww9LQ@mail.gmail.com>
	<201109161816.28057.paul.eggleton@linux.intel.com>
Date: Fri, 16 Sep 2011 14:18:43 -0300
X-Google-Sender-Auth: 9gXsYRnbQEoa3W2NBMpr0shTWN4
Message-ID: <CAP9ODKoVOSsDOKtiv-LExuKbeGciGp4hfC=V5j-zCY8wDNwr3A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core release process
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
X-List-Received-Date: Fri, 16 Sep 2011 17:23:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 14:16, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 16 September 2011 18:08:04 Otavio Salvador wrote:
>> More then once I wanted to pick a patch that was in poky and not yet
>> merged into oe-core and it wasn't that easy to split it.
>
> Can you give a specific example of this?
>
> Since the split, there have never been any patches intentionally merged i=
nto
> poky's OE-core parts that were not already in OE-core. (There were a few
> isolated occasions where some accidentally slipped in, these were rectifi=
ed as
> soon as they were discovered.)

They all ended up in oe-core the problem is when they're not yet
merged but I want to merge them into my tree for use, test or
anything.

The combo-layer was one example. It was made available on poky contrib
tree and I had to manually export the patches instead of pulling it
into a branch for testing.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


