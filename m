Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tc1JI-0005T2-OM for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 23:01:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANLl8sL027722;
	Fri, 23 Nov 2012 21:47:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26424-01; Fri, 23 Nov 2012 21:47:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANLkwxS027664
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 23 Nov 2012 21:47:00 GMT
Message-ID: <1353707218.21863.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
Date: Fri, 23 Nov 2012 21:46:58 +0000
In-Reply-To: <1353600120-22967-5-git-send-email-bjst@enea.com>
References: <1353600120-22967-1-git-send-email-bjst@enea.com>
	<1353600120-22967-5-git-send-email-bjst@enea.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	qANLl8sL027722
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] Add ptest for dbus.
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
X-List-Received-Date: Fri, 23 Nov 2012 22:01:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-22 at 17:02 +0100, Bj=C3=B6rn Stenberg wrote:
> This patch adds a new recipe dbus-test to build and package the dbus te=
st
> suite. The reason for a separate recipe is that the dbus test suite dep=
ends
> on dbus-glib, so it cannot be compiled at the same time as dbus.
>=20
> An RDEPENDS rule is added to the dbus recipe to include the dbus-test
> package into the image when ptest is enabled, since the standard -ptest
> suffix mechanism does not apply to this package.

Why not call the recipe dbus-ptest, then the standard logic would work?

Cheers,

Richard



