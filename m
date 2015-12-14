Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0A87B73179
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 20:43:51 +0000 (UTC)
Received: by pfbo64 with SMTP id o64so32623160pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=CBk/jutgpJq6wymMmtEBWKsBOEA5t2E4b4xlQP747R8=;
	b=DiwsjRAvmJVHdajwXpgQk5LJu4BQNeaW4IaaqSBJ+m7/dl2RBzQCe2+Gfhr3QeXMqm
	y35ryXsta3+ypPTpJnq8CYwxqEnFEKcRo6rqAYSqN8dMliRgagNxCcH5b/XoQjgzq0Zb
	Yvs2oagqPCUJV3YpqgVcg1jd+qYKN8kIBoQPLEJdSN06KYYZ1Irx0sHZS7O/wnV7j87l
	tefZ1s8JVerU+bdQ9BVr09p2Nvi+h3WcWDf8yX+enhGqvp2+Mnw632OTkz7CyR1wKT16
	t8KafuMN7muif7APfXqg7Mea3TcowGqv1OJl5S4BaY0CwjiPXSSPnP0gwl6xb7dM38TN
	BlSQ==
X-Received: by 10.98.73.77 with SMTP id w74mr37744082pfa.39.1450125832355;
	Mon, 14 Dec 2015 12:43:52 -0800 (PST)
Received: from ?IPv6:2601:647:4c02:cc6:c1af:4877:6898:e1ea?
	([2601:647:4c02:cc6:c1af:4877:6898:e1ea])
	by smtp.gmail.com with ESMTPSA id
	y22sm44225873pfi.95.2015.12.14.12.43.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Dec 2015 12:43:51 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LaXYu8epz1WaQCbOB0JLrvChOS8o2LADQWcjwpx4vCxnA@mail.gmail.com>
Date: Mon, 14 Dec 2015 12:43:51 -0800
Message-Id: <0CC4ED09-43F2-4EA9-A8E4-0E39C6102900@gmail.com>
References: <cover.1450073907.git.raj.khem@gmail.com>
	<2ae1ec09a656b0401bdc399ac0b8fb7d488c4106.1450073907.git.raj.khem@gmail.com>
	<CAJTo0LaXYu8epz1WaQCbOB0JLrvChOS8o2LADQWcjwpx4vCxnA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] uclibc: Switch to using uclibc-ng
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
X-List-Received-Date: Mon, 14 Dec 2015 20:43:52 -0000
X-Groupsio-MsgNum: 74750
Content-Type: multipart/signed;
	boundary="Apple-Mail=_06251311-D8AB-4451-8864-42BD90DC1F5E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_06251311-D8AB-4451-8864-42BD90DC1F5E
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_3FD4E015-16B0-4ACD-8155-E725FE35ADF3"

--Apple-Mail=_3FD4E015-16B0-4ACD-8155-E725FE35ADF3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 14, 2015, at 4:20 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 14 December 2015 at 06:23, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> diff --git a/meta/recipes-core/uclibc/uclibc_git.bb =
<http://uclibc_git.bb/> b/meta/recipes-core/uclibc/uclibc_git.bb =
<http://uclibc_git.bb/>
> index fd02b3d..81756ac 100644
> --- a/meta/recipes-core/uclibc/uclibc_git.bb <http://uclibc_git.bb/>
> +++ b/meta/recipes-core/uclibc/uclibc_git.bb <http://uclibc_git.bb/>
> @@ -13,6 +13,11 @@ DEPENDS =3D "virtual/${TARGET_PREFIX}binutils \
>             linux-libc-headers ncurses-native \
>             libgcc-initial kern-tools-native"
>=20
> +#do_compile_prepend () {
> +#  unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +#  oe_runmake pregen
> +#}
> +#
>=20
> Was this for testing?  Presumably I can drop it?

Its dropped from updated patch on pull branch

>=20
> Ross


--Apple-Mail=_3FD4E015-16B0-4ACD-8155-E725FE35ADF3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Dec 14, 2015, at 4:20 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 14 December 2015 at 06:23, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":33d" =
class=3D"a3s" style=3D"overflow:hidden">diff --git =
a/meta/recipes-core/uclibc/<a href=3D"http://uclibc_git.bb/" =
rel=3D"noreferrer" target=3D"_blank" class=3D"">uclibc_git.bb</a> =
b/meta/recipes-core/uclibc/<a href=3D"http://uclibc_git.bb/" =
rel=3D"noreferrer" target=3D"_blank" class=3D"">uclibc_git.bb</a><br =
class=3D"">
index fd02b3d..81756ac 100644<br class=3D"">
--- a/meta/recipes-core/uclibc/<a href=3D"http://uclibc_git.bb/" =
rel=3D"noreferrer" target=3D"_blank" class=3D"">uclibc_git.bb</a><br =
class=3D"">
+++ b/meta/recipes-core/uclibc/<a href=3D"http://uclibc_git.bb/" =
rel=3D"noreferrer" target=3D"_blank" class=3D"">uclibc_git.bb</a><br =
class=3D"">
@@ -13,6 +13,11 @@ DEPENDS =3D "virtual/${TARGET_PREFIX}binutils \<br =
class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; linux-libc-headers =
ncurses-native \<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; libgcc-initial =
kern-tools-native"<br class=3D"">
<br class=3D"">
+#do_compile_prepend () {<br class=3D"">
+#&nbsp; unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS<br class=3D"">
+#&nbsp; oe_runmake pregen<br class=3D"">
+#}<br class=3D"">
+#</div></blockquote></div><br class=3D"">Was this for testing?&nbsp; =
Presumably I can drop it?</div></div></div></blockquote><div><br =
class=3D""></div><div>Its dropped from updated patch on pull =
branch</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><br =
class=3D""></div><div class=3D"gmail_extra">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_3FD4E015-16B0-4ACD-8155-E725FE35ADF3--

--Apple-Mail=_06251311-D8AB-4451-8864-42BD90DC1F5E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZvKggACgkQuwUzVZGdMxSU/wCfTBBqZhVp0J1WmVrSQyxDXkN/
PyIAnjiXra2cl8JUQmqEsWy+dtqScwc3
=6Ucs
-----END PGP SIGNATURE-----

--Apple-Mail=_06251311-D8AB-4451-8864-42BD90DC1F5E--
