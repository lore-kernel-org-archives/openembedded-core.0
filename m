Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R5cQR-0001nH-D8
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 13:54:15 +0200
Received: by bke11 with SMTP id 11so24526784bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 04:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=VuC0COlaYd7q/IF2e1NfHf4ReXsIJNz2lp94RsCDy2Q=;
	b=r2Gqa5GJCjF0XTVSbZzf5PH+LUBQanuXZ8+gumn9n4sOvLHXmjF5SWJ15cRa9ykIjG
	uI3SL7FtlLSmDFrOsirepkoIRkdgR0HOQKAp7DnxA9JZQvjpR/TCl57/tQsS59Sj7Q0q
	3jlwpm6PoiJs4zYJq/8GOPDzBT9WpHWolFx18=
MIME-Version: 1.0
Received: by 10.204.140.88 with SMTP id h24mr1626343bku.166.1316432939406;
	Mon, 19 Sep 2011 04:48:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Mon, 19 Sep 2011 04:48:59 -0700 (PDT)
In-Reply-To: <DD23E745-87D9-4831-85D4-C038CD79DCF7@dominion.thruhere.net>
References: <20110911172241.GA3674@chargestorm.se>
	<4E7246EB.2070607@eukrea.com>
	<CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
	<201109161212.19780.paul.eggleton@linux.intel.com>
	<4E733F7D.6090109@eukrea.com>
	<CAP9ODKo9-6qHhCWfWS5_GXrNxw38VCXjzih2hdoWRQ9vY3MVFg@mail.gmail.com>
	<DD23E745-87D9-4831-85D4-C038CD79DCF7@dominion.thruhere.net>
Date: Mon, 19 Sep 2011 08:48:59 -0300
X-Google-Sender-Auth: aotHpjOCFCqh64cb-4QuRFVMwP4
Message-ID: <CAP9ODKoemW81Sob3uUe-1LedWXcoJqEdkUGTj-+ZjgrUsytb_Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Mon, 19 Sep 2011 11:54:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2011 at 06:45, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> Send a patch that adds 4.7.4 with DEFAULT_PREFERENCE =3D -1, but leaves 4=
.7.3 intact.
>
> That way people can migrate their bbappends without needing a flag day an=
d it also allows people to test 4.7.4 more easily before it gets made the d=
efault.

I prefer to have 4.7.4 in as it ... it has been in test here, on Eric
and maybe others with no know issues so I'd prefer to have it into the
release and get done with it. 4.7.4 is the current stable release, the
only know regression has a fix available and people have been using it
locally so no reason to leave it behind.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


