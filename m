Return-Path: <kergoth@gmail.com>
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
	[209.85.167.181])
	by mail.openembedded.org (Postfix) with ESMTP id D105C7D9E9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 15:17:07 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id 203so1809477oid.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 08:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i8/Fs3GGAYpgL1+L9C5nlhXX4WtD0rAYRpEDLEGvFUc=;
	b=lhCcByX+hIbx2v09h1I3tZAnGma8x5EfoE/Av9jkyjiUp8ZV58Xrhio9Tl9KhhpBFs
	USM9USdXthkwEvCudUvsFpw6DR5kCcJQ3AoPgxI/KBS2yP6QY1vita6nJ4KxhmA2Qfm0
	beA3F+OacZzUAuo4AcFtW4nkWIDlhh9oclRrhvJz1WUdugtvTAxW8EVvWrkTEXxz8jRv
	GyCtrO1xzlkC29TR5bceMVuz3t8eeA/dMPPNp8LlQ08aTdH/ajZ4UyZyC7JY2lkGf5QE
	9CVbEdhFCCoyDEQDKCQR+KNCsPBF9OJjm2j5Ff0XO9Ffe4sNEnSkIY/ruNzEjpPEIVa6
	DD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i8/Fs3GGAYpgL1+L9C5nlhXX4WtD0rAYRpEDLEGvFUc=;
	b=ScmAy4+nsEca9Rc2R5R7fTtrRBpOXnevZmmaKtEHTXcCWBVZfHuvUiyNs77lbeBKBj
	UHCZGm5PFd/MW2Y3mXSvRQr4HoPb8TKQCciYlhEwwzQnfIP32RbS2ZAE3WKdjntyLSBv
	0V8ij1J5xE1j5dCxRUZ5SfyFn8RH2N63YI9wk2SfTpzArMPmuL2F8yhtVkzC1qTRYvGa
	9OjGjX9K+EcWl5i4RRh0g14Is/J8V2xsDhpTOfoc/yhHH/n8/NpTwihm0BSi6Dh8vEGx
	2AGWIlqwNXXeEBU3z4MaKop72uVUcHy4PK1H/WzkPkeCPjS/9StX6CtyUpQ79vE00p3C
	PUXg==
X-Gm-Message-State: APjAAAXXxB3nTALyzIuEeI8XsrPjzjld48D4NLX1Se9CHGOg0+RM2G5c
	AC5ydhaKVuNoKKvRqdcK/sz0riwVmEjoOaX/1frWqbG6
X-Google-Smtp-Source: APXvYqyvgrJqCzP+0HiT+id5KINCkOEVujclr8RVIMlq2Wa90uXbgatk+h2oxpPzFnyNC1xkurzVjANsgBoxetD64UM=
X-Received: by 2002:aca:f204:: with SMTP id q4mr2495882oih.109.1557328628840; 
	Wed, 08 May 2019 08:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <1557324149-15256-1-git-send-email-Michael.Ho@bmw.de>
In-Reply-To: <1557324149-15256-1-git-send-email-Michael.Ho@bmw.de>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 8 May 2019 08:16:57 -0700
Message-ID: <CABcZANkiucQ6m13KLdEvOj9mUwSp+BpFwQaPB7G7w=r-opSqgw@mail.gmail.com>
To: Michael Ho <Michael.Ho@bmw.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: add named SRCREVs to the sstate hash
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
X-List-Received-Date: Wed, 08 May 2019 15:17:09 -0000
Content-Type: multipart/alternative; boundary="000000000000b87f06058861d39d"

--000000000000b87f06058861d39d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Does SRCPV not already cover this in the majority of cases? SRCREV_FORMAT
controls how the multiple revs end up in PV, and the change to PV results
in rebuilding anyway. And iterating over d.keys() is inefficient, *if*
you=E2=80=99re going to do this, operate on SRCREV, gather up the name=3D p=
arameters
from scm urls, and use that to drive it.

On Wed, May 8, 2019 at 7:10 AM Michael Ho <Michael.Ho@bmw.de> wrote:

> Several fetchers support named sources that require setting a SRCREV with
> the source name as a suffix. These named SRCREV variables are not capture=
d
> in the sstate hash calculation because they're only referenced within the
> bitbake fetcher function.
>
> Add a snippet to the base.bbclass anonymous python to add all named SRCRE=
V
> variables to the vardeps of do_fetch to capture them in the sstate hash
> calculation.
>
> Testing of the bug can be shown by running the following bitbake commands
> with this patch set not applied:
>
> bitbake vulkan-demos | tee
> sed -i 's/SRCREV_gli =3D ".*"/SRCREV_gli =3D "xxx"/' \
>   ../meta/recipes-graphics/vulkan/vulkan-demos_git.bb
> bitbake vulkan-demos | tee;
>
> Results in no errors despite a broken SRCREV because the vulkan-demos is
> considered unchanged.
>
> After applying this patch the above commands instead result in a fetcher
> error which is correct.
> ---
>  meta/classes/base.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 1636c6e..84a27f5 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -638,6 +638,16 @@ python () {
>
>      if needsrcrev:
>          d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")
> +        # Gather all SRCREV_* references to add to the sstate hash
> calculation
> +        # This may capture SRCREVs not used but it's difficult to try to
> restrict it
> +        # to only what is needed
> +        for dkey in d.keys():
> +            if dkey.startswith("SRCREV_"):
> +                # This anonymous python snippet is called multiple times
> so we
> +                # need to be careful to not double up the appends here
> and cause
> +                # the base hash to mismatch the task hash
> +                if dkey not in (d.getVarFlag("do_fetch", "vardeps") or
> '').split():
> +                    d.appendVarFlag("do_fetch", "vardeps", "
> {}".format(dkey))
>
>      set_packagetriplet(d)
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000b87f06058861d39d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Does SRCPV not already cover this in the majority of cases=
? SRCREV_FORMAT controls how the multiple revs end up in PV, and the change=
 to PV results in rebuilding anyway. And iterating over d.keys() is ineffic=
ient, *if* you=E2=80=99re going to do this, operate on SRCREV, gather up th=
e name=3D parameters from scm urls, and use that to drive it.</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 8,=
 2019 at 7:10 AM Michael Ho &lt;<a href=3D"mailto:Michael.Ho@bmw.de">Michae=
l.Ho@bmw.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">Several fetchers suppo=
rt named sources that require setting a SRCREV with<br>
the source name as a suffix. These named SRCREV variables are not captured<=
br>
in the sstate hash calculation because they&#39;re only referenced within t=
he<br>
bitbake fetcher function.<br>
<br>
Add a snippet to the base.bbclass anonymous python to add all named SRCREV<=
br>
variables to the vardeps of do_fetch to capture them in the sstate hash<br>
calculation.<br>
<br>
Testing of the bug can be shown by running the following bitbake commands<b=
r>
with this patch set not applied:<br>
<br>
bitbake vulkan-demos | tee<br>
sed -i &#39;s/SRCREV_gli =3D &quot;.*&quot;/SRCREV_gli =3D &quot;xxx&quot;/=
&#39; \<br>
=C2=A0 ../meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-demos_git.b=
b" rel=3D"noreferrer" target=3D"_blank">vulkan-demos_git.bb</a><br>
bitbake vulkan-demos | tee;<br>
<br>
Results in no errors despite a broken SRCREV because the vulkan-demos is<br=
>
considered unchanged.<br>
<br>
After applying this patch the above commands instead result in a fetcher<br=
>
error which is correct.<br>
---<br>
=C2=A0meta/classes/base.bbclass | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass<br>
index 1636c6e..84a27f5 100644<br>
--- a/meta/classes/base.bbclass<br>
+++ b/meta/classes/base.bbclass<br>
@@ -638,6 +638,16 @@ python () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0if needsrcrev:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;SRCPV&quot;, &quot;${@bb.f=
etch2.get_srcrev(d)}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Gather all SRCREV_* references to add to the=
 sstate hash calculation<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This may capture SRCREVs not used but it&#39=
;s difficult to try to restrict it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to only what is needed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dkey in d.keys():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dkey.startswith(&quot;SRCREV_=
&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This anonymous p=
ython snippet is called multiple times so we<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # need to be caref=
ul to not double up the appends here and cause<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the base hash to=
 mismatch the task hash<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dkey not in (d.=
getVarFlag(&quot;do_fetch&quot;, &quot;vardeps&quot;) or &#39;&#39;).split(=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.ap=
pendVarFlag(&quot;do_fetch&quot;, &quot;vardeps&quot;, &quot; {}&quot;.form=
at(dkey))<br>
<br>
=C2=A0 =C2=A0 =C2=A0set_packagetriplet(d)<br>
<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christoph=
er Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></d=
iv>

--000000000000b87f06058861d39d--
