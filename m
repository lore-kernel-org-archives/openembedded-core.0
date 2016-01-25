Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 05DF7770F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 08:48:25 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id h5so26241437igh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 00:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VM1o+EJAyGsbBnkvbdLdTakfqJtbgx7KF5ALld2DydM=;
	b=d8Nfe7rIDPDU9WASLXeg7ik3S8jtiqn4WgUvYFOVv/b+NiylxJSEqEIKRfuM7bg/eF
	f4q8gxDx/foKwOxifB4tn9bujhDayEOJgwiiPxI7PjixJ/NsCuXp9nKzK8bd7N7I819p
	xR+I4LCgZCK//F7a9y/xT5P0WDqim8sTcmchwblBnj0ZlpAATPsP5826Q7tMaP+KL9S/
	iwzd8XdAQms8rVDXZx2PHRjIjx4VGB5QzP4Icc9NlCxWlvAlAkmbF5BhzuQCd5PrYKQ0
	G87e5A/GcSxubR9INLT2av7NhHSEqFU6MxHEnUHN61MuqfdIi0izVtPJ0qQ/vMhgSmuf
	cKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VM1o+EJAyGsbBnkvbdLdTakfqJtbgx7KF5ALld2DydM=;
	b=P3ulMvvD+IBFuXcFVJau/XgqVHU8Mw9D1bG8Nx0jpGecL5p/kSiXsa51O8Szm60ymg
	n/mWzDJIH7E4hJ5Io0Z8FE5zI/1E05aJxym2W6GQ7qhntqA7l3eYgJJXQiNVlo6Irv+X
	+E6JYIeqezmdVaOmdObBYnkQWGXv9cTs0p1jZgnqZw2J+ySihCO/qgUwGRtCB2TXM5Ri
	bo6r6flOBI7/HBP1CMgfzYBZr672MXmwVMdRL0vC1u9mZoli+QfKde87mhn9pfaflwqz
	Kw/Tev1VHZctfkLFG8Pzqx2tb3kgtX9wR0fNmiG8ybWcovF+6+2y2hyXerutJ9V9d4tK
	9Rng==
X-Gm-Message-State: AG10YOT2zA/tIgwejMI1+E9whSfLRTdSxzJ4JNF6jrrAP8amNbCYT5Js4bdaRdKqwLXU1oeyl4k5hbGUYQ0AAQgd
X-Received: by 10.50.13.100 with SMTP id g4mr15205848igc.64.1453711706115;
	Mon, 25 Jan 2016 00:48:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 25 Jan 2016 00:48:06 -0800 (PST)
In-Reply-To: <CAMKF1sohABk==LdOMgph7JyHaTH2B0-=5ODtFy49-BJHbcM4Lg@mail.gmail.com>
References: <cover.1453703961.git.kai.kang@windriver.com>
	<51f0a96271229055e28dfe5ab12a29559c474614.1453703961.git.kai.kang@windriver.com>
	<CAMKF1sohABk==LdOMgph7JyHaTH2B0-=5ODtFy49-BJHbcM4Lg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jan 2016 08:48:06 +0000
Message-ID: <CAJTo0LYrOjAaOALMkon02aJNrDL43dNgJ6s2G=aPhtejodQwMA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] wget: inherit perlnative
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
X-List-Received-Date: Mon, 25 Jan 2016 08:48:26 -0000
Content-Type: multipart/alternative; boundary=089e013c6614d96c40052a24a1ab

--089e013c6614d96c40052a24a1ab
Content-Type: text/plain; charset=UTF-8

On 25 January 2016 at 07:27, Khem Raj <raj.khem@gmail.com> wrote:

> what happens for wget-native ? Does it now serialize the build ?
>

Thankfully wget-native is an assumed dependency (albeit not explicitly, we
should fix that).

But I do agree that perlnative is a *huge* dependency for a bit of
documentation.  SLED 11 is rather old now (released 2009), we don't test it
on the autobuilders, and support for it ends in less than two months.  I'd
prefer to either call this a distro patch for products who want to continue
to support SLED11, or patch the documentation build so that it doesn't pass
--utf8 if that isn't harmful.

Ross

--089e013c6614d96c40052a24a1ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 January 2016 at 07:27, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":12yt" class=3D"a3s" st=
yle=3D"overflow:hidden">what happens for wget-native ? Does it now serializ=
e the build ?</div></blockquote><div><br></div><div>Thankfully wget-native =
is an assumed dependency (albeit not explicitly, we should fix that).</div>=
<div><br></div><div>But I do agree that perlnative is a *huge* dependency f=
or a bit of documentation.=C2=A0 SLED 11 is rather old now (released 2009),=
 we don&#39;t test it on the autobuilders, and support for it ends in less =
than two months.=C2=A0 I&#39;d prefer to either call this a distro patch fo=
r products who want to continue to support SLED11, or patch the documentati=
on build so that it doesn&#39;t pass --utf8 if that isn&#39;t harmful.</div=
><div><br></div><div>Ross</div></div></div></div>

--089e013c6614d96c40052a24a1ab--
