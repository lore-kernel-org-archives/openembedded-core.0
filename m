Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SpJ7v-0004GZ-V0
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 15:08:18 +0200
Received: by eeit10 with SMTP id t10so136154eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 05:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=9frpK5lRJKFwVEuQ723WOdtqlmt075YMk4Mqxb+Jgy4=;
	b=Ep3Qlu81VLwcqz3IJkftcVB61u+5EvdbIbpR5fYVJOdSUt7nEtng6TGtUUX0T4rsj1
	c6fa0V2pqI0kHPO2V5QjuQ8uWQ6yl1O+Lt4/miQBy9A+jZ4e0htItjjq4CVRrxCSqmei
	gsvMW/sShuHoqbuJXKVb5ZRyFfS7hueeWAyymynzMuU+Uor1hl7QtcZdPgo/UFUzxY63
	kwYDO9WDlQ9ZUcCoNGX6tK07MfxOBeoOZXzhOiPu/XB0IBC7sZM9FE1EjwirS/0e1f4Y
	Bw5KRCIPMFqFdn0n3RJgefdHm9RZw6VGr6ebvix4y6y5Y+zfB7D6JI+SAGAVkw6eVBOj
	BP5g==
Received: by 10.14.119.200 with SMTP id n48mr11903205eeh.104.1342097811364;
	Thu, 12 Jul 2012 05:56:51 -0700 (PDT)
Received: from ?IPv6:2001:610:612::49c7:1a8f:3a7d:b8aa?
	([2001:610:612:0:49c7:1a8f:3a7d:b8aa])
	by mx.google.com with ESMTPS id s4sm15493534eef.2.2012.07.12.05.56.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 05:56:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAK18fxGaTeNPMeVq_JUSTmJggPHjmDLta6hun4p3kqoZbF167A@mail.gmail.com>
Date: Thu, 12 Jul 2012 14:56:52 +0200
Message-Id: <927F0993-6573-459B-820D-0ECFA37787C8@dominion.thruhere.net>
References: <1342015854-30040-1-git-send-email-koen@dominion.thruhere.net>
	<4FFDE7B3.8050804@linux.intel.com>
	<CAK18fxGaTeNPMeVq_JUSTmJggPHjmDLta6hun4p3kqoZbF167A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkG6HKZc1IGBnCwh67JA59mca/lXNwD+F5wpf8iUxHjogD+LryPlCQ67TI0HBsQhSHpQGaI
Subject: Re: [PATCH] xz: update to 5.1.2alpha
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
X-List-Received-Date: Thu, 12 Jul 2012 13:08:18 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 12 jul. 2012, om 14:26 heeft Andrei Gherzan het volgende geschreven:

> On Wed, Jul 11, 2012 at 11:53 PM, Saul Wold <sgw@linux.intel.com> =
wrote:
> On 07/11/2012 07:10 AM, Koen Kooi wrote:
> This contains bugfixes from the 5.0.3 and 5.0.4 releases
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>   meta/recipes-extended/xz/{xz_5.1.1alpha.bb =3D> xz_5.1.2alpha.bb} |  =
  7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>   rename meta/recipes-extended/xz/{xz_5.1.1alpha.bb =3D> =
xz_5.1.2alpha.bb} (86%)
>=20
> diff --git a/meta/recipes-extended/xz/xz_5.1.1alpha.bb =
b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
> similarity index 86%
> rename from meta/recipes-extended/xz/xz_5.1.1alpha.bb
> rename to meta/recipes-extended/xz/xz_5.1.2alpha.bb
> index 7fa7177..9d68720 100644
> --- a/meta/recipes-extended/xz/xz_5.1.1alpha.bb
> +++ b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
> @@ -10,11 +10,8 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dc475b6c7dca236740ace4bba553e8e1c \
>                       =
file://lib/getopt.c;endline=3D23;md5=3D2069b0ee710572c03bb3114e4532cd84 =
"
>=20
>   SRC_URI =3D "http://tukaani.org/xz/xz-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] =3D "bb24436fa12780808e1c142980484104"
> -SRC_URI[sha256sum] =3D =
"54e59a83690a4a0ec88a7d7c3bdef90c6b196c892a93463863c71c24fe87951a"
> -
> -PR =3D "r0"
> +SRC_URI[md5sum] =3D "9bad1e249537ce69b206815cf28ca87b"
> +SRC_URI[sha256sum] =3D =
"70e792d2a67cfbb8f2dffd0feab6ca6e5a4a618d65070fb44a367629d1ba94e5"
>=20
>   inherit autotools gettext
>=20
>=20
>=20
> How stable is this alpha release?  We don't generally take up =
re-releases, correct?
>=20
> =20
> We already have an alpha release... so another alpha shouldn't be a =
problem, right? .1a it's a good deal as it implements multithreaded =
compression and decompression.

After Andrei's patch for image_types.bbclass goes in I have a follow up =
patch to enable xz threads (and disable the -e -9) to give a nice =
speedup for xz images. On my aging core2quad compressing a 4gb image =
goes from ~22 minutes to ~6.5 minutes with -T4. On my 4c/8t i7 I can get =
up to a 6x speedup with -T6 or -T8, hyperthreading does a better job =
than I expected.

regards,

Koen

regards,

Koen=


