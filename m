Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SKqdL-0005yN-Th
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Apr 2012 14:38:48 +0200
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 7403A4B0099
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 14:29:17 +0200 (CEST)
Date: Thu, 19 Apr 2012 14:29:15 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120419142915.1578a6cf@eb-e6520>
In-Reply-To: <1334837877.13017.0.camel@ted>
References: <1334837877.13017.0.camel@ted>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [PATCH] package.bbclass: Ensure kernel modules get stripped
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
X-List-Received-Date: Thu, 19 Apr 2012 12:38:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Thu, 19 Apr 2012 13:17:57 +0100,
Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :

> Kernel modules are not marked as executable but we do expect to strip the=
m.
> This patch adds in missing code to ensure we do this. Without this images
> are getting sigificantly bloated in size.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

cool, that explains why I had a 190 MB modules.tar.bz2 when building a
test image for a Pandaboard last weekend ;-)

Eric


