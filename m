Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id F320B7D2D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 16:53:55 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d79so60555178qke.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 09:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FwSNzq6HjffVbfPqZ3mTffag0jb3S+bWp3EI06gdj2Q=;
	b=ClwsZX4dZc1tHQAkZRHLufgUQB0ezlx+Ks1VRugbgHP7pqECvWxOyQV6ygR++2lVy9
	bdbj5pN9DQ9d61HJUnKIZi8fTNrsrrmuwzE2u9yD+ry1unoQvJUZITh8wRwGuH+ZBUBf
	Zht6O8bCE4yKee2Y9hKsmCak5639wb8CIwncSBVN814LNUiaUJamWd8yGyqq9cWzbHmC
	o05uZ4XH9EwsGZcxghOXG5igsYWTTSS4Xas46Z1+4EF3MtphdyvN1ykGQKp61nSsk3kE
	knXrmuxCIJt5QNs9VO/U/djK2ECWDN+0bTv+gcUQP3wQ/QHLRaGMN+669GDrbDwk6jv8
	f6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FwSNzq6HjffVbfPqZ3mTffag0jb3S+bWp3EI06gdj2Q=;
	b=hQrG788pAZ30fIHgY9IyFNHzVW8DhPw87r0jyJQZC+gnLF8sEuJzAZ+q41Auh4bHad
	EO8ZYCMP5lPAP4SVHh/uGUQemI5XxziAmgkeq52hsmwnFGEcmM6rYPD26YDIZ1cV+HAr
	Wdi4JgH4tugRf7uRXe0EI+k1d+xaYzUvpFsq+QRpX/V0gvvWc8oh9kYbVxVJRB7H8/My
	rZgpmNMZ6wyVZIx365lM5R6zkqP47kuDbNwADJwlOx0fP0aiBGuK4Ow26lX+R20dlKsW
	e/Y5kbZSO658N72O0kjjw5HtOBYIYm5FevdVdMLIdM1gnHNYyEQbHK2wWI3kbYDBzJG1
	3BZA==
X-Gm-Message-State: APjAAAWhfYkaHQpEve4X+caWzG/RUqfftOLJOO0PGU+MsanTCEkcfFw3
	X03caH2x8uoUhGUOHjDaOpSepPvNh+s74OsBhkQ=
X-Google-Smtp-Source: APXvYqzqy2VBp7SvqU4qFsvyAcWHG1AxZoqqyEZnSczGf1vRwlj+CWld07aZ+KivM2QD/ECJGmhGHbgU9L02wu8mVXU=
X-Received: by 2002:a37:c81:: with SMTP id 123mr105520077qkm.474.1565024036543;
	Mon, 05 Aug 2019 09:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190731174820.16459-1-raj.khem@gmail.com>
	<CANNYZj8jXXn4-kjumdBu-jeJmZec_X3sfjO=Z+YjY=wZocrdhQ@mail.gmail.com>
In-Reply-To: <CANNYZj8jXXn4-kjumdBu-jeJmZec_X3sfjO=Z+YjY=wZocrdhQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Aug 2019 09:53:45 -0700
Message-ID: <CAMKF1sp88sbmHSaRL3pxjoijaCsASeZd8iNrFfnC9zpwaeo9JQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libedit: Move from meta-oe
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
X-List-Received-Date: Mon, 05 Aug 2019 16:53:56 -0000
Content-Type: multipart/alternative; boundary="000000000000c36123058f618d46"

--000000000000c36123058f618d46
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 5, 2019 at 4:34 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Wed, 31 Jul 2019 at 19:48, Khem Raj <raj.khem@gmail.com> wrote:
>
>> +UPSTREAM_CHECK_REGEX = "libedit-(?P<pver>\d+(\.\d+)+)\.tar.gz"
>>
>
> The recipe in meta-oe did not have this line. Where did you take it from
> and how did you test it? It is incorrect as it does not match anything with
> a dash (-) in it.
> Simply dropping the line makes the version check work again.
>

Yes it was left over of some trying thanks for finding it I will send a
patch

>
> Alex
>

--000000000000c36123058f618d46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Aug 5, 2019 at 4:34 AM Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On=
 Wed, 31 Jul 2019 at 19:48, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+UPSTREA=
M_CHECK_REGEX =3D &quot;libedit-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar.gz&quot;<b=
r></blockquote><div><br></div><div>The recipe in meta-oe did not have this =
line. Where did you take it from and how did you test it? It is incorrect a=
s it does not match anything with a dash (-) in it.</div><div>Simply droppi=
ng the line makes the version check work again.<br></div><div></div></div><=
/div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes it was =
left over of some trying thanks for finding it I will send a patch=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div><br></div><div>Alex<br></div></div></div>
</blockquote></div></div>

--000000000000c36123058f618d46--
