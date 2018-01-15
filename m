Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 78CA07842F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 19:34:54 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id c17so14227585iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 11:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zaI5ro9sak+S8rP1+6trU3+S9RiWw/CW429Wewky6Ts=;
	b=cE8urwcDPJo3TPN/j6EuG5lQc4fVVsaw6IJlp4dW7vaq0qTbXxAJMq98CI3HTIDx9G
	VIxf0gdpWzTXyttPuZrOoAu2hmX5XolTLaSr2C2L1iEvb4qERNNQtmKWfnfM5wrPl4n7
	TJQYQieWYlb3kRZR2P/99KnmZWuVh+GtLicB0Db9jEOyoj9thZrgF1Uzx6g+Q7cj2An6
	ZLU7bVo0ra0eufnpVtHDlJ2/JumO0FQXsMrlClSVmUoWyVGSH4oranDG1wH48ei8FtOL
	OqULiGijB+dxycHfgPZGkquG3Yxi4y//EnycjCjDZW1EGkDBGvxMXlXnIj0RFPAAmYOA
	XFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zaI5ro9sak+S8rP1+6trU3+S9RiWw/CW429Wewky6Ts=;
	b=YpTzzfOXY4EOMi2Qlay+hTac89mvutt/Jxf2mrx0hcLbYhsXNm8BTYilnuIxmumKge
	qrKuC5ETF9If1gF6QVRqAZL8AbaLok3WqAfOrCIAIsmavtZC37EbU17rqgnxoxXEGLU8
	fr5PZrJJQIS7ILmCds6lPKPc4Qb8R/lh387K/rXFoXKcJh35GHyKcr50MI7BKjTrEf/J
	tN5Vw+/bwjVtxqA6WBE4FAswzKcpREoIdx3CTmW3qndqI7RjKqsP00OnTmh2cbpzGoS2
	9hAutpQeaUCTAvyuj5aLx3mM34cqRxkJaBfz4AbaHR+aSUbSb9A0XfKSEPT5xH+RL6O0
	xGRQ==
X-Gm-Message-State: AKwxytcaOn+zKsaLK0T7opxqtTsw/Gh2tkLeq/TA7W4mHXlsxgxH6AKy
	drF2eTNe+eArzn7oSTdGZS8PJ/06tGdKKva5jpyk+g==
X-Google-Smtp-Source: ACJfBouIu8JIDF2HiOTBYdUf/CqxqpWr9cRrm2yfL8nl54GFzLEHp3PLTXXG+4g3RPpBAhzkYh52axTvf/fg/yJ2r6o=
X-Received: by 10.107.175.8 with SMTP id y8mr6929453ioe.37.1516044895622; Mon,
	15 Jan 2018 11:34:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.157.202 with HTTP; Mon, 15 Jan 2018 11:34:35 -0800 (PST)
In-Reply-To: <20180115175321.r7sfuxibr743icio@mcrowe.com>
References: <20180115175321.r7sfuxibr743icio@mcrowe.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jan 2018 19:34:35 +0000
Message-ID: <CAJTo0LbcZxArSP-TRYXfNVXY9FS8hK=okbHT2p8RU+nx1Sya+g@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: glib-2.0 fails to configure with USE_NLS="no"
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
X-List-Received-Date: Mon, 15 Jan 2018 19:34:54 -0000
Content-Type: multipart/alternative; boundary="001a1144a26877b1d00562d5b5c2"

--001a1144a26877b1d00562d5b5c2
Content-Type: text/plain; charset="UTF-8"

Have a look at what just landed in master...

Ross

On 15 January 2018 at 17:53, Mike Crowe <mac@mcrowe.com> wrote:

> If I add USE_NLS = "no" to local.conf, then glib-2.0 fails to configure:
>
> | checking for ngettext in libc... yes
> | checking for dgettext in libc... yes
> | checking for bind_textdomain_codeset... (cached) yes
> | checking for msgfmt... no
> | configure: error:
> | *** You must have either have gettext support in your C library, or use
> | the
> | *** GNU gettext library.
> | (http://www.gnu.org/software/gettext/gettext.html)
>
> It seems that glib-2.0 does not support --disable-nls and always requires
> gettext.
>
> I can avoid this error by adding gettext-native to glib-2.0's DEPENDS, but
> I'm not sure whether this is solution would be acceptable.
>
> Is there a better way?
>
> Thanks.
>
> Mike.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144a26877b1d00562d5b5c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Have a look at what just landed in master...<div><br></div=
><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On 15 January 2018 at 17:53, Mike Crowe <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">If I add USE_NLS =3D &quot;no&quot=
; to local.conf, then glib-2.0 fails to configure:<br>
<br>
| checking for ngettext in libc... yes<br>
| checking for dgettext in libc... yes<br>
| checking for bind_textdomain_codeset... (cached) yes<br>
| checking for msgfmt... no<br>
| configure: error:<br>
| *** You must have either have gettext support in your C library, or use<b=
r>
| the<br>
| *** GNU gettext library.<br>
| (<a href=3D"http://www.gnu.org/software/gettext/gettext.html" rel=3D"nore=
ferrer" target=3D"_blank">http://www.gnu.org/software/<wbr>gettext/gettext.=
html</a>)<br>
<br>
It seems that glib-2.0 does not support --disable-nls and always requires<b=
r>
gettext.<br>
<br>
I can avoid this error by adding gettext-native to glib-2.0&#39;s DEPENDS, =
but<br>
I&#39;m not sure whether this is solution would be acceptable.<br>
<br>
Is there a better way?<br>
<br>
Thanks.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mike.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1144a26877b1d00562d5b5c2--
