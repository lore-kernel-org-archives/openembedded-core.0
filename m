Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.6929.1615372378703470417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 02:32:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: kory.maincent@bootlin.com)
Received: from kmaincent-XPS-13-7390 (92.208.113.78.rev.sfr.net [78.113.208.92])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id D05C1200013;
	Wed, 10 Mar 2021 10:32:55 +0000 (UTC)
Date: Wed, 10 Mar 2021 11:32:54 +0100
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/6] linux-yocto/5.10: update to v5.10.21
Message-ID: <20210310113254.71b29092@kmaincent-XPS-13-7390>
In-Reply-To: <c15444b65a82b76332dc30a1120888e5828b91a8.1615317549.git.bruce.ashfield@gmail.com>
References: <cover.1615317549.git.bruce.ashfield@gmail.com>
	<c15444b65a82b76332dc30a1120888e5828b91a8.1615317549.git.bruce.ashfield@gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Bruce,

On Tue,  9 Mar 2021 14:23:38 -0500
"Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Updating linux-yocto/5.10 to the latest korg -stable release that compris=
es
> the following commits:

Got this error:

/home/pokybuild/yocto-worker/edgerouter/build/build/tmp/work-shared/edgerou=
ter/kernel-source/arch/mips/cavium-octeon/setup.c: In function 'device_tree=
_init':
/home/pokybuild/yocto-worker/edgerouter/build/build/tmp/work-shared/edgerou=
ter/kernel-source/arch/mips/cavium-octeon/setup.c:1168:2: error: #endif wit=
hout #if
 1168 | #endif
      |  ^~~~~
  CC      arch/mips/cavium-octeon/executive/octeon-model.o
make[3]: *** [/home/pokybuild/yocto-worker/edgerouter/build/build/tmp/work-=
shared/edgerouter/kernel-source/scripts/Makefile.build:279: arch/mips/caviu=
m-octeon/setup.o] Error 1
make[3]: *** Waiting for unfinished jobs....

Here is the autobuilder log error:
https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/3180/step=
s/11/logs/stdio

Regards,

K=C3=B6ry
