Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7B86E78672
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 04:53:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jan 2018 20:53:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,409,1511856000"; d="scan'208";a="14070226"
Received: from ndhanire-mobl1.amr.corp.intel.com ([10.254.16.72])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2018 20:53:49 -0800
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <1516847187-6081-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
Date: Wed, 24 Jan 2018 20:53:49 -0800
Message-Id: <E36F9698-3D8E-4574-98D4-7DFF66ED1879@linux.intel.com>
References: <1516847187-6081-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
To: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH]] python-oauthlib_2.0.6.bb: Add python-oauthlib
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
X-List-Received-Date: Thu, 25 Jan 2018 04:53:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Why do you feel this needs to be in oe-core rather than meta-python? We =
are trying to keep oe-core self contained and if nothing depends on this =
it does not belong in oe-core.

Also, please provide a python3 version as well as oe-core and =
meta-python are transitioning to only python3 support (python2 will be =
EOL in ~2020).

> On Jan 24, 2018, at 6:26 PM, Bhargava Sreekantappa Gayathri =
<bhargava.sreekantappa-gayathri@xilinx.com> wrote:
>=20
> This patch adds python-oauthlib recipe.
>=20
> Signed-off-by: Bhargava Sreekantappa Gayathri =
<bhargava.sreekantappa-gayathri@xilinx.com>
> ---
> .../python/python-oauthlib_2.0.6.bb                | 27 =
++++++++++++++++++++++
> 1 file changed, 27 insertions(+)
> create mode 100644 =
meta/recipes-devtools/python/python-oauthlib_2.0.6.bb
>=20
> diff --git a/meta/recipes-devtools/python/python-oauthlib_2.0.6.bb =
b/meta/recipes-devtools/python/python-oauthlib_2.0.6.bb
> new file mode 100644
> index 0000000..0bcb7b8
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-oauthlib_2.0.6.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "A generic, spec-compliant, thorough implementation of =
the OAuth request-signing logic"
> +HOMEPAGE =3D "https://github.com/idan/oauthlib"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D5ba9ce41463615e082609806255bce1b"
> +
> +SRC_URI =3D =
"https://pypi.python.org/packages/a5/8a/212e9b47fb54be109f3ff0684165bb38c5=
1117f34e175c379fce5c7df754/oauthlib-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "277a9a966cc8c72e492b4eeb41332445"
> +SRC_URI[sha256sum] =3D =
"ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1"
> +
> +S =3D "${WORKDIR}/oauthlib-${PV}"
> +
> +inherit setuptools
> +
> +# The following configs & dependencies are from setuptools =
extras_require.
> +# These dependencies are optional, hence can be controlled via =
PACKAGECONFIG.
> +# The upstream names may not correspond exactly to bitbake package =
names.
> +#
> +# Uncomment this line to enable all the optional features.
> +#PACKAGECONFIG ?=3D "test signedtoken signals rsa"
> +PACKAGECONFIG[test] =3D ",,,python-blinker python-cryptography =
python-nose python-pyjwt"
> +PACKAGECONFIG[signedtoken] =3D ",,,python-cryptography python-pyjwt"
> +PACKAGECONFIG[signals] =3D ",,,python-blinker"
> +PACKAGECONFIG[rsa] =3D ",,,python-cryptography"
> +
> +RDEPENDS_${PN} +=3D "python-core python-crypt python-datetime =
python-json python-lang python-logging python-math python-netclient =
python-re python-unittest"
> +
> --
> 2.7.4
>=20
> This email and any attachments are intended for the sole use of the =
named recipient(s) and contain(s) confidential information that may be =
proprietary, privileged or copyrighted under applicable law. If you are =
not the intended recipient, do not read, copy, or forward this email =
message or any attachments. Delete this email message and any =
attachments immediately.
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


