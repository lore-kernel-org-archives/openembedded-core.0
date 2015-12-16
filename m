Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8634F70016
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 21:51:12 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id to18so68496574igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 13:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=P5SLKCp/bVsTNxCNOzaSll3HcHCWN6Exisz4dvf4TE4=;
	b=oCJMwQ/IPDATmyJOUnVU+6HMdmR/G+ENCj/9L2/H6f+jmZ/0E3qB1d1KMtL7V7Gzbm
	l9MFwPLFvKGVqxsCM8rW5KikjLBo+TdPMpI0vU2mpi5JixNjjubm8ut5vqZ6aUyBL+lV
	82X1TztaJHsk9htAEAgvyQWg6faTDtxO+EBYFZkcloTauw7o1ZSx/QT1VwuYknuaeh3G
	SNVORna8kC32GNImwnT4kmUJVRmzHrmqq0TuWtq6Ng5OXoTn5EatKdWP6Q+yo/QQ8bbN
	XraXXRgt9Gh/DEkohwx2OTKqqkNwscBBIT2ww1psVN+JlnMK1pnw08kPFVS7bqfIyP1Y
	NCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=P5SLKCp/bVsTNxCNOzaSll3HcHCWN6Exisz4dvf4TE4=;
	b=iMoYEPYG21yocvez7C8C3huGn+5ZGj/wKlDsNlwpDSPibm7TylPBc+1jHbKzm/GbKN
	nj7LcjQaPNyXfT+ou3Etj1FOYTp4vmO8t3/7qzTW7AeEBd2JKMPOc30oNDywkC/gfKYs
	AETtik47D2Vg9FXsewZWk69Z16FvzcXgyohyPKInAHdmvWuvRsCjHIRKCwIjcQHjRwoT
	pF0plygymaN7sBYzz/N7w6+fJGtZ7LdFUZfkg+En8dYIhVdLRy+eaBc90Hm5jxlz1bwJ
	wZUDz9yxF0PPhFwuP55+ULBgJ3yXK/mvujXAukh4P9T6g4rC+E1LQVoLEiSMEotva+vB
	zQ1w==
X-Gm-Message-State: ALoCoQkDgOjzlgrGBCjkxz5NtiTUDtlZf59ZSsUVyz2dOsHrpcZJG6U4m5x4iRKjrevJNWtuzoRVg9OzCVejeenN2DcUug3mh/ZL7nwSplkhsn3D1Qinvc4=
X-Received: by 10.50.7.102 with SMTP id i6mr69702iga.64.1450302673568; Wed, 16
	Dec 2015 13:51:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 16 Dec 2015 13:50:54 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Dec 2015 21:50:54 +0000
Message-ID: <CAJTo0LZtiL=t498ZyUb2upQSfm1+hHwPT0EGYqXWwVx5k5s=Gg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Robert Yang <liezhi.yang@windriver.com>
Subject: Re: [PATCH][V2 1/2][jethro] openssl: sanity check that the bignum module is present
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
X-List-Received-Date: Wed, 16 Dec 2015 21:51:15 -0000
Content-Type: multipart/alternative; boundary=089e0111b170ace74805270ae75d

--089e0111b170ace74805270ae75d
Content-Type: text/plain; charset=UTF-8

Hi Robert,

Can you cherry-pick this back to Jethro please?

Thanks,
Ross

On 11 November 2015 at 15:32, Ross Burton <ross.burton@intel.com> wrote:

> The crypto_use_bigint_in_x86-64_perl patch uses the "bigint" module to
> transparently support 64-bit integers on 32-bit hosts.  Whilst bigint
> (part of
> bignum) is a core Perl module not all distributions install it (notable
> Fedora
> 23).
>
> As the error message when bignum isn't installed is obscure, add a task to
> check
> that it is available and alert the user if it isn't.
>
> [ YOCTO #8562 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.0.2d.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> index fd56841..659e0bd 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> @@ -56,3 +56,13 @@ PARALLEL_MAKEINST = ""
>  do_configure_prepend() {
>    cp ${WORKDIR}/find.pl ${S}/util/find.pl
>  }
> +
> +# The crypto_use_bigint patch means that perl's bignum module needs to be
> +# installed, but some distributions (for example Fedora 23) don't ship it
> by
> +# default.  As the resulting error is very misleading check for bignum
> before
> +# building.
> +do_configure_prepend() {
> +       if ! perl -Mbigint -e true; then
> +               bbfatal "The perl module 'bignum' was not found but this
> is required to build openssl.  Please install this module (often packaged
> as perl-bignum) and re-run bitbake."
> +       fi
> +}
> --
> 2.1.4
>
>

--089e0111b170ace74805270ae75d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Robert,<div><br></div><div>Can you cherry-pick this bac=
k to Jethro please?</div><div><br></div><div>Thanks,</div><div>Ross</div><d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 11 November=
 2015 at 15:32, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.bu=
rton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span class=3D"">The crypto_use_bigint=
_in_x86-64_perl patch uses the &quot;bigint&quot; module to<br>
transparently support 64-bit integers on 32-bit hosts.=C2=A0 Whilst bigint =
(part of<br>
bignum) is a core Perl module not all distributions install it (notable Fed=
ora<br>
23).<br>
<br>
As the error message when bignum isn&#39;t installed is obscure, add a task=
 to check<br>
that it is available and alert the user if it isn&#39;t.<br>
<br>
[ YOCTO #8562 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
</span>=C2=A0meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.=
0.2d.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2d.bb</a> | 10 ++=
++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.=
0.2d.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2d.bb</a> b/meta/=
recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2d.bb" rel=3D"no=
referrer" target=3D"_blank">openssl_1.0.2d.bb</a><br>
index fd56841..659e0bd 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2d.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2d.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.0.2d.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.2d.bb</a><br>
@@ -56,3 +56,13 @@ PARALLEL_MAKEINST =3D &quot;&quot;<br>
<span class=3D"">=C2=A0do_configure_prepend() {<br>
=C2=A0 =C2=A0cp ${WORKDIR}/<a href=3D"http://find.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">find.pl</a> ${S}/util/<a href=3D"http://find.pl" rel=3D"nor=
eferrer" target=3D"_blank">find.pl</a><br>
=C2=A0}<br>
+<br>
+# The crypto_use_bigint patch means that perl&#39;s bignum module needs to=
 be<br>
+# installed, but some distributions (for example Fedora 23) don&#39;t ship=
 it by<br>
+# default.=C2=A0 As the resulting error is very misleading check for bignu=
m before<br>
+# building.<br>
</span>+do_configure_prepend() {<br>
<div class=3D"HOEnZb"><div class=3D"h5">+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ! pe=
rl -Mbigint -e true; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;The p=
erl module &#39;bignum&#39; was not found but this is required to build ope=
nssl.=C2=A0 Please install this module (often packaged as perl-bignum) and =
re-run bitbake.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div></div></div>

--089e0111b170ace74805270ae75d--
