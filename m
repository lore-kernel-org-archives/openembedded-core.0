Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1DF7F336
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 09:45:23 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id v6so65081159vsq.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2019 02:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MzlxahXh4Lpk81OVaaRQccs6F/E/RbobhJIna3PKAyM=;
	b=W27AK8d67Gey+KGmLjpgnId9Sx/qsh9N5nMmQ6jcJfn5Wa8gB1g58eS5LGL4TlmmkZ
	hdkHH/mkzJajRCdNCk7+Qv9qYmUDZmP1rdcC6YBaLFAEGQdH+58/FYJeXksHTzyIOzRH
	rifrH8/nrM9NimKKKt2tT9zX/tjG0Q8WhedvF0poJVXbZrvxASwxA1Su6NMDh2c/v6F1
	bWgeB9pizfYq+M7RskP6656LyDacM2DxWio6bbJxuEhL9XI1F2N7l7O4eDwup6Id6Vil
	sALbTRFWf0DWwqoOTyn6Q+dA7PAQMInybQUH/nXN4zCENRsohYznaK3vH5PzxH/6BtKv
	xQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MzlxahXh4Lpk81OVaaRQccs6F/E/RbobhJIna3PKAyM=;
	b=dkhX8zJm/ImGXoryQHH3u9exriigEu5vNMNwssXBaOJKwecGoKjIIiC7SH3WarsTxL
	LgnnagLcKJOTyC7u9/9GBv17V0R0g6IyGfil12p3c/SCq0Wa29zocGnFC63EDBQqMi32
	Sf/4Ypy5BTux5JKcZoYZdclCc2mNZqQYlT1pB4lmMBLKtpEJ6+xntsOKWmP+2jU9fyYD
	/adofGE3NeX3a4SB4+m7E3qpSB3WcP0c4tGsWWIPithust2tEN6cFI+pC1imDPDL78hh
	cXYJSTip3rMXrs/z46yn5gXz5UwIfMOdhkT3eveN08s8ryM8B9HWvQlhM91FIwnBiPnP
	Y/lw==
X-Gm-Message-State: APjAAAUNySsHSpvGy3y7q5dNfeQl4lPnPAB6v3ObW7x34k4LaiIzdISA
	V4iVIzQtthSzcivaXxFbewkn5N02TvcNendjJfI=
X-Google-Smtp-Source: APXvYqwYCAP9QnhsoV8807aHuqwrkVIYbSdC0UgzHdo+9TGQQ2sySAs9zV8TYC0C0qLWE/37mT578cvPMEyRFjXfsYo=
X-Received: by 2002:a67:e8c3:: with SMTP id y3mr12474644vsn.94.1565343924597; 
	Fri, 09 Aug 2019 02:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
	<94b692a828bbf5230f56afbc401bf9d66660283b.camel@linuxfoundation.org>
	<CANNYZj-t2TSN4dMpfEgU_k_dDqHRLeqNSYWi-=uUK2BH09-tMA@mail.gmail.com>
	<CAMKF1squwmc8-sm+JMM6gU5oyHSKHv7ejRoOokTdb4Nd-SEk2A@mail.gmail.com>
	<CAMKF1soSXrDEHu+0v7v052EpCfXwu=+_ysWiwDcd=HY7oaBU8Q@mail.gmail.com>
In-Reply-To: <CAMKF1soSXrDEHu+0v7v052EpCfXwu=+_ysWiwDcd=HY7oaBU8Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Aug 2019 11:45:13 +0200
Message-ID: <CANNYZj81jgzZP0VNSbpA6RVh=JDc7748XszNEOJ9Dz+qf+8hmQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Fri, 09 Aug 2019 09:45:23 -0000
Content-Type: multipart/alternative; boundary="00000000000093ba43058fac083d"

--00000000000093ba43058fac083d
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Aug 2019 at 03:34, Khem Raj <raj.khem@gmail.com> wrote:

> > There are several packages in meta-openembedded which are showing these
> errors one that I see is net kit-rusers seems to be failing for wrong reason
> >
> > I will send full list once I am close to computer
>
> here is full list
>
> https://errors.yoctoproject.org/Errors/Build/86513/
> all do_package_qa are due to this change.
>

There are plenty of recipes in that list that come from oe-core (not
meta-oe), and do not show errors on the AB, e.g. glib-2.0:

ERROR: QA Issue: /usr/lib/libgio-2.0.so.0.6000.6 contained in package
glib-2.0 requires libz.so.1(ZLIB_1.2.2)(64bit), but no providers found
in RDEPENDS_glib-2.0? [file-rdeps]
ERROR: QA Issue: /usr/lib/libgio-2.0.so.0.6000.6 contained in package
glib-2.0 requires libz.so.1()(64bit), but no providers found in
RDEPENDS_glib-2.0? [file-rdeps]
ERROR: QA Issue: /usr/lib/libglib-2.0.so.0.6000.6 contained in package
glib-2.0 requires libpcre.so.1()(64bit), but no providers found in
RDEPENDS_glib-2.0? [file-rdeps]
ERROR: QA Issue: /usr/lib/libgobject-2.0.so.0.6000.6 contained in
package glib-2.0 requires libffi.so.6()(64bit), but no providers found
in RDEPENDS_glib-2.0? [file-rdeps]

Can I see the configuration where this happened? Might be some other
setting that breaks shlib resolution (that was previously unnoticed due to
recursive qa RDEPENDS).

Alex

--00000000000093ba43058fac083d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 9 Aug 2019 at 03:34, Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">&gt; There are several packages in meta-openembedded which are s=
howing these errors one that I see is net kit-rusers seems to be failing fo=
r wrong reason<br>
&gt;<br>
&gt; I will send full list once I am close to computer<br>
<br>
here is full list<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Build/86513/" rel=3D"nore=
ferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Build/8651=
3/</a><br>
all do_package_qa are due to this change.<br></blockquote><div><br></div><d=
iv>There are plenty of recipes in that list that come from oe-core (not met=
a-oe), and do not show errors on the AB, e.g. glib-2.0:</div><div><pre>ERRO=
R: QA Issue: /usr/lib/libgio-2.0.so.0.6000.6 contained in package glib-2.0 =
requires libz.so.1(ZLIB_1.2.2)(64bit), but no providers found in RDEPENDS_g=
lib-2.0? [file-rdeps]
ERROR: QA Issue: /usr/lib/libgio-2.0.so.0.6000.6 contained in package glib-=
2.0 requires libz.so.1()(64bit), but no providers found in RDEPENDS_glib-2.=
0? [file-rdeps]
ERROR: QA Issue: /usr/lib/libglib-2.0.so.0.6000.6 contained in package glib=
-2.0 requires libpcre.so.1()(64bit), but no providers found in RDEPENDS_gli=
b-2.0? [file-rdeps]
ERROR: QA Issue: /usr/lib/libgobject-2.0.so.0.6000.6 contained in package g=
lib-2.0 requires libffi.so.6()(64bit), but no providers found in RDEPENDS_g=
lib-2.0? [file-rdeps]</pre></div><div>Can I see the configuration where thi=
s happened? Might be some other setting that breaks shlib resolution (that =
was previously unnoticed due to recursive qa RDEPENDS).</div><div><br></div=
><div>Alex<br></div><div> <br></div></div></div>

--00000000000093ba43058fac083d--
