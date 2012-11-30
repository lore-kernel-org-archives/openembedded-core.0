Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TeWZY-0005HG-65
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 20:48:28 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so1187365ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 11:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=w7Zwm1JhSw+AKz+VnQ7S2ziJ6qXLNUKNnfeEN+eS63I=;
	b=QrrX4duVRZ9IANU0D8dGcFWcmvC8Y9rmSsyEwAWsTq/3LW4KSmU5adOlP5+liID1V2
	XBZCkUUmslczLgNfJzmBvOmg1aWnqLZ4OBrNa5CLLd1kkWm8CExhBBBVVpsFD/+ImYLN
	/radramR9ELLKFHqLT7BtvJTQi3bf9hNEtGwzoI7nO7n8+8Dv9VOOWDA7jy6Ey/oLw7V
	NOLp84pti4SFLkKFycByJSwV9mQSA82Vx6kI5/F0mIvpS78N4PMDIysWonnyIkNsFGXT
	ieNBOyPvHvdEe1J65XGRDQLYy3Pk5/5hNzEiaHdo6gtS2VbJiNSSm/RQLTSC54Qy5C57
	ZQTQ==
MIME-Version: 1.0
Received: by 10.42.179.8 with SMTP id bo8mr1909369icb.0.1354304050114; Fri, 30
	Nov 2012 11:34:10 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Fri, 30 Nov 2012 11:34:09 -0800 (PST)
In-Reply-To: <1354201523-18600-1-git-send-email-Martin.Jansa@gmail.com>
References: <1354201523-18600-1-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 30 Nov 2012 20:34:09 +0100
Message-ID: <CALbNGRQwF9yi32uOJj-MTpwX2-02+tGY1DisqqCKkLYo5gN06A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcgroup: fix INSANE_SKIP
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
X-List-Received-Date: Fri, 30 Nov 2012 19:48:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2012 at 4:05 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * that .so file is in cgroups-pam-plugin not PN
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/libcgroup/libcgroup_0.37.1.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb b/meta/recip=
es-core/libcgroup/libcgroup_0.37.1.bb
> index 3ef1dad..e74f831 100644
> --- a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
> +++ b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
>  LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
>  inherit autotools pkgconfig
>
> @@ -24,4 +24,4 @@ FILES_${PN}-dbg +=3D "${base_libdir}/security/.debug"
>  FILES_${PN}-dev +=3D "${base_libdir}/security/*.la"
>
>  # We really need the symlink so :(
> -INSANE_SKIP_${PN} =3D "dev-so"
> +INSANE_SKIP_cgroups-pam-plugin =3D "dev-so"
> --
> 1.8.0
>
Acked-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>


