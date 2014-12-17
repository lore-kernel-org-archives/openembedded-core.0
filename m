Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5809672653
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 11:04:49 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id z107so584069qgd.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 03:04:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EzbG9yHTdZMOlrKe3yTbpLK3b5/ETIMJhMhyvYOq9i4=;
	b=FfHhJ0A0XQtmujC+vvrkMQ9aSN9ZorONUNVR0F7oBXWzCdkfDatYlZzkaKom26lk2N
	vPgUqm+tT/SpFmzAjno81YmVzQnPYtl4YwN9/3AEVKEBUmQR70KDEo5Eodvu+LB2Kd4s
	jIwmvtIQHl6zslLmdgkW8s1eJICanTaxPiiJOaWZlrbK/S6DthWx/QtH1uqiwMcyngp6
	Ux6qpCG323rl7UfOSHBKzeA5hmmHw1lRz0SQO47zTPlH7kVugboDeM166XqI1zf55GRc
	AS8C0KdLbnIZIriCN4SvAVaWMNXsN7CDU08T60DxGyX2y6Asg8856N+Z7evHYoYKV7KW
	T08w==
X-Gm-Message-State: ALoCoQkIrLl1NCuW78owEvF/Bv0AclYfRgdbLNdDp/UGERaBckJvwu+LPERABC4l/ZPaD6oxhjF4
X-Received: by 10.229.126.129 with SMTP id c1mr1438214qcs.12.1418814289920;
	Wed, 17 Dec 2014 03:04:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 17 Dec 2014 03:04:29 -0800 (PST)
In-Reply-To: <54914322.6000309@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<835687296e529e505a948421804d16259eb51d2b.1415350038.git.kai.kang@windriver.com>
	<D9FD4A25-6B2D-4868-B536-9593EFF79254@dominion.thruhere.net>
	<54914322.6000309@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Dec 2014 11:04:29 +0000
Message-ID: <CAJTo0La+gHrdTtS9qG6iMnaHwHrEDcN2DY6uq+EH3tWUbdHfVw@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH 09/24] libpng: add neon option for aarch64
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
X-List-Received-Date: Wed, 17 Dec 2014 11:04:52 -0000
Content-Type: multipart/alternative; boundary=001a1133db4ac0d689050a6771c4

--001a1133db4ac0d689050a6771c4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I find Koen's patch for libpng neater so could you merge that into your
qemuarm64 branch?  The autobuilder has been doing some builds so this
should be the last stage before it's all merged.

Ross

On 17 December 2014 at 08:47, Kang Kai <Kai.Kang@windriver.com> wrote:
>
>  On 2014=E5=B9=B412=E6=9C=8817=E6=97=A5 03:30, Koen Kooi wrote:
>
>  Op 7 nov. 2014, om 09:51 heeft Kai Kang <kai.kang@windriver.com> <kai.ka=
ng@windriver.com> het volgende geschreven:
>
> Add neon option for aarch64 just as for arm. It fails with:
>
> | ./.libs/libpng16.so: undefined reference to `png_init_filter_functions_=
neon'
> | collect2: error: ld returned 1 exit status
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com> <kai.kang@windriver.com>
> ---
> meta/recipes-multimedia/libpng/libpng_1.6.13.bb | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb b/meta/recip=
es-multimedia/libpng/libpng_1.6.13.bb
> index 0c6fd1f..3d32bfe 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
> @@ -20,6 +20,7 @@ inherit autotools binconfig-disabled pkgconfig
>
> # Work around missing symbols
> EXTRA_OECONF_append_arm =3D " ${@bb.utils.contains("TUNE_FEATURES", "neon=
", "--enable-arm-neon=3Don", "--enable-arm-neon=3Doff" ,d)}"
> +EXTRA_OECONF_append_aarch64 =3D " ${@bb.utils.contains("TUNE_FEATURES", =
"neon", "--enable-arm-neon=3Don", "--enable-arm-neon=3Doff" ,d)}"
>
>  You're introducing the same bug in a different way: overeager use of qua=
lifiers. Just drop the _arm bit and it works.
>
>
>
> OK. I'll remove the _arm to fix this issue.
>
> Thanks.
>
> --
> Regards,
> Neil | Kai Kang
>
>

--001a1133db4ac0d689050a6771c4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I find Koen&#39;s patch for libpng neater so could you mer=
ge that into your qemuarm64 branch?=C2=A0 The autobuilder has been doing so=
me builds so this should be the last stage before it&#39;s all merged.<div>=
<br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On 17 December 2014 at 08:47, Kang Kai <span dir=3D"ltr">&lt;=
<a href=3D"mailto:Kai.Kang@windriver.com" target=3D"_blank">Kai.Kang@windri=
ver.com</a>&gt;</span> wrote:<blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><div><div class=3D"h5">
    <div>On 2014=E5=B9=B412=E6=9C=8817=E6=97=A5 03:30, Koen Kooi wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre></pre>
      <blockquote type=3D"cite">
        <pre>Op 7 nov. 2014, om 09:51 heeft Kai Kang <a href=3D"mailto:kai.=
kang@windriver.com" target=3D"_blank">&lt;kai.kang@windriver.com&gt;</a> he=
t volgende geschreven:

Add neon option for aarch64 just as for arm. It fails with:

| ./.libs/libpng16.so: undefined reference to `png_init_filter_functions_ne=
on&#39;
| collect2: error: ld returned 1 exit status

