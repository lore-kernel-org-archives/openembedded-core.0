Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qx3g3-0000g0-6s
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 23:10:59 +0200
Received: by bkbzu17 with SMTP id zu17so2959202bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 14:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=e/VIzGpstRWhUcytKtKm71XnVc66J1ahJhB8uxt3P2M=;
	b=vJtht4eKJDR3PkpILWsQsMUgYPVbgEydU/itD/eK8W7ZkUmCA4YK/rQ6yLqXeQoF6F
	qnVItLL5PRwJyLHvEDLF/mIi7DaUdDuKYQ9PEF238XIG7two3uytnq8TCOh6R9Hvs67t
	89O8nDJu7yoq9pT3KebTMLKJSPQVgqkMkNUFI=
MIME-Version: 1.0
Received: by 10.204.133.12 with SMTP id d12mr861138bkt.227.1314392770274; Fri,
	26 Aug 2011 14:06:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.15.66 with HTTP; Fri, 26 Aug 2011 14:06:10 -0700 (PDT)
Date: Fri, 26 Aug 2011 18:06:10 -0300
X-Google-Sender-Auth: Y-OkwQ2eQ4w6ZNif8zmpUWSVsiY
Message-ID: <CAP9ODKoei49fOtr7sySUQkbXY-yrdaF+cVydXXfwOXxtQ+8kyQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Use of multiple GIT repositories in SRCREV but updating PV
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
X-List-Received-Date: Fri, 26 Aug 2011 21:10:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

We have two recipes that use a common static library and every time we
change something on this library we need to bump PR of those recipes.
We want to avoid that specially for daily builds that will  be using
GIT AUTOREV support.

For it to work, we need to have a way to put two SRCREV in PV and then
it will be rebuit every time the library changes.

Any clue how to do that?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


