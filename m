Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvF8f-0000GS-Dd
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 21:28:45 +0100
Received: by fxm8 with SMTP id 8so1513879fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 12:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=RbGQK3mqHClgGjzZMyEdF/m73SD0rBLXTUAwvQSfcNs=;
	b=rWMgPVcBj4R/eiqVWZS/1V+ihsJxRRzvIKQHdsKh5pHuwenDuPJNCv0B+c2Y34UxWc
	dg+EE6Bld57JNqw0gQD7Td0kpTG5jr830bBKZ1TqxvBMnWf846VT9376lR7tD0yaLq8o
	cq7hCBSXZ9Xy5fRHGFK1AxPrGkg51vdcShWv8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=ujIQq0Ql8uwCTsHp5xsR5aLl8JItT5QpFLJHSsk/aRUcdh+Eg6dMVfvg+6rvgd4BF+
	5qlkPKfkfISbV5paPiKnFFleM8vup7K/VcM0k+vJ56fGn1KGfb7DfRxYxX339XxdZtOD
	xciTv/2OnYgtP22JEZucXKpb1ljD6glMajs0c=
Received: by 10.223.87.1 with SMTP id u1mr1980279fal.112.1299184018229; Thu,
	03 Mar 2011 12:26:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Thu, 3 Mar 2011 12:26:38 -0800 (PST)
In-Reply-To: <da65d2bd3d1f83d84b728f4cddfd6418cd953241.1299182375.git.sgw@linux.intel.com>
References: <cover.1299182375.git.sgw@linux.intel.com>
	<da65d2bd3d1f83d84b728f4cddfd6418cd953241.1299182375.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2011 12:26:38 -0800
Message-ID: <AANLkTi=7XzTXYvjgq6rqNYsW-uafHjsmSZqC01CxODJz@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 07/10] recipe: add chkconfig for LSB command test
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
X-List-Received-Date: Thu, 03 Mar 2011 20:28:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 3, 2011 at 12:02 PM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Kang Kai <kai.kang@windriver.com>
>
> chkconfig is a system tool for maintaining the /etc/rc*.d hierarchy,
> and LSB command test will check 2 links point to command =C2=A0chkconfig
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
> =C2=A0.../recipes-extended/chkconfig/chkconfig_1.3.49.bb | =C2=A0 27 ++++=
++++++++++++++++
> =C2=A01 files changed, 27 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta/recipes-extended/chkconfig/chkconfig_1.3.49=
.bb
>
> diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb b/meta/r=
ecipes-extended/chkconfig/chkconfig_1.3.49.bb
> new file mode 100644
> index 0000000..bbaba71
> --- /dev/null
> +++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "A system tool for maintaining the /etc/rc*.d hierarchy"
> +
> +DESCRIPTION =3D "Chkconfig is a basic system utility. =C2=A0It updates a=
nd queries runlevel \
> +information for system services. =C2=A0Chkconfig manipulates the numerou=
s \
> +symbolic links in /etc/rc.d, to relieve system administrators of some \
> +of the drudgery of manually editing the symbolic links."
> +
> +HOMEPAGE =3D "http://fedorahosted.org/releases/c/h/chkconfig"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5574c6965ae5f583e55880e397fbb=
018"
> +
> +DEPENDS =3D "libnewt gettext popt"
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://fedorahosted.org/releases/c/h/chkconfig/${P}.tar.bz2=
"
> +SRC_URI[md5sum] =3D "9b5e91d25f4f3b21f4c0bdf55a721431"
> +SRC_URI[sha256sum] =3D "775100a9d6f70fbd8f33ed24b560b6842161fc496c21b1fc=
6d2aed646f9d855f"
> +
> +inherit autotools
> +
> +do_install_append() {
> +# =C2=A0 =C2=A0mkdir -p ${D}/etc/rc.d/init.d
> +# =C2=A0 mkdir -p =C2=A0${D}/etc/rc.d/rc{0,1,2,3,4,5,6}.d

these comments can be removed I guess.

> + =C2=A0 =C2=A0mkdir -p ${D}/etc/chkconfig.d
> +}
> --
> 1.7.1.1
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>


