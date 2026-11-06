Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1915.1793953734121736937
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 00:28:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vXeRE/cp;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so506535eec.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 00:28:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793953733; cv=none;
        d=google.com; s=arc-20260327;
        b=qTZ9OdyzpfMWou8R7wwPk07WR+HjdwgLq/tDfVR1QIH57Lf72SL8ZxXAYsQ2/R5ozg
         YI9pToMdK8CDR82nuHOAcpz6B/04BpO/uctB7+umsnGjOHNP4Hwy+5ie3A5I+8Ti60nD
         u7sezPiVrx4LX0MHgivoUKz5KnED7HmZIgQp8fZclvcu7y3TX9AgWyqrjK/kYtJYpmrO
         cLxMSxx9I55utf5TvnKfk7DpTgoonYSYXEiRRy1cth9aduk3+RS1G+aQf+barn0O/nkC
         fMDQm16uz5DmRYlGKQIGYjs9Sw93Yg4+2vM803oOsVaAgEN+64tNGEgt9BaXdqSiyWT+
         bSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H3FIiAJha0XVg1ovLx7CQD5UBc1zx/yueH5zFLs1iVQ=;
        fh=r4OXJ1IvJg9T/FrQDoMse5GPLBudIXm5C1nou4KtwTU=;
        b=AXn5FX5FKoCJ6b75zPtM8nD84BsEeP8kTxX4Wz1a5Y3X+D6olSTMwKt10EIZbDx+eS
         AQtfYG7wq9PwxvJUTYtZ+09OTqMnqg4CJzAJN4EQg+WgbvSbcZxZN7cwVkjWFlM2bO1B
         SyKMd9nUmDc0O2+cEIfwdyjSSF8Ikzw/NMmu4gXcs491BeegTOLKc0NDp0hsRCpRusqq
         AfXC7VaS+couekw/Pu5ffv9K/gZO8y7fkkcRHV/6NNS8OWAYXkhBl3CpciGt7eDHeOiY
         IHu5SxZHiNPWFg9a0I/DLEByPrh0mFhLLyD0MxQNWZVVCAzNCCW0CwLShZLJD/Ju8Dh7
         hekg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793953733; x=1794558533; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3FIiAJha0XVg1ovLx7CQD5UBc1zx/yueH5zFLs1iVQ=;
        b=vXeRE/cpDGvtmPT33YVAjdfIketDr6FR5TlnDc0WfWeukEg0U9DC39m7T9+CZnwPBU
         fq9LTmPepsKgYNOe2qOdp2OJXO4AHRGwOZmVfB5FbPNbq9rMtp1bMoUftD2+M2fv5hQM
         mBdNdG3E6g/4TjQ2s18Xds5zriMG+yF7IZVla4eANkwzVU71fRsVsoJp5TJfmTx9rxmO
         TRZb/i+WBi9lyLNxQLn1rqJwOeQXjFKrK8/RXEqhTKYlcpHasRX/ZzJ3hhYdGw0EU6YB
         aoQdOJO+G9DC+l9AoDomKtHno2bI+ju410ueK1Hp/l1MG4Oyem6CWL3vpJssBvA8qIJR
         EclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953733; x=1794558533;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H3FIiAJha0XVg1ovLx7CQD5UBc1zx/yueH5zFLs1iVQ=;
        b=Nnph98BWPzhDJmRoLER4A9VI93x/umfVGwbGFA/xl2Ph5iRy8JDqiFeJwLy3UkD3U+
         C42oREVlsN9NUbYsu/xyNzwMvMQXtNBdt5CQ8AY5kSsYMqcudt+kNjlPbMUsTtJWCWoV
         jDN1+YbjXd0cvv3pRCkphwxLsCu/jLVADmE8oDR0x0YR+7OZSz95WsnBk2rIvO1vdImW
         6JR+dS1hy4IQsAwx24x3bi9Gh8WgEZjPPLgVzlDgUReNBM5Ot2iWu92xe9D0Cj6JVwuQ
         nZ+KeK7mj7c5qXJXRdBEZ7bur0uUnRx/wYWcEuQ3s6GbK5wBXtsgF9rLBsI17vfY6QlN
         P7wg==
X-Gm-Message-State: APuU4Z/9QgldUKI7zE2F8rYayOHkNMZgrsHkl4K3nRqU8Prq9t1C/joj
	mA/SVbueZLju0r9MiUSmnfYu3u1Dy+w2WbOAeuL9izqAiVfaq9FBHUUR/TZCxHS3tEeqlKR6Cev
	iZoNPW/Z2AvLQB8C9wg7cLt36KqBsT4E=
