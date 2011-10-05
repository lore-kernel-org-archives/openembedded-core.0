Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RBQNw-0004Cd-Q6
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 14:15:41 +0200
Received: by bke11 with SMTP id 11so2055229bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 05:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=WWz+gJjqH33eXQMPW97hh5n4sYfWZTpX111NEyLqlwE=;
	b=C/2CfNIVZOm9ncjZpZ31sC5oqOmwYA6NDMp/jPPgfcmB0VIWJavoTWoOuUOvyaN8DK
	anFKpWZPvhLvbLAkeo5v7FswHDjCoSa/nA0BZgRbK88BYSEb+KANHEAqzXevvOwDTumi
	te4jt4pN2eTGyGTi2hjN5e23Xvo8HY/Y/OkV8=
MIME-Version: 1.0
Received: by 10.204.157.136 with SMTP id b8mr1515730bkx.10.1317816603728; Wed,
	05 Oct 2011 05:10:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Wed, 5 Oct 2011 05:10:03 -0700 (PDT)
In-Reply-To: <1317765609.14671.118.camel@ted>
References: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
	<1317392122.12332.208.camel@ted>
	<20110930164658.GB7364@jama.jama.net>
	<1317402578.12332.218.camel@ted>
	<CAP9ODKqb8RGLi_5-_+uegLmtZ7Wo-70oDJcF_R6yaSJ2q9mGwg@mail.gmail.com>
	<1317765609.14671.118.camel@ted>
Date: Wed, 5 Oct 2011 09:10:03 -0300
X-Google-Sender-Auth: R7um-qJfDvNO21w1uNYq0QdPaSQ
Message-ID: <CAP9ODKrfDeDMomqeJCeyJBWqD_KqdMO=WBvjVY5d_j+btn3DfQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] Improve handling of 'all' architecture recipes and their interaction with sstate
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
X-List-Received-Date: Wed, 05 Oct 2011 12:15:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 4, 2011 at 19:00, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Really? hal doesn't really replace udev though, we can just use udev
> directly in place of it for many things now?

Yes, many moved from hal to udev.

> Specifically which applications are people using with dependencies on
> hal? As has been pointed out we can fix the xserver and that appears to
> be the only thing remaining in OE-Core?

OE-Core can be easily hal-less but I just ask for hal to not be
removed from meta data as I and probably others hasn't finish the move
to udev yet.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


