Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RlAz1-0004MJ-H7
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 04:05:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0C2w8wF005171
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2012 18:58:11 -0800 (PST)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 11 Jan 2012 18:58:00 -0800
Message-ID: <4F0E4C11.4050207@windriver.com>
Date: Thu, 12 Jan 2012 10:57:21 +0800
From: Zumeng Chen <zumeng.chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.24) Gecko/20111108 Lightning/1.0b2 Thunderbird/3.1.16
MIME-Version: 1.0
CC: <openembedded-core@lists.openembedded.org>
References: <cover.1326244852.git.zumeng.chen@windriver.com>
	<2b95052bfcb49e681e8e40dbdfabfd804febb845.1326244852.git.zumeng.chen@windriver.com>
In-Reply-To: <2b95052bfcb49e681e8e40dbdfabfd804febb845.1326244852.git.zumeng.chen@windriver.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q0C2w8wF005171
Subject: Re: [PATCH 1/4] lttng-ust: Integrate into yocto linux
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
X-List-Received-Date: Thu, 12 Jan 2012 03:05:45 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Richard/Saul,

I'm afraid this thread has incurred confusion to you, I'll
send a clean pull request for merging, if any let me know.

Thanks,
Zumeng



=E4=BA=8E 2012=E5=B9=B401=E6=9C=8811=E6=97=A5 09:31, Zumeng Chen =E5=86=99=
=E9=81=93:
> This patch intended to integrate the LTTng UST 2.0 package, which
> contains the userspace tracer library to trace userspace codes.
>
> Signed-off-by: Zumeng Chen<zumeng.chen@windriver.com>
> ---
>   meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb |   25 +++++++++++++=
+++++++++
>   1 files changed, 25 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
>
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb b/meta/re=
cipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
> new file mode 100644
> index 0000000..32ec25b
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "Linux Trace Toolkit Userspace Tracer 2.0"
> +DESCRIPTION =3D "The LTTng UST 2.0 package contains the userspace trac=
er library to trace userspace codes."
> +HOMEPAGE =3D "http://lttng.org/lttng2.0"
> +BUGTRACKER =3D "n/a"
> +
> +LICENSE =3D "LGPLv2.1+&  BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De647752e045a8c45b6f583771bd=
561ef \
> +                    file://snprintf/snprintf.c;endline=3D32;md5=3Dd3d5=
44959d8a3782b2e07451be0a903c \
> +                    file://snprintf/various.h;endline=3D31;md5=3D89f25=
09b6b4682c4fc95255eec4abe44"
> +
> +inherit autotools
> +
> +DEPENDS =3D "liburcu util-linux"
> +
> +SRC_URI =3D "http://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "0f09bb954c99cb99ab6997cd492953c1"
> +SRC_URI[sha256sum] =3D "e9ec3c55c2251b3f3b512bfa1015b0f67e35d55793850c=
cea5134f7b24ee3ba1"
> +
> +S =3D "${WORKDIR}/lttng-ust-${PV}"
> +
> +# Due to liburcu not building for MIPS currently this recipe needs to
> +# be limited also.
> +# So here let us first suppport x86/arm/powerpc platforms now.
> +COMPATIBLE_HOST =3D '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'



