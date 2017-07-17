Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id 92ABB6FF84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 15:35:46 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id a12so48921869ywh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 08:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5dqztUgenHKp2MwcNvYnV49ViH3b7fcVBnZBeL+fKec=;
	b=t1GDD45hDoUsxs9cKmrvWMAq4TFAl7IFNOUhAvbhzn1sNg42eJzlgWIRdv5BMcBWpC
	qfnI2USS/F9O0u+/83ci04Ad7VaOqcfv3I2+koMU+0yIiDx3+bDyrtBdJP0s1N8Y9HNZ
	MFyIWk4hpKi01+sOUWz3jIjgaTrFNZqKoXwTIzQYm5+M6dCy2mBarPCASZg1eLVqTayM
	aoIm6Sltk/rij8lSahNq71ArT7Hu5KYM/TPC+zvk70dLCmi7ubwPrPZSIt6daECa4WM3
	Y0isdFbDTtiCVWdLs+IDRklkTZU7wSpSRvG2Bz/rtYxaXgJPqigjpFXvwEUI65BNyqsD
	aVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5dqztUgenHKp2MwcNvYnV49ViH3b7fcVBnZBeL+fKec=;
	b=YrjHUoO6oDMej0plzPBxXkKQrAqoDD13qJwxDRXBRFUo3YqUKgghiNmGDqbQZwY/bq
	uhIe2ByItYm1SuJsVbD05zNFpo5gG02B3jDBb5++aFd6v/7guP2WiCS/SKFOLsIs8Xbh
	ZYpGqh2d/foCW27b9rP6pHhDpyf6oYIx1b+FIyIq/Schykn7dTAeQsLOIFSNBTHC5sAf
	Ixhtw8Sw4kxEfAkYfkk+O8i6DvI54fz8+TqL/e3VyoYIyTDgIffdxoD/I8xV/Kxpn+bp
	wpCKwBCbWiFtS+rcPZbVsxJfQYmgN3fvvjnE8bFmpxDnCYR7rBk20VbyUupCvgdnm6MG
	H1oA==
X-Gm-Message-State: AIVw112Q01oL3rmfjJ6YP6rktdgPLC/g55PiEVuNDzLkKhUJi2PfKVs5
	xW1JyAGIlT3+4CDlp2vmkfG/O2AdnmyO
X-Received: by 10.129.86.215 with SMTP id k206mr16502471ywb.306.1500305747234; 
	Mon, 17 Jul 2017 08:35:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Mon, 17 Jul 2017 08:35:46 -0700 (PDT)
In-Reply-To: <20170717171848.4a8bdc07@tomas.local.tbs-biometrics.cz>
References: <20170717140450.5764-1-Martin.Jansa@gmail.com>
	<20170717171848.4a8bdc07@tomas.local.tbs-biometrics.cz>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 17 Jul 2017 17:35:46 +0200
Message-ID: <CA+chaQf4LMbMS8Er23G9bpxnR620mqBReU=ZK1nqcKmuumUX4g@mail.gmail.com>
To: Tomas Novotny <tomas@novotny.cz>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: icecc in OE (Was: [PATCH] icecc.bbclass: prevent nativesdk builds depending on target specific KERNEL_CC)
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
X-List-Received-Date: Mon, 17 Jul 2017 15:35:46 -0000
Content-Type: multipart/alternative; boundary="001a11431f6a1e619b055485278a"

--001a11431f6a1e619b055485278a
Content-Type: text/plain; charset="UTF-8"

Hi Tomas,

last time we were more actively using 1.0.1-1 (with Ubuntu 12.04), but
nowadays icecc.bbclass is mostly just historic relic for us, we still
inherit it in our DISTROs (with 99.9999% builds running with ICECC_DISABLED
= "1"), so that if someone enables icecc again he will get the same sstate
signatures as our jenkins builds - to reuse already prepopulated
sstate-cache.

