Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.7011.1615372962544596376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 02:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: kory.maincent@bootlin.com)
X-Originating-IP: 78.113.208.92
Received: from kmaincent-XPS-13-7390 (92.208.113.78.rev.sfr.net [78.113.208.92])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D1AF82000F;
	Wed, 10 Mar 2021 10:42:35 +0000 (UTC)
Date: Wed, 10 Mar 2021 11:42:34 +0100
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/6] perf: fix reproducibility issues
Message-ID: <20210310114234.1b838cd8@kmaincent-XPS-13-7390>
In-Reply-To: <0e2ab3111ac8446d0657e8f4d8d400f50f4e245b.1615317549.git.bruce.ashfield@gmail.com>
References: <cover.1615317549.git.bruce.ashfield@gmail.com>
	<0e2ab3111ac8446d0657e8f4d8d400f50f4e245b.1615317549.git.bruce.ashfield@gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Bruce,

On Tue,  9 Mar 2021 14:23:36 -0500
"Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> perf has been failing our reproducible testing due to multiple symbols
> containg build paths.

There is still reproducible issues:
https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/89/steps=
/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/84/steps=
/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/86/steps=
/13/logs/stdio

Here is the diffoscope log:
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210310-pc9vzt=
2k/packages/diff-html/

Regards,

K=C3=B6ry
