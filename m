Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3A0C660111
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 16:33:31 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id d136so918076qkg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Aug 2017 09:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6eLwughecRWpMB888vb7rZShU9OPXelwFA9CL4AMMMU=;
	b=ova44RlIsZn1kS1fGHySWo6iYg0tnwhA+vc6g6ypCt+bEW6Y3NzdSCw6YW13d5/wg4
	zyF6rOwPLpn61rCJRC1CUjbrv+QT0gbjBr6wTP+Zif6DusTbN/txXt3OcH/41YJItz1D
	qXja5dYCbXFvdih7O372v4+/e0UJkJp77NMnVIO3jcoBWIuLaDW8I8OJDvoQNGuf+PYi
	N8a/dgdEgVvQKyxY67vQw4A1MA5eVFEgjqQji7L4Y504GtWXS7vz4IGYBcLQouBXsDtY
	rwvG9uqIpX5+bV8h9C2U6ZlS02LTe18Oxc4ZYDu+YEa4do82b+Y+y7P9SrHVDkEBMOEV
	Cijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6eLwughecRWpMB888vb7rZShU9OPXelwFA9CL4AMMMU=;
	b=cdfv6bunkX0C8Y+LDjoDsYijFZNVXCclZP06v+Do3PslNEDPvWih/vVhLVBmwDfzLV
	9w+bkdPTGWj/evUm9vXi9Q2oO/CEs/uvmh1oySUGwWOpnwrKYm3UpnvlIb5WmmCzLCZa
	LHgwdJvgpNTzZanMixTIpDOpMrNJz4WeLspT4HScqmDwaIN9v59vYQakXgaNGSAuEKS+
	WpnM+jiQG7mEVn+0IUUVtFYN5kltLcsPt/SlnPKapuDvXng5OtqTrdFRdQZb7pbF/abG
	SBsRrEVcyyB/55kbgI9nznURZRkhkgvKgpYdH9P6rd3Ezl+vydcXRv8tT34zC2epcs3V
	U4KA==
X-Gm-Message-State: AHYfb5i11nhj8uMYiifnWfr11nwkHyNS/LXC2eCbsTlYm4hkvAtTsP4D
	9MJTUmAiudMXD/AfCXfMqbDaBK2uXA==
X-Received: by 10.55.170.77 with SMTP id t74mr1421886qke.201.1502123613213;
	Mon, 07 Aug 2017 09:33:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.32.6 with HTTP; Mon, 7 Aug 2017 09:33:12 -0700 (PDT)
In-Reply-To: <ccbb9c05cff2aa32ea2677bce15c076ea41acda4.1500889785.git.Qi.Chen@windriver.com>
References: <cover.1500889785.git.Qi.Chen@windriver.com>
	<ccbb9c05cff2aa32ea2677bce15c076ea41acda4.1500889785.git.Qi.Chen@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 7 Aug 2017 09:33:12 -0700
Message-ID: <CABcZANkk7GCArcBTs0kg5W7BK_wnH0DEh3ELfXD=rm63w5wCOw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] diffutils: upgrade to 3.6
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
X-List-Received-Date: Mon, 07 Aug 2017 16:33:32 -0000
Content-Type: multipart/alternative; boundary="001a114d82e85fdf7f05562c688d"

--001a114d82e85fdf7f05562c688d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2017 at 2:51 AM, Chen Qi <Qi.Chen@windriver.com> wrote:

> diffutils-3.5-gcc7.patch is removed as it's merged in this version.
>
> do_configure_prepend is removed to solve the following configure error.
>
>   error: possibly undefined macro: gl_TYPE_WINT_T_PREREQ
>
> A workaround patch is made to fix the following compilation error for
> glibc.
>
>   error: dereferencing pointer to incomplete type 'const struct rpl_optio=
n'
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>

This disables use of the internal getopt, yet we don=E2=80=99t set
gl_cv_func_getopt_gnu=3Dyes in our site info, so it always assumes it doesn=
=E2=80=99t
have a valid gnu getopt and decides to use the internal one, and the build
fails. I expect we need to add that to the site info in glibc-common in the
glib section in order to get this to build, now.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a114d82e85fdf7f05562c688d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, Jul 24, 2017 at 2:51 AM, Chen Qi <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@win=
driver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:r=
gb(204,204,204);padding-left:1ex">diffutils-3.5-gcc7.patch is removed as it=
&#39;s merged in this version.<br>
<br>
do_configure_prepend is removed to solve the following configure error.<br>
<br>
=C2=A0 error: possibly undefined macro: gl_TYPE_WINT_T_PREREQ<br>
<br>
A workaround patch is made to fix the following compilation error for glibc=
.<br>
<br>
=C2=A0 error: dereferencing pointer to incomplete type &#39;const struct rp=
l_option&#39;<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br></blockquote><div><br></div><div>This disables us=
e of the internal getopt, yet we don=E2=80=99t set gl_cv_func_getopt_gnu=3D=
yes in our site info, so it always assumes it doesn=E2=80=99t have a valid =
gnu getopt and decides to use the internal one, and the build fails. I expe=
ct we need to add that to the site info in glibc-common in the glib section=
 in order to get this to build, now.</div></div>-- <br><div class=3D"gmail_=
signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>ker=
goth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Sen=
ior Software Engineer, Mentor Graphics</div></div></div></div>
</div></div>

--001a114d82e85fdf7f05562c688d--
