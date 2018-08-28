Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id A551278F6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 15:16:31 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id z8-v6so2086970qto.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 08:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xftXnCrzuYcVcOaUmkdsj6zaCM0lOMxcu/i9iSJose0=;
	b=eLvzt3uSBIL3QoCAvFUvp567m4YcTwEF0PSHmJOTEP8IgfxdZKADmksKRY6MGqG9Zg
	+ACn68nFWwmbk7cZGroFSJvHGBZ7RR+21K5w/nYAG3LPwKOlobp2YNmsjezNKHBzRE+X
	cWdbvbo1B6BKXdj2SChz1lQDDA/iDjJQgTOAWMgm0KYOHioUryzp+oR+UU9G9SEcN1MI
	KDUr8Y7Yw6VaffRixOXDV7oeBkZyv6S3JIiPoYSBQc6m5A1KD6R5hG9qHJ1/KQoq2VdJ
	0tCiqhx5lNdia1mCrVSdRut3m7CgUBCMrxPD+N7OE5Ln3RxoWovtkkYcS22tnQaaJ2Hq
	Uzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xftXnCrzuYcVcOaUmkdsj6zaCM0lOMxcu/i9iSJose0=;
	b=UiFAGsU7zRP2fL3o9ZY4DnuFuj6SDVpkmie4roQK0q4cLzOdzctgNLv8xzEcuGgVsb
	egV1Zir1XVGI7YS5f6u4tFuOVqqGdl/hlQCTdReXsmKOXyNHnzYpoSoOfE8FOMMWYFPN
	/isPLCP1m3JbsuXXX/JB6yoJNjSGaR4dUXHmHLhPkbVee3kUuGLrYj6pOF9jr9PEGUxv
	mvIV91WpK5qdwMmCmOJtnKBeZvr6JKIPaoWwRfJM0zXDj8NGK7DHSuxWCgCk+qLdeuo/
	AkIOG+oDf0FsFqGgFbFCj0WJh3NTkhRGKHHxtL1BNBkAGUnd9Pqaj5MzIGQ57nezNswq
	wKcA==
X-Gm-Message-State: APzg51Dpmqod7X2A9Y2MtwdA8rE+X8+OzeVbHzJZp6Wi8nZK5zWu6izH
	0TPtsHwaX9QsJSwW7qrHNg64HoCpNtVQpT7l98A=
X-Google-Smtp-Source: ANB0Vda0Xe/bgTcBfYzgf9UkOUSe4cE2HJsU9rZtSrbPD/1McgyqgahsbDKBo1M0OjvrsbgpZHJ9NA3+O1T1cq1XXYQ=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr2184160qtq.161.1535469392523; 
	Tue, 28 Aug 2018 08:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20180824080738.6061-1-raj.khem@gmail.com>
	<90CD9834-5DC6-4700-8CFA-53634E2A2EA0@gmail.com>
In-Reply-To: <90CD9834-5DC6-4700-8CFA-53634E2A2EA0@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Aug 2018 08:16:21 -0700
Message-ID: <CAMKF1soWiC3zD_Ki82FCNVPDmwYDwZncmrgkZPR8w0T+Gpn2vg@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "cpan.bbclass: adopt to recent EU::MM"
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
X-List-Received-Date: Tue, 28 Aug 2018 15:16:32 -0000
Content-Type: multipart/alternative; boundary="000000000000b477ca05748053c6"

--000000000000b477ca05748053c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 28, 2018 at 12:21 AM Jens Rehsack <rehsack@gmail.com> wrote:

