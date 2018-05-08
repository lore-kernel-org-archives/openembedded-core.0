Return-Path: <taborskikrzysztof@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC8274D2B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 13:08:37 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id a8so18708991wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=/HBWF4KE6FiepMfjwknmFu/mcuL4ETwwInO0DSLlmC8=;
	b=T8sHuvqlEJ8OTnEv6mKIwDX5etlHRe1MzcbcHpCt5iHhsBNTNrbUysRqO9NEuR0D5v
	QtpZdhSWhKWD9OLCXvJKQWmSlu2pzux8HeMHX1WAJy7Nn0c2u7UamLMYKLs/17HsV9c8
	Sl/p7yHOWSTF0FjQPzEuRbEN4kFfpWX/UtYjvK9uvoFxZiE+ra/qptIAqqykMJaaZgIw
	/phxTXn7Z1yaqQlf39HUfu0ZOJAxE0KS9+CX81UPq7RPEFkAF5F/3XiakZbL0fUttEC1
	3SPDtjAfyH/5iuVh+jnfo17AoWq3UuttJEvKNitWWI/7il0H+uS2Sh85hsuWQZiEaoky
	yPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=/HBWF4KE6FiepMfjwknmFu/mcuL4ETwwInO0DSLlmC8=;
	b=VLYfyO5Pf00+idO3/JpzXE3ePQIgQkjI/hTcxl/18KQsCZLfFrUs778mc+/O+YIqVs
	u+uh6SxIZz/lNbsePXJ5b/JZjGR5+NFdZyJhfODtQg4EbUgfeH73I6rH+d1jCYuBfNHc
	bxAoxW546j9/13U/Xfv2+p9wjXaOn/o7dROUNV8jXVT6wteVB0w9pABbEliP1sPyQYH4
	W4X9dDemPEdJosOg55h6msGRsQwoPlGlqhP2guIR7CXJHeIdztrRO/44OJ2IZ3LJbUnm
	WKDtEO9CSGAtOvFNeQzv17HRLPiJnXBlTwhuNJrCYwD/82doDvZzEhQOAkdNSccnZ1xi
	RIsQ==
X-Gm-Message-State: ALQs6tA2qmJZD8uOJgXeCJjQqQWuCq/PYNxNPinZ9ZEymw2bQo3xNNyO
	t95UWpxqQs/jRvHVBnc4IPZUu8wGDHQbb3IQZQE=
X-Google-Smtp-Source: AB8JxZobmYQ+ZY5Ep4N/mYCRsrprRuQupth5rSBLIFLL6HVyWp5NpqDGgkBrGj7/AXplixxMbrEk8Agn3PRKgFA4cF8=
X-Received: by 2002:a1c:a750:: with SMTP id
	q77-v6mr3229710wme.111.1525784917468; 
	Tue, 08 May 2018 06:08:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.100.84 with HTTP; Tue, 8 May 2018 06:08:36 -0700 (PDT)
In-Reply-To: <CAFmD+WGeSMG8ZOQnRrjWfN7To6fMbwGS3M2q7Q=8Jf3+hA-ZsA@mail.gmail.com>
References: <20171204181640.31225-1-taborskikrzysztof@gmail.com>
	<00b201d3704c$8357c870$8a075950$@gmail.com>
	<CAFmD+WESsG-ebvx_AmDOpisQFaP3_DzvrWr8dF9j88=5V7GBDg@mail.gmail.com>
	<CAFmD+WGeSMG8ZOQnRrjWfN7To6fMbwGS3M2q7Q=8Jf3+hA-ZsA@mail.gmail.com>
From: Krzysztof Taborski <taborskikrzysztof@gmail.com>
Date: Tue, 8 May 2018 15:08:36 +0200
Message-ID: <CAFmD+WE9YxrEp-zjA998nFH7jKHER-fsBOJyniTzm3+jV0OKOQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 08 May 2018 13:08:37 -0000
Content-Type: multipart/alternative; boundary="000000000000026cab056bb17c5b"

--000000000000026cab056bb17c5b
Content-Type: text/plain; charset="UTF-8"

Could someone look at this?

2017-12-18 16:51 GMT+01:00 Krzysztof Taborski <taborskikrzysztof@gmail.com>:

> ping
>
> 2017-12-12 9:34 GMT+01:00 Krzysztof Taborski <taborskikrzysztof@gmail.com>
> :
>
>> kindly reminder
>>
>> 2017-12-08 18:46 GMT+01:00 Krzysztof Taborski <
>> taborskikrzysztof@gmail.com>:
>>
>>> Hello,
>>> I would like to request feedback about my patch.
>>>
>>> Br,
>>> Krzysztof Taborski
>>>
>>> -----Original Message-----
>>> From: Krzysztof Taborski [mailto:taborskikrzysztof@gmail.com]
>>> Sent: Monday, December 04, 2017 7:17 PM
>>> To: openembedded-core@lists.openembedded.org
>>> Cc: Krzysztof Taborski
>>> Subject: [OE-core][PATCH v2] perl: native modules will not trigger build
>>> perl for target.
>>>
>>> Currently building perl-native modules triggers build perl for target due
>>> to PACKAGES_DYNAMIC regex.
>>>
>>> This commit will cause, that perl native modules will trigger perl-native
>>> build.
>>>
>>> Signed-off-by: Krzysztof Taborski <taborskikrzysztof@gmail.com>
>>> ---
>>>  meta/recipes-devtools/perl/perl-native_5.24.1.bb | 2 ++
>>>  meta/recipes-devtools/perl/perl_5.24.1.bb        | 2 +-
>>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>>> b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>>> index 48113f05a9..a81dc4d703 100644
>>> --- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>>> +++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
>>> @@ -134,3 +134,5 @@ EOF
>>>
>>>  # Fix the path in sstate
>>>  SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"
>>> +PACKAGES_DYNAMIC_class-native += "^perl-module-.*native$"
>>> +
>>> diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb
>>> b/meta/recipes-devtools/perl/perl_5.24.1.bb
>>> index 6b27b22d22..3dc7805da9 100644
>>> --- a/meta/recipes-devtools/perl/perl_5.24.1.bb
>>> +++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
>>> @@ -323,7 +323,7 @@ python split_perl_packages () {
>>>      d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages))
>>> }
>>>
>>> -PACKAGES_DYNAMIC += "^perl-module-.*"
>>> +PACKAGES_DYNAMIC += "^perl-module-.*(?<!\-native)$"
>>>  PACKAGES_DYNAMIC_class-nativesdk += "^nativesdk-perl-module-.*"
>>>
>>>  RPROVIDES_perl-lib = "perl-lib"
>>> --
>>> 2.13.6
>>>
>>>
>>
>>
>> --
>> Pozdrawiam,
>> Krzysiek Taborski
>>
>
>
>
> --
> Pozdrawiam,
> Krzysiek Taborski
>



-- 
Pozdrawiam,
Krzysiek Taborski

--000000000000026cab056bb17c5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Could someone look at this?<br></div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">2017-12-18 16:51 GMT+01:00 Krzysztof T=
aborski <span dir=3D"ltr">&lt;<a href=3D"mailto:taborskikrzysztof@gmail.com=
" target=3D"_blank">taborskikrzysztof@gmail.com</a>&gt;</span>:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div dir=3D"ltr">ping</div><div class=3D"gmail_extra=
"><div><div class=3D"h5"><br><div class=3D"gmail_quote">2017-12-12 9:34 GMT=
+01:00 Krzysztof Taborski <span dir=3D"ltr">&lt;<a href=3D"mailto:taborskik=
rzysztof@gmail.com" target=3D"_blank">taborskikrzysztof@gmail.com</a>&gt;</=
span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">kindly reminder<b=
r></div><div class=3D"gmail_extra"><div><div class=3D"m_-667724658835564336=
8h5"><br><div class=3D"gmail_quote">2017-12-08 18:46 GMT+01:00 Krzysztof Ta=
borski <span dir=3D"ltr">&lt;<a href=3D"mailto:taborskikrzysztof@gmail.com"=
 target=3D"_blank">taborskikrzysztof@gmail.com</a>&gt;</span>:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Hello,<br>
I would like to request feedback about my patch.<br>
<br>
Br,<br>
Krzysztof Taborski<br>
<div class=3D"m_-6677246588355643368m_897606133491491596HOEnZb"><div class=
=3D"m_-6677246588355643368m_897606133491491596h5"><br>
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
/div><span class=3D"m_-6677246588355643368HOEnZb"><font color=3D"#888888">-=
- <br><div class=3D"m_-6677246588355643368m_897606133491491596gmail_signatu=
re" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Pozdrawiam,<div>Krz=
ysiek Taborski</div></div></div>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div></div></div><span c=
lass=3D"HOEnZb"><font color=3D"#888888">-- <br><div class=3D"m_-66772465883=
55643368gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
">Pozdrawiam,<div>Krzysiek Taborski</div></div></div>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Pozdrawiam,<div=
>Krzysiek Taborski</div></div></div>
</div>

--000000000000026cab056bb17c5b--
