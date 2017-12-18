Return-Path: <taborskikrzysztof@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2498A71B32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 15:51:06 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id i11so30099545wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 07:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=vE1hNSMQhJM4PfUKcLOkgdhGSAUb+SUShjtR3n/TqXo=;
	b=mUXj1MHLfY8LejintH/RsKhs3cHnpdn0uZqifpWsa1a/Fg67xZhyafnlx/oqzf8eTD
	LEMZYMG+pi76wkW1rOLqqf5MJuVQraB0W6GYewmLHYDXkf0reIrYmQOo6uhtxMPdW+8D
	pExXnhpiX++8T4v1elkPylQ78oHxi+afzmJn8Wef0JfhmfzJbgWQyBBiOz9kqj0nBF0c
	DCaPwMCKhb9gHGWOVgtc1X7oaFAytUFWz6nQFh0wZwjaecONYg0d6eT9Vn5hBapSyMXe
	eC3q6734FDENI5IgnmsZVpO/79HkxomZDBFwlhvEsBsN2d9oqX54YAFEjiwDkjyYYlTg
	3dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=vE1hNSMQhJM4PfUKcLOkgdhGSAUb+SUShjtR3n/TqXo=;
	b=l450sFzwgIyisnP4Zs1iLCIbFmewo1Va/pMe4wfJrQ6OkMppRzT5MRBU3Izz6I2PlT
	Oajl2QljMjawr9QONHU6YDDHUJgnSq26GQ187i1UwcuALyIB4wvmkiB82e4KtBGbL9LE
	ziTVjfkuyik9BRPVsO0pJErh4QaG0aaA3zMv0/vVv7pVgYRYk1j6rDfsfXVtdQD+el7/
	cd9fcLj7a5MfALd10h6FeLr6hWfTPUDOI4Lo+RrPoAYDwVg5Y+GahArIf9is1khM6qP8
	ujGxBPl+klgksQ7qFOhsCwsXlBIjP90sWNxz8gTrS8knH6EbK1J207W+uT33uU0CId1O
	2KOA==
X-Gm-Message-State: AKGB3mLJkFQNEbP3NrwDQTdLlqTrr/DKwJdG6NTEZKZ2Op7lvj4Xk5pN
	IUQg7Xy8RS6bT6NsasabrABatcNuSHjtkErf7wM=
X-Google-Smtp-Source: ACJfBovuMqhsA+KkkMhUXVj+02OAvAaINLZMG/sk59qdH2d/uOzwQYi30dGcYz4TRDIVYebIvV0Cb48ZmP/UaluNrXM=
X-Received: by 10.28.191.3 with SMTP id p3mr58513wmf.81.1513612267505; Mon, 18
	Dec 2017 07:51:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.105.70 with HTTP; Mon, 18 Dec 2017 07:51:06 -0800 (PST)
In-Reply-To: <CAFmD+WESsG-ebvx_AmDOpisQFaP3_DzvrWr8dF9j88=5V7GBDg@mail.gmail.com>
References: <20171204181640.31225-1-taborskikrzysztof@gmail.com>
	<00b201d3704c$8357c870$8a075950$@gmail.com>
	<CAFmD+WESsG-ebvx_AmDOpisQFaP3_DzvrWr8dF9j88=5V7GBDg@mail.gmail.com>
From: Krzysztof Taborski <taborskikrzysztof@gmail.com>
Date: Mon, 18 Dec 2017 16:51:06 +0100
Message-ID: <CAFmD+WGeSMG8ZOQnRrjWfN7To6fMbwGS3M2q7Q=8Jf3+hA-ZsA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] perl: native modules will not trigger build perl for target.
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
X-List-Received-Date: Mon, 18 Dec 2017 15:51:07 -0000
Content-Type: multipart/alternative; boundary="001a114e2a8e8850cf05609f5142"

--001a114e2a8e8850cf05609f5142
Content-Type: text/plain; charset="UTF-8"

ping

2017-12-12 9:34 GMT+01:00 Krzysztof Taborski <taborskikrzysztof@gmail.com>:

> kindly reminder
>
> 2017-12-08 18:46 GMT+01:00 Krzysztof Taborski <taborskikrzysztof@gmail.com
> >:
>
>> Hello,
>> I would like to request feedback about my patch.
>>
>> Br,
>> Krzysztof Taborski
>>
>> -----Original Message-----
>> From: Krzysztof Taborski [mailto:taborskikrzysztof@gmail.com]
>> Sent: Monday, December 04, 2017 7:17 PM
>> To: openembedded-core@lists.openembedded.org
>> Cc: Krzysztof Taborski
>> Subject: [OE-core][PATCH v2] perl: native modules will not trigger build
>> perl for target.
>>
>> Currently building perl-native modules triggers build perl for target due
>> to PACKAGES_DYNAMIC regex.
>>
>> This commit will cause, that perl native modules will trigger perl-native
>> build.
>>
>> Signed-off-by: Krzysztof Taborski <taborskikrzysztof@gmail.com>
>> ---
>>  meta/recipes-devtools/perl/perl-native_5.24.1.bb | 2 ++
>>  meta/recipes-devtools/perl/perl_5.24.1.bb        | 2 +-
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>> b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>> index 48113f05a9..a81dc4d703 100644
>> --- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>> +++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>> @@ -134,3 +134,5 @@ EOF
>>
>>  # Fix the path in sstate
>>  SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"
>> +PACKAGES_DYNAMIC_class-native += "^perl-module-.*native$"
>> +
>> diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb
>> b/meta/recipes-devtools/perl/perl_5.24.1.bb
>> index 6b27b22d22..3dc7805da9 100644
>> --- a/meta/recipes-devtools/perl/perl_5.24.1.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
>> @@ -323,7 +323,7 @@ python split_perl_packages () {
>>      d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages))
>> }
>>
>> -PACKAGES_DYNAMIC += "^perl-module-.*"
>> +PACKAGES_DYNAMIC += "^perl-module-.*(?<!\-native)$"
>>  PACKAGES_DYNAMIC_class-nativesdk += "^nativesdk-perl-module-.*"
>>
>>  RPROVIDES_perl-lib = "perl-lib"
>> --
>> 2.13.6
>>
>>
>
>
> --
> Pozdrawiam,
> Krzysiek Taborski
>



