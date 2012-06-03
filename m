Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SbFRX-0003fb-QS
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jun 2012 20:22:24 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 03 Jun 2012 11:11:57 -0700
Received: by lahj13 with SMTP id j13so2198495lah.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jun 2012 11:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=qZRd93iVAcAvK/yTSQW6Zzorc4PjqBcB6sjXRKbZkPM=;
	b=V4wwlPdUoXxPf3dEWrY1nxdC6QYml116dr6B3sl8iq6Z2oXlFfImUrYvg4gIDrliP/
	iKvZIvuBBhGHRHAOdZXmcGFupnYa8MraS/5KMTteuWz7pm47m6wIA9hwHWkHPmeFiTPD
	0BLdjQkW6YN0rIZHbj4Ojy5ElxVNhjEgntTi66Iu8Vt2XlTGc1/FRgkrVH4MkMIxi3oU
	3LujcGrYS/2E5xqtnUZu33Cl4+fhHfRQz5urJDOHB2KOJa6Fofq/gw+s4M6G+q+FFvYV
	vs54dboJvcRjueIvXLgSxbBcxKWcZuRPT0/E9myLZxJ437PZO+AnbycXCNkiRtgJZYy8
	cVcQ==
MIME-Version: 1.0
Received: by 10.112.36.163 with SMTP id r3mr4797789lbj.87.1338747115077; Sun,
	03 Jun 2012 11:11:55 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Sun, 3 Jun 2012 11:11:55 -0700 (PDT)
In-Reply-To: <3b6d1051beff117d6d98bdcaabb7a06b98c33e51.1338541462.git.xiaofeng.yan@windriver.com>
References: <cover.1338541462.git.xiaofeng.yan@windriver.com>
	<3b6d1051beff117d6d98bdcaabb7a06b98c33e51.1338541462.git.xiaofeng.yan@windriver.com>
Date: Sun, 3 Jun 2012 11:11:55 -0700
Message-ID: <CAPhnLPBqmU27AVOaVH2+egbeWjhLXhZ=EvDmzi=18Q8tgTCtLg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmcj2Sfxyj+GqZ98coCk2N4ab9EcA2pFGIHGAMiYsd5itHoOwVTlJiaQOBdDSD8hQGbFGW+
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/3 V2] lsbinitscripts: Add initscripts to enhance init functions in an lsb image
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
X-List-Received-Date: Sun, 03 Jun 2012 18:22:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 1, 2012 at 2:13 AM,  <xiaofeng.yan@windriver.com> wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>
> The version of initscripts has more functions than the simple.
> There could be some errors for current initscripts when running
> some programe because of absent some functions provided by initscripts.
>

Just an FYI, this was missing a DEPENDS on popt. I've fixed that in
my consolidated pull.

-b

> [YOCTO #2133]
>
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> =A0meta/recipes-extended/lsb/lsbinitscripts_9.03.bb | =A0 26 ++++++++++++=
++++++++++
> =A01 files changed, 26 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
>
> diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/reci=
pes-extended/lsb/lsbinitscripts_9.03.bb
> new file mode 100644
> index 0000000..8ee8636
> --- /dev/null
> +++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION =3D "SysV init scripts which only is used in an LSB image"
> +SECTION =3D "base"
> +LICENSE =3D "GPLv2"
> +PR =3D "r0"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Debf4e8b49780ab187d51bd26aaa02=
2c6"
> +
> +S=3D"${WORKDIR}/initscripts-${PV}"
> +SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscr=
ipts-${PV}.tar.bz2/668fa2762b57ef75436303857847bba3/initscripts-${PV}.tar.b=
z2 \
> + =A0 =A0 =A0 =A0 =A0 file://functions.patch \
> + =A0 =A0 =A0 =A0 =A0"
> +
> +SRC_URI[md5sum] =3D "668fa2762b57ef75436303857847bba3"
> +SRC_URI[sha256sum] =3D "d56547a68ce223a7413b2676650b042125f047c8d6d139c5=
b970e118b3dc958a"
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY =3D "10"
> +ALTERNATIVE_${PN} =3D "functions"
> +ALTERNATIVE_LINK_NAME[functions] =3D "${sysconfdir}/init.d/functions"
> +
> +do_configure[noexec] =3D "1"
> +
> +do_install(){
> + =A0 =A0 =A0 install -d ${D}/etc/init.d/
> + =A0 =A0 =A0 install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/=
functions
> +}
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


