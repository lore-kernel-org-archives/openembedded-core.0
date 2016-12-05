Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id AC74660248
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 15:34:35 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id p16so316290557qta.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 07:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tq6MnALXs7IRggvKqwqal1dnmB5Smmny/KV4WD5gB8Q=;
	b=beZnwObYAq3NOh/utUiANOJrD/zowYNy2YvKrNMPbaT4OF3eQ4mY/zZfU2JfhqZQpM
	Y/9JmBJKNpqt71h1htUxRQNM/ooREE1NjkvGv/TJuQQsJpuzzDJpngRuO4XKA+uxkIW7
	XGO67Hm9J4kqESQX4LhYWq06WVPpxr7cRbNqjgRx1/pMpek8ZaTUPwQojOLDgqkDtkvj
	l5vHJoixKfpKXCVGFOFDYG0X6jxBP7jwRsay0ODpI7ELWh84vjWckCNvzP27UQHwrBAR
	k2tPFLl+ObD6QOpu9aCReeFh31xomjAHM+5cTuYBFthdMBfFVnH+iXikCyv3DrWeQXqk
	W4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tq6MnALXs7IRggvKqwqal1dnmB5Smmny/KV4WD5gB8Q=;
	b=UGIuwMRXCELsh+VftgkziEZIEszNaY9LYdb6aox2h3zvWcuNRWu7q6sr3hOWeTKJX6
	2nZyD92104ZWSb5KqdRTorapPEfRtbd+mFDOI+62Pp3lthypLo7Bm/X6qZjDzY4LwJQm
	f4ydzHuD4nGgSckANbwa8Jp8HZNOAFm+e8K202GMOcF9eyX3YqtwvZjrVVamw+BqVC2y
	+Ss7jweYvF7tFYUte2Nz/hqUZ1gX+n3PjwN4MihIN4yEn6QbKs8X0x0FKkxV1azqbCTd
	bcqisUUdItz3v1BeVI8bFBfsQAGtmiAtmrekv1RYotTefX19iAdxc0gpBfccbm14o2ta
	oLcg==
X-Gm-Message-State: AKaTC00lFdWLuUfDW3l3JwKnA+csJmBSVQJKKEGjYvL8hvh9RWb4WiCR6++eedzPeXcLXAiWyggD3EIbH+bxCOxA
X-Received: by 10.237.34.46 with SMTP id n43mr55587695qtc.105.1480952077149;
	Mon, 05 Dec 2016 07:34:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 5 Dec 2016 07:34:16 -0800 (PST)
In-Reply-To: <20161109055107.2250-1-jackie.huang@windriver.com>
References: <20161109055107.2250-1-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Dec 2016 15:34:16 +0000
Message-ID: <CAJTo0LZrTFKALSKsZo=54OQ52Bbex5_bVFL0Xj6QVHULkQFsOg@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/cpan-base: fix for PERLVERSION
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
X-List-Received-Date: Mon, 05 Dec 2016 15:34:38 -0000
Content-Type: multipart/alternative; boundary=001a11377e187d1b470542eb0678

--001a11377e187d1b470542eb0678
Content-Type: text/plain; charset=UTF-8

On 9 November 2016 at 05:51, <jackie.huang@windriver.com> wrote:

> -PERLVERSION := "${@get_perl_version(d)}"
> +PERLVERSION = "${@get_perl_version(d)}"
>

This uses := as the get_perl_version is a non-trivial amount of python
which doesn't need to be re-evaluated all the time.  Have you looked at how
bad the performance hit is, and whether there is an alternative?

Ross

--001a11377e187d1b470542eb0678
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 November 2016 at 05:51,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jacki=
e.huang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div id=3D"gmail-:351" class=3D"gmail-a3=
s gmail-aXjCH gmail-m15847a7f3f90656b">-PERLVERSION :=3D &quot;${@get_perl_=
version(d)}&quot;<br>
+PERLVERSION =3D &quot;${@get_perl_version(d)}&quot;<br></div></blockquote>=
</div><br>This uses :=3D as the get_perl_version is a non-trivial amount of=
 python which doesn&#39;t need to be re-evaluated all the time.=C2=A0 Have =
you looked at how bad the performance hit is, and whether there is an alter=
native?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a11377e187d1b470542eb0678--