X-Gm-Gg: AYBFou0w2VrTjVWBlxerzMBewN5ioi0ZLWnpcksXeeAYYbp8HI58tHfl69/4gF6BLNO
	FI+SjvPz4bgYaiC4k63mP92JfLtOe5cpUD6Mx3DAjYDjBuInwKRKO/TNS/HWU9XufJOzVcCUch5
	caD3dVTx1Di7Luo/OODEUQmjdHtmBC6585fhQDJ/XiveO/n3ZduUrwVHyxTAGChkbrPBZxxVtgL
	FOIi9NySu7aZSh9v/jy9N+nrEkL/wC29PSJ7D4tbPnGA66WhuXpKnFdxBpTkK54kspYSclYA7IM
	uv2Ht0UtF5HosfxocllozyC0VKCmWUF7ZtO8J3WFvqxB0LDvf3YyIh5lu/uMjOxGpM2Or25822H
	nT6oy8EeGRkmE2LjuiAk5Yt1QygcZayJwQW9wNBg=
X-Received: by 2002:a05:7300:828b:b0:36f:5861:69a2 with SMTP id
 5a478bee46e88-36f729cf8c1mr2347176eec.3.1793953733202; Fri, 06 Nov 2026
 00:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20261106011324.626292-1-ragaprasanth@gmail.com>
 <20261106011324.626292-2-ragaprasanth@gmail.com> <AS8PR10MB50735550B026B9C13DAB259DFD762@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
 <CAG7eodHrvRHJj8P5MGmAxm99Umxb12qeVDaRkggFOdw+sTfjNg@mail.gmail.com>
In-Reply-To: <CAG7eodHrvRHJj8P5MGmAxm99Umxb12qeVDaRkggFOdw+sTfjNg@mail.gmail.com>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Fri, 6 Nov 2026 17:28:16 +0900
X-Gm-Features: AclHuK8dXh8MH53hRTDHsOn0enwq14Tt10j_uBArdVVK5mawlND-IHPyTL6Aj4A
Message-ID: <CAG7eodHPk6FYtFE7-M35ymXqH40RpYEHkdoUbkcgpNKaSdYC0g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] zlib: ignore CVE-2026-76844
To: "paul@pbarker.dev" <paul@pbarker.dev>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Marko, Peter" <peter.marko@siemens.com>
Content-Type: multipart/alternative; boundary="00000000000002d824065f976740"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249609

--00000000000002d824065f976740
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

are you ok with dropping 2/2?

Thanks,
Prasanth


On Fri, Nov 6, 2026 at 5:13=E2=80=AFPM Prasanth Ramesh <ragaprasanth@gmail.=
com>
wrote:

> Hi Peter,
>
> Makes sense for 1.4. I think we can drop patch 2/2, as patch 1/2 doesn't
> depend on it.
> I'll add the CVE_STATUS to the backport branches instead, if needed, ther=
e.
>
> Thanks,
> Prasanth
>
>
> On Fri, Nov 6, 2026 at 3:53=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.=
com>
> wrote:
>
>> zlib recipe version 1.4 does not assert this CVE as unpatched.
>> I think it's not worth to carry patches which just switch
>> patched:fixed-version to patched:cpe-incorrect.
>>
>> Peter
>>
>> > -----Original Message-----
>> > From: Prasanth R <ragaprasanth@gmail.com>
>> > Sent: Friday, November 6, 2026 2:13 AM
>> > To: openembedded-core@lists.openembedded.org
>> > Cc: paul@pbarker.dev; Marko, Peter (FT D EU SK BFS1)
>> > <Peter.Marko@siemens.com>; Prasanth R <ragaprasanth@gmail.com>
>> > Subject: [PATCH v2 2/2] zlib: ignore CVE-2026-76844
>> >
>> > CVE-2026-76844 is a webpack-dev-middleware CVE. Its record got the zli=
b
>> > gz_vacate details by mistake; the zlib CVE for that bug is
>> > CVE-2026-85091 [1].
>> >
>> > [1] https://github.com/madler/zlib/issues/1330
>> >
>> > AI-Generated: Uses Claude
>> > Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
>> > ---
>> >  meta/recipes-core/zlib/zlib_1.4.bb | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta/recipes-core/zlib/zlib_1.4.bb
>> b/meta/recipes-core/zlib/zlib_1.4.bb
>> > index 18b27df878..2bc1967c0e 100644
>> > --- a/meta/recipes-core/zlib/zlib_1.4.bb
>> > +++ b/meta/recipes-core/zlib/zlib_1.4.bb
>> > @@ -47,3 +47,5 @@ BBCLASSEXTEND =3D "native nativesdk"
>> >
>> >  # Adding 'CVE_PRODUCT' to avoid false detection of CVEs
>> >  CVE_PRODUCT =3D "zlib:zlib gnu:zlib"
>> > +
>> > +CVE_STATUS[CVE-2026-76844] =3D "cpe-incorrect: this CVE is for
>> webpack-dev-
>> > middleware, the zlib details were added in error"
>> > --
>> > 2.34.1
>>
>>

