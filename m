Return-Path: <kergoth@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id D541B60670
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jan 2015 22:39:32 +0000 (UTC)
Received: by mail-yk0-f179.google.com with SMTP id 142so2652344ykq.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jan 2015 14:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=F+R7DzW6kpVD0ehZmI+Mp9mAUzMfTbva/gkEpe2otfg=;
	b=tawjK6LGQ71KmeJmf9KbNB4FePWKhw9/aldfVs3kH4X3HeZVre9Nch9XOusU4eO0Uj
	nwxgsEOGKjvBdKP0Ye9Q1l84BA8PvVfVkb9iV/xG6BYOrLSY6/+Ep7SYG9WKgAoTfVsB
	aPyIm0K77hhjkqzThs2x7oxanNaXXC0W2cp4bteFqpAJrVB6af9ldXBiFi/LBVu0Pm0D
	/xs9z5ipICQ0jEWNzk19r8aUGw4bsBi9eLWIay/CRmZ76kfrP22XI7Y/CEii6ovbYdab
	mQJueujEMfhK7I6vNRHzpE8QuOJQnvAyp8Ox44dim/63FLw4UqTxnftc1aCRO/u/TzcU
	XCFw==
X-Received: by 10.236.110.36 with SMTP id t24mr8036123yhg.102.1422225572846;
	Sun, 25 Jan 2015 14:39:32 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.170.190.16 with HTTP; Sun, 25 Jan 2015 14:39:12 -0800 (PST)
In-Reply-To: <20150125221821.07fc63b4@e6520eb.localdomain>
References: <54C1AE00.6010402@windriver.com>
	<20150125221821.07fc63b4@e6520eb.localdomain>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 25 Jan 2015 15:39:12 -0700
X-Google-Sender-Auth: kMyXy7MorNUgrsXdz4hep-zM7Wg
Message-ID: <CABcZANn4U+z7J7VxYRz_LomC2WGSFnErjz7opEQnG-Gbuh8FhA@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] About GPLv2's native recipe
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
X-List-Received-Date: Sun, 25 Jan 2015 22:39:35 -0000
Content-Type: multipart/alternative; boundary=001a1132ea2c0f6673050d81b288

--001a1132ea2c0f6673050d81b288
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2015 at 2:18 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:

> Le Fri, 23 Jan 2015 10:12:16 +0800,
> Robert Yang <liezhi.yang@windriver.com> a =C3=A9crit :
> > We have several GPLv2 recipes such as m4-native_1.4.9.bb, while we also
> > have GPLv3's m4-native_1.4.17.bb, I think that we can remove
> > m4-native_1.4.9.bb if the target m4_1.4.9.bb builds well ?
> >
> > I'd like to remove it because we don't build the lower native version b=
y
> > default, and we don't know whether it works or when it would fail.
> >
> if you want to build a system without GPLv3 ("supported for only
> minimal and base images" as stated in the manual) you may need GPLv2
> tools :
>
> http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#ref-i=
mages
> INCOMPATIBLE_LICENSE =3D "GPL-3.0 LGPL-3.0 AGPL-3.0"
>

GPLv3 native tools will still be used in such a build, as far as I know,
just not the target ones.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1132ea2c0f6673050d81b288
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Jan 25, 2015 at 2:18 PM, Eric B=C3=A9nard <span dir=3D"ltr">&lt;<a =
href=3D"mailto:eric@eukrea.com" target=3D"_blank">eric@eukrea.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ri" class=3D"a3=
s" style=3D"overflow:hidden">Le Fri, 23 Jan 2015 10:12:16 +0800,<br>
Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@wi=
ndriver.com</a>&gt; a =C3=A9crit :<br>
<span class=3D"">&gt; We have several GPLv2 recipes such as <a href=3D"http=
://m4-native_1.4.9.bb" target=3D"_blank">m4-native_1.4.9.bb</a>, while we a=
lso<br>
&gt; have GPLv3&#39;s <a href=3D"http://m4-native_1.4.17.bb" target=3D"_bla=
nk">m4-native_<span class=3D"aBn"><span class=3D"aQJ">1.4.17</span></span>.=
bb</a>, I think that we can remove<br>
&gt; <a href=3D"http://m4-native_1.4.9.bb" target=3D"_blank">m4-native_1.4.=
9.bb</a> if the target <a href=3D"http://m4_1.4.9.bb" target=3D"_blank">m4_=
1.4.9.bb</a> builds well ?<br>
&gt;<br>
&gt; I&#39;d like to remove it because we don&#39;t build the lower native =
version by<br>
&gt; default, and we don&#39;t know whether it works or when it would fail.=
<br>
&gt;<br>
</span>if you want to build a system without GPLv3 (&quot;supported for onl=
y<br>
minimal and base images&quot; as stated in the manual) you may need GPLv2<b=
r>
tools :<br>
<a href=3D"http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.h=
tml#ref-images" target=3D"_blank">http://www.yoctoproject.org/docs/current/=
ref-manual/ref-manual.html#ref-images</a><br>
INCOMPATIBLE_LICENSE =3D &quot;GPL-3.0 LGPL-3.0 AGPL-3.0&quot;</div></block=
quote></div><br>GPLv3 native tools will still be used in such a build, as f=
ar as I know, just not the target ones.<br>-- <br><div class=3D"gmail_signa=
ture">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake=
, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Enginee=
r, Mentor Graphics</div>
</div></div>

--001a1132ea2c0f6673050d81b288--
