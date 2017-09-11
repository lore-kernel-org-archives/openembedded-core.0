Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1172F71BE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:07:58 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id j141so28027245ioj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 08:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M7Rd6s+NCMjb4mDjm7FrDaQikWCrBpfYOZuEnfFZxHg=;
	b=bFEUyhiDA9NYWAv7N4nuHizlCqq9IYaIcWHzdRir3v1RHP9R85Ckg8v00OZgLP+h+U
	NZl1O/SxUBY1PYlzP9Svw3yTzek7yismcF4k/H6pX5p8Uqu7jeYBPK9+Qg5e52A813Xe
	Hg88DwDTVKH5JwKnYUl3upQnu6WeHMCl5wUxMflJusxtWV5mnNSheg32FvG6y3+q4ySp
	rlN/5jjdYh/3ynIQw2zWNwFQkcevje5QNbCHsQlhoePH1PTl5VlsjS3a7mHCPzoLEvxI
	N84YJQ5tPy56apXXq45aS5E1IMfZ49k7HdX67rv6DscSz1npjGW5DL3R0bOb2EfIBcZd
	jDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M7Rd6s+NCMjb4mDjm7FrDaQikWCrBpfYOZuEnfFZxHg=;
	b=NjTeIOoJfFizcx+0KcLQvpykv39lncR5WDk8fgXvu+GrNbvJTyRnh9uUC3vsN8prix
	2lo09Dq/2iN/ZLU7OTEqilvbb8tEc8i/CZb5HfMdQr4ireuWmpfYC1j8c3ZRwNJOa5L3
	4wPhD2BjrAH6AMkoQOFRHck9/WB6O2qF1DAgYU6Xmjt6jrJ66bSVD1z+4iWvzPlYvWkY
	cfygiQmi3A4iArFUyA0wJCC9XhV/YTYteeT3iRO6/YcaEopgfQI91ZulUqsxXlDAY9cQ
	GaeJWgLsCw6tnnBsBI9BAjAX8LqtBZUZxpbdqTNX0/wORpCAxM7YuOPx0Udz//X9VczY
	Whmg==
X-Gm-Message-State: AHPjjUh9urTxp+nAjFyHYpo+K5vO0sqH34CbURnz/e9/LgMwnorU1n92
	pV7KTCvwDra2jeXNZV3QT/BF+DMG46DS
X-Google-Smtp-Source: AOwi7QCiebK7MFv/F6QevT+dtAICUzSqVKRfHQ2x8NGijAB8z/qIx5EBcAAqcfUdWYyCSOJw2OQoGYbBfEwIlEbbkfA=
X-Received: by 10.107.41.18 with SMTP id p18mr14976554iop.142.1505142479832;
	Mon, 11 Sep 2017 08:07:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.158.206 with HTTP; Mon, 11 Sep 2017 08:07:38 -0700 (PDT)
In-Reply-To: <2be5bc6d-25e6-f67b-b1eb-12c3febffb81@windriver.com>
References: <cover.1504673600.git.Qi.Chen@windriver.com>
	<2be5bc6d-25e6-f67b-b1eb-12c3febffb81@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Sep 2017 16:07:38 +0100
Message-ID: <CAJTo0LbfCBcP3zdLyhy+gPunoaF1Fo0yvy-oRAvuEehNaVYixw@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] python3-pip & python3-setuptools: extend to nativesdk
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
X-List-Received-Date: Mon, 11 Sep 2017 15:07:59 -0000
Content-Type: multipart/alternative; boundary="001a1141d8a2d8ed0b0558eb4aab"

--001a1141d8a2d8ed0b0558eb4aab
Content-Type: text/plain; charset="UTF-8"

These are in master-next.

Ross

On 11 September 2017 at 02:44, ChenQi <Qi.Chen@windriver.com> wrote:

> ping
>
> On 09/06/2017 12:54 PM, Chen Qi wrote:
>
>> The following changes since commit 8b4f16a9cbbaf521461f699b7264fa
>> c2ac872581:
>>
>>    mesa-gl: Fix build after recent mesa PACKAGECONFIG changes (2017-09-05
>> 15:01:02 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib ChenQi/python3-nativesdk
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=C
>> henQi/python3-nativesdk
>>
>> Chen Qi (2):
>>    python3-pip: extend to nativesdk
>>    python3-setuptools: extend to nativesdk
>>
>>   meta/recipes-devtools/python/python3-pip_9.0.1.bb         | 2 +-
>>   meta/recipes-devtools/python/python3-setuptools_36.2.7.bb | 7 ++++---
>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141d8a2d8ed0b0558eb4aab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">These are in master-next.<div><div><br></div><div>Ross</di=
v></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
11 September 2017 at 02:44, ChenQi <span dir=3D"ltr">&lt;<a href=3D"mailto:=
Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">ping<span class=3D"im HOEnZb"><=
br>
<br>
On 09/06/2017 12:54 PM, Chen Qi wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The following changes since commit 8b4f16a9cbbaf521461f699b7264fa<wbr>c2ac8=
72581:<br>
<br>
=C2=A0 =C2=A0mesa-gl: Fix build after recent mesa PACKAGECONFIG changes (20=
17-09-05 15:01:02 +0100)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 =C2=A0git://<a href=3D"http://git.pokylinux.org/poky-contrib" rel=3D=
"noreferrer" target=3D"_blank">git.pokylinux.org/poky-<wbr>contrib</a> Chen=
Qi/python3-nativesdk<br>
=C2=A0 =C2=A0<a href=3D"http://git.pokylinux.org/cgit.cgi/poky-contrib/log/=
?h=3DChenQi/python3-nativesdk" rel=3D"noreferrer" target=3D"_blank">http://=
git.pokylinux.org/<wbr>cgit.cgi/poky-contrib/log/?h=3DC<wbr>henQi/python3-n=
ativesdk</a><br>
<br>
Chen Qi (2):<br>
=C2=A0 =C2=A0python3-pip: extend to nativesdk<br>
=C2=A0 =C2=A0python3-setuptools: extend to nativesdk<br>
<br>
=C2=A0 meta/recipes-devtools/python/<a href=3D"http://python3-pip_9.0.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">p<wbr>ython3-pip_9.0.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0 meta/recipes-devtools/python/<a href=3D"http://python3-setuptools_36=
.2.7.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython3-setuptools_36.2.=
7.bb</a> | 7 ++++---<br>
=C2=A0 2 files changed, 5 insertions(+), 4 deletions(-)<br>
<br>
</blockquote>
<br>
-- <br></span><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1141d8a2d8ed0b0558eb4aab--
