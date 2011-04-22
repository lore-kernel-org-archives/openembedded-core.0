Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QDK18-0003u3-Dr
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 19:19:42 +0200
Received: by eye27 with SMTP id 27so217431eye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 10:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=VwtfevcKP28ydZax1yzV7BHiDo3WCG5lThAVAmsROfQ=;
	b=pwTKePfzuuEjkaYlOjUZezI0Aj6t3pUvYX4JtzWLmPdVUdtqPvhDKcFVVldY+IZ6mO
	p0ia662XNn7Ur+bTL+iUPJa/Dvfkr+BbCM+3fCPxSQLgF/QduVct+nhH+9UntiGC8o3n
	43B/lBWsDjYfldyUfVtUsyREQ+KUhkQX4Pl2M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=pjKQiZAiNFRpqcR2etDofUJIT6JZEBfK69mH8Z4hlY5RYl9D7VgbOMIzQe2A0pPo/O
	YSnDNkbyu+bqUXXcDJkwcEnJD5na3iS0o94oa6wXXGVqBzBrjbbP/bE2R1u4u7DHYXvL
	YHaaQnD3LA3xQDT4+YGm2s/a4An6oaS+nLSZk=
Received: by 10.14.37.71 with SMTP id x47mr472549eea.60.1303492637135; Fri, 22
	Apr 2011 10:17:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.119.196 with HTTP; Fri, 22 Apr 2011 10:16:47 -0700 (PDT)
In-Reply-To: <0daf49a24c9ff05b60377dad60234107009efbdb.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
	<0daf49a24c9ff05b60377dad60234107009efbdb.1303453279.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Apr 2011 10:16:47 -0700
Message-ID: <BANLkTiksRbTcCmjcJDeiK=dzhY01N=O6CA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 19:25:49 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 28/33] python-pycairo: fix installation path of __init__.py
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
X-List-Received-Date: Fri, 22 Apr 2011 17:19:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2011 at 12:24 AM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> This fixes Bug [YOCTO #477]
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> =C2=A0.../python/python-pycairo_1.8.10.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A08 +++++++-
> =C2=A01 files changed, 7 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb b/meta=
/recipes-devtools/python/python-pycairo_1.8.10.bb
> index 7d73dc2..24b3ff2 100644
> --- a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
> +++ b/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "LGPLv2.1 & MPLv1.1"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df2e071ab72978431b294a0d6=
96327421"
> =C2=A0# cairo >=3D 1.8.8
> =C2=A0DEPENDS =3D "cairo"
> -PR =3D "ml0"
> +PR =3D "r1"

any reason not to use mlX
>
> =C2=A0SRC_URI =3D "http://cairographics.org/releases/py2cairo-${PV}.tar.g=
z"
>
> @@ -16,6 +16,12 @@ S =3D "${WORKDIR}/pycairo-${PV}"
>
> =C2=A0inherit distutils pkgconfig
>
> +do_compile_prepend() {
> +#fix the installation path of __init__.py
> +#It was going in the sysroot instead of target install location
> + =C2=A0 =C2=A0 =C2=A0 sed -i -e "s#dsy.get_python_lib()#'${D}${PYTHON_SI=
TEPACKAGES_DIR}'#" ${S}/setup.py
> +}
> +
> =C2=A0do_install_append () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${includedir}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}
> --
> 1.7.1
>
>


