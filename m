Received: from mail-qw0-f44.google.com ([209.85.216.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R1eZr-0005Uy-MX
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 15:23:36 +0200
Received: by qwg2 with SMTP id 2so740537qwg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2011 06:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=3avlDPDggGnLYp4Vydf5vy4SMUZAasRaUhAx174t8Ig=;
	b=iioku9e9rI/VVhReRtFtHODhMUOGyX9gAGGvM1+CEzdZG7DnjINdWecRqJe/6czNS1
	omnWIEk13I13pPdPFjGpHqkeHD13bb67ZcHL4ufkfE/4sNu5mJWwgRpwuAT9wxrekS+v
	DC49PYm02iQ6duvt0pZBDQ6G8hz/hHDynr/to=
MIME-Version: 1.0
Received: by 10.68.20.99 with SMTP id m3mr1149581pbe.444.1315487910869; Thu,
	08 Sep 2011 06:18:30 -0700 (PDT)
Received: by 10.142.223.1 with HTTP; Thu, 8 Sep 2011 06:18:30 -0700 (PDT)
In-Reply-To: <1315294779-3295-1-git-send-email-denis@eukrea.com>
References: <1315294422-3097-1-git-send-email-denis@eukrea.com>
	<1315294779-3295-1-git-send-email-denis@eukrea.com>
Date: Thu, 8 Sep 2011 15:18:30 +0200
Message-ID: <CA+chaQdR=p6C++xpewOvbc+F04kEu6RpnWBeQrunLyDa7oOnLw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] busybox: update to 1.8.5
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
X-List-Received-Date: Thu, 08 Sep 2011 13:23:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 6, 2011 at 9:39 AM, Denis Carikli <denis@eukrea.com> wrote:
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> ---
> =C2=A0.../B921600.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A00
> =C2=A0.../busybox-appletlib-dependency.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../busybox-udhcpc-no_deconfig.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../{busybox-1.18.4 =3D> busybox-1.18.5}/defconfig =C2=A0 | =C2=A0 =
=C2=A00
> =C2=A0.../get_header_tar.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../run-parts.in.usr-bin.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../udhcpc-fix-nfsroot.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../udhcpscript.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../{busybox_1.18.4.bb =3D> busybox_1.18.5.bb} =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A06 +++---
> =C2=A09 files changed, 3 insertions(+), 3 deletions(-)
> =C2=A0rename meta/recipes-core/busybox/{busybox-1.18.4 =3D> busybox-1.18.=
5}/B921600.patch (100%)
> =C2=A0rename meta/recipes-core/busybox/{busybox-1.18.4 =3D> busybox-1.18.=
5}/busybox-appletlib-dependency.patch (100%)
> =C2=A0rename meta/recipes-core/busybox/{busybox-1.18.4 =3D> busybox-1.18.=
5}/busybox-udhcpc-no_deconfig.patch (100%)
> =C2=A0rename meta/recipes-core/busybox/{busybox-1.18.4 =3D> busybox-1.18.=
5}/defconfig (100%)
> =C2=A0rename meta/recipes-core/busybox/{busybox-1.18.4 =3D> busybox-1.18.=
5}/get_header_tar.patch (100%)
> =C2=A0rename meta/recipes-core/busybox/{busybox-1.18.4 =3D> busybox-1.18.=
5}/run-parts.in.usr-bin.patch (100%)
> =C2=A0rename meta/recipes-core/busybox/{busybox-1.18.4 =3D> busybox-1.18.=
5}/udhcpc-fix-nfsroot.patch (100%)
> =C2=A0rename meta/recipes-core/busybox/{busybox-1.18.4 =3D> busybox-1.18.=
5}/udhcpscript.patch (100%)
> =C2=A0rename meta/recipes-core/busybox/{busybox_1.18.4.bb =3D> busybox_1.=
18.5.bb} (85%)


While upgrading I've noticed few file conflicts
Configuring busybox.
ln: /sbin/blockdev: File exists
ln: /usr/bin/flock: File exists
ln: /usr/bin/time: File exists

update-alternatives: Error: not linking //sbin/blockdev to
../bin/busybox since //sbin/blockdev exists and is not a link
update-alternatives: Error: not linking //usr/bin/flock to
../../bin/busybox since //usr/bin/flock exists and is not a link
update-alternatives: Error: not linking //usr/bin/time to
../../bin/busybox since //usr/bin/time exists and is not a link

SHR root@gjama / $ opkg search /sbin/blockdev
util-linux - 2.19.1-r4
SHR root@gjama / $ opkg search /usr/bin/flock
util-linux - 2.19.1-r4
SHR root@gjama / $ opkg search /usr/bin/time
time - 1.7-r0

So someone should update busybox's defconfig or teach util-linux and
time to use u-a for this.

Regards,

>
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/B921600.patch b/met=
a/recipes-core/busybox/busybox-1.18.5/B921600.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/B921600.patch
> rename to meta/recipes-core/busybox/busybox-1.18.5/B921600.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/busybox-appletlib-d=
ependency.patch b/meta/recipes-core/busybox/busybox-1.18.5/busybox-appletli=
b-dependency.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/busybox-appletlib-de=
pendency.patch
> rename to meta/recipes-core/busybox/busybox-1.18.5/busybox-appletlib-depe=
ndency.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/busybox-udhcpc-no_d=
econfig.patch b/meta/recipes-core/busybox/busybox-1.18.5/busybox-udhcpc-no_=
deconfig.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/busybox-udhcpc-no_de=
config.patch
> rename to meta/recipes-core/busybox/busybox-1.18.5/busybox-udhcpc-no_deco=
nfig.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/defconfig b/meta/re=
cipes-core/busybox/busybox-1.18.5/defconfig
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/defconfig
> rename to meta/recipes-core/busybox/busybox-1.18.5/defconfig
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/get_header_tar.patc=
h b/meta/recipes-core/busybox/busybox-1.18.5/get_header_tar.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/get_header_tar.patch
> rename to meta/recipes-core/busybox/busybox-1.18.5/get_header_tar.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/run-parts.in.usr-bi=
n.patch b/meta/recipes-core/busybox/busybox-1.18.5/run-parts.in.usr-bin.pat=
ch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/run-parts.in.usr-bin=
.patch
> rename to meta/recipes-core/busybox/busybox-1.18.5/run-parts.in.usr-bin.p=
atch
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/udhcpc-fix-nfsroot.=
patch b/meta/recipes-core/busybox/busybox-1.18.5/udhcpc-fix-nfsroot.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/udhcpc-fix-nfsroot.p=
atch
> rename to meta/recipes-core/busybox/busybox-1.18.5/udhcpc-fix-nfsroot.pat=
ch
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/udhcpscript.patch b=
/meta/recipes-core/busybox/busybox-1.18.5/udhcpscript.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/udhcpscript.patch
> rename to meta/recipes-core/busybox/busybox-1.18.5/udhcpscript.patch
> diff --git a/meta/recipes-core/busybox/busybox_1.18.4.bb b/meta/recipes-c=
ore/busybox/busybox_1.18.5.bb
> similarity index 85%
> rename from meta/recipes-core/busybox/busybox_1.18.4.bb
> rename to meta/recipes-core/busybox/busybox_1.18.5.bb
> index b2053ee..c0dc1d4 100644
> --- a/meta/recipes-core/busybox/busybox_1.18.4.bb
> +++ b/meta/recipes-core/busybox/busybox_1.18.5.bb
> @@ -1,5 +1,5 @@
> =C2=A0require busybox.inc
> -PR =3D "r9"
> +PR =3D "r0"
>
> =C2=A0SRC_URI =3D "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2=
;name=3Dtarball \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://udhcpscript.patch \
> @@ -25,7 +25,7 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox-$=
{PV}.tar.bz2;name=3Dtarball \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://umount.busybox \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://defconfig"
>
> -SRC_URI[tarball.md5sum] =3D "b03c5b46ced732679e525a920a1a62f5"
> -SRC_URI[tarball.sha256sum] =3D "4d24d37bd6f1bd153e8cf9a984ec2f32f18464f7=
3ca535e2cc2e8be9694097fa"
> +SRC_URI[tarball.md5sum] =3D "96dd43cc7cee4017a6bf31b7da82a1f5"
> +SRC_URI[tarball.sha256sum] =3D "10954fcd5c48d8a262a3497b16227bf983a05658=
bf2bf661af2fdeca773f2fc0"
>
> =C2=A0EXTRA_OEMAKE +=3D "V=3D1 ARCH=3D${TARGET_ARCH} CROSS_COMPILE=3D${TA=
RGET_PREFIX} SKIP_STRIP=3Dy"
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


