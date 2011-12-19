Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RcY1n-0006Zh-6Z
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 08:52:55 +0100
Received: (qmail invoked by alias); 19 Dec 2011 07:45:52 -0000
Received: from p5B0A29E0.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.41.224]
	by mail.gmx.net (mp066) with SMTP; 19 Dec 2011 08:45:52 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/2C6waTwv2/8wDyCyW50SLPAWg3oGYetgjAd5QVT
	cSMob/uzaGpAn8
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2011 08:46:32 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1324252470.4568.156.camel@ted>
In-Reply-To: <1324252470.4568.156.camel@ted>
MIME-Version: 1.0
Message-Id: <201112190846.32828.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] opkg: Add logic to detect and creak circular dependencies
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
X-List-Received-Date: Mon, 19 Dec 2011 07:52:55 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday, December 19, 2011 12:54:30 AM Richard Purdie wrote:
> This addresses some of the concerns about the previous opkg changes
> allowing it to break out of circular dependency loops with just a notice
> in the logs rather than effectively going OOM.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
This saves my circular dependenciy victims (xfwm4 / font-util). Build from=
=20
scratch tested. Thanks.

Acked-by: Andreas M=FCller <schnitzeltony@gmx.de>