We also use own version of icecc-create-env, still the same as long time
ago in:
https://github.com/openwebos/meta-webos/tree/master/recipes-upstreamable/icecc-create-env

Regards,

On Mon, Jul 17, 2017 at 5:18 PM, Tomas Novotny <tomas@novotny.cz> wrote:

> Hi Martin,
>
> which version of icecc are you using?
>
> We were trying 1.1rc2, but we had to patch icecc-create-env script in oe.
>
> Tomas
>
> On Mon, 17 Jul 2017 16:04:50 +0200
> Martin Jansa <martin.jansa@gmail.com> wrote:
>
> > * without this we cause nativesdk-linux-libc-headers to depend
> >   on target specific KERNEL_CC (through icecc_get_tool ->
> >   icecc_is_kernel -> KERNEL_CC -> HOST_CC_KERNEL_ARCH ->
> >   TARGET_CC_KERNEL_ARCH -> TUNE_FEATURES(thumb) as shown by
> >   bitbake-diffsigs:
> >
> >   OE qemux86@ ~/build/oe-core $ ls /OE/build/oe-core/tmp-glibc/
> sstate-diff/1499859497/qemu*/*sdk*/*/*do_configure.sigdata*
> >   /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/
> qemuarm/x86_64-nativesdk-oesdk-linux/nativesdk-linux-
> libc-headers/4.10-r0.do_configure.sigdata.3a9a423878d56524e0ee8e42eba1804f
> >   /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/
> qemux86/x86_64-nativesdk-oesdk-linux/nativesdk-linux-
> libc-headers/4.10-r0.do_configure.sigdata.401071dbaa88903ece37d35a47965ff2
> >
> >   OE qemux86@ ~/build/oe-core $ bitbake-diffsigs
> /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemu*/*
> sdk*/*/*do_configure.sigdata*
> >   basehash changed from 39774238b66763c598153132e87a2c1a to
> aa2d66e770bf533e312536eb0a401c4c
> >   Variable TARGET_CC_KERNEL_ARCH value changed from
> '${@bb.utils.contains('TUNE_FEATURES', 'thumb',
> '-mno-thumb-interwork-marm', '', d)} TUNE_FEATURES{thumb} = Set' to ''
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/icecc.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> > index 8a3308bdda..1cc1c4ddb0 100644
> > --- a/meta/classes/icecc.bbclass
> > +++ b/meta/classes/icecc.bbclass
> > @@ -42,6 +42,7 @@ def icecc_dep_prepend(d):
> >
> >  DEPENDS_prepend += "${@icecc_dep_prepend(d)} "
> >
> > +get_cross_kernel_cc[vardepsexclude] += "KERNEL_CC"
> >  def get_cross_kernel_cc(bb,d):
> >      kernel_cc = d.getVar('KERNEL_CC', False)
> >
>

--001a11431f6a1e619b055485278a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Tomas,<div><br></div><div>last time we were more active=
ly using=C2=A01.0.1-1 (with Ubuntu 12.04), but nowadays icecc.bbclass is mo=
stly just historic relic for us, we still inherit it in our DISTROs (with 9=
9.9999% builds running with ICECC_DISABLED =3D &quot;1&quot;), so that if s=
omeone enables icecc again he will get the same sstate signatures as our je=
nkins builds - to reuse already prepopulated sstate-cache.</div><div><br></=
div><div>We also use own version of icecc-create-env, still the same as lon=
g time ago in:</div><div><a href=3D"https://github.com/openwebos/meta-webos=
/tree/master/recipes-upstreamable/icecc-create-env">https://github.com/open=
webos/meta-webos/tree/master/recipes-upstreamable/icecc-create-env</a><br><=
/div><div><br></div><div>Regards,</div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Mon, Jul 17, 2017 at 5:18 PM, Tomas Novotny =
<span dir=3D"ltr">&lt;<a href=3D"mailto:tomas@novotny.cz" target=3D"_blank"=
>tomas@novotny.cz</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">H=
i Martin,<br>
<br>
which version of icecc are you using?<br>
<br>
We were trying 1.1rc2, but we had to patch icecc-create-env script in oe.<b=
r>
<br>
Tomas<br>
<br>
On Mon, 17 Jul 2017 16:04:50 +0200<br>
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gma=
il.com</a>&gt; wrote:<br>
<br>
&gt; * without this we cause nativesdk-linux-libc-headers to depend<br>
&gt;=C2=A0 =C2=A0on target specific KERNEL_CC (through icecc_get_tool -&gt;=
<br>
&gt;=C2=A0 =C2=A0icecc_is_kernel -&gt; KERNEL_CC -&gt; HOST_CC_KERNEL_ARCH =
-&gt;<br>
&gt;=C2=A0 =C2=A0TARGET_CC_KERNEL_ARCH -&gt; TUNE_FEATURES(thumb) as shown =
by<br>
&gt;=C2=A0 =C2=A0bitbake-diffsigs:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0OE qemux86@ ~/build/oe-core $ ls /OE/build/oe-core/tmp-gli=
bc/<wbr>sstate-diff/1499859497/qemu*/*<wbr>sdk*/*/*do_configure.sigdata*<br=
>
&gt;=C2=A0 =C2=A0/OE/build/oe-core/tmp-glibc/<wbr>sstate-diff/1499859497/<w=
br>qemuarm/x86_64-nativesdk-<wbr>oesdk-linux/nativesdk-linux-<wbr>libc-head=
ers/4.10-r0.do_<wbr>configure.sigdata.<wbr>3a9a423878d56524e0ee8e42eba180<w=
br>4f<br>
&gt;=C2=A0 =C2=A0/OE/build/oe-core/tmp-glibc/<wbr>sstate-diff/1499859497/<w=
br>qemux86/x86_64-nativesdk-<wbr>oesdk-linux/nativesdk-linux-<wbr>libc-head=
ers/4.10-r0.do_<wbr>configure.sigdata.<wbr>401071dbaa88903ece37d35a47965f<w=
br>f2<br>
&gt;<br>
&gt;=C2=A0 =C2=A0OE qemux86@ ~/build/oe-core $ bitbake-diffsigs /OE/build/o=
e-core/tmp-glibc/<wbr>sstate-diff/1499859497/qemu*/*<wbr>sdk*/*/*do_configu=
re.sigdata*<br>
&gt;=C2=A0 =C2=A0basehash changed from 39774238b66763c598153132e87a2c<wbr>1=
a to aa2d66e770bf533e312536eb0a401c<wbr>4c<br>
&gt;=C2=A0 =C2=A0Variable TARGET_CC_KERNEL_ARCH value changed from &#39;${@=
bb.utils.contains(&#39;TUNE_<wbr>FEATURES&#39;, &#39;thumb&#39;, &#39;-mno-=
thumb-interwork-marm&#39;, &#39;&#39;, d)} TUNE_FEATURES{thumb} =3D Set&#39=
; to &#39;&#39;<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/icecc.bbclass | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass<b=
r>
&gt; index 8a3308bdda..1cc1c4ddb0 100644<br>
&gt; --- a/meta/classes/icecc.bbclass<br>
&gt; +++ b/meta/classes/icecc.bbclass<br>
&gt; @@ -42,6 +42,7 @@ def icecc_dep_prepend(d):<br>
&gt;<br>
&gt;=C2=A0 DEPENDS_prepend +=3D &quot;${@icecc_dep_prepend(d)} &quot;<br>
&gt;<br>
&gt; +get_cross_kernel_cc[<wbr>vardepsexclude] +=3D &quot;KERNEL_CC&quot;<b=
r>
&gt;=C2=A0 def get_cross_kernel_cc(bb,d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 kernel_cc =3D d.getVar(&#39;KERNEL_CC&#39;, False)=
<br>
&gt;<br>
</blockquote></div><br></div>

--001a11431f6a1e619b055485278a--
