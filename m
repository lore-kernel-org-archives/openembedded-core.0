Return-Path: <jpewhacker@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF8F7458E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 03:46:30 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id y10-v6so4531636otg.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 20:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dTzvZAqEXnQjNC4YYZnSYoBIlKan1I5yeDJHiMyK2+8=;
	b=cg7x0bxwvYIXx2bp1npHwn088a9Pe7TRmiw06MSMShSS4co5oWwsstBkw0H+z3Mlk6
	CAd2SAOz3M8uvVbkMIaA8+fUY8UDusjLZ5ykHrGOEDV8o8fL+vAgxsdjpjGg/gbDFoyh
	yq9tCJ/wbJi+Wjxkr46xQMRsIl83uVUpsKtv/S0uTbGc2xeno7fp6ibz4LsWTW7K2s58
	y/9ndyh5Nzqa4cRBVsRsSoSmGtCBMd9EjEcm9B+qM9S1E3rpZj81rBrtO7Q2uuyS368e
	SfbZ3Wf+PLTq7/v+4ziaS3dLcC0TEaOQIjBHScEvrSALynfmwFY99LGme0e13sA6i/tl
	tPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dTzvZAqEXnQjNC4YYZnSYoBIlKan1I5yeDJHiMyK2+8=;
	b=HmbqzGN3QG206P5YeDzpPr95aEiCmwYJhdFAakvgjufU/v73s8gS8XVkOJN2mGEEf0
	z4JUXYRqzgm3fhG9mfoh4sSvhOb3Pa3JeKtAY5Cgnq6mzhdJKtA/eZomwrkFYUXwW8zx
	TnT/t9FdY9uNzi8gpD42d71ALOOSwUzCgnj4XM/K+5gorFBIELVQZwWI7FPJadnxue2p
	EiqPiwOareolERpAFLXD9zROj41eklvGwLU2c+Ha428ziRdT+JP9v3sl5Mo8jxR961dR
	jDJsCTbN1vyhjODQYbjbKqZg5ODPPBYkhMWXFKDeHu+d/VbqjF6Kz62gCMOMCF2nrWDN
	JuEg==
X-Gm-Message-State: ALKqPwfqt7giz9t3HD04BRt3TJDz8JworB/OW6i6eClaIOPwbFkXcaia
	MiYC32XJvnzAhgpe5fFoWDKLVnQMC2/WLIWZmbs=
X-Google-Smtp-Source: ADUXVKIPPuXEOYgEHfkZkY7wXiHGY6pWHls0ehLc9KTtbdxwsrMSTdT1Mnff0W1lZW9tJmswUxvJAZYUAy4ymON0ioU=
X-Received: by 2002:a9d:4808:: with SMTP id c8-v6mr501866otf.262.1527219991629;
	Thu, 24 May 2018 20:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20180525030911.55982-1-Yue.Tao@windriver.com>
In-Reply-To: <20180525030911.55982-1-Yue.Tao@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 24 May 2018 22:46:19 -0500
Message-ID: <CAJdd5GYqp=urzru6H8EuTtS63QxjGC7BMntuV10w+KXediE9-w@mail.gmail.com>
To: Yue Tao <Yue.Tao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: correct the searching patch of waf
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
X-List-Received-Date: Fri, 25 May 2018 03:46:31 -0000
Content-Type: multipart/alternative; boundary="000000000000185472056cff9d1c"

--000000000000185472056cff9d1c
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018, 22:10 Yue Tao <Yue.Tao@windriver.com> wrote:

> The waf is localed at ${S}/buildtools/bin/, not ${S}. Update the
> subsrcdir to look for the right path. The WARNINGs below can be fixed
> by the fix.
>
> WARNING: lib32-libtalloc-2.1.9-r0 do_configure: Unable to execute waf
> --version, exit code 127. Assuming waf version without bindir/libdir
> support.
> WARNING: lib32-libtdb-1.3.14-r0 do_configure: Unable to execute waf
> --version, exit code 127. Assuming waf version without bindir/libdir
> support.
> WARNING: lib32-libtevent-0.9.31-r0 do_configure: Unable to execute waf
> --version, exit code 127. Assuming waf version without bindir/libdir
> support.
> WARNING: lib32-libldb-1.1.29-r0 do_configure: Unable to execute waf
> --version, exit code 127. Assuming waf version without bindir/libdir
> support.
> WARNING: lib32-samba-4.6.7-r0 do_configure: Unable to execute waf
> --version, exit code 127. Assuming waf version without bindir/libdir
> support.
>
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> ---
>  meta/classes/waf.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index 19e93761b3..f8e66835fb 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -7,7 +7,7 @@ python waf_preconfigure() {
>      import subprocess
>      from distutils.version import StrictVersion
>      subsrcdir = d.getVar('S')
> -    wafbin = os.path.join(subsrcdir, 'waf')
> +    wafbin = os.path.join(subsrcdir + '/buildtools/bin/', 'waf')
>

NACK. ${S}/waf is the "standard" location for waf, if your recipe has it in
a different location, you need to parameterize it. Probably something like:

 WAF ?= "${S}/waf"

However, I thought these recipes were inheriting from waf-samba.bbclass
which already does the right thing. Perhaps you have an outdated version of
meta-oe?

     try:
>          result = subprocess.check_output([wafbin, '--version'],
> cwd=subsrcdir, stderr=subprocess.STDOUT)
>          version = result.decode('utf-8').split()[1]
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000185472056cff9d1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Thu, May 24, 2018, 22:10 Yue Tao &lt;<a href=3D"mailto:Yue.Tao@windriver=
.com">Yue.Tao@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">The waf is localed at ${S}/buildtools/bin/, not ${S}. Update the<br=
>
subsrcdir to look for the right path. The WARNINGs below can be fixed<br>
by the fix.<br>
<br>
WARNING: lib32-libtalloc-2.1.9-r0 do_configure: Unable to execute waf --ver=
sion, exit code 127. Assuming waf version without bindir/libdir support.<br=
>
WARNING: lib32-libtdb-1.3.14-r0 do_configure: Unable to execute waf --versi=
on, exit code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: lib32-libtevent-0.9.31-r0 do_configure: Unable to execute waf --ve=
rsion, exit code 127. Assuming waf version without bindir/libdir support.<b=
r>
WARNING: lib32-libldb-1.1.29-r0 do_configure: Unable to execute waf --versi=
on, exit code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: lib32-samba-4.6.7-r0 do_configure: Unable to execute waf --version=
, exit code 127. Assuming waf version without bindir/libdir support.<br>
<br>
Signed-off-by: Yue Tao &lt;<a href=3D"mailto:Yue.Tao@windriver.com" target=
=3D"_blank" rel=3D"noreferrer">Yue.Tao@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/waf.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index 19e93761b3..f8e66835fb 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -7,7 +7,7 @@ python waf_preconfigure() {<br>
=C2=A0 =C2=A0 =C2=A0import subprocess<br>
=C2=A0 =C2=A0 =C2=A0from distutils.version import StrictVersion<br>
=C2=A0 =C2=A0 =C2=A0subsrcdir =3D d.getVar(&#39;S&#39;)<br>
-=C2=A0 =C2=A0 wafbin =3D os.path.join(subsrcdir, &#39;waf&#39;)<br>
+=C2=A0 =C2=A0 wafbin =3D os.path.join(subsrcdir + &#39;/buildtools/bin/&#3=
9;, &#39;waf&#39;)<br></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">NACK. ${S}/waf is the &quot;standard&quot; location for w=
af, if your recipe has it in a different location, you need to parameterize=
 it. Probably something like:</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">=C2=A0WAF ?=3D &quot;${S}/waf&quot;</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">However, I thought these recipes were inheriting from waf=
-samba.bbclass which already does the right thing. Perhaps you have an outd=
ated version of meta-oe?</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D subprocess.check_output([wafbi=
n, &#39;--version&#39;], cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version =3D result.decode(&#39;utf-8&#39;=
).split()[1]<br>
-- <br>
2.17.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--000000000000185472056cff9d1c--
