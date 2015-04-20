Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4E87390D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 22:01:24 +0000 (UTC)
Received: by qkhg7 with SMTP id g7so199578977qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 15:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=C+86D1MhIkIfZm83NpzQanEaToqhgki6BCC9F2NceC0=;
	b=mxTEdqTKYuZitiwMsDEmau9TiS8cUDa7mlhPYdUJE4ogji4WSNhvBp8fKjTehXFtjD
	RPdZYBU4azXr3eJWIGS6Xh27MJdbrUsKRpkwm4ZYRxeMFulq3671G59ZCLBULELYZQys
	iF70OIxkx6WndBkF1Vt8Ug3qPJbONro0iWBIePvTe6xqsaFOYJ6u5WeBzw9F1u2VyKKE
	YcfE0R65/cNd7eOgcML62MuCkcsFKzAPXa6XgCyEV51lsHHnyRMyOgR6FhFOFFWJicS+
	ZVIsTQJ5w4396d8QkzmbdD8SBfvu9i1f1V518iEojOE2mPCmnZxlO2XQhZ7cUrVU7ln/
	L5Wg==
X-Received: by 10.55.31.7 with SMTP id f7mr32930578qkf.9.1429567285608; Mon,
	20 Apr 2015 15:01:25 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.34 with HTTP; Mon, 20 Apr 2015 15:01:05 -0700 (PDT)
In-Reply-To: <CABcZANm790dekEqEh5nyGoyo_L9K6Qj3Yugx=jCuVSkEqcW0pA@mail.gmail.com>
References: <1416364933-214069-1-git-send-email-mark.hatle@windriver.com>
	<CABcZANm790dekEqEh5nyGoyo_L9K6Qj3Yugx=jCuVSkEqcW0pA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 20 Apr 2015 15:01:05 -0700
X-Google-Sender-Auth: PLVJqJDy6lP4gqQqXcZMNBo23f0
Message-ID: <CABcZANkYegAavg-ia-21M-isawm4CuDva1J3g-GM8cQsQ-dLwg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: Add a method for creating a companion debug filesystem
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
X-List-Received-Date: Mon, 20 Apr 2015 22:01:26 -0000
Content-Type: multipart/alternative; boundary=001a1147bae23dc7b005142f12b8

--001a1147bae23dc7b005142f12b8
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 21, 2014 at 11:26 AM, Christopher Larson <clarson@kergoth.com>
wrote:

> On Tue, Nov 18, 2014 at 7:42 PM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
>
>> The companion debug filesystem contains only the package database and the
>> complementary *-dbg packages for the main filesystem component.  This is
>> useful in a production environment to produce a companion filesystem
>> capable
>> of remote system debugging, without requiring corresponding debug
>> symbols or
>> source code on the device.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>
>> If dbg pkgs have already been installed to the rootfs image,
>> the installation to companion debug filesystem will fail,
>> because both of image creation make use of the same pm
>> database.
>>
>> In this situation, try to copy installed dbg files from rootfs
>> image to companion debug filesystem.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>
>
> This looks pretty good to me, nicely done.
>
> Acked-by: Christopher Larson <chris_larson@mentor.com>
>

Following up on this, are there any objections to getting this merged for
after fido?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1147bae23dc7b005142f12b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Nov 21, 2014 at 11:26 AM, Christopher Larson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
<div class=3D"gmail_quote">On Tue, Nov 18, 2014 at 7:42 PM, Mark Hatle <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:mark.hatle@windriver.com" target=3D"_bl=
ank">mark.hatle@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div style=3D"overflow:hidden">The <span class=3D"il">companion<=
/span> <span class=3D"il">debug</span> <span class=3D"il">filesystem</span>=
 contains only the package database and the<br>
complementary *-dbg packages <span class=3D"il">for</span> the main <span c=
lass=3D"il">filesystem</span> component.=C2=A0 This is<br>
useful in <span class=3D"il">a</span> production environment to produce <sp=
an class=3D"il">a</span> <span class=3D"il">companion</span> <span class=3D=
"il">filesystem</span> capable<br>
of remote system debugging, without requiring corresponding <span class=3D"=
il">debug</span> symbols or<br>
source code on the device.<br>
<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com" t=
arget=3D"_blank">mark.hatle@windriver.com</a>&gt;<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
 target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
<br>
If dbg pkgs have already been installed to the rootfs image,<br>
the installation to <span class=3D"il">companion</span> <span class=3D"il">=
debug</span> <span class=3D"il">filesystem</span> will fail,<br>
because both of image creation make use of the same pm<br>
database.<br>
<br>
In this situation, try to copy installed dbg files from rootfs<br>
image to <span class=3D"il">companion</span> <span class=3D"il">debug</span=
> <span class=3D"il">filesystem</span>.<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
 target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com" t=
arget=3D"_blank">mark.hatle@windriver.com</a>&gt;</div></blockquote></div><=
br></span>This looks pretty good to me, nicely done.<br><div><br></div><div=
>Acked-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
" target=3D"_blank">chris_larson@mentor.com</a>&gt;</div></blockquote></div=
><br>Following up on this, are there any objections to getting this merged =
for after fido?<br>-- <br><div class=3D"gmail_signature">Christopher Larson=
<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaur=
us<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1147bae23dc7b005142f12b8--
