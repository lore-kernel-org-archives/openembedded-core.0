Return-Path: <anibal.limon@linaro.org>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 98D467D19E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 02:35:32 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id w10so2189542uar.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2019 18:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sOAC98FRBuOqkIEGndGCv53z7M/arzmwo+ptbPKW1hg=;
	b=WtEvLHVAu301vsVYNPR60y/aN9FRfl8p0PooF7mKDiLCu05jqoVRxHucIxdyqUFtmk
	xLcYkd7qhW7h9GOXCpExojNmhae89HroiAMPWNmgr0/eDOqWNqXI6Tl8XRi4HXpNCBGb
	w9eucUpM66Jot+FewekPo5oIswwC7nj/q/YEDRSlvN26S+M+nscalIAaGvRThoFoWZ/9
	Wpa7bsfriz5trP9dl/RkhPHi3lw2qikzv6hwbyWgN5mfr16POXW6enE83/3yd8twJpID
	cbdCOiPbiutFb6c6J7sEz3mZsbcs+CtYP9XsIE/Mt08GWJVQH4noS+E3TyLuprNkqSc/
	9cGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sOAC98FRBuOqkIEGndGCv53z7M/arzmwo+ptbPKW1hg=;
	b=Ll1umEQJvBAnd4JKEoFEXqEN/I86Ja0ul5rpN4pwzpEdsoZfSjQid1G4cUYFVbfUQS
	rHdPYf8JHQYUgipEV1pxRTbCXPFPVMmWooHG6sWDGaCewVXO3Gbj198Zh7RlxO4ntZS0
	1uhDke43ulD6OspQukeGr7GqvubG3AG2jIbX2TjObQvxqfaJfgHMYP2ZUkONMec7ECQn
	V+ytXni48zDlIdvQOsCe2ZrqBkkOPIEfnEltMWtHLVgVZogfKZKLIka9G6qCdovuAcJ8
	2stdMIMmEW/JanBXqg2LDnNzqQUzDJBFEfEjb6zFvnQvn8N3S/fWfJJ6BzgmFIeTpprH
	UcAQ==
X-Gm-Message-State: APjAAAXS+NKz7BaGz0degpPSoRhHdENK+N35qky/zmVgQ5yf/gKugFT7
	BLAqXmpHKbRDgWoOkfsY/593+nG0aPWRkNNxFyDfBA==
X-Google-Smtp-Source: APXvYqz5RwwFIyBOnjOvhRuiSi5I/rzw/FY/gsTOtt36BEcxuVzXCZWB4a7NAMvRHebsCLGLMeQzVKbRNBnUYTr3BcM=
X-Received: by 2002:ab0:7219:: with SMTP id u25mr1092068uao.10.1575426933387; 
	Tue, 03 Dec 2019 18:35:33 -0800 (PST)
MIME-Version: 1.0
References: <20191203220624.26500-1-anibal.limon@linaro.org>
	<CAMKF1spabEvBMwjvefWN7ULZ8ZpGfNDgJ1gf75u1B7h3oD4nJg@mail.gmail.com>
In-Reply-To: <CAMKF1spabEvBMwjvefWN7ULZ8ZpGfNDgJ1gf75u1B7h3oD4nJg@mail.gmail.com>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Tue, 3 Dec 2019 20:35:22 -0600
Message-ID: <CA+_AqisSN24sPo5vOzeGY4Kdb_mmQxGArCu0Kw6yeSBv-a+QHw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/classes/meson.bbclass: Add inherit setuptools3
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
X-List-Received-Date: Wed, 04 Dec 2019 02:35:32 -0000
Content-Type: multipart/alternative; boundary="000000000000bc07430598d7aa80"

--000000000000bc07430598d7aa80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Dec 2019 at 17:37, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Tue, Dec 3, 2019 at 2:06 PM An=C3=ADbal Lim=C3=B3n <anibal.limon@linar=
o.org>
> wrote:
>
>> Fixes,
>>
>> ...
>> | Program python3 found: YES
>> (/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/a=
arch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-n=
ative/python3)
>> |
>> | meson.build:36:0: ERROR: <ExternalProgram 'python3' ->
>> ['/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/=
aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-=
native/python3']>
>> is not a valid python or it is missing setuptools
>> |
>> | A full log can be found at
>> /home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aa=
rch64-linaro-linux/waffle/1.6.0-r0/build/meson-logs/meson-log.txt
>> | WARNING: exit code 1 from a shell command.
>> ...
>>
>
> I wonder if it=E2=80=99s better to add this inherit to waffle recipe alon=
e I doubt
> that all meson using recipes are building python modules
>

This issue is triggered from waffle [1] but the actual meson code looks for
setuptools [2].

Anibal

[1] https://gitlab.freedesktop.org/mesa/waffle/blob/master/meson.build#L36
[2]
https://github.com/mesonbuild/meson/blob/master/mesonbuild/modules/python.p=
y#L578


>
>
>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>> ---
>>  meta/classes/meson.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
>> index efa6234078..90868963b7 100644
>> --- a/meta/classes/meson.bbclass
>> +++ b/meta/classes/meson.bbclass
>> @@ -1,4 +1,4 @@
>> -inherit siteinfo python3native
>> +inherit siteinfo python3native setuptools3
>>
>>  DEPENDS_append =3D " meson-native ninja-native"
>>
>> --
>> 2.24.0
>>
>>

--000000000000bc07430598d7aa80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 3 Dec 2019 at 17:37, Khem Raj=
 &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br></div=
><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Dec 3, 2019 at 2:06 PM An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto=
:anibal.limon@linaro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fixes,<b=
r>
<br>
...<br>
| Program python3 found: YES (/home/anibal.limon/linaro/oe-rpb-master/build=
-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroo=
t-native/usr/bin/python3-native/python3)<br>
|<br>
| meson.build:36:0: ERROR: &lt;ExternalProgram &#39;python3&#39; -&gt; [&#3=
9;/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aar=
ch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-nat=
ive/python3&#39;]&gt; is not a valid python or it is missing setuptools<br>
|<br>
| A full log can be found at /home/anibal.limon/linaro/oe-rpb-master/build-=
410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/build/meson-lo=
gs/meson-log.txt<br>
| WARNING: exit code 1 from a shell command.<br>
...<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I wonder if it=
=E2=80=99s better to add this inherit to waffle recipe alone I doubt that a=
ll meson using recipes are building python modules=C2=A0</div></div></div><=
/blockquote><div><br></div><div>This issue is triggered from waffle [1] but=
 the actual meson code looks for setuptools [2].</div><div><br></div><div>A=
nibal</div><div><br></div><div>[1]=C2=A0<a href=3D"https://gitlab.freedeskt=
op.org/mesa/waffle/blob/master/meson.build#L36">https://gitlab.freedesktop.=
org/mesa/waffle/blob/master/meson.build#L36</a></div><div>[2]=C2=A0<a href=
=3D"https://github.com/mesonbuild/meson/blob/master/mesonbuild/modules/pyth=
on.py#L578">https://github.com/mesonbuild/meson/blob/master/mesonbuild/modu=
les/python.py#L578</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=3D"auto"><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/classes/meson.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass<br>
index efa6234078..90868963b7 100644<br>
--- a/meta/classes/meson.bbclass<br>
+++ b/meta/classes/meson.bbclass<br>
@@ -1,4 +1,4 @@<br>
-inherit siteinfo python3native<br>
+inherit siteinfo python3native setuptools3<br>
<br>
=C2=A0DEPENDS_append =3D &quot; meson-native ninja-native&quot;<br>
<br>
-- <br>
2.24.0<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000bc07430598d7aa80--
