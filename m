Received: from mail-wy0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R4YYh-0001v4-FR
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 15:34:23 +0200
Received: by wyh21 with SMTP id 21so3827125wyh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 06:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Xv2g28cvcauhK+bo+Q0T9LTK4IKGXxrLjOtsEe4uq9I=;
	b=GrmuwvWYSGeKhQ2TvERlowgWys+LkZ8hXtoX9pVVguaXFf5SkXDxqc++J5O39dlMpl
	ejVelczk4IOFWds92K4iwzPdMf+RVJ8JvE6paNbCs/EX/g+ZWCPSk+ExpKKdBfds/g54
	sQmQXQMTQ1XLIo8hzsmm9ssbmf2wBPJBmK9eI=
MIME-Version: 1.0
Received: by 10.216.177.132 with SMTP id d4mr791622wem.45.1316179750767; Fri,
	16 Sep 2011 06:29:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.138 with HTTP; Fri, 16 Sep 2011 06:29:10 -0700 (PDT)
In-Reply-To: <1316177653.20858.23.camel@ted>
References: <1316177653.20858.23.camel@ted>
Date: Fri, 16 Sep 2011 10:29:10 -0300
X-Google-Sender-Auth: rhiIslRMzZ8aut_Hy0nAlHTCaMg
Message-ID: <CAP9ODKor_37hXUvXv3GOYkF1ugkC_sWK4i4SW7tiU8ekJYu6Dw@mail.gmail.com>
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
X-List-Received-Date: Fri, 16 Sep 2011 13:34:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 09:54, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Its been mentioned to me that we perhaps haven't made it really clear
> what is happening with OE-Core at the moment. When we started this off,
> we agreed to try and get on a roughly six month release cadence so
> people had some idea of what to expect from the project and when. We
> decided to put that in sync with what Yocto was doing since it was felt
> OE-Core would equally benefit from the QA and bug fixing Yocto does as
> part of its release process.

I fully agree on that and I do think this will gonna be good for both
projects; what I dislike is that Yocto people keep using Poky to their
development instead of OE-Core and this it is quite boring to share
patches between both until you have  cherry-pick them.

This should be change in my point of view and people ought to use
oe-core for hacking so we all share same base tree.

My 2c.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


