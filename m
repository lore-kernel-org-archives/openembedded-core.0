Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U2lsl-0005ue-24 for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 18:00:33 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r15GnWoA015201; Tue, 5 Feb 2013 16:49:32 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kvuLDtSuY3Ks; Tue,  5 Feb 2013 16:49:32 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r15GnOfI015197
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 5 Feb 2013 16:49:27 GMT
Message-ID: <1360082643.28450.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
	=?ISO-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
Date: Tue, 05 Feb 2013 16:44:03 +0000
In-Reply-To: <3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r15GnWoA015201
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] Revert "Add ptest for glib."
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 17:00:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-02-05 at 16:55 +0100, Bernhard Reutner-Fischer wrote:
> This reverts commit dec6f912d68f52748f645b6af411f189cf464f85.
>=20
> This breaks core-image-sato-sdk for TCLIBC=3D"uclibc".
>=20
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
>  .../glib-2.0/glib-2.0/Makefile-ptest.patch         |   61 ------------=
--------
>  meta/recipes-core/glib-2.0/glib-2.0/run-ptest      |    3 -
>  meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb      |   22 -------
>  3 files changed, 86 deletions(-)
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.=
patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/run-ptest

How about we fix ptest for glib? The revert isn't really the direction
we want to take the project. At least discussing this with Bj=C3=B6rn (cc=
'd)
and/or filing a bug would be a good idea before we move to reverting it.

Cheers,

Richard