--00000000000002d824065f976740
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Paul,=C2=A0</div><div><br></div><div>are you ok wi=
th dropping 2/2?<br><br>Thanks,<br>Prasanth</div><div><div dir=3D"ltr" clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
br></div></div></div></div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 6, 2026 at 5:13=E2=
=80=AFPM Prasanth Ramesh &lt;<a href=3D"mailto:ragaprasanth@gmail.com">raga=
prasanth@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi Peter,<br><br>Makes =
sense for 1.4. I think we can drop patch 2/2, as patch 1/2 doesn&#39;t depe=
nd on it.<br>I&#39;ll add the CVE_STATUS to the backport branches instead, =
if needed, there.<br><br>Thanks,<br>Prasanth<br><br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 6, 2026 at =
3:53=E2=80=AFPM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com"=
 target=3D"_blank">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">zlib recipe version 1.4 does not =
assert this CVE as unpatched.<br>
I think it&#39;s not worth to carry patches which just switch patched:fixed=
-version to patched:cpe-incorrect.<br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Prasanth R &lt;<a href=3D"mailto:ragaprasanth@gmail.com" target=
=3D"_blank">ragaprasanth@gmail.com</a>&gt;<br>
&gt; Sent: Friday, November 6, 2026 2:13 AM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: <a href=3D"mailto:paul@pbarker.dev" target=3D"_blank">paul@pbarker=
.dev</a>; Marko, Peter (FT D EU SK BFS1)<br>
&gt; &lt;<a href=3D"mailto:Peter.Marko@siemens.com" target=3D"_blank">Peter=
.Marko@siemens.com</a>&gt;; Prasanth R &lt;<a href=3D"mailto:ragaprasanth@g=
mail.com" target=3D"_blank">ragaprasanth@gmail.com</a>&gt;<br>
&gt; Subject: [PATCH v2 2/2] zlib: ignore CVE-2026-76844<br>
&gt; <br>
&gt; CVE-2026-76844 is a webpack-dev-middleware CVE. Its record got the zli=
b<br>
&gt; gz_vacate details by mistake; the zlib CVE for that bug is<br>
&gt; CVE-2026-85091 [1].<br>
&gt; <br>
&gt; [1] <a href=3D"https://github.com/madler/zlib/issues/1330" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/madler/zlib/issues/1330</a><br=
>
&gt; <br>
&gt; AI-Generated: Uses Claude<br>
&gt; Signed-off-by: Prasanth R &lt;<a href=3D"mailto:prasanth.r@lineo.co.jp=
" target=3D"_blank">prasanth.r@lineo.co.jp</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/zlib/<a href=3D"http://zlib_1.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">zlib_1.4.bb</a> | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/zlib/<a href=3D"http://zlib_1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">zlib_1.4.bb</a> b/meta/recipes-core/zlib/=
<a href=3D"http://zlib_1.4.bb" rel=3D"noreferrer" target=3D"_blank">zlib_1.=
4.bb</a><br>
&gt; index 18b27df878..2bc1967c0e 100644<br>
&gt; --- a/meta/recipes-core/zlib/<a href=3D"http://zlib_1.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">zlib_1.4.bb</a><br>
&gt; +++ b/meta/recipes-core/zlib/<a href=3D"http://zlib_1.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">zlib_1.4.bb</a><br>
&gt; @@ -47,3 +47,5 @@ BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; <br>
&gt;=C2=A0 # Adding &#39;CVE_PRODUCT&#39; to avoid false detection of CVEs<=
br>
&gt;=C2=A0 CVE_PRODUCT =3D &quot;zlib:zlib gnu:zlib&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2026-76844] =3D &quot;cpe-incorrect: this CVE is for w=
ebpack-dev-<br>
&gt; middleware, the zlib details were added in error&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
<br>
</blockquote></div></div>
</blockquote></div>

--00000000000002d824065f976740--
