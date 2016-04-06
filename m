Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7663877114
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 08:23:27 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id o126so25480273iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2016 01:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5w1HZ+CKpHhIY9OhGDfagl42nGhliOKAbejliV7V0UY=;
	b=Sld9w4pPTLbK4bnT7LuH2OaNkW+DcpY5e3bX5bs4cXqUihOt4SuF8OG7IapuJU5oTi
	3011ddNonYgyXPIP0Gw39gzYfh85wS46/TGpJA3DPz32VYSnRIrdvrW2/sz7q92FGB/T
	yze4ydROWgBt8YN+tmHEY1wUQMm6S0tmE6jTXk5aFxX55UB/dp/MH8Ci7KNI6vGUnL02
	fP96yWp9xbMy7sOz8ST9urVxGPHcQwDA1qZnpB/7Ej6BDlmeMagF2vg6iV72PLABokJv
	azc7w9/6PGBebFM3MvApDeP4ktcM+ZBV8OT+Qe9lGLG3IX9wO5sZplurKj8uwk2mlzM/
	Ee+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5w1HZ+CKpHhIY9OhGDfagl42nGhliOKAbejliV7V0UY=;
	b=b4ktDuhzbX4NzRueHC391hN+uqQqOK2fim3P3nmHfkxuDBnVtuffzadyPX8uBnjNP1
	9t0s8PaUqBNHR37Ku9rnaULUrQqnTCZCSaEUJNTSElzSskptUFz1/Ik7vMc0pImd0T/N
	DDjlPoQqufJ56LY+nwypcO0V4n20vohWWiJfqHtjlvLqxPB0wTMgJSkt9ZI7TU5wONvo
	eZXAKiFZ6guzEzUx8/B4LCy1byB4yFY5ZqGBrsmjL6TIFHyxdRXWOIoDcpdDIAa+Hl+s
	Ejq1j1jtL9W4uih1QDG/Bq28DROffFACf0IPGiKBgTiz3BUBKfuXG3CXiQiw2KPihNQv
	Iavg==
X-Gm-Message-State: AD7BkJKIdD3IUY7r7246fz+0ZS5rkJ9JzMnUQJzzM72uL84unuJxJbKRqOIQHJsNnoFxorhi2xdrEDQND47EkA/D
X-Received: by 10.107.134.84 with SMTP id i81mr22330943iod.99.1459931007719;
	Wed, 06 Apr 2016 01:23:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Wed, 6 Apr 2016 01:23:08 -0700 (PDT)
In-Reply-To: <CAJ86T=XXJtGhRqvtkXp1aAHMYN8Y0VDrUJZfDhqNkodtbOXymw@mail.gmail.com>
References: <1459891560-4178-1-git-send-email-ross.burton@intel.com>
	<CAJ86T=XXJtGhRqvtkXp1aAHMYN8Y0VDrUJZfDhqNkodtbOXymw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Apr 2016 09:23:08 +0100
Message-ID: <CAJTo0LZSmc3+nOGn1dK9CzKqd+aAkAnFdk=tkk-gCHPqz+8NNg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bzip2: set correct soname
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
X-List-Received-Date: Wed, 06 Apr 2016 08:23:27 -0000
Content-Type: multipart/alternative; boundary=001a113febc81cdf53052fccada0

--001a113febc81cdf53052fccada0
Content-Type: text/plain; charset=UTF-8

On 5 April 2016 at 23:02, Andre McCurdy <armccurdy@gmail.com> wrote:

> > +libbz2_la_LDFLAGS = -version-info 1:6:0
>
> 1:6:0 or 1:0:6 ?


1:6:0 results in /usr/lib/libbz2.so.1.0.6, which is what upstream intended
in their broken Makefile that we don't use.

Ross

--001a113febc81cdf53052fccada0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 April 2016 at 23:02, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><span class=3D"">&gt; +libbz2_la_LDFLAGS =3D=
 -version-info 1:6:0<br>
<br>
</span>1:6:0 or 1:0:6 ?</blockquote></div><br>1:6:0 results in=C2=A0/usr/li=
b/libbz2.so.1.0.6, which is what upstream intended in their broken Makefile=
 that we don&#39;t use.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a113febc81cdf53052fccada0--
