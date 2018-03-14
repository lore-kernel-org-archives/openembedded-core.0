Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BFC1B719E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 15:28:26 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u10so4650113wmu.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 08:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=PrW6JU1hFNYkLLVNS9xKLnm3cRjjThx+jlBlq9zrpbo=;
	b=p/d+LFIzQF5CcVJ//xdnl5R1IYqmApgCWqjoTm65xesUCFgUKtPbU2Y+AGgJlW1kTF
	VvrA9g3q7TBCdJYEBFnPQ71V1fdW6pZst70+WZHDbuoYr4IVCILt0cXN0Eaz7c7Gc+sK
	vz7jtxcWGJjE9lLNZU2vAhPJrlmoYrm1LC089kEE0XQiyXcIfRjyfC9YKkDq0gfZyQyN
	q5p365yXQwQOAtwwWiCLEsnXjbGBn3EzrFVmXJpf77S9G/d/pfqjqHfadlVU23j+6+w5
	3uMNIqUEvY1cka8M7KrTA5O4mdmIkonYrHJZEIIMon28IrRwBAcItGnWzLrHnAbK9p85
	l15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=PrW6JU1hFNYkLLVNS9xKLnm3cRjjThx+jlBlq9zrpbo=;
	b=VjeJyDC/mJYW9xK46BO2u3pPzuDNZmAzg1FMaKexNMxNVRkJ12IDnAIeAMbzQamR96
	fu0d++kZWvUYjGrh4mGMYYaff3RlayJ7f2tYexAYKSyo8A9gbdl+GQp8J+V4ipxm7xVV
	T5XBb6AhJI9aweBCrroiGdiE6U2rjTn6SFSg8r7z9AUMc44MpV9eGcXVienj5eN7ZSRd
	4QPpu8wqLu5QU8qrXt03bOz1y6G4lvg2i8vRnRbob1WkLbKq0s67qiwKJABAT1xGYj/P
	zPqUlhmDG3rZCTqvRhUnarW4uXH0SYuL6O+DGHdu/tEVCBMiKydtAkXzSPldQ6tOoLsZ
	1znQ==
X-Gm-Message-State: AElRT7HXvDA9+X8LnecNGynAUIkiJcbo5n7KLlSYXXF+CYH5BRMXNgd8
	8p8rrmD/Zyc7OSbSQ+iw/PGX3xjjj83/ZXuMDds=
X-Google-Smtp-Source: AG47ELubGg0IxZdY4h40JUkgOf6XOPkA/ea3m9FL9rIu3pMfHIwizKu3ghLsClP/kmCutufvbq0Fba62SRPy1E5smTE=
X-Received: by 10.28.148.206 with SMTP id w197mr1858405wmd.60.1521041307474;
	Wed, 14 Mar 2018 08:28:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Wed, 14 Mar 2018 08:28:27 -0700 (PDT)
In-Reply-To: <46eeffd1f3886c633a7586562b1ec67508650528.1520728804.git.Martin.Jansa@gmail.com>
References: <cover.1520728804.git.Martin.Jansa@gmail.com>
	<46eeffd1f3886c633a7586562b1ec67508650528.1520728804.git.Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 14 Mar 2018 16:28:27 +0100
Message-ID: <CA+chaQfQ8y60w15ot+Gn0Hnvv5P-gU_07fpW-HYRy-VNY18M+Q@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH 1/8] Revert "waf.bbclass: explicitly pass bindir and libdir if supported"
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
X-List-Received-Date: Wed, 14 Mar 2018 15:28:27 -0000
Content-Type: multipart/alternative; boundary="001a114b8634d2200f0567610688"

--001a114b8634d2200f0567610688
Content-Type: text/plain; charset="UTF-8"

ping, this was in rocko-next for a while and then it disappeared.

