Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8C47D413
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 10:02:05 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s15so7902731wra.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=yk9fD/H6XIwzgm6Z5PYE5i34eNzv+eGrhL8sbyWRlvM=;
	b=cQzMMbfz/SUvW3vnueImUnAll27+biPpjP5qZD/PZRia/Ft81k7Z1+i/8gRaISxIP8
	BjJrhyNl5qnNIwHHccZQz6WcuKtojoqQFyyd/oK7/2w+iaVbAIZL1mrdRu1yixr40Uty
	4LJVkeoxoHRHaU7NZ0QRq4NUAqvbx8RZwSSvl+/H5+a0TcAFv/dTcG8EZKnbeRimrB2I
	+8gwyUFcf3GEkT+6mbFhuzGKqJir+lW13kGnU6XP2qOFZ0CN+N+f78gf3fZLBKhDqjab
	6gdx3EOYhnR5pldgPtSFpkgsPA0dqd8bL2XHoIGrmNE0cvFpUlZoYDhxqVb8cgDh2EOa
	T3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=yk9fD/H6XIwzgm6Z5PYE5i34eNzv+eGrhL8sbyWRlvM=;
	b=YdWCWZ2juDdPFbvw+t26Tq/GkW2LC8v7BgJ/qyqu6g3b241i/bqyvcztlAYsXzuPtI
	hLkmAbjsGvWPaW3dHNaGgFk0F7J5cfxkSW0OXKPPdWSSYAoQzVuZkO5h0r6cfn5yoEOI
	mSj+DATnik5IK3lhjuoMOItf96n2ZN5GBAAWml6FGXcxP/vqZnRLLGg3FY8Na8aZ+kyT
	EO/jpPwc/a+bCM7hfMmpEZyPx65YJN2UOvOccCoTDPvzkV9e4BBO80lIwuwB26HQLO3D
	ZBzPi4UnAbvnipUJrCJP18cgcdqdZRJWE/HkerqdyMkcLRIYdjqmG75YYsYN991pQfc8
	ol6w==
X-Gm-Message-State: APjAAAU0PjYcL76TqaMCS7I3gmN3/Essldfhi5x2fOQeQANZ+2ApjvBU
	kiplxtsAyQiz4yOtTHsGpdg=
X-Google-Smtp-Source: APXvYqzJMvFK7Z+rn7MkUd10BDjSE2EaqTE6/XOX+1gTAgtJCqwUHS1pgoWD3JSOsD9mrYYqJf1q/Q==
X-Received: by 2002:a5d:5346:: with SMTP id t6mr13952027wrv.59.1556359326200; 
	Sat, 27 Apr 2019 03:02:06 -0700 (PDT)
Received: from ?IPv6:2a02:8109:b5c0:1267:f14e:659c:1edd:c8ce?
	([2a02:8109:b5c0:1267:f14e:659c:1edd:c8ce])
	by smtp.gmail.com with ESMTPSA id 62sm5408264wrl.55.2019.04.27.03.02.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Apr 2019 03:02:05 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16E227)
In-Reply-To: <CALbNGRSjZ1mDoDNT7SXyKfFad4r7Yn8pLdL8ddMhKE-nctFBtw@mail.gmail.com>
Date: Sat, 27 Apr 2019 12:02:04 +0200
Message-Id: <BC6A3A88-2393-4AD1-8153-1301759A9646@gmail.com>
References: <20190424091318.18154-1-schnitzeltony@gmail.com>
	<e290569afc4a08a1489cf033195e32d58ba78e19.camel@linuxfoundation.org>
	<CALbNGRTMzeWHgAO6MdLs1HmiCrMWfmpd3=OLUrJdSDBbbT44Gg@mail.gmail.com>
	<CALbNGRSjZ1mDoDNT7SXyKfFad4r7Yn8pLdL8ddMhKE-nctFBtw@mail.gmail.com>
To: =?utf-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte: upgrade 0.52.2 -> 0.56.1
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
X-List-Received-Date: Sat, 27 Apr 2019 10:02:05 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-B0383428-52CE-4395-A431-02AE19772877
Content-Transfer-Encoding: 7bit