Signed-off-by: Kai Kang <a href=3D"mailto:kai.kang@windriver.com" target=3D=
"_blank">&lt;kai.kang@windriver.com&gt;</a>
---
meta/recipes-multimedia/libpng/<a href=3D"http://libpng_1.6.13.bb" target=
=3D"_blank">libpng_1.6.13.bb</a> | 1 +
1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libpng/<a href=3D"http://libpng_1.6.13=
.bb" target=3D"_blank">libpng_1.6.13.bb</a> b/meta/recipes-multimedia/libpn=
g/<a href=3D"http://libpng_1.6.13.bb" target=3D"_blank">libpng_1.6.13.bb</a=
>
index 0c6fd1f..3d32bfe 100644
--- a/meta/recipes-multimedia/libpng/<a href=3D"http://libpng_1.6.13.bb" ta=
rget=3D"_blank">libpng_1.6.13.bb</a>
+++ b/meta/recipes-multimedia/libpng/<a href=3D"http://libpng_1.6.13.bb" ta=
rget=3D"_blank">libpng_1.6.13.bb</a>
@@ -20,6 +20,7 @@ inherit autotools binconfig-disabled pkgconfig

# Work around missing symbols
EXTRA_OECONF_append_arm =3D &quot; ${@bb.utils.contains(&quot;TUNE_FEATURES=
&quot;, &quot;neon&quot;, &quot;--enable-arm-neon=3Don&quot;, &quot;--enabl=
e-arm-neon=3Doff&quot; ,d)}&quot;
+EXTRA_OECONF_append_aarch64 =3D &quot; ${@bb.utils.contains(&quot;TUNE_FEA=
TURES&quot;, &quot;neon&quot;, &quot;--enable-arm-neon=3Don&quot;, &quot;--=
enable-arm-neon=3Doff&quot; ,d)}&quot;
</pre>
      </blockquote>
      <pre>You&#39;re introducing the same bug in a different way: overeage=
r use of qualifiers. Just drop the _arm bit and it works.

</pre>
    </blockquote>
    <br>
    </div></div><font size=3D"+1">OK. I&#39;ll remove the _arm to fix this =
issue.<br>
      <br>
      Thanks.<span class=3D"HOEnZb"><font color=3D"#888888"><br>
    </font></span></font><span class=3D"HOEnZb"><font color=3D"#888888"><br=
>
    <pre cols=3D"72">--=20
Regards,
Neil | Kai Kang</pre>
  </font></span></div>

</blockquote></div></div>

--001a1133db4ac0d689050a6771c4--
