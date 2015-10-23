Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id C218A75E80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 15:52:56 +0000 (UTC)
Received: by iow1 with SMTP id 1so128315845iow.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 08:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=K1rpz05yis9Ph1E1HuF5o7Ggl05HvB1mb6J9WUO4Y9M=;
	b=wvjIJucZpPSb14fCRfrWZDc/3Uc6W4xkFTaHADZlGLEAL7Ytx6m1wHiep/7sU41aZG
	P/wzgYQxyoUw1+6eqTyJPNZG/U+PwuN0HnQ/Bplmir3J57/ClxZtQorVISXrU1eIBpQ6
	r7u9dRcqMR1n9S3Br8m5GjrpeHzcmPffzqfx+tvWDJe0f+ZiIpxrysZQ86cz9ykQ8kOV
	iT4Us1Y8s7dkD/ynjxbkMClARf4cE5Qr7ou02VFdkDjfbFc9bB4QqqGFUPGj4QeNJdEj
	cET4JHfsoOxFiT2zd20sLgBHuVQgdCAe6w7+T5UKE26NLLhep/Ob6oM2je//f7VUQCEN
	f5DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=K1rpz05yis9Ph1E1HuF5o7Ggl05HvB1mb6J9WUO4Y9M=;
	b=MHPiiOD3ShND3xjWoWpxEo+gCvM/G3BjmhIpZZyOeP7FXnEpMOxCNnSG1vtXUKZfCi
	3CaJKH62GvDswj900GoWFXfPrYN/32fxWTsdXh76Z8TR8v6plb4ndgQLMWPNja/QWCmH
	bwYUPLO/G4SanezCf8zKFaf/nKhnH5Ks574mcbgoBD2filoSWqtFtc67o7KSsMuWOjL4
	LL+qdDbbYM3yA0h9OViYGgvVKwJ5nKe9LRQAoTHqeVNQvCo0Pj3qcEOZGv7IQhlhtXiX
	1oB6nbZhXU8pEPefYx03Qpe5D5td6eUA+7cZKFQkHStXRQ/zcTpfCHd7lLeC0GT6OdYO
	NjAw==
X-Received: by 10.107.134.94 with SMTP id i91mr20855113iod.74.1445615576150;
	Fri, 23 Oct 2015 08:52:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.65.204 with HTTP; Fri, 23 Oct 2015 08:52:36 -0700 (PDT)
In-Reply-To: <CAJTo0LaKdMib+D292Yo4YZy4H96qJ7_BJnppqggV5_8YaP0AcA@mail.gmail.com>
References: <cover.1445596115.git.pkj@axis.com>
	<b1fb2b65b6ffde36ca2d6e8f24874ff7004de038.1445596115.git.pkj@axis.com>
	<CAJTo0LaKdMib+D292Yo4YZy4H96qJ7_BJnppqggV5_8YaP0AcA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 23 Oct 2015 08:52:36 -0700
X-Google-Sender-Auth: MuTUdTzSYN25sDtJ-Av4W9OyINw
Message-ID: <CABcZAN=q05OJu62PPoNSrQ4KDRp7KwbgH3UyobYmTeJ+ov53ww@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] useradd-staticids.bbclass: Do not require trailing colons
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
X-List-Received-Date: Fri, 23 Oct 2015 15:52:56 -0000
Content-Type: multipart/alternative; boundary=001a113ec89ce5f87c0522c79ac3

--001a113ec89ce5f87c0522c79ac3
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 23, 2015 at 8:20 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 23 October 2015 at 11:38, Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>
>> -                        field = line.rstrip().split(":")
>> +                        # Make sure there always are at least seven
>> elements in
>> +                        # the field list. This allows for leaving out
>> trailing
>> +                        # colons in the passwd file.
>> +                        line = line.rstrip() + "::::::"
>> +                        field = line.split(":")
>>
>
> It's a stylist thing but I prefer padding the field list instead of
> manipulating the input string. Something like
>
>   field = line.strip().split(":")
>   field += [''] * (7 - len(field))
>

Agreed, but I think this is cleaner:

def iter_extend(iterable, length, obj=None):
    """Ensure that iterable is the specified length by extending with obj"""
    return itertools.islice(itertools.chain(iterable,
itertools.repeat(obj)), length)

fields = iter_extend(line.rstrip().split(":"), 7)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ec89ce5f87c0522c79ac3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Oct 23, 2015 at 8:20 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div class=3D"gmail_extra"><span><=
div class=3D"gmail_quote">On 23 October 2015 at 11:38, Peter Kjellerstedt <=
span dir=3D"ltr">&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=
=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-lef=
t:1ex"><div style=3D"overflow:hidden">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 field =3D line.rstrip().sp=
lit(&quot;:&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # Make sure there always are at least seven elements in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # the field list. This allows for leaving out trailing<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # colons in the passwd file.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 line =3D line.rstrip() + &quot;::::::&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 field =3D line.split(&quot;:&quot;)</div></blockquote></div><br>=
</span>It&#39;s a stylist thing but I prefer padding the field list instead=
 of manipulating the input string. Something like</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">=C2=A0 field =3D line.strip().s=
plit(&quot;:&quot;)</div><div class=3D"gmail_extra">=C2=A0 field +=3D [&#39=
;&#39;] * (7 - len(field))</div></blockquote></div><br clear=3D"all"><div>A=
greed, but I think this is cleaner:</div><div><br></div><div><div>def iter_=
extend(iterable, length, obj=3DNone):</div><div>=C2=A0 =C2=A0 &quot;&quot;&=
quot;Ensure that iterable is the specified length by extending with obj&quo=
t;&quot;&quot;</div><div>=C2=A0 =C2=A0 return itertools.islice(itertools.ch=
ain(iterable, itertools.repeat(obj)), length)</div></div><div><br></div><di=
v>fields =3D iter_extend(line.rstrip().split(&quot;:&quot;), 7)</div>-- <br=
><div>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake=
, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Enginee=
r, Mentor Graphics</div>
</div></div>

--001a113ec89ce5f87c0522c79ac3--