On Sun, Mar 11, 2018 at 1:43 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> * this doesn't work correctly as discussed in:
>   http://lists.openembedded.org/pipermail/openembedded-
> commits/2018-January/218460.html
> * some of the issues were fixed in master since then
>   but not all, so revert it until it's completely resolved
>
> This reverts commit eac21f981337bfaddb2d67161a1ff049158041ce.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/waf.bbclass | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)
>
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index acbda278a2..c4698e910a 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -25,23 +25,8 @@ def get_waf_parallel_make(d):
>
>      return ""
>
> -python waf_preconfigure() {
> -    from distutils.version import StrictVersion
> -    srcsubdir = d.getVar('S')
> -    wafbin = os.path.join(srcsubdir, 'waf')
> -    status, result = oe.utils.getstatusoutput(wafbin + " --version")
> -    if status != 0:
> -        bb.warn("Unable to execute waf --version, exit code %d. Assuming
> waf version without bindir/libdir support." % status)
> -        return
> -    version = result.split()[1]
> -    if StrictVersion(version) >= StrictVersion("1.8.7"):
> -        d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir}
> --libdir=${libdir}")
> -}
> -
> -do_configure[prefuncs] += "waf_preconfigure"
> -
>  waf_do_configure() {
> -       ${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF}
> ${EXTRA_OECONF}
> +       ${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
>  }
>
>  waf_do_compile()  {
> --
> 2.15.1
>
>

--001a114b8634d2200f0567610688
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping, this was in rocko-next for a while and then it disap=
peared.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On S=
un, Mar 11, 2018 at 1:43 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* this doesn&#39;t wor=
k correctly as discussed in:<br>
=C2=A0 <a href=3D"http://lists.openembedded.org/pipermail/openembedded-comm=
its/2018-January/218460.html" rel=3D"noreferrer" target=3D"_blank">http://l=
ists.openembedded.org/<wbr>pipermail/openembedded-<wbr>commits/2018-January=
/218460.<wbr>html</a><br>
* some of the issues were fixed in master since then<br>
=C2=A0 but not all, so revert it until it&#39;s completely resolved<br>
<br>
This reverts commit eac21f981337bfaddb2d67161a1ff0<wbr>49158041ce.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/waf.bbclass | 17 +----------------<br>
=C2=A01 file changed, 1 insertion(+), 16 deletions(-)<br>
<br>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index acbda278a2..c4698e910a 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -25,23 +25,8 @@ def get_waf_parallel_make(d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0return &quot;&quot;<br>
<br>
-python waf_preconfigure() {<br>
-=C2=A0 =C2=A0 from distutils.version import StrictVersion<br>
-=C2=A0 =C2=A0 srcsubdir =3D d.getVar(&#39;S&#39;)<br>
-=C2=A0 =C2=A0 wafbin =3D os.path.join(srcsubdir, &#39;waf&#39;)<br>
-=C2=A0 =C2=A0 status, result =3D oe.utils.getstatusoutput(<wbr>wafbin + &q=
uot; --version&quot;)<br>
-=C2=A0 =C2=A0 if status !=3D 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Unable to execute waf --version,=
 exit code %d. Assuming waf version without bindir/libdir support.&quot; % =
status)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
-=C2=A0 =C2=A0 version =3D result.split()[1]<br>
-=C2=A0 =C2=A0 if StrictVersion(version) &gt;=3D StrictVersion(&quot;1.8.7&=
quot;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;WAF_EXTRA_CONF&quot;, &quot;--b=
indir=3D${bindir} --libdir=3D${libdir}&quot;)<br>
-}<br>
-<br>
-do_configure[prefuncs] +=3D &quot;waf_preconfigure&quot;<br>
-<br>
=C2=A0waf_do_configure() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/waf configure --prefix=3D${prefix} ${WAF_E=
XTRA_CONF} ${EXTRA_OECONF}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/waf configure --prefix=3D${prefix} ${EXTRA=
_OECONF}<br>
=C2=A0}<br>
<br>
=C2=A0waf_do_compile()=C2=A0 {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
</font></span></blockquote></div><br></div>

--001a114b8634d2200f0567610688--
