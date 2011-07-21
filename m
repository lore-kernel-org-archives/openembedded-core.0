Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1QjsTO-00080h-Lf
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 14:35:26 +0200
Received: by pzk1 with SMTP id 1so1933858pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 05:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=nUUpIxonVzeSc/cHCezbbq4saOKL5HmOzTMM1SED6y4=;
	b=vVI3RhgBYMQ/IDF/x+vQ5CY0uAizrgydwzNoqa3sa5CNYV/2JNetbG9Ic1DSNfO5F3
	6deP7jK3aO/xSclZtPBUxfqMj5D/bTLZ8QNs6xj3YCAmR1SwjC9AhoRPSADPvNg/AnO6
	tK6LROaIZAEnzqyIoTQrtpueNtoKJ25ElsP28=
MIME-Version: 1.0
Received: by 10.68.13.68 with SMTP id f4mr199536pbc.404.1311251476455; Thu, 21
	Jul 2011 05:31:16 -0700 (PDT)
Received: by 10.68.66.135 with HTTP; Thu, 21 Jul 2011 05:31:16 -0700 (PDT)
In-Reply-To: <BBB3C9E0-A02C-4375-8075-5DD2C6588AB4@kernel.crashing.org>
References: <BBB3C9E0-A02C-4375-8075-5DD2C6588AB4@kernel.crashing.org>
Date: Thu, 21 Jul 2011 14:31:16 +0200
Message-ID: <CAF3Rn=w6gEoOafnMG72zsWGs4mL2Ho+Qt4xuP=F3Qt==1iQ1qw@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: siteinfo split between powerpc-common & powerpc-linux
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
X-List-Received-Date: Thu, 21 Jul 2011 12:35:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Kumar,

On Thu, Jul 21, 2011 at 2:17 PM, Kumar Gala <galak@kernel.crashing.org> wro=
te:
> Why do we have a split between powerpc-common & powerpc-linux?
>
> I assume powerpc-linux is used and picked up for powerpc-linux-uclibc in =
addition to normal powerpc-linux.
>
> I'm looking at adding powerpc64 support and powerpc-common is all kinda o=
f broken for it. =A0I'd like to just merge powerpc-common & powerpc-linux (=
as powerpc-linux 32-bit) for now and start a new powerpc-common that refact=
ors 32/64 commonalities.
>
> Unless someone says otherwise about the meaning of these files.
>

Good fine, go ahead, I think these are left-overs from long ago.

Regards,
--=20
Leon


