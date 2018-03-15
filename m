Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f47.google.com (mail-pl0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id C264A787F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 02:00:00 +0000 (UTC)
Received: by mail-pl0-f47.google.com with SMTP id c11-v6so2832628plo.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 19:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QOfhXoo6EMe3WQTCF1Hdxunb/Mk1CCx18mwEhYNiqOo=;
	b=QtFsmPANhWHQN9NGMIlSXYZcNkdOEwMobgw1Eqcsy/2iYDGL0vnUN4P9cbmHBrMTih
	RH2j2Ov5+0Gg1UYGcfPDu/ynZg44R6B8poVjWH8b4SpYe7r6yWqiyeNnsQzZJqOTUfZt
	v0AL3YYvPsrSLIVUbvQqchxwDVe3D+B7ijRt4G0aje5NBlmB3D2w8LZGN6DqhU6/u5YQ
	tNL1faJhSYCR0ix1iVrq+S08vfR9xVq6iKBUOIr/0wjZEKTxrF0E4KcJtA6C8REGgLzx
	ylpwlpAOAIwxlbi6rBzdEGnARb/qygL4R2EZqT9Gfw/nJ5E9pYOfX2LwC/TTVH7Pd1PL
	cWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QOfhXoo6EMe3WQTCF1Hdxunb/Mk1CCx18mwEhYNiqOo=;
	b=dBXS11lYw27NeruF7XYxKEcUz2u/RY1I+ESnuDGgbkZuddyRD1qrIdw5T0ifP9879E
	ewIk+RK3Pmlh5F7JrpZc7NIw+W2ynAaaPsMM01kKXOOn8FfSBlzwboPa86eGo1fOR39R
	h9UxMGMLBxGAINkl8eiheswrhkbx2SoDd1xlw9PoxRImzOczLrFgufbn410LpQ9UePYt
	A9nFWXkM/04hcCorul25vZJGv/I73HXIdwhFj881sSVRo09s0/guQ0i6Md5zcU2tEajO
	5w7lKkUltnYCOoiZYkFL4Q3Nasi++CWVi+lr8+JqK3vbkoFyiIw3Taa5r1wc3KBO4U63
	KS0A==
X-Gm-Message-State: AElRT7GlOa6N6S+hzD+GCFo3+0tMtB4QBC7jMyCAjKKXKRCUcB2aTm2S
	Ay3nCc2FgQeD8stpVUXMVlstCTjLTBJ+KToa+io=
X-Google-Smtp-Source: AG47ELt8PJQSsGKTNVq+8YjjCgOlrDF90awnUeLVP6PpXo34FLtTNcptg3AOSHPNOic5Ck+kMHKOex1Su/zddhLG4KU=
X-Received: by 2002:a17:902:63:: with SMTP id
	90-v6mr6212124pla.125.1521079202011; 
	Wed, 14 Mar 2018 19:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20180315014848.14279-1-raj.khem@gmail.com>
	<CABcZANnzr1Xpw+Xc0=Wr-HCi95Er-GU+zOLPKj81S33GEnUW0w@mail.gmail.com>
In-Reply-To: <CABcZANnzr1Xpw+Xc0=Wr-HCi95Er-GU+zOLPKj81S33GEnUW0w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Mar 2018 01:59:51 +0000
Message-ID: <CAMKF1sqVTJXwHNDPoZ66b7DXCjdGCWsx+0=2ay4dRttOBO+aDw@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Do not use --with-linker-hash-style if LINKER_HASH_STYLE is empty
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
X-List-Received-Date: Thu, 15 Mar 2018 02:00:00 -0000
Content-Type: multipart/alternative; boundary="00000000000082e001056769d9da"

--00000000000082e001056769d9da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2018 at 6:57 PM Christopher Larson <kergoth@gmail.com>
wrote:

> On Wed, Mar 14, 2018 at 6:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> We allow to set LINKER_HASH_STYLE to be empty so this would fail
>> since --with-linker-hash-style needs an argument and cant be empty
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-7.3.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc
>> b/meta/recipes-devtools/gcc/gcc-7.3.inc
>> index d56d2c5e06..cc428ad3ef 100644
>> --- a/meta/recipes-devtools/gcc/gcc-7.3.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
>> @@ -100,7 +100,7 @@ EXTRA_OECONF_BASE =3D "\
>>      --disable-bootstrap \
>>      --disable-libmudflap \
>>      --with-system-zlib \
>> -    --with-linker-hash-style=3D${LINKER_HASH_STYLE} \
>> +
>> ${@['','--with-linker-hash-style=3D${LINKER_HASH_STYLE}'][d.getVar('LINK=
ER_HASH_STYLE')
>> !=3D '']} \
>>
>
> That syntax was a hack around the fact that python didn=E2=80=99t have in=
line if
> statements at the time we started the project, but it does now:
>
>     ${@=E2=80=98=E2=80=94with-linker-hash-style=3D${LINKER_HASH_STYLE}=E2=
=80=99 if
> =E2=80=98${LINKER_HASH_STYLE}=E2=80=99 else =E2=80=98'}
>

Yes that looks more elegant I will test it out and send another patch

> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
>

--00000000000082e001056769d9da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Wed, Mar 14, 2018 =
at 6:57 PM Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.com">kerg=
oth@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><=
div class=3D"gmail_extra"><div class=3D"gmail_quote">On Wed, Mar 14, 2018 a=
t 6:48 PM, Khem Raj <span>&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">We allow to set LINKER_HASH_STYLE to be empty so this would f=
ail<br>
since --with-linker-hash-style needs an argument and cant be empty<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-7.3.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/=
gcc/gcc-7.3.inc<br>
index d56d2c5e06..cc428ad3ef 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc<br>
@@ -100,7 +100,7 @@ EXTRA_OECONF_BASE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0--disable-bootstrap \<br>
=C2=A0 =C2=A0 =C2=A0--disable-libmudflap \<br>
=C2=A0 =C2=A0 =C2=A0--with-system-zlib \<br>
-=C2=A0 =C2=A0 --with-linker-hash-style=3D${LINKER_HASH_STYLE} \<br>
+=C2=A0 =C2=A0 ${@[&#39;&#39;,&#39;--with-linker-hash-style=3D${LINKER_HASH=
_STYLE}&#39;][d.getVar(&#39;LINKER_HASH_STYLE&#39;) !=3D &#39;&#39;]} \<br>=
</blockquote><div><br></div></div></div></div><div><div class=3D"gmail_extr=
a"><div class=3D"gmail_quote"><div>That syntax was a hack around the fact t=
hat python didn=E2=80=99t have inline if statements at the time we started =
the project, but it does now:</div><div><br></div><div>=C2=A0 =C2=A0 ${@=E2=
=80=98=E2=80=94with-linker-hash-style=3D${LINKER_HASH_STYLE}=E2=80=99 if =
=E2=80=98${LINKER_HASH_STYLE}=E2=80=99 else =E2=80=98&#39;}</div></div></di=
v></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes that=
 looks more elegant I will test it out and send another patch=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div><div class=3D"gmail_extra"><div class=3D"=
gmail_quote"><div></div></div></div></div><div><div class=3D"gmail_extra">-=
- <br><div class=3D"m_-6433377919948742872gmail_signature" data-smartmail=
=3D"gmail_signature"><div><div><div>Christopher Larson<br>kergoth at gmail =
dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software E=
ngineer, Mentor Graphics</div></div></div></div>
</div></div></blockquote></div></div>

--00000000000082e001056769d9da--
