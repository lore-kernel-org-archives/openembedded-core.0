Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QTddB-0004eQ-6O
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 19:30:25 +0200
Received: by bwz5 with SMTP id 5so4107043bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jun 2011 10:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=o42SRb+exHL/WNWJY3UQ45DXiN6Rda77AbyBE16moEE=;
	b=tOOE+HaX7mYgieZmmCgyDtFf+tkPH7Uq6etUZBofl7+yC2eVJQUvh2d8c3FB5Ta2PO
	CFAaGBeJ5DQmQvGsB216/Q3THWM6n/QAmZ14r5afdhWrmo7hZsk8czvNFUTn9/XQtS33
	PN+8BHprM7Ngu5+8pn45Sqh8OVFA36hHfGzqQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=BYLiWU8QNT1/pW/LkYDKN0fPk8fw561NJrjfduHbGeW9W4C5myi5RWEbw4UxEdeYrn
	xoZRE2H4F5b1BT8b6Bh1xtzqAIsc4qnm4GEWhafseR+yMYjl8wm55AWYAHKKlYFvb4tb
	QHAW3whDyA0nHih8TKZpL3zCESEwfaEGTcWJc=
MIME-Version: 1.0
Received: by 10.204.15.139 with SMTP id k11mr5167773bka.49.1307381227924; Mon,
	06 Jun 2011 10:27:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.116.82 with HTTP; Mon, 6 Jun 2011 10:27:07 -0700 (PDT)
In-Reply-To: <1307380473.7672.30.camel@rex>
References: <cover.1307342214.git.sgw@linux.intel.com>
	<e66fee724ac6efa49cb941a59b2fc7c61bf14405.1307342214.git.sgw@linux.intel.com>
	<1307380473.7672.30.camel@rex>
Date: Mon, 6 Jun 2011 17:27:07 +0000
X-Google-Sender-Auth: NRhbijADt1zG63W3LzdHQUBMD8U
Message-ID: <BANLkTin=ZK9g5LM60TgvtpQqiqE3TYpUJw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 10/20] package.bbclass: add support to split Qt translation files
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
X-List-Received-Date: Mon, 06 Jun 2011 17:30:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 6, 2011 at 17:14, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2011-06-05 at 23:44 -0700, Saul Wold wrote:
>> From: Otavio Salvador <otavio@ossystems.com.br>
>>
>> There're many Qt applications that provide translation files in '.qm'
>> format however those weren't being splitted as GetText based
>> ones.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Am I right in assuming all these qt applications use one of the qt
> classes?

I'd expect it.

> I do wonder if this shouldn't be part of one of the qt classes as part
> of a package_do_split_locales_append() or prepend() style function from
> a code separation point of view.

I believe there's going to have a lot of code duplication between the
two to do that.

> I do appreciate the need to influence
> the list of locales although you could do that through directory
> creation or an extra variable but we could enhance package.bbclass to
> support that.

I don't understand what you meant by this. Mind to elaborate it a bit more?

...
>> + =A0 =A0 =A0 =A0 =A0 =A0 if qm_files.has_key(l):
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 locale_re =3D re.compile("^.*(=
[a-z]{2}(_[A-Z]{2})?)$")
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ln =3D legitimize_package_name=
(locale_re.match(l).group(1))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 files +=3D qm_files[l]
>
> Regardless, this is changing ln under some weird circumstances.
> Shouldn't the code adding this to the locales list be handling this
> translation? I can see potential duplication between the arrays and a
> host of other nasty bugs with this code as it stands :/. Please take
> that regexp out of this loop at the very least.

Where do you suggest me to move the regexp to?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