>
>
> Am 24.08.2018 um 10:07 schrieb Khem Raj <raj.khem@gmail.com>:
>
> This reverts commit 2e61533e7c1b1cfd49dc771e907207f11a15c44f.
> ---
> meta/classes/cpan.bbclass | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
> index 926c6358a6..8e079e0d55 100644
> --- a/meta/classes/cpan.bbclass
> +++ b/meta/classes/cpan.bbclass
> @@ -16,7 +16,8 @@ export PERL_ARCHLIB =3D
> "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
> export PERLHOSTLIB =3D
> "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
>
> cpan_do_configure () {
> - yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor
> NO_PERLLOCAL=3D1 NO_PACKLIST=3D1 ${EXTRA_CPANFLAGS}
> + export PERL5LIB=3D"${PERL_ARCHLIB}"
> + yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor
> ${EXTRA_CPANFLAGS}
>
> # Makefile.PLs can exit with success without generating a
> # Makefile, e.g. in cases of missing configure time
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> This one shouldn't get tested together with
>    2387c0d3 cpan.bbclass: make RPATH fix more general
> since the hacked PERL5LIB=3D"${PERL_ARCHLIB}" hides the broken RPATH
> behavior.
>

Yes it won=E2=80=99t this was actsully meant for master-next only

> --
> Jens Rehsack - rehsack@gmail.com
>
>

--000000000000b477ca05748053c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue,=
 Aug 28, 2018 at 12:21 AM Jens Rehsack &lt;<a href=3D"mailto:rehsack@gmail.=
com">rehsack@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div style=3D"word-wrap:break-word;line-break:after-white-space"><br><di=
v><br><blockquote type=3D"cite"></blockquote></div></div><div style=3D"word=
-wrap:break-word;line-break:after-white-space"><div><blockquote type=3D"cit=
e"><div>Am 24.08.2018 um 10:07 schrieb Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;:</div><br class=
=3D"m_5519773361565648024Apple-interchange-newline"></blockquote></div></di=
v><div style=3D"word-wrap:break-word;line-break:after-white-space"><div><bl=
ockquote type=3D"cite"><div><div></div></div></blockquote></div></div><div =
style=3D"word-wrap:break-word;line-break:after-white-space"><div><blockquot=
e type=3D"cite"><div><div>This reverts commit 2e61533e7c1b1cfd49dc771e90720=
7f11a15c44f.<br>---<br> meta/classes/cpan.bbclass | 3 ++-<br> 1 file change=
d, 2 insertions(+), 1 deletion(-)<br><br>diff --git a/meta/classes/cpan.bbc=
lass b/meta/classes/cpan.bbclass<br>index 926c6358a6..8e079e0d55 100644<br>=
--- a/meta/classes/cpan.bbclass<br>+++ b/meta/classes/cpan.bbclass<br>@@ -1=
6,7 +16,8 @@ export PERL_ARCHLIB =3D &quot;${STAGING_LIBDIR}${PERL_OWN_DIR}=
/perl/${@get_perl_version<br> export PERLHOSTLIB =3D &quot;${STAGING_LIBDIR=
_NATIVE}/perl-native/perl/${@get_perl_version(d)}/&quot;<br><br> cpan_do_co=
nfigure () {<br>-<span class=3D"m_5519773361565648024Apple-tab-span" style=
=3D"white-space:pre-wrap">	</span>yes &#39;&#39; | perl ${EXTRA_PERLFLAGS} =
Makefile.PL INSTALLDIRS=3Dvendor NO_PERLLOCAL=3D1 NO_PACKLIST=3D1 ${EXTRA_C=
PANFLAGS}<br>+<span class=3D"m_5519773361565648024Apple-tab-span" style=3D"=
white-space:pre-wrap">	</span>export PERL5LIB=3D&quot;${PERL_ARCHLIB}&quot;=
<br>+<span class=3D"m_5519773361565648024Apple-tab-span" style=3D"white-spa=
ce:pre-wrap">	</span>yes &#39;&#39; | perl ${EXTRA_PERLFLAGS} Makefile.PL I=
NSTALLDIRS=3Dvendor ${EXTRA_CPANFLAGS}<br><br> <span class=3D"m_55197733615=
65648024Apple-tab-span" style=3D"white-space:pre-wrap">	</span># Makefile.P=
Ls can exit with success without generating a<br> <span class=3D"m_55197733=
61565648024Apple-tab-span" style=3D"white-space:pre-wrap">	</span># Makefil=
e, e.g. in cases of missing configure time<br>-- <br>2.18.0<br><br></div></=
div></blockquote></div></div><div style=3D"word-wrap:break-word;line-break:=
after-white-space"><div><blockquote type=3D"cite"><div><div>-- <br>________=
_______________________________________<br>Openembedded-core mailing list<b=
r><a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_bl=
ank">Openembedded-core@lists.openembedded.org</a><br><a href=3D"http://list=
s.openembedded.org/mailman/listinfo/openembedded-core" target=3D"_blank">ht=
tp://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br></div=
></div></blockquote></div><div><br></div><div>This one shouldn&#39;t get te=
sted together with=C2=A0</div><div>=C2=A0 =C2=A02387c0d3=C2=A0cpan.bbclass:=
 make RPATH fix more general</div><div>since the hacked PERL5LIB=3D&quot;${=
PERL_ARCHLIB}&quot; hides the broken RPATH</div><div>behavior.</div></div><=
/blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes it won=E2=80=
=99t this was actsully meant for master-next only=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div style=3D"word-wrap:break-word;line-break:after-white-=
space"><div></div></div><div style=3D"word-wrap:break-word;line-break:after=
-white-space"><div>
<div style=3D"color:rgb(0,0,0);letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;word-wra=
p:break-word"><div style=3D"color:rgb(0,0,0);letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;word-wrap:break-word"><div>--=C2=A0</div><div>Jens Rehsack - <a href=
=3D"mailto:rehsack@gmail.com" target=3D"_blank">rehsack@gmail.com</a></div>=
</div></div>
</div>
<br></div></blockquote></div></div>

--000000000000b477ca05748053c6--