--Apple-Mail-B0383428-52CE-4395-A431-02AE19772877
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

The build log makes it rather clear?

configure: error: *** A compiler with support for C++17 language features is=
 required.

Alex

> On 27 Apr 2019, at 11.52, Andreas M=C3=BCller <schnitzeltony@gmail.com> wr=
ote:
>=20
>> On Fri, Apr 26, 2019 at 11:26 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
>>=20
>> On Fri, Apr 26, 2019 at 10:34 PM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>=20
>>> Hi,
>>>=20
>>>> On Wed, 2019-04-24 at 11:13 +0200, Andreas M=C3=BCller wrote:
>>>> * license: COPYING was replaced by
>>>> COPYING.LGPL2/COPYING.LGPL3/COPYING.GPL3
>>>> * prettify recipe a bit
>>>>=20
>>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>>>> ---
>>>>=20
>>>> V1 -> V2: Fix build with musl
>>>=20
>>> I think something with vte-native is not working quite right with one
>>> of these patches and is causing oe-selftest to fail:
>>>=20
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/433
>>>=20
>>> (oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk)
>> Will try to reproduce...
>>=20
> Hi,
>=20
> Alex - you just wrote in mesa-meson thread, that vte-native fails due
> to ancient gcc on host. May I ask where you found this information?
>=20
> Andreas

--Apple-Mail-B0383428-52CE-4395-A431-02AE19772877
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">The build log makes it rather clear?<div><b=
r></div><div><pre style=3D"word-wrap: break-word;"><font face=3D"UICTFontTex=
tStyleBody"><span style=3D"white-space: normal; background-color: rgba(255, 2=
55, 255, 0);"> configure: error: *** A compiler with support for C++17 langu=
age features is required.</span></font></pre><br><div id=3D"AppleMailSignatu=
re" dir=3D"ltr">Alex</div><div dir=3D"ltr"><br>On 27 Apr 2019, at 11.52, And=
reas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmail.com">schnitzelton=
y@gmail.com</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><div dir=3D=
"ltr"><span>On Fri, Apr 26, 2019 at 11:26 PM Andreas M=C3=BCller &lt;<a href=
=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wrote:</=
span><br><blockquote type=3D"cite"><span></span><br></blockquote><blockquote=
 type=3D"cite"><span>On Fri, Apr 26, 2019 at 10:34 PM Richard Purdie</span><=
br></blockquote><blockquote type=3D"cite"><span>&lt;<a href=3D"mailto:richar=
d.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wro=
te:</span><br></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><span>Hi,</span><br></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>On Wed,=
 2019-04-24 at 11:13 +0200, Andreas M=C3=BCller wrote:</span><br></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>* license: COPYING was replaced by</span><br></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>COPYING.LGPL2/COPYING.LGPL3/COPYING.G=
PL3</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>* prettify reci=
pe a bit</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>Signed-off-by: Andreas M=C3=BC=
ller &lt;<a href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com<=
/a>&gt;</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>---</span><=
br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>V1 -&gt; V2: Fix build with musl</span><br><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>I think something with vte-native is n=
ot working quite right with one</span><br></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>of these patches and is ca=
using oe-selftest to fail:</span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><span><a href=3D"h=
ttps://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/433">https:=
//autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/433</a></span><b=
r></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>(oe-selftest -r runtime_test.TestImage.test_tes=
timage_virgl_gtk)</span><br></blockquote></blockquote><blockquote type=3D"ci=
te"><span>Will try to reproduce...</span><br></blockquote><blockquote type=3D=
"cite"><span></span><br></blockquote><span>Hi,</span><br><span></span><br><s=
pan>Alex - you just wrote in mesa-meson thread, that vte-native fails due</s=
pan><br><span>to ancient gcc on host. May I ask where you found this informa=
tion?</span><br><span></span><br><span>Andreas</span><br></div></blockquote>=
</div></body></html>=

--Apple-Mail-B0383428-52CE-4395-A431-02AE19772877--
