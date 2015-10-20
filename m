Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6069675A38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 03:21:25 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so6535630pab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 20:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=YuEssHEXUYAZcP5aAb2WoW9hqhkl5N5nUHrzNUK6vkY=;
	b=0M/VIJv1WCSp2T/Xu8HJHqSUXaIt1viWrJXJG5ezrMQT07JNXLc3Vke1UMKcWqtLan
	x13+kEXOO4cOSW+YLlI4SfTr8GQTCLy4l8RhdLxi0/ZQz/11Bm9U+O89mhUd4Gj72q0v
	aPpPpEJoem6JMnV7Rh4htzsvvnlqT8mcqMj+x+B/4116sykLdHRZGTiuLxEDmjm1jSEL
	IdUwsO7xfPUTlmxePsilUx7FwZ4xz7y9jcGxi1+1FcjiZQI+BX7XgHgjXhaRvMxKZCjh
	5tCWpfPn9dmR/Ql/vxnPU+sfDg0bv+ouww+UO/ra+Yy47NDCvapTWiFKvcVcz2N6udie
	RBWw==
X-Received: by 10.66.157.135 with SMTP id wm7mr1177902pab.22.1445311286494;
	Mon, 19 Oct 2015 20:21:26 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:c43a:7500:299d:6c4e?
	([2601:646:8601:4580:c43a:7500:299d:6c4e])
	by smtp.gmail.com with ESMTPSA id zi1sm689877pbc.10.2015.10.19.20.21.25
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 19 Oct 2015 20:21:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.4\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1445291743-6618-5-git-send-email-ross.burton@intel.com>
Date: Mon, 19 Oct 2015 20:21:24 -0700
Message-Id: <75DA7EE8-0981-47CA-BF96-22F6F2596CC1@gmail.com>
References: <1445291743-6618-1-git-send-email-ross.burton@intel.com>
	<1445291743-6618-5-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3096.4)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][V2 5/5] subversion: add explicit dependency on file-replacement-native for native builds
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
X-List-Received-Date: Tue, 20 Oct 2015 03:21:26 -0000
X-Groupsio-MsgNum: 72384
Content-Type: multipart/signed;
	boundary="Apple-Mail=_069DB0B8-DE40-4AFA-AAF2-5FF8FEB39153";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_069DB0B8-DE40-4AFA-AAF2-5FF8FEB39153
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 19, 2015, at 2:55 PM, Ross Burton <ross.burton@intel.com> =
wrote:
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-devtools/subversion/subversion_1.8.13.bb | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/subversion/subversion_1.8.13.bb =
b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
> index f843b95..9c9bdb1 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.8.13.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
> @@ -1,6 +1,7 @@
> SUMMARY =3D "Subversion (svn) version control system client"
> SECTION =3D "console/network"
> DEPENDS =3D "apr-util serf sqlite3 file=E2=80=9D

It already has file in DEPENDS which means native version will get =
file-native on dependencies, right ?

> +DEPENDS_append_class-native =3D " file-replacement-native"
> RDEPENDS_${PN} =3D "serf"
> LICENSE =3D "Apache-2"
> HOMEPAGE =3D "http://subversion.tigris.org"
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_069DB0B8-DE40-4AFA-AAF2-5FF8FEB39153
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYlszUACgkQuwUzVZGdMxQOxwCePOQaLDOGliWXL5Nd+Rqs6a7h
h2kAoIqCrgpkPI6Bvc+ZwKS1vIFaSx4w
=RPrs
-----END PGP SIGNATURE-----

--Apple-Mail=_069DB0B8-DE40-4AFA-AAF2-5FF8FEB39153--
