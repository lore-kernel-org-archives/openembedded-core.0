Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QswGn-0006zx-2U
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 14:27:53 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Mon, 15 Aug 2011
	14:23:16 +0200
Date: Mon, 15 Aug 2011 14:23:27 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110815122327.GA7862@chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1313164659.6733.163.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1313164659.6733.163.camel@phil-desktop>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH] libx11: skip self if x11 not in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 15 Aug 2011 12:27:53 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Although, it is already mergerd by Richard, I really like this patch
series (after testing it).

* Phil Blundell <philb@gnu.org> [110812 17:57]:
> This stops (most) x11 packages leaking into a non-x11 distro by mistake.

Will you submit this to meta-oe also?
This question might apply to a few of the other patches also.

Cheers,
Anders

> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-graphics/xorg-lib/libx11.inc |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)

> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-gra=
phics/xorg-lib/libx11.inc
> index c156ce6..455753f 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
> @@ -42,3 +42,8 @@ do_compile() {
>  # Multiple libx11 derivatives from from this file and are selected by vi=
rtual/libx11
>  # A world build should only build the correct version, not all of them.
>  EXCLUDE_FROM_WORLD =3D "1"
> +
> +python () {
> +       if not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, =
d):
> +		  raise bb.parse.SkipPackage("X11 not enabled for this DISTRO")
> +}
--=20
Anders Darander
ChargeStorm AB		Tel: +46 702 44 84 36
Laxholmstorget 3	Email: anders@chargestorm.se
602 21 Norrk=F6ping	Web: www.chargestorm.se


