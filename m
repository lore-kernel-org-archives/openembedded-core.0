Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5001C607DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 06:20:59 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id w190so16592769qkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 23:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VxkXLnBSw6DtR7Sntdc3eTVHZSVq1noVGQPnlxHuSjQ=;
	b=YYEuKMzlGXDk6gUkwOFRjYBNnFOeYz1WWGt7EC835Z3c3s979xUJVPgObCy9z8vynG
	PEVPvk7Sj4VOGi752qAc4dwGEca8gcjMHC8c7WQ77g1vDG1NQ8xA8XRuhOF+Pq6hQKE7
	02Ovk+Hw2XERuwfxowHIOAF4yeRPduxSEAXSwrv83LfrO2GSVWGnnAIQB46tm7ueTkJc
	AGiFrFYXHHdR9KgHtCpK3GYviXsDjovHZL0kjZ/e+XKzEFAEH5J09H0FVzJOSqoeSVmH
	xBY+V4lL9nlmLkFojq6g29uRbsh0RQ5aDAquL2DBM3nLn+b+RE4WkvtJaQmzzfJSC2FB
	Fdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VxkXLnBSw6DtR7Sntdc3eTVHZSVq1noVGQPnlxHuSjQ=;
	b=ZyiKeyXUado3qroNMtnFi34fUyEz5HJ9q8MWHbuscyPfYPAR1DxFeV/+nskDW70o75
	DPd4dRPuDJoNVDUal0gnBM2bFlgwK5elLjoP7bTuQJMWG1udsgSBU4QTmITA9G1JQ20O
	gMfmrhu4chm7aILjDmh7sF922A7qkKB3g1UUSqIlInavUTSVQ54VUoMeZK1y3acbsGYk
	ujqi/+8LmqR5EFDlFG2Pk1paNbK1BeOyXZuU29MJPcZ1mEAvzHQ/Nfci9Bk2n+OUVZjv
	mqwkMucOJ9S8vbqQj5OGMoxwwqJLtQcLrIUIzo2dZfzHwqZ6rTQ3H8CXn8i2aRCjbDFZ
	DcEg==
X-Gm-Message-State: APjAAAWuFJWCUoRNRk/cBlPcDRk7cMOsSdH9VmDGEdzM/icRNKHw6ZNr
	Bu41tGt/89nU7TLNVhC/FzyXYYvAYD3/+YalDz+GuZ8x
X-Google-Smtp-Source: APXvYqyme3dIglGnS8vMZQi4rNe2E7PLudueuLbFYEch7gi78yq2TfY2arwUVBM7+v0oJE5txJY4646QFAfWZut+q0Q=
X-Received: by 2002:a37:7083:: with SMTP id l125mr23892732qkc.71.1563344459866;
	Tue, 16 Jul 2019 23:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190715102016.114264-1-kai.kang@windriver.com>
	<CAMKF1sq8rpdxdH2Yr8bHze06-R3hsmLTDdSLkX-TEj4utY2VYQ@mail.gmail.com>
	<0f664af2-cea3-aaa2-2a7c-74c43d58ced4@windriver.com>
	<CAMKF1spSOgaLYgy6U3r=wXNPcMA+qyy1Oigpob42xFAOFugbvA@mail.gmail.com>
	<8164ebb7-8a4f-a7ce-74de-e4adb60a6022@windriver.com>
In-Reply-To: <8164ebb7-8a4f-a7ce-74de-e4adb60a6022@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 23:20:48 -0700
Message-ID: <CAMKF1sp=r+x8+DyGPAmJUfAMn6qtSzjquP+iaEwjtz1SkYXf7A@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: set incomptible with tune mips
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
X-List-Received-Date: Wed, 17 Jul 2019 06:20:59 -0000
Content-Type: multipart/alternative; boundary="000000000000312802058dda7f7d"

--000000000000312802058dda7f7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right so we should only disable the tunes which don=E2=80=99t have clz and =
not all
mips as this patch is doing

