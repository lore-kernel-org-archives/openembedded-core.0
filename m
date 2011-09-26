Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R8DDc-0008MF-3o
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 17:35:44 +0200
Received: by bke11 with SMTP id 11so6032978bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 08:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=EubrDanl8XQArikqg8KeSNiLx2a6UHFNWDe5Ne+kw7k=;
	b=veG7osLHlgdVnCQ09xrISbnOFdUaNUNVWdypiDIq7ECigZUmm3ZSuUvza0XgvnDYsn
	h5kbyhbQ1nlY1ddBDgW97SvuMLMC4rkn3shPPl2GkQmpB5m5UxBboF85Yr96/W3A1eM6
	TUD4DFYhdEvxhH4AmU9cbeLFNB/YGYgLqJY9M=
MIME-Version: 1.0
Received: by 10.204.138.193 with SMTP id b1mr4398314bku.114.1317051019470;
	Mon, 26 Sep 2011 08:30:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Mon, 26 Sep 2011 08:30:19 -0700 (PDT)
In-Reply-To: <CABcZANkz0jCrZoNteOkeux76m_VTbnnfpxymTs8wctFs_rLfvw@mail.gmail.com>
References: <CAP9ODKpF7hQQmB7YWE4RCWDbEfZwv8432KJrBmvpwe1u_SaCTg@mail.gmail.com>
	<1316734501.28323.18.camel@ted>
	<CAP9ODKqWLVrKRE+HT4k82f+BYdY96N_h581dp8u0AETWBTQV0w@mail.gmail.com>
	<1316799031.3125.3.camel@ted>
	<CAP9ODKoqywvZQyAJ=Jz8wh4hVoucJvo-QpyTZ_cpP8MhnEXb3w@mail.gmail.com>
	<1317029042.26109.29.camel@ted>
	<CAP9ODKqGJ+VxCf8kFcbeaMNwgneLpb-HU2eTpu8w_UM1p-5A6g@mail.gmail.com>
	<1317041232.26109.38.camel@ted>
	<CABcZANkz0jCrZoNteOkeux76m_VTbnnfpxymTs8wctFs_rLfvw@mail.gmail.com>
Date: Mon, 26 Sep 2011 12:30:19 -0300
X-Google-Sender-Auth: 3ZrAyfdtsSvH05nVZY11-OA-RTA
Message-ID: <CAP9ODKqPOc6z3k0jYRJTnNc+6aP9KYwk-PSo_Xe7MhepB7CU-w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Branch management for OE-Core release
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
X-List-Received-Date: Mon, 26 Sep 2011 15:35:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2011 at 11:38, Chris Larson <clarson@kergoth.com> wrote:
...
> Just the other day I was doing a conversion from svn to git for a
> project and ran into a related issue. There was no merge metadata in
> svn from the release branches back to master, so now I have to
> painstakingly step through and make absolutely certain all the fixes
> went into both. For old releases, this is particularly difficult (and
> I think is part of otavio's concern), as you can no longer just merge
> from release/stable to master sanely, due to refactoring, renames, etc
> on the master branch.

I ended up abbandoning our current OE-classic tree due this. I had a
tree that was forked in 2009 and it turned to be impossible to merge
it into master since it has conflicts everywhere. The problem is that
the amount of changes we did is quite small but the lack of knowledge
of SCM regarding what changes made it the fact eaiser to start over
again.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


