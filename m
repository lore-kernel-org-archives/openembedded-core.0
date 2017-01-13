Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 70B9371D9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:32:06 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id s140so55806847qke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5qBKPOCn/ETA2YCuehEiyOB+4PAqKCUtzQrLIYSwD2w=;
	b=e8v0k8coxYy1YwNlnX3ags2t64zrgmOquRC2DTXakQ0xxp6v77UtyEyewUtkaze7dn
	v89FoKCg9C0jYeRkC2x6rg2jtQlnjVlTSjvvhd+1v8vcjS5i3hyReXHNuSzakaJIXG4h
	nYr1dAi5CLm0rzh6q8xGWouhNUhElEMrEEjJHyufi4Nfe7pUm7dfo7mRVZzN9kLdRuR+
	6ZDWPkpqlnDBorXntU5uUFEHE4kJ3ZloJ3ttep2fMqBNfLP8N46LPoTbR2np4B1Q8vIM
	dYqn0pefNUhWtNd/Pn+KB/sbJum7kKuCVZEd/9kxq7gHmCDDReIU24jIKgE9UyvksEq4
	P02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5qBKPOCn/ETA2YCuehEiyOB+4PAqKCUtzQrLIYSwD2w=;
	b=ebhITsmrDyHZe3ZkeicXfs7GEB5B9/J68rKXjp1k17YtLuDbnNcsIWlUe0gYX35rye
	sNh5Ypgfw5cgF3OPtev+5RkTbeulP7eCFM3rarbR3eo/COt/gF1bNfKmTNTrQrn1QWs2
	+yJL8VUA6CZE8j3ONy+yqij9LEgHh114Yi6BU+z9fhyxcfFDChiJBqNBPlCevRwpIxUV
	qUFWl9CkxpCIwwejesLQ7Vw/LoO6EnpDVNt/V+zVTKz3hjLJFxgN5ulYM6Pj3c4tM+/9
	weyAlqpfMf5BfPFNBrI74Gv1hoVNDWl29IoouCvRY5fh0VS7srG53fmcp+XlWhdebd4I
	l1Hg==
X-Gm-Message-State: AIkVDXIWatLtRYn0asUvsW4SI+8Rd8hXbB2Xsqp9smV5AES4XRWZXamiDlFqA+J2Xj8+jztspTgbL5opf/4hkQ==
X-Received: by 10.55.121.194 with SMTP id u185mr18229449qkc.56.1484317926216; 
	Fri, 13 Jan 2017 06:32:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Fri, 13 Jan 2017 06:32:05 -0800 (PST)
In-Reply-To: <CAJTo0LZcdu=N99Brb5zocN9w2cROjDU6dgT-1HwXvkJKpxe6cw@mail.gmail.com>
References: <cover.1484312322.git.ross.burton@intel.com>
	<CADkTA4NpPn78=SB+b2zO=Vd8z2SG+BtBLQi1ciKjXyEruoQ1rQ@mail.gmail.com>
	<CAHiDW_Fs4B1B2qzqsJqVdVuEZa40boKH8zGnON04W7L8=bfgSA@mail.gmail.com>
	<CADkTA4O0vhL8k+nvvwMsyBGt-YToan0KiSpMtSYOh+Qkwms6SQ@mail.gmail.com>
	<CAJTo0LZcdu=N99Brb5zocN9w2cROjDU6dgT-1HwXvkJKpxe6cw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 13 Jan 2017 09:32:05 -0500
Message-ID: <CADkTA4PehadXvsFM2wT4sfytFMTK1cNrh+-FA+md4DjFC136Ug@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/80] Consolidated pull
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
X-List-Received-Date: Fri, 13 Jan 2017 14:32:09 -0000
Content-Type: multipart/alternative; boundary=94eb2c05a196b9dded0545fab24d

--94eb2c05a196b9dded0545fab24d
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 13, 2017 at 9:25 AM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 13 January 2017 at 14:19, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>> I'm not much good with musl unfortunately, but honestly, I'm wondering
>> how long we
>> can keep this out with relatively few build issues. In tree, they'll get
>> more attention.
>>
>
> This is a greater problem - the kernel guys seem to think that glibc is
> the only C library worth thinking about.  Khem took the action to talk with
> musl and get their headers fixed - which I believe is just adding a new
> #define to them.
>

oh, and is this one logged in bugzilla ? (or elsewhere, I don't care .. i
just want to have a look
at the proposed fix so I can start a musl build and see if I can fix things
in the background).

Bruce


>
> I'll continue stacking on 4.9 changes until they get sorted out.  I'll
>> probably have some
>> cycles near the end of next week to get lost in c library #ifdef's, if
>> the issues are still
>> around.
>>
>
> I keep on pushing the kernel bits to mut2, so feel free to send an updated
> branch and I can merge that in too.
>
> Ross
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c05a196b9dded0545fab24d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jan 13, 2017 at 9:25 AM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D""=
>On 13 January 2017 at 14:19, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I&#39;m n=
ot much good with musl unfortunately, but honestly, I&#39;m wondering how l=
ong we<br></div><div>can keep this out with relatively few build issues. In=
 tree, they&#39;ll get more attention.</div></blockquote><div><br></div></s=
pan><div>This is a greater problem - the kernel guys seem to think that gli=
bc is the only C library worth thinking about.=C2=A0 Khem took the action t=
o talk with musl and get their headers fixed - which I believe is just addi=
ng a new #define to them.</div></div></div></div></blockquote><div><br></di=
v><div>oh, and is this one logged in bugzilla ? (or elsewhere, I don&#39;t =
care .. i just want to have a look<br></div><div>at the proposed fix so I c=
an start a musl build and see if I can fix things in the background).<br><b=
r></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><sp=
an class=3D""><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I&#39;ll c=
ontinue stacking on 4.9 changes until they get sorted out.=C2=A0 I&#39;ll p=
robably have some<br></div><div>cycles near the end of next week to get los=
t in c library #ifdef&#39;s, if the issues are still<br></div><div>around.<=
/div></blockquote></span></div><br></div><div class=3D"gmail_extra">I keep =
on pushing the kernel bits to mut2, so feel free to send an updated branch =
and I can merge that in too.</div><span class=3D"HOEnZb"><font color=3D"#88=
8888"><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></font></span></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the =
NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div>

--94eb2c05a196b9dded0545fab24d--
