Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 491BD6FF4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 18:27:03 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id f81so25882029iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=mfWqox+3eoLu3d61MZJ0dvvd1SI10HkkKpkPasR1Z6M=;
	b=pL5In1MZWgFJroQNGKZIUp7grPjMz/Fb37kYD1p2H1fxpZbWvKAk3W0x65sEBOqp6u
	D9BeMrECNBtFn0qHbPGZpI6F2PM8swrcg9YC3ry9JFd6EZBHN7FB2krDOzqDXl2IINwM
	D1SRs6ZWnvi1443nvXkL0Yi1qGPTXkQBGjOMOmPEV3/NA5KlDQlo0T9An8W7xN4Kn3qY
	7zkg2N3U3lwwzdls6P+j4bjg3K0ecS1EHosbVs69YMzu5YrmuYZGL9L8cR87eZURql1O
	7hT79lTg+xLGB1py3HEArTld57eVaNaANKv7e1p6s/erTF0l73T0tPqYM/rCNAd62zGg
	wcAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=mfWqox+3eoLu3d61MZJ0dvvd1SI10HkkKpkPasR1Z6M=;
	b=IIB4v5S3lr6OWmzSyiWR3f+Fk7IQdYhcK5LGrzFH8lScCA4Xr70h9ztFqtUOGkYHWv
	MUd3MnidekPUmZYAYPKQ9l39XTtAZqkN99TtFDyndh+X7UGRd9dhsEUZvqpaFA1m2fum
	kVCKtgBt4GDewNYz4Se4hBNseSaN2m1BP/DLh/4i7Nx56GPa9KsXSt4BVD2vHKP4tGrs
	6CbW0FyXfdp1dUt5CHvZxlQfVTMzC8f/4/nLc6iGGvlI0PhNz8BeSzT8c/hdYRRLkWir
	y3qs2J964MH9FfAhNKGRHNCs9KO8vzq0IswUj5VhxCDjF722AvYo5HtzJvqNdSAtP+sR
	DWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type;
	bh=mfWqox+3eoLu3d61MZJ0dvvd1SI10HkkKpkPasR1Z6M=;
	b=gOKmrh5Jl9L9DpenVojVeVv6sAASHEQtdlEPp2n5FVzg0X31wmlSXHO2v/tMtM0ZsH
	5NpKKNTnyoka17Ez2OhgEousYrUOVv6NjXO6YMaaqZwIbzSzl3g3jaqpWk1rVwbPLZe7
	O5GWiC/owD3/zlXxX1ur5WuaHuYPPS0kl5vgzP/Bh6G7sEvQcrdGkAqhrXKpK0l5R7Lp
	duEGon7xd9MgZRiAWjOziPBMCxszrb1OeKkgeqS6hj04TSvGAEC3E8KBp3UXrwfnhZv3
	RoXXbo3cQsFlNj9PvROQOnt/jiNp5YzbmuWU/kAAi6X8sBQAEJyyMmj6kRwoqYMSgHLZ
	YavA==
X-Gm-Message-State: ALoCoQnRDjkK+VpTf04l+xCgn0IrNLQomNJguj3kPPZQfNpCH6mfYpR3dCBRvbyeT7Vn6jGsPaPpkmZpLQH6gPOyTiMuuxmGQA==
X-Received: by 10.107.133.40 with SMTP id h40mr22645469iod.83.1453141624429;
	Mon, 18 Jan 2016 10:27:04 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.104.194 with HTTP; Mon, 18 Jan 2016 10:26:44 -0800 (PST)
In-Reply-To: <CAJTo0LaZgist+rg-WYBOFQ8ZBsnyhwWs7U89XZjHeYXZ25rcKA@mail.gmail.com>
References: <1452804424-17632-1-git-send-email-danismostlikely@gmail.com>
	<1452804424-17632-2-git-send-email-danismostlikely@gmail.com>
	<CAJTo0LaZgist+rg-WYBOFQ8ZBsnyhwWs7U89XZjHeYXZ25rcKA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 18 Jan 2016 11:26:44 -0700
X-Google-Sender-Auth: UMt10Zl4r1QKbK7ZU0eN1vjl0Bc
Message-ID: <CABcZAN=02MM7-RBKWSJm4VLErtMwFqwAyAyhgt4kNuwN13Kp0Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bitbake.conf: make localedir nonarch
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
X-List-Received-Date: Mon, 18 Jan 2016 18:27:04 -0000
Content-Type: multipart/alternative; boundary=001a113fd8cc55229105299fe6e2

--001a113fd8cc55229105299fe6e2
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 18, 2016 at 5:18 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 14 January 2016 at 20:47, Dan McGregor <danismostlikely@gmail.com>
> wrote:
>
>> -localedir = "${libdir}/locale"
>> +localedir = "${nonarch_libdir}/locale"
>>
>
> As was recently discovered, this variable isn't really used in many places:
>
> $ dpkg -c xz-locale-de_5.2.2-r0.1_corei7-64.ipk|grep mo
> -rw-r--r-- root/root     26533 2016-01-12 16:50
> ./usr/share/locale/de/LC_MESSAGES/xz.mo
>
> I'd suggest that localedir should be ${datadir}/locale, and then any
> explicit users of ${datadir}/locale/ replaced with ${localedir}.
>

Isn't the current localedir used for binary locales, whereas datadir/locale
is the location of the non-binary locale files? So we'd be changing the
meaning/semantics of the variable? Admittedly to a version which would be
used in more recipes, but I think we should make it clear that we're
changing its meaning in that way, if so.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113fd8cc55229105299fe6e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jan 18, 2016 at 5:18 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_=
extra"><span class=3D""><div class=3D"gmail_quote">On 14 January 2016 at 20=
:47, Dan McGregor <span dir=3D"ltr">&lt;<a href=3D"mailto:danismostlikely@g=
mail.com" target=3D"_blank">danismostlikely@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:sol=
id;padding-left:1ex"><div style=3D"overflow:hidden">-localedir =3D &quot;${=
libdir}/locale&quot;<br>
+localedir =3D &quot;${nonarch_libdir}/locale&quot;</div></blockquote></div=
><br></span>As was recently discovered, this variable isn&#39;t really used=
 in many places:</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra"><div class=3D"gmail_extra">$ dpkg -c xz-locale-de_5.2.2-r0.1_cor=
ei7-64.ipk|grep mo</div><div class=3D"gmail_extra">-rw-r--r-- root/root =C2=
=A0 =C2=A0 26533 2016-01-12 16:50 ./usr/share/locale/de/LC_MESSAGES/xz.mo</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I&#39;d=
 suggest that localedir should be ${datadir}/locale, and then any explicit =
users of ${datadir}/locale/ replaced with ${localedir}.</div></div></blockq=
uote></div><br></div><div class=3D"gmail_extra">Isn&#39;t the current local=
edir used for binary locales, whereas datadir/locale is the location of the=
 non-binary locale files? So we&#39;d be changing the meaning/semantics of =
the variable? Admittedly to a version which would be used in more recipes, =
but I think we should make it clear that we&#39;re changing its meaning in =
that way, if so.<br>-- <br><div class=3D"gmail_signature">Christopher Larso=
n<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZau=
rus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div=
>
</div></div>

--001a113fd8cc55229105299fe6e2--
