Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QW8Tc-0005u7-ED
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 16:50:52 +0200
Received: by wye20 with SMTP id 20so3706961wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 07:47:28 -0700 (PDT)
Received: by 10.227.156.70 with SMTP id v6mr4926752wbw.21.1307976448020;
	Mon, 13 Jun 2011 07:47:28 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb6sm4311873wbb.0.2011.06.13.07.47.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 07:47:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1307975748.10825.2.camel@elmorro>
Date: Mon, 13 Jun 2011 16:47:25 +0200
Message-Id: <05D8A861-D865-4303-BB8B-69F5F22B651D@dominion.thruhere.net>
References: <1307975748.10825.2.camel@elmorro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] systemtap: remove non-core COMPATIBLE_MACHINES
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
X-List-Received-Date: Mon, 13 Jun 2011 14:50:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 jun 2011, om 16:35 heeft Tom Zanussi het volgende geschreven:
> -COMPATIBLE_MACHINE =3D =
"(qemux86|qemux86-64|qemuppc|emenlow|crownbay|atom-pc|n450)"
> +COMPATIBLE_MACHINE =3D "(qemux86|qemux86-64|qemuppc|atom-pc)"

After having looked at the recipe (basically 'inherit autotools', =
PACKAGE_ARCH =3D BASE_PACKAGE_ARCH) and reading the systemtap wiki I =
can't figure out why COMPATIBLE_MACHINE is actually needed. The closest =
I get is "needs specific kernel config", but that argument quickly falls =
down when looking at other recipes that need that (e.g. udev) and =
considering out layer strategy (bbappending it for all your machines).

So, what am I missing here?

regards,

Koen

PS: there's no 'atom-pc' in OE-core=


