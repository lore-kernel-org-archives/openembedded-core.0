Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6D29960034
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 23:54:38 +0000 (UTC)
Received: by wijp15 with SMTP id p15so154959920wij.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 16:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=qX1HiqQNnxuIZ27EQLkilrjpDzzoUaYw0Nazv8GJ1Es=;
	b=NxVEnoXBjuuawnXvsEh9uK7nodZtM6slIo0d0PfZTBraNYjeEPpi7hsLphJ8MDMRP8
	uss3p1ob+NLC4dHQuOgKV6U7+A+nrG66UiWgJDq7B/AzoGwcTKlo/2M89dPPEZJvxn2Q
	2NaKUC1p0q/LK9fqyg6kb2m2jWBtFKSYF6+Kj2vkzy0GUw6rWbelaUB+7wkeby9860op
	+hCX1P1RBM0oZWNNy1sbJAwgWPxA2Id1C1sMIoxFPSut8n1pM7g5d+SKAm81ZuycmROF
	eYyr2RSIs3KleotAa5QgMi5wK813VYZPRXoqPmOjF4TemrnCj+HhE6vARaK4lCdSL/JR
	CklQ==
MIME-Version: 1.0
X-Received: by 10.194.21.230 with SMTP id y6mr54496567wje.132.1439250878919;
	Mon, 10 Aug 2015 16:54:38 -0700 (PDT)
Received: by 10.194.89.129 with HTTP; Mon, 10 Aug 2015 16:54:38 -0700 (PDT)
In-Reply-To: <1439244450-10472-1-git-send-email-anibal.limon@linux.intel.com>
References: <1439244450-10472-1-git-send-email-anibal.limon@linux.intel.com>
Date: Mon, 10 Aug 2015 16:54:38 -0700
Message-ID: <CAJ86T=XSFiXWE_69rGzJkxUd45QT_KhDoRsuWFpEXB5xD3=8+g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mc: Fix QA warning RDEPENDS of util-linux-libmount
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Aug 2015 23:54:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2015 at 3:07 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> mc depends on libmount that uses for try to mount filesystems.
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> ---
>  meta/recipes-extended/mc/mc_4.8.14.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/mc/mc_4.8.14.bb b/meta/recipes-extende=
d/mc/mc_4.8.14.bb
> index 8fec0b3..fe35bcd 100644
> --- a/meta/recipes-extended/mc/mc_4.8.14.bb
> +++ b/meta/recipes-extended/mc/mc_4.8.14.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D270bbafe360e73f9840bd7981621f=
9c2"
>  SECTION =3D "console/utils"
>  DEPENDS =3D "ncurses glib-2.0"
> -RDEPENDS_${PN} =3D "ncurses-terminfo"
> +RDEPENDS_${PN} =3D "ncurses-terminfo util-linux-libmount"

I guess adding util-linux to DEPENDS would be the correct fix. The
runtime dependency on libmount will then be detected automatically.


>  SRC_URI =3D "http://www.midnight-commander.org/downloads/${BPN}-${PV}.ta=
r.bz2 \
>             "
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