On Tue, Jul 16, 2019 at 10:42 PM Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2019/7/16 =E4=B8=8B=E5=8D=8811:33, Khem Raj wrote:
>
>
>
> On Tue, Jul 16, 2019 at 2:33 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>
>> On 2019/7/16 =E4=B8=8B=E5=8D=883:19, Khem Raj wrote:
>> > On Mon, Jul 15, 2019 at 3:21 AM <kai.kang@windriver.com> wrote:
>> >> From: Kai Kang <kai.kang@windriver.com>
>> >>
>> >> It fails to compile webkit when default tune is 'mips':
>> >>
>> >> |
>> .../tmp-glibc/work/mips-wrs-linux/webkitgtk/2.24.2-r0/webkitgtk-2.24.2
>> >> | /Source/JavaScriptCore/assembler/MacroAssemblerMIPS.h:418:23:
>> >> | error: static assertion failed: CLZ opcode is not available for thi=
s
>> ISA
>> >>
>> >> So don't build webkit when default tune is mips.
>> >>
>> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> >> ---
>> >>   meta/recipes-sato/webkit/webkitgtk_2.24.2.bb | 2 ++
>> >>   1 file changed, 2 insertions(+)
>> >>
>> >> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
>> b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
>> >> index 056334fff5..891266b220 100644
>> >> --- a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
>> >> +++ b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
>> >> @@ -43,6 +43,8 @@ DEPENDS =3D "zlib libsoup-2.4 curl libxml2 cairo
>> libxslt libxt libidn libgcrypt \
>> >>             gettext-native glib-2.0 glib-2.0-native libtasn1 \
>> >>             "
>> >>
>> >> +COMPATIBLE_HOST_mipsarch =3D "${@bb.utils.contains('DEFAULTTUNE',
>> 'mips', 'null', 'mips.*-linux', d)}"
>> <$%7B@bb.utils.contains('DEFAULTTUNE','mips','null','mips.*-linux',d)%7D=
>
>> >> +
>> > this disables is for all kind of mips. I think thats a broad set, it
>> > would be best to narrow it to what you saw it failing for
>> > e.g. it should work for mips32 and mips64 so maybe mips1 is what you
>> > want to disable for
>>
>> I tested with qemumips and qemumips64. When set
>>
>> DEFAULTTUNE=3D "mips"
>
>
> How about using mips32 and mips64 for default tune and retest
>
>
> It build webkitgtk successfully on qemumips and qemumips64 with default
> tune mips32 and mips64.
>
>
>
>>
>> It fails with the error.
>>
>> Regards,
>> Kai
>>
>> >
>> >
>> >>   PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
>> 'x11', 'wayland' ,d)} \
>> >>                      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl'=
,
>> 'webgl opengl', '' ,d)} \
>> >>                      enchant \
>> >> --
>> >> 2.20.0
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>> --
>> Kai Kang
>>
>>
> --
> Kai Kang
>
>

--000000000000312802058dda7f7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Right so we should only disable the tunes which don=
=E2=80=99t have clz and not all mips as this patch is doing=C2=A0</div></di=
v><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, Jul 16, 2019 at 10:42 PM Kang Kai &lt;<a href=3D"mailto:Kai.Kang@w=
indriver.com">Kai.Kang@windriver.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"></div><div bgcolor=3D"#FFFFFF" =
text=3D"#000000">
    <div class=3D"m_-5888914540470042948moz-cite-prefix">On 2019/7/16 =E4=
=B8=8B=E5=8D=8811:33, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 16, 2019 at 2:3=
3
            AM Kang Kai &lt;<a href=3D"mailto:Kai.Kang@windriver.com" targe=
t=3D"_blank">Kai.Kang@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On
            2019/7/16 =E4=B8=8B=E5=8D=883:19, Khem Raj wrote:<br>
            &gt; On Mon, Jul 15, 2019 at 3:21 AM &lt;<a href=3D"mailto:kai.=
kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;
            wrote:<br>
            &gt;&gt; From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windrive=
r.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
            &gt;&gt;<br>
            &gt;&gt; It fails to compile webkit when default tune is
            &#39;mips&#39;:<br>
            &gt;&gt;<br>
            &gt;&gt; |
            .../tmp-glibc/work/mips-wrs-linux/webkitgtk/2.24.2-r0/webkitgtk=
