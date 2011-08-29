Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qy5dq-0006k2-7X
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 19:28:58 +0200
Received: by bkbzu17 with SMTP id zu17so4304431bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 10:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lzBGVuf25hA6e61AUfdrF0UeourTo1DFt1+NSW9X3es=;
	b=vS1sBluQXMB16rmegMrLdXRW/s7vBOY5NvUa69YIeBEr1PxEJRBH5Tgv2hq7/pf18d
	jTqaovuINmn5tY6QL2YwdlHDC14UXChR3J4dKkPweuu4K1jpZvqk6Rj3vtphIsZh267w
	hMyGzP/c7zgrjKloDkuWn443MVQS7Kt7F0XAw=
MIME-Version: 1.0
Received: by 10.204.3.28 with SMTP id 28mr2547165bkl.175.1314638645756; Mon,
	29 Aug 2011 10:24:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.15.66 with HTTP; Mon, 29 Aug 2011 10:24:05 -0700 (PDT)
In-Reply-To: <1314517270.5939.268.camel@rex>
References: <CAP9ODKoei49fOtr7sySUQkbXY-yrdaF+cVydXXfwOXxtQ+8kyQ@mail.gmail.com>
	<1314394806.5939.264.camel@rex>
	<CAP9ODKp6igGGDY2AQL+VqhYZm-GmFrKKcLg=5gRMaq5jwp+2MQ@mail.gmail.com>
	<1314517270.5939.268.camel@rex>
Date: Mon, 29 Aug 2011 14:24:05 -0300
X-Google-Sender-Auth: nVfP2X9UcoXKIAfbEL3SxGiz8UU
Message-ID: <CAP9ODKpdUMKw0RUHgzy5LnEupR9+wOuan7xiekefGitHSROBbw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Use of multiple GIT repositories in SRCREV but updating PV
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
X-List-Received-Date: Mon, 29 Aug 2011 17:28:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 28, 2011 at 04:41, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> See linux-yocto as an example. You need to name the two git uris:
>
> SRC_URI =3D "\
> git://git.yoctoproject.org/linux-yocto-a;protocol=3Dgit;name=3Dmachine \
> git://git.yoctoproject.org/linux-yocto-b;protocol=3Dgit;name=3Dmeta \
> "

I did it locally and it ...:

 - does the clones in DL_DIR file
 - gets the right SRCREV for both
 - gets the right SRCPV

However on unpack it fails; it always use S as '${WORKDIR}/git' even
if I change it in the recipe.

Something seems broken on bitbake support for it.

Clues?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


