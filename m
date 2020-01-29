Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 430BD6027C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:52:08 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id n11so4038367iom.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4DlU+jvXKPYfRYqai9IXspvOotC7EsbrNKdIk2EUajw=;
	b=Lzm0tykzPFneervmtWfzmQ0fslJmaEQUO9YKwVpjDDKr4CSfIm/vh6y1AUhgg80cYf
	OFBxnzmu/zRgJ9I1LsHhE0GSY3X0oNPERsNXLQQucVxHqFERE5jWBvV10+zFEvc3CkCy
	7RG23l1+jVWgVr+IHLQfG0iJBQc4ZGeiBX+11m1HKGxIWg7XWUF/XLSwjpj6Du1RN7VZ
	gYhMApuJTUv7G1Pyi6uhIgR++ZMPiopsbQ7i85G3sbbpexEiY6yYXIFkwwEU5MmkX3AE
	XGKPBAXiOAKPiBAa75lCBJLGN57b453hXdKu4XlJDjlv8Ab9LRycVPCWKFITwJV+NoLg
	B/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4DlU+jvXKPYfRYqai9IXspvOotC7EsbrNKdIk2EUajw=;
	b=uBejCsGkj15QOc67RTifngKG54nEqHmbZqzpg8WYf8jwb1YDjVnNJFd8zmSQSey6n8
	eRoe4f8VVTldnFnNGAkj6jbU9Zm6RgW4+ZysVjkmwZeEow77YmjLe7XO0mkYHUjz3Dlt
	ZzUjxYQf25WRpZ2OKYI2Xa5IYyTMbQeR0vX9L7olr2ooZUfZn4qJ2YOIiheMXHI5UGRf
	ztmFNgTPnTgxCV1CfT0Sf63tHqAmifcjCUKaTfL/XN5xoNTIUt06kxkUPyX0wVuD0pya
	gidSjzFxjWTB43DRNm+l3HXXpaA+et247VlOjBebQZFr/nZuNJsR4tLPNrMszc7vzmuh
	pJJg==
X-Gm-Message-State: APjAAAWiPWmTBOFZ4C1i7+bR49qHzSlCA4/fQ/yi44iVpxw0+mdpG8IC
	zba5iAMDqWBxinrwLPfHmTURbuvCdoazVWXqyDQPeBJh
X-Google-Smtp-Source: APXvYqyZFM2KjZISulKduwPlabIlUrpgOmKboGb6ktm3x7bBRuw+rwrbUM0IYYZ21BKoNM0oXt7C1YBsZU2SEdaqOTM=
X-Received: by 2002:ac8:145:: with SMTP id f5mr27150624qtg.194.1580313740676; 
	Wed, 29 Jan 2020 08:02:20 -0800 (PST)
MIME-Version: 1.0
References: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
	<20200128151643.9711-3-richard.purdie@linuxfoundation.org>
	<CAMKF1sqYswYbOA+N80sK3sELzPPCTymDna8bgSKETCvZROi2Fw@mail.gmail.com>
	<10d77c789a51e9fdb089b2faf983414cc17fb20b.camel@linuxfoundation.org>
In-Reply-To: <10d77c789a51e9fdb089b2faf983414cc17fb20b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Jan 2020 08:02:09 -0800
Message-ID: <CAMKF1sqXQR0Ot0GOyYsWPUB_1ZJKOQtzrFU0Fz9bLiMcM-SwHA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] texinfo/texinfo-dummy-native: Drop native path prefix
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:13 -0000
Content-Type: multipart/alternative; boundary="000000000000259052059d497786"

--000000000000259052059d497786
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 29, 2020 at 4:00 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2020-01-28 at 18:00 -0800, Khem Raj wrote:
> > it perhaps is the reason for most of failures seen here
> >
> > https://errors.yoctoproject.org/Errors/Build/97736/
> >
> > perhaps we need to explicitly inherit gettext in these recipes ?
>
> These patches aren't quite working in master yet but those failures
> look like they'd be solved with an "inherit texinfo" added to the
> recipes.


Right except indent package which is quite unhappy even after that but I
have disabled documentation generation for that now


>
> Cheers,
>
> Richard
>
>
>
>

--000000000000259052059d497786
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jan 29, 2020 at 4:00 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 2020-=
01-28 at 18:00 -0800, Khem Raj wrote:<br>
&gt; it perhaps is the reason for most of failures seen here<br>
&gt; <br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Build/97736/" rel=3D=
"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Build=
/97736/</a><br>
&gt; <br>
&gt; perhaps we need to explicitly inherit gettext in these recipes ?<br>
<br>
These patches aren&#39;t quite working in master yet but those failures<br>
look like they&#39;d be solved with an &quot;inherit texinfo&quot; added to=
 the<br>
recipes.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Right ex=
cept indent package which is quite unhappy even after that but I have disab=
led documentation generation for that now=C2=A0</div><div dir=3D"auto"><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000259052059d497786--