-2.24.2<br>
            &gt;&gt; |
            /Source/JavaScriptCore/assembler/MacroAssemblerMIPS.h:418:23:<b=
r>
            &gt;&gt; | error: static assertion failed: CLZ opcode is not
            available for this ISA<br>
            &gt;&gt;<br>
            &gt;&gt; So don&#39;t build webkit when default tune is mips.<b=
r>
            &gt;&gt;<br>
            &gt;&gt; Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang=
@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
            &gt;&gt; ---<br>
            &gt;&gt;=C2=A0 =C2=A0meta/recipes-sato/webkit/<a href=3D"http:/=
/webkitgtk_2.24.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.2=
.bb</a>
            | 2 ++<br>
            &gt;&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
            &gt;&gt;<br>
            &gt;&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http:=
//webkitgtk_2.24.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.=
2.bb</a>
            b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.24.2.b=
b" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.2.bb</a><br>
            &gt;&gt; index 056334fff5..891266b220 100644<br>
            &gt;&gt; --- a/meta/recipes-sato/webkit/<a href=3D"http://webki=
tgtk_2.24.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.2.bb</a=
><br>
            &gt;&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://webki=
tgtk_2.24.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.2.bb</a=
><br>
            &gt;&gt; @@ -43,6 +43,8 @@ DEPENDS =3D &quot;zlib libsoup-2.4 c=
url
            libxml2 cairo libxslt libxt libidn libgcrypt \<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gettext=
-native glib-2.0 glib-2.0-native
            libtasn1 \<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<=
br>
            &gt;&gt;<br>
            &gt;&gt; +COMPATIBLE_HOST_mipsarch =3D
            <a class=3D"m_-5888914540470042948moz-txt-link-rfc2396E" href=
=3D"mailto:$%7B@bb.utils.contains(&#39;DEFAULTTUNE&#39;,&#39;mips&#39;,&#39=
;null&#39;,&#39;mips.*-linux&#39;,d)%7D" target=3D"_blank">&quot;${@bb.util=
s.contains(&#39;DEFAULTTUNE&#39;, &#39;mips&#39;, &#39;null&#39;,
            &#39;mips.*-linux&#39;, d)}&quot;</a><br>
            &gt;&gt; +<br>
            &gt; this disables is for all kind of mips. I think thats a
            broad set, it<br>
            &gt; would be best to narrow it to what you saw it failing
            for<br>
            &gt; e.g. it should work for mips32 and mips64 so maybe
            mips1 is what you<br>
            &gt; want to disable for<br>
            <br>
            I tested with qemumips and qemumips64. When set<br>
            <br>
            DEFAULTTUNE=3D &quot;mips&quot;</blockquote>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">How about using mips32 and mips64 for default
            tune and retest <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    </div><div bgcolor=3D"#FFFFFF" text=3D"#000000"><p>It build webkitgtk s=
uccessfully on qemumips and qemumips64 with
      default tune mips32 and mips64.</p></div><div bgcolor=3D"#FFFFFF" tex=
t=3D"#000000">
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><br>
            <br>
            It fails with the error.<br>
            <br>
            Regards,<br>
            Kai<br>
            <br>
            &gt;<br>
            &gt;<br>
            &gt;&gt;=C2=A0 =C2=A0PACKAGECONFIG ??=3D
            &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&=
#39;, &#39;x11&#39;,
            &#39;wayland&#39; ,d)} \<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0
            ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39=
;, &#39;webgl
            opengl&#39;, &#39;&#39; ,d)} \<br>
            &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 enchant \<br>
            &gt;&gt; --<br>
            &gt;&gt; 2.20.0<br>
            &gt;&gt;<br>
            &gt;&gt; --<br>
            &gt;&gt; _______________________________________________<br>
            &gt;&gt; Openembedded-core mailing list<br>
            &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded=
.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
            &gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listi=
nfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.op=
enembedded.org/mailman/listinfo/openembedded-core</a><br>
            <br>
            <br>
            -- <br>
            Kai Kang<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"m_-5888914540470042948moz-signature" cols=3D"72">--=20
Kai Kang</pre>
  </div>

</blockquote></div></div>

--000000000000312802058dda7f7d--
