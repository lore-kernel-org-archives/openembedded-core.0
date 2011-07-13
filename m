Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgxRi-00028h-TR
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:17:38 +0200
Received: by wwi18 with SMTP id 18so4755391wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 04:13:40 -0700 (PDT)
Received: by 10.227.177.193 with SMTP id bj1mr946043wbb.30.1310555619946;
	Wed, 13 Jul 2011 04:13:39 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm11576389wbb.65.2011.07.13.04.13.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jul 2011 04:13:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1310555312.20015.1096.camel@rex>
Date: Wed, 13 Jul 2011 13:13:33 +0200
Message-Id: <6FD8E09E-1FDA-4CB6-84B0-085F878F0214@dominion.thruhere.net>
References: <1310547824.6337.212.camel@phil-desktop>
	<1310555312.20015.1096.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] eglibc: ensure that NSS libs go into the right package when ${base_libdir} and ${libdir} are the same
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
X-List-Received-Date: Wed, 13 Jul 2011 11:17:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 jul 2011, om 13:08 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-07-13 at 10:03 +0100, Phil Blundell wrote:
>> Previously, libnss_hesiod et al. could get swallowed by the =
wildcarded glob in ${PN}-dev.
>> Fix it by moving eglibc-extra-nss earlier in the PACKAGES and =
adjusting its FILES to ensure
>> that the devel symlinks don't get caught.
>>=20
>> Signed-off-by: Phil Blundell <philb@gnu.org>
>> ---
>> meta/recipes-core/eglibc/eglibc-package.inc |    4 ++--
>> meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
>> 2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> Merged to master, thanks.

That is missing a PR bump for eglibc 2.12=