-- 
Pozdrawiam,
Krzysiek Taborski

--001a114e2a8e8850cf05609f5142
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">2017-12-12 9:34 GMT+01:00 Krzysztof Taborski <span dir=3D"ltr">&l=
t;<a href=3D"mailto:taborskikrzysztof@gmail.com" target=3D"_blank">taborski=
krzysztof@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
dir=3D"ltr">kindly reminder<br></div><div class=3D"gmail_extra"><div><div c=
lass=3D"h5"><br><div class=3D"gmail_quote">2017-12-08 18:46 GMT+01:00 Krzys=
ztof Taborski <span dir=3D"ltr">&lt;<a href=3D"mailto:taborskikrzysztof@gma=
il.com" target=3D"_blank">taborskikrzysztof@gmail.com</a>&gt;</span>:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Hello,<br>
I would like to request feedback about my patch.<br>
<br>
Br,<br>
Krzysztof Taborski<br>
<div class=3D"m_897606133491491596HOEnZb"><div class=3D"m_89760613349149159=
6h5"><br>
-----Original Message-----<br>
From: Krzysztof Taborski [mailto:<a href=3D"mailto:taborskikrzysztof@gmail.=
com" target=3D"_blank">taborskikrzysztof@gmai<wbr>l.com</a>]<br>
Sent: Monday, December 04, 2017 7:17 PM<br>
To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_=
blank">openembedded-core@lists.openem<wbr>bedded.org</a><br>
Cc: Krzysztof Taborski<br>
Subject: [OE-core][PATCH v2] perl: native modules will not trigger build<br=
>
perl for target.<br>
<br>
Currently building perl-native modules triggers build perl for target due<b=
r>
to PACKAGES_DYNAMIC regex.<br>
<br>
This commit will cause, that perl native modules will trigger perl-native<b=
r>
build.<br>
<br>
Signed-off-by: Krzysztof Taborski &lt;<a href=3D"mailto:taborskikrzysztof@g=
mail.com" target=3D"_blank">taborskikrzysztof@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24.1.bb" r=
el=3D"noreferrer" target=3D"_blank">pe<wbr>rl-native_5.24.1.bb</a> | 2 ++<b=
r>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">pe<wbr>rl_5.24.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 2 +-<br>
=C2=A02 files changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24.=
1.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.bb</a><b=
r>
b/meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24.1.bb" rel=
=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.bb</a><br>
index 48113f05a9..a81dc4d703 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24.1.bb" r=
el=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24.1.bb" r=
el=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.bb</a><br>
@@ -134,3 +134,5 @@ EOF<br>
<br>
=C2=A0# Fix the path in sstate<br>
=C2=A0SSTATE_SCAN_FILES +=3D &quot;*.pm *.pod *.h *.pl *.sh&quot;<br>
+PACKAGES_DYNAMIC_class-native +=3D &quot;^perl-module-.*native$&quot;<br>
+<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" r=
el=3D"noreferrer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=3D"noref=
errer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
index 6b27b22d22..3dc7805da9 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
@@ -323,7 +323,7 @@ python split_perl_packages () {<br>
=C2=A0 =C2=A0 =C2=A0d.setVar(d.expand(&quot;RRECOMMEND<wbr>S_${PN}-modules&=
quot;), &#39; &#39;.join(packages))<br>
}<br>
<br>
-PACKAGES_DYNAMIC +=3D &quot;^perl-module-.*&quot;<br>
+PACKAGES_DYNAMIC +=3D &quot;^perl-module-.*(?&lt;!\-native)$<wbr>&quot;<br=
>
=C2=A0PACKAGES_DYNAMIC_class-native<wbr>sdk +=3D &quot;^nativesdk-perl-modu=
le-.*&quot;<br>
<br>
=C2=A0RPROVIDES_perl-lib =3D &quot;perl-lib&quot;<br>
--<br>
2.13.6<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div></div><=
/div><span class=3D"HOEnZb"><font color=3D"#888888">-- <br><div class=3D"m_=
897606133491491596gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr">Pozdrawiam,<div>Krzysiek Taborski</div></div></div>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Po=
zdrawiam,<div>Krzysiek Taborski</div></div></div>
</div>

--001a114e2a8e8850cf05609f5142--
