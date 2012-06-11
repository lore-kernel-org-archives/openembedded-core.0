Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8mP-0000MB-Ey
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 19:51:53 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:41:18 -0700
Received: by lbbgh12 with SMTP id gh12so2567738lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=Palt4LP0t0y89lBCl9FQkcZtZXhv0pV6+VAVZ56r/tg=;
	b=iw1tCmp8hiYlGjiLmKNhJfvWs1hrkeBGwdKpIPwGB2ER7uubZ3i555rSdbpPBMDS/y
	2AwWn2sKio9eWidgmAXEiV17l/Jdt90IsQ+tJGOH/1HpBbnehWIagiwNAP+M3AP3+qoV
	WweXbWBT61kRb3LNkKI6WKYXvRhateXBOOZxYvWBxgUgNVytUeyFnftDrqDNP0/v5fxZ
	CrCAn2IeC5qQXWp/65XSnjK0f3E2HjuyxMKG1j5IentYCPvCKdOgWzrLPWM61StbJolF
	SiwB7jDO0IpEYtZLNQOELVdUOit8U9pRH8Qu0sUpF79Ukf3+1MFcSJXjR6hlww8nhxOb
	znxA==
MIME-Version: 1.0
Received: by 10.152.135.200 with SMTP id pu8mr8686020lab.8.1339436475828; Mon,
	11 Jun 2012 10:41:15 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:41:15 -0700 (PDT)
In-Reply-To: <73f473e10d4b1670823ff5b1ec9d8220f2751f9f.1338990374.git.tom.zanussi@intel.com>
References: <cover.1338990374.git.tom.zanussi@intel.com>
	<73f473e10d4b1670823ff5b1ec9d8220f2751f9f.1338990374.git.tom.zanussi@intel.com>
Date: Mon, 11 Jun 2012 10:41:15 -0700
Message-ID: <CAPhnLPBDMamgbD-yNNNSFP=KZR+eNRQ-8oDU7p3eObZJEgzDdg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmjMXimdMa2kgi4tGiLyHNdVxy7T+aPi4zNOeHuxrvDNpUgHCJBsas5dtEGmOn0CujF97Jr
Subject: Re: [PATCH 1/2] gnupg: add libusb to DEPENDS
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
X-List-Received-Date: Mon, 11 Jun 2012 17:51:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 6, 2012 at 6:53 AM,  <tom.zanussi@intel.com> wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
>
> gnupg apparently depends on libusb:
>
> | error: Failed dependencies:
> | =A0 =A0 =A0 =A0libusb-0.1-4 >=3D 0.1.3 is needed by gnupg-2.0.18-r1.cor=
e2
>
> So add libusb to gnupg DEPENDS.
>
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
> =A0meta/recipes-support/gnupg/gnupg_2.0.19.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/gnupg/gnupg_2.0.19.bb b/meta/recipes-su=
pport/gnupg/gnupg_2.0.19.bb
> index 1d19fe3..9a0f160 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.0.19.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
> @@ -4,8 +4,8 @@ LICENSE =3D "GPLv3 & LGPLv3"
> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be89=
67949 \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://COPYING.LIB;md5=3D6a6a8e02=
0838b23406c81b19c1d46df6"
>
> -DEPENDS =3D "pth libassuan libksba zlib bzip2 readline libgcrypt"
> -PR =3D "r0"
> +DEPENDS =3D "pth libassuan libksba zlib bzip2 readline libgcrypt libusb"
> +PR =3D "r1"
>
> =A0inherit autotools gettext
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


Merged into OE-Core

Thanks

-b


--=20
Elizabeth Flanagan
Yocto Project
Build and Release


