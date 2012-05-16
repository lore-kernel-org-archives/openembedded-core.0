Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUf4N-0008HY-QH
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 16:19:15 +0200
Received: by yhjj56 with SMTP id j56so884727yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 07:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=cmWYbvByt5bOm49DkR0WPhDYg/OFPUvC9hj3V7V8TOU=;
	b=hkLl4fKt31BHV9lPjXTRnNuHqVwLoqrYAlnPbqqZLAwDKFC9OSXIn2YjTWdirkseyx
	SS9PxXHamBKfB1kwGByinJks56NgcMBux4dRbipvN3Nxa5Nqo1jeYMOn7s5ItRuaaNDt
	wtW/Frs2bSzVnDwYoXBn46mHtH3zy0OksbIatJhGcv/aLkH8QqEXm5jGGWVyaRp2xScY
	bDDIQ11jUnQs9R2vCBPSF/jxOiP5Jy1GTCRQM3V0tKF+O7ynzn5JGDUuO81uIk9j7wXP
	rBQC+fE9HMmtJ+mf2eTI+wNdZMS2AZReB2KUieVYbQGm2y2iN1riiaPXjouPfgFG1vNR
	bvrQ==
MIME-Version: 1.0
Received: by 10.236.153.104 with SMTP id e68mr3567762yhk.36.1337177354024;
	Wed, 16 May 2012 07:09:14 -0700 (PDT)
Received: by 10.236.23.9 with HTTP; Wed, 16 May 2012 07:09:13 -0700 (PDT)
In-Reply-To: <1337177105-22386-1-git-send-email-alexandru.damian@intel.com>
References: <1337177105-22386-1-git-send-email-alexandru.damian@intel.com>
Date: Wed, 16 May 2012 16:09:13 +0200
Message-ID: <CA+chaQdan5Nn=sxHQ_LHgiURNcucJcfx-BCiffRL3-QrZgE5YQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] xf86-video-vmware: update package to 12.0.2
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
X-List-Received-Date: Wed, 16 May 2012 14:19:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 4:05 PM, Alexandru DAMIAN
<alexandru.damian@intel.com> wrote:
> This patch updates the package version for the vmware xorg driver
> to 12.0.2, following upstream. No other changes made beside updating
> the checksums.

then reset PR in v2

Cheers,

> ---
> =C2=A0...mware_12.0.1.bb =3D> xf86-video-vmware_12.0.2.bb} | =C2=A0 =C2=
=A04 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> =C2=A0rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_12.0.1.=
bb =3D> xf86-video-vmware_12.0.2.bb} (77%)
>
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.b=
b b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
> similarity index 77%
> rename from meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.bb
> rename to meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
> index a5655fc..4b9844d 100644
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.bb
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
> @@ -11,8 +11,8 @@ DEPENDS +=3D "virtual/libx11 libxvmc drm glproto \
>
> =C2=A0PR =3D "${INC_PR}.1"
>
> -SRC_URI[md5sum] =3D "08101a9b09774ec2f432db5118928c53"
> -SRC_URI[sha256sum] =3D "ded644af1f74ca0ebdc759e3db715519c476b341c1783c3d=
92c93a76591ed496"
> +SRC_URI[md5sum] =3D "0743ec7c479603fba60d118858fd5783"
> +SRC_URI[sha256sum] =3D "c827875fd94805ec9b925fe09aaa973e7e3f9096c7ef311d=
449c3f134ae75147"
>
> =C2=A0COMPATIBLE_HOST =3D '(i.86.*-linux|x86_64.*-linux)'
>
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


