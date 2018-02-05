Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 78E086093B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 11:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 481A61852B;
	Mon,  5 Feb 2018 12:29:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id YIm1qUVBngq9; Mon,  5 Feb 2018 12:29:14 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7B8C7184AB;
	Mon,  5 Feb 2018 12:29:14 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FCAE1A07B;
	Mon,  5 Feb 2018 12:29:14 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 545A41A05D;
	Mon,  5 Feb 2018 12:29:14 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon,  5 Feb 2018 12:29:14 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 46D8029FA;
	Mon,  5 Feb 2018 12:29:14 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Mon, 5 Feb 2018 12:29:14 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Mon, 5 Feb 2018 12:29:14 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/4] git: 2.15.0 -> 2.16.1
Thread-Index: AQHTnirF8N97q7+OfUaR+j9i+WhXo6OVqlAA
Date: Mon, 5 Feb 2018 11:29:14 +0000
Message-ID: <8e77657de70448429413f20d9d26b33f@XBOX02.axis.com>
References: <cover.1517798422.git.liezhi.yang@windriver.com>
	<46e9caf8d072f584d43c411386159b795e84eb47.1517798422.git.liezhi.yang@windriver.com>
In-Reply-To: <46e9caf8d072f584d43c411386159b795e84eb47.1517798422.git.liezhi.yang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 3/4] git: 2.15.0 -> 2.16.1
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
X-List-Received-Date: Mon, 05 Feb 2018 11:29:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Robert Yang
> Sent: den 5 februari 2018 03:41
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 3/4] git: 2.15.0 -> 2.16.1
>=20
> Add RDEPENDS_${PN} +=3D "perl" to fix:
> ERROR: git-2.16.1-r0 do_package_qa: QA Issue: /usr/share/git-
> core/templates/hooks/fsmonitor-watchman.sample contained in package git
> requires /usr/bin/perl, but no providers found in RDEPENDS_git? [file-rde=
ps]
> ERROR: git-2.16.1-r0 do_package_qa: QA run found fatal errors. Please
> consider fixing them.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/git/git.inc       |  2 ++
>  meta/recipes-devtools/git/git_2.15.0.bb | 11 -----------
>  meta/recipes-devtools/git/git_2.16.1.bb | 11 +++++++++++
>  3 files changed, 13 insertions(+), 11 deletions(-)
>  delete mode 100644 meta/recipes-devtools/git/git_2.15.0.bb
>  create mode 100644 meta/recipes-devtools/git/git_2.16.1.bb
>=20
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/gi=
t/git.inc
> index 9b4c128..4943b94 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -125,6 +125,8 @@ FILES_${PN}-perltools +=3D " \
>      ${libdir}/perl \
>      ${datadir}/perl \
>  "
> +RDEPENDS_${PN} +=3D "perl"

No, don't do that. Instead add the fsmonitor-watchman.sample file=20
to ${PERLTOOLS}, just like the other hook sample files=20
(prepare-commit-msg.sample and pre-rebase.sample) that are written=20
in Perl. That way we'll keep the perl dependency out of the main=20
git package.

>  RDEPENDS_${PN}-perltools =3D "${PN} perl perl-module-file-path findutils=
"
>=20
>  # git-tk package with gitk and git-gui
> diff --git a/meta/recipes-devtools/git/git_2.15.0.bb b/meta/recipes-
> devtools/git/git_2.15.0.bb
> deleted file mode 100644
> index fd6c931..0000000
> --- a/meta/recipes-devtools/git/git_2.15.0.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require git.inc
> -
> -EXTRA_OECONF +=3D "ac_cv_snprintf_returns_bogus=3Dno \
> -
> ac_cv_fread_reads_directories=3D${ac_cv_fread_reads_directories=3Dyes} \
> -                 "
> -EXTRA_OEMAKE +=3D "NO_GETTEXT=3D1"
> -
> -SRC_URI[tarball.md5sum] =3D "1ed7298833336c1accb0a7be5a7a2b1b"
> -SRC_URI[tarball.sha256sum] =3D
> "25762cc50103a6a0665c46ea33ceb0578eee01c19b6a08fd393e8608ccbdb3da"
> -SRC_URI[manpages.md5sum] =3D "19a0116bcb0779e0bc997c4180018daf"
> -SRC_URI[manpages.sha256sum] =3D
> "3b1b9ebf02d4aa6e741becd1ed9319597488743f939fdab3b894ec52d25408ef"
> diff --git a/meta/recipes-devtools/git/git_2.16.1.bb b/meta/recipes-
> devtools/git/git_2.16.1.bb
> new file mode 100644
> index 0000000..9dc4eba
> --- /dev/null
> +++ b/meta/recipes-devtools/git/git_2.16.1.bb
> @@ -0,0 +1,11 @@
> +require git.inc
> +
> +EXTRA_OECONF +=3D "ac_cv_snprintf_returns_bogus=3Dno \
> +
> ac_cv_fread_reads_directories=3D${ac_cv_fread_reads_directories=3Dyes} \
> +                 "
> +EXTRA_OEMAKE +=3D "NO_GETTEXT=3D1"
> +
> +SRC_URI[tarball.md5sum] =3D "37467da8e79e72f28598d667f219f75e"
> +SRC_URI[tarball.sha256sum] =3D
> "56cfa48af2b289bba172ca0a47c29f0083f5846cf4759978b70988e4f07fc9fd"
> +SRC_URI[manpages.md5sum] =3D "5587407f3c28446af12fde3f3131ba34"
> +SRC_URI[manpages.sha256sum] =3D
> "d499e825f429d76862be415f579c20cc26b046573a3a39237acaf9682cb71be7"
> --
> 2.7.4

//peter


