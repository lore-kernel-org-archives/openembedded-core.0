Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXHRw-0002Xz-Ge
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 22:47:07 +0200
Received: by mail-wi0-f170.google.com with SMTP id l13so4657620wie.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 13:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=v9REg1nyV09ksJj1ao1Dyh90y24y89pgmai2mlQHcFE=;
	b=J7eNkzdZKkKQeEPwyrMRq9kJrBDBOFkJzGsifUcX09s3wLaaFP+w6tx3z5sEgYCiYz
	SZPPsLBkwqMw2pOSatGmg9XEyuxW4wllXPMgRY9LxxbgxTlj+oRYiimeUYXJB64tuoFY
	tzJP2zOzm7SiDx4qYBvnBYcfQn2O2o8iZfrm4IoCIb3rmy9971qrHzJb0KyvoY7xi3YV
	YRGTMqvgQ1PWA/kQIrjYN6kaxccw7jXS/WaVyXg1Jvl6P8ZAwWVu7L+KTCfHDhxJn47G
	fNiULVVViaJWTei4n6ZmT/yCCuR6YvF/51dGMX0SsPNxISOxySiXbVxs5/ha9OvoNFP8
	XisA==
MIME-Version: 1.0
X-Received: by 10.180.21.193 with SMTP id x1mr26866802wie.31.1367353745476;
	Tue, 30 Apr 2013 13:29:05 -0700 (PDT)
Received: by 10.216.211.131 with HTTP; Tue, 30 Apr 2013 13:29:05 -0700 (PDT)
In-Reply-To: <1367325004-7740-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367325004-7740-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 30 Apr 2013 22:29:05 +0200
Message-ID: <CALbNGRQhmPO2gtmprOUQDEKC4u=tjTG3JzX=D2VJmY+eO_FYrQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH/v2 1/3] systemd: do not recommend udev-extraconf for udev
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
X-List-Received-Date: Tue, 30 Apr 2013 20:47:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2013 at 2:30 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> * adding this extra functionality is an image- or distro-decision
> * at least automount-rule/script breaks other automount solutions causing
>   misleading kernel messages as 'VFS: could not find a valid V7 on sda'
>
> same as already sent by Koen Kooi [1]
>
> [1] http://patches.openembedded.org/patch/48139/
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-core/systemd/systemd_199.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core=
/systemd/systemd_199.bb
> index 43463c5..08cb0c6 100644
> --- a/meta/recipes-core/systemd/systemd_199.bb
> +++ b/meta/recipes-core/systemd/systemd_199.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260=
aa954499f7abaabaa882bbe \
>  PROVIDES =3D "udev"
>
>  PE =3D "1"
> -PR =3D "r3"
> +PR =3D "r4"
>
>  DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-nati=
ve acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
>  DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
> @@ -211,7 +211,7 @@ FILES_udev-dbg +=3D "/lib/udev/.debug"
>
>  RDEPENDS_udev +=3D "udev-utils"
>  RPROVIDES_udev =3D "hotplug"
> -RRECOMMENDS_udev +=3D "udev-extraconf udev-hwdb"
> +RRECOMMENDS_udev +=3D "udev-hwdb"
>
>  FILES_udev +=3D "${base_sbindir}/udevd \
>                 ${rootlibexecdir}/systemd/systemd-udevd \
> --
> 1.7.6.5
>

In case my family name causes trouble:

The following changes since commit e86538db13605953465aacc3f2fb7d719dad919e=
:

  neard: add systemd unit file (2013-04-29 15:31:39 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/oe-core.git udev-extra-patches

Andreas M=C3=BCller (3):
      systemd: do not recommend udev-extraconf for udev
      udev: do not recommend udev-extraconf
      core-image-sato: add udev-extraconf

 meta/recipes-core/systemd/systemd_199.bb    |    4 ++--
 meta/recipes-core/udev/udev.inc             |    2 +-
 meta/recipes-sato/images/core-image-sato.bb |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)


Andreas


