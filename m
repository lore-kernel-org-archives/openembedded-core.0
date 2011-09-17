Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R4tjn-0001DH-Tc
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Sep 2011 14:11:15 +0200
Received: by bke11 with SMTP id 11so11115679bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2011 05:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Tb6DeH3ykl5rxSbrRUDsjesiEj4EkmyaCqdJ/o5N4zQ=;
	b=LhRjfbJNFDhQNIahD5PY0XJ3lj5QmplX0NYVlt8izuq0Kr9zaD/HulKEU8kYP4CKV8
	FTlwaPE0SMJyJqAXUgqJPodZeegdq7ZI3HltQ0JcLvmj6pfqTjz55XrHSHGfWLMd7QeX
	DiJzxMxZA6XbSKLMWT1HXGk3T85us0IWy+u8k=
MIME-Version: 1.0
Received: by 10.204.140.88 with SMTP id h24mr330012bku.166.1316261159075; Sat,
	17 Sep 2011 05:05:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Sat, 17 Sep 2011 05:05:59 -0700 (PDT)
In-Reply-To: <BBD91366-D6E5-45DA-B6D3-FA23CCE35B16@dominion.thruhere.net>
References: <1316177653.20858.23.camel@ted>
	<201109161816.28057.paul.eggleton@linux.intel.com>
	<CAP9ODKoVOSsDOKtiv-LExuKbeGciGp4hfC=V5j-zCY8wDNwr3A@mail.gmail.com>
	<201109161849.52647.paul.eggleton@linux.intel.com>
	<CAP9ODKpqO4zN=gjOsod6UtTku6xZmRen63VBKs+_MOdjF1AAFA@mail.gmail.com>
	<4E73A769.9070903@windriver.com>
	<CABcZANnuV39P8kgBY0=cy6nvVMKbDKZVg2NTOQAn8f_wij7+_g@mail.gmail.com>
	<BBD91366-D6E5-45DA-B6D3-FA23CCE35B16@dominion.thruhere.net>
Date: Sat, 17 Sep 2011 09:05:59 -0300
X-Google-Sender-Auth: iWa8la54OB8X2M0Ww1BHo1lkvA4
Message-ID: <CAP9ODKrzVRiHJomjoDNc=8wLVMBNbKKGFOAHxON5ti0YBZaf2A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sat, 17 Sep 2011 12:11:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 17, 2011 at 06:06, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
>> I don't see why it isn't reasonable. If they need a change done sooner
>> than can be done by pushing it upstream, they can put it into a local
>> layer until it makes it into oe-core. Seems simple enough to me.
>
> Furthermore, poky is the only distro using this weird combo-layer arrange=
ment, all the others I know off (angstrom, shr, micro, aurora) consume oe-c=
ore directly.

At O.S. Systems we use combo-layer but we work at oe-core directly and
keep our repository up to date. That bring us the good of both Worlds
without making difficult to us to sync both.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


