Return-Path: <kergoth@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id D15AF65C91
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 18:26:41 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id wp4so4365737obc.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 10:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=j+Z4vmBe2r8PPk92vMhQnY2JtmwG0aVgpJF5T5Btjds=;
	b=cxy/UeBhtWkmuutheh0pAfEmNRT8ANJLO+H7KL2NLZWIIdT+L7G46KhPoKBlVwCM9J
	pvlYFwnPFFJNTy0b7TgZSD1WV98CvgYrPp4RhpFm2+BXiRfnAsrDGEw9Vl4Aw8A+x/aO
	9Tyvwhd1+3IkQnb4LMX/sw1pGThXxIJnruLrmy5gnLxgR7pv+LXY4wAm9lslOhqcMUd0
	X4lkuIIu2Erc3ioffihadW4GhB7qb7C11GRzgydkGD6wlOoF1V02SyH/NIWLXwPXGGK7
	Z9gLUKMBj1JuPrRbkc2GY3rLBPqae1nGGSK3I7Rn0a/CHcNNJRYQwNb2MOyogk3NjhGP
	T0SQ==
X-Received: by 10.182.133.104 with SMTP id pb8mr2990671obb.81.1416594401571;
	Fri, 21 Nov 2014 10:26:41 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.76.82.35 with HTTP; Fri, 21 Nov 2014 10:26:21 -0800 (PST)
In-Reply-To: <1416364933-214069-1-git-send-email-mark.hatle@windriver.com>
References: <1416364933-214069-1-git-send-email-mark.hatle@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 21 Nov 2014 11:26:21 -0700
X-Google-Sender-Auth: -baW6bzLcAjXifR3YcNrBKSjoqg
Message-ID: <CABcZANm790dekEqEh5nyGoyo_L9K6Qj3Yugx=jCuVSkEqcW0pA@mail.gmail.com>
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
X-List-Received-Date: Fri, 21 Nov 2014 18:26:42 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1ce2218bb9c05086296df

--e89a8ff1ce2218bb9c05086296df
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 18, 2014 at 7:42 PM, Mark Hatle <mark.hatle@windriver.com>
wrote:

> The companion debug filesystem contains only the package database and the
> complementary *-dbg packages for the main filesystem component.  This is
> useful in a production environment to produce a companion filesystem
> capable
> of remote system debugging, without requiring corresponding debug symbols
> or
> source code on the device.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>
> If dbg pkgs have already been installed to the rootfs image,
> the installation to companion debug filesystem will fail,
> because both of image creation make use of the same pm
> database.
>
> In this situation, try to copy installed dbg files from rootfs
> image to companion debug filesystem.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>

This looks pretty good to me, nicely done.

Acked-by: Christopher Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--e89a8ff1ce2218bb9c05086296df
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Nov 18, 2014 at 7:42 PM, Mark Hatle <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":i1=
" class=3D"a3s" style=3D"overflow:hidden">The companion debug filesystem co=
ntains only the package database and the<br>
complementary *-dbg packages for the main filesystem component.=C2=A0 This =
is<br>
useful in a production environment to produce a companion filesystem capabl=
e<br>
of remote system debugging, without requiring corresponding debug symbols o=
r<br>
source code on the device.<br>
<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com">m=
ark.hatle@windriver.com</a>&gt;<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;<br>
<br>
If dbg pkgs have already been installed to the rootfs image,<br>
the installation to companion debug filesystem will fail,<br>
because both of image creation make use of the same pm<br>
database.<br>
<br>
In this situation, try to copy installed dbg files from rootfs<br>
image to companion debug filesystem.<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com">m=
ark.hatle@windriver.com</a>&gt;</div></blockquote></div><br>This looks pret=
ty good to me, nicely done.<br><div><br></div><div>Acked-by: Christopher La=
rson &lt;<a href=3D"mailto:chris_larson@mentor.com">chris_larson@mentor.com=
</a>&gt;</div>-- <br><div class=3D"gmail_signature">Christopher Larson<br>c=
larson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br=
>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--e89a8ff1ce2218bb9c05086296df--
