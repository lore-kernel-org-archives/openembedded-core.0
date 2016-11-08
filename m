Return-Path: <kergoth@gmail.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0DADE719ED
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 15:19:52 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id r204so180202246ywb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 07:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=HKX9bCcFsxFpyAB5mdF2uXb0D700vEkM6LazEWsmB5E=;
	b=UJ2sxvaDDlABcHkrZ0SggjpWgO0Rn5kgMe8zjvhP0O7dhEf7gnuBKHgTh9SeRCUwEP
	JtALrc6LwNfy1+YzzW7gyztc7RKOM3emJ4jpMceshKnb5VlZVhAmgLjkmXfisGeG/70+
	vTkgOMCOqd+EzHUx+H1IQ+038QYODOi6lARSqa40JV84ju3FHlA3GDJWA5dYK3BHZgyz
	8VU7lPKoVF/pgxQffAEEPad9BWj58Qkn3kkMomLADDWsAd6nYvKP6YmOYC0d5Nivr7We
	+0sAmnV9/zPJES4PPZYU5zldzvd3HovsezxSQC3FHQ3bGHzBs6FXmW9JIdCNjg+Bytjf
	qW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=HKX9bCcFsxFpyAB5mdF2uXb0D700vEkM6LazEWsmB5E=;
	b=fwRRVere+YZsusHegw9IRalzmMiXfReBl8bdLRxJeOcrL1bPTVwRym/TGniwU7uRAy
	X2MXvFgnxf5a01MB3XnKwMCh46ZcZq5uBLymgLdfQtTtq5t93V/LfBW6W2nTcjmSSHS5
	UhZamIk5ycl/foIevYQdTo+EAYfsEvL3EYSNq8yU6ndYH5zFE0A2RnjNKiRZ1UkS2qHN
	Z5z4oSe3OYX/Q+XMwpoLOyVe7Xxh5CPDulwTn0HpL2iV9Ja9mNf4usgw/vjm17U8RonZ
	5+FqwoGO0GoZTrdk2SKLWJtGh6MQftJu7thUG1JwYnRvgjkbe+UzvX9Veq4gy8hNEFbj
	AYcA==
X-Gm-Message-State: ABUngvfedma8c8c5gBVP8jp5XPU5HOc2WsGRSyt5U4x6mrIYhGq/wHs0ebfumcohwdGNE97t4FC9lBVSEP6Y8g==
X-Received: by 10.202.186.2 with SMTP id k2mr7885735oif.11.1478618394103; Tue,
	08 Nov 2016 07:19:54 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Tue, 8 Nov 2016 07:19:33 -0800 (PST)
In-Reply-To: <390c7dd5-dd7b-8364-66ac-d2853f0a574a@mlbassoc.com>
References: <d1522ddb-4dd2-5f1c-5dc6-558ff6aefd75@mlbassoc.com>
	<1478253823.23123.93.camel@linuxfoundation.org>
	<390c7dd5-dd7b-8364-66ac-d2853f0a574a@mlbassoc.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 8 Nov 2016 08:19:33 -0700
X-Google-Sender-Auth: auKhEhfpl69cFLoSVUJLqQj6T1A
Message-ID: <CABcZANnTZxzZycy4kd67veiv3M1Y4s2HKtNir-7Zemo+dLXiRQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: uninative binary?
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
X-List-Received-Date: Tue, 08 Nov 2016 15:19:54 -0000
Content-Type: multipart/alternative; boundary=001a113cd24223b3660540cbacc7

--001a113cd24223b3660540cbacc7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 7, 2016 at 11:41 PM, Gary Thomas <gary@mlbassoc.com> wrote:

> On 2016-11-04 11:03, Richard Purdie wrote:
>
>> On Fri, 2016-11-04 at 08:16 +0100, Gary Thomas wrote:
>>
>>> Some of my customers need to be able to build without any
>>> network connectivity, so I normally use BB_NO_NETWORK=3D"1"
>>>
>>> Is there a way to add the uninative "binary shim" to my
>>> download mirror?  Given that the path includes a hash as
>>> a directory, it's not clear to me how to put it into my
>>> mirror.
>>>
>>> Thanks for any ideas
>>>
>>
>> Set UNINATIVE_URL to point at your mirror?
>>
>> If the file already exists in DL_DIR, it will be used without touching
>> the network.
>>
>
> Thanks, that worked.  I keep a link to my mirror in my meta tree,
> so I added these lines to my ${DISTRO}.conf:
>   UNINATIVE_URL ?=3D "file://${COREBASE}/sources/uninative/1.4/"
>   require conf/distro/include/yocto-uninative.inc
>   INHERIT +=3D "uninative"
> When I ran a build, this got sucked into my ${DL_DIR} as
>   $ ls -lR downloads/uninative/
>   downloads/uninative/:
>   total 4
>   drwxrwxr-x 2 gthomas gthomas 4096 Nov  7 13:02
> 101ff8f2580c193488db9e76f9646fb6ed38b65fb76f403acb0e2178ce7127ca
>
>   downloads/uninative/101ff8f2580c193488db9e76f9646fb6ed38b65f
> b76f403acb0e2178ce7127ca:
>   total 4
>   lrwxrwxrwx 1 gthomas gthomas 76 Nov  7 13:02
> x86_64-nativesdk-libc.tar.bz2 -> /local/poky-cutting-edge/sourc
> es/uninative/1.4/x86_64-nativesdk-libc.tar.bz2


It seems the uninative fetch does use mirrors, as well, from what I=E2=80=
=99ve
seen. At least, premirrors. I see a bunch of irritating fetch failure
messages from each of my premirrors when attempting to get uninative in
certain builds.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113cd24223b3660540cbacc7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Nov 7, 2016 at 11:41 PM, Gary Thomas <span dir=3D"ltr">&lt;<a href=
=3D"mailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 2016-11-=
04 11:03, Richard Purdie wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Fri, 2016-11-04 at 08:16 +0100, Gary Thomas wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Some of my customers need to be able to build without any<br>
network connectivity, so I normally use BB_NO_NETWORK=3D&quot;1&quot;<br>
<br>
Is there a way to add the uninative &quot;binary shim&quot; to my<br>
download mirror?=C2=A0 Given that the path includes a hash as<br>
a directory, it&#39;s not clear to me how to put it into my<br>
mirror.<br>
<br>
Thanks for any ideas<br>
</blockquote>
<br>
Set UNINATIVE_URL to point at your mirror?<br>
<br>
If the file already exists in DL_DIR, it will be used without touching<br>
the network.<br>
</blockquote>
<br></span>
Thanks, that worked.=C2=A0 I keep a link to my mirror in my meta tree,<br>
so I added these lines to my ${DISTRO}.conf:<br>
=C2=A0 UNINATIVE_URL ?=3D &quot;file://${COREBASE}/sources/un<wbr>inative/1=
.4/&quot;<br>
=C2=A0 require conf/distro/include/yocto-unin<wbr>ative.inc<br>
=C2=A0 INHERIT +=3D &quot;uninative&quot;<br>
When I ran a build, this got sucked into my ${DL_DIR} as<br>
=C2=A0 $ ls -lR downloads/uninative/<br>
=C2=A0 downloads/uninative/:<br>
=C2=A0 total 4<br>
=C2=A0 drwxrwxr-x 2 gthomas gthomas 4096 Nov=C2=A0 7 13:02 101ff8f2580c1934=
88db9e76f9646f<wbr>b6ed38b65fb76f403acb0e2178ce71<wbr>27ca<br>
<br>
=C2=A0 downloads/uninative/101ff8f258<wbr>0c193488db9e76f9646fb6ed38b65f<wb=
r>b76f403acb0e2178ce7127ca:<br>
=C2=A0 total 4<br>
=C2=A0 lrwxrwxrwx 1 gthomas gthomas 76 Nov=C2=A0 7 13:02 x86_64-nativesdk-l=
ibc.tar.bz2 -&gt; /local/poky-cutting-edge/sourc<wbr>es/uninative/1.4/x86_6=
4-native<wbr>sdk-libc.tar.bz2</blockquote></div><br>It seems the uninative =
fetch does use mirrors, as well, from what I=E2=80=99ve seen. At least, pre=
mirrors. I see a bunch of irritating fetch failure messages from each of my=
 premirrors when attempting to get uninative in certain builds.<br>-- <br><=
div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Christophe=
r Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphi=
cs</div>
</div></div>

--001a113cd24223b3660540cbacc7--
