Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SIO1J-0003Oc-KV
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 19:41:21 +0200
Received: by vcbfl13 with SMTP id fl13so1753375vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 10:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9mau+NeLhTXREmNBhfj4o+WcwyIvcrPvNs8UPjCPJqQ=;
	b=CAofIxJPm7aqS8tBjzJrxEUsDTSL/C4mPZQFmmZca6wCwdLpL/0WqJ2dHU0S7vfe4u
	+gGZ+qhziSAqa3ZJPPf2r29XuDKv60IQ0CMK1xMymL0zNFtpulipZhbJkm6a9UhZnrnB
	qpGxlXWzt4NTd6/zMwqTZ6A8O8FPXjUz25s8idtskVIsP6zH0ohIcEupnGGFTJ6ccyzc
	GxnDf/bNdf1KiZdoPPKBwaLIB6vAnJi8kr+wjdxkDXnue8sptecJG7h4oAoehqa2Cz+E
	ArpN62rIocCClA8SeU9PQtORSSlm/aziE6OAAT+QULvdtt9kvnohEUPIyJ/bKVBRD3aV
	N8kQ==
MIME-Version: 1.0
Received: by 10.220.156.72 with SMTP id v8mr1711927vcw.45.1334251920924; Thu,
	12 Apr 2012 10:32:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.2.195 with HTTP; Thu, 12 Apr 2012 10:32:00 -0700 (PDT)
In-Reply-To: <D08D0BD0-4C47-4062-9B08-F44FD1683EED@dominion.thruhere.net>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
	<CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
	<D08D0BD0-4C47-4062-9B08-F44FD1683EED@dominion.thruhere.net>
Date: Thu, 12 Apr 2012 14:32:00 -0300
X-Google-Sender-Auth: CmAuzG4pTwYmqj1F_auaY7MIX08
Message-ID: <CAP9ODKraSBuER3diXxFR8sFW4xN=UKHi=76fTNBm=isJTban8g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project 1.2 M4 schedule
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
X-List-Received-Date: Thu, 12 Apr 2012 17:41:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2012 at 14:22, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> You just volunteered to handle all the "Does it work with yocto 1.2?" que=
stions :)
>
> Simply put: people are stupid, they need explicit PHB compliant names in =
tags, even if it isn't 100% politically correct to say "yocto" when we actu=
ally mean "oe-core".
>
> Unless the yocto 1.2 release note state that it's based on oe-core "foo" =
and all layers compatible with "foo" use "foo" in tags/branches.

I think layers ought to have tags for both ...

<layer>-oe-core-<tag>
<layer>-yocto-<tag>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


