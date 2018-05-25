Return-Path: <mans.zigher@gmail.com>
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id C9B3B74BDF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 08:52:47 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id t1-v6so5246317oth.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 01:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=FtkU+Ck79QSS0pHEenSLUScmiQeYbob95+qWNK5tsNI=;
	b=roKc08BeMHcz1uAKA6UkZb4dwMWn7zzITr/J2MCvXA2zBrNNUb0VXbK0Yi68YCDQuq
	mwvaBICDYW1Almkw2i1wWRjhC0T4SEK/J8EKb6ruMIpqEytfxuGUyeUyj98+oQQXB2Sm
	fIrLZC/4gAQhiryXzaLiG7AWXYbPuvOuSP/+ESoGD8SeCkBDHXk+9JqnEqORUVO3Lbl4
	x7ydFXCf+9OAweYgdYDTNar/LWYnMZoXm35f9h6vULkjuX8hvQ5pxYAcwtpo8BBlWLRU
	xsndOzwKDQvR6vkeDY1FvjqJ5MmKNRZ0csFzCgUc4V/DnY+a+OJZc5WBWnKXv9oy1SJO
	lGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=FtkU+Ck79QSS0pHEenSLUScmiQeYbob95+qWNK5tsNI=;
	b=KcYXg+qGCUqxVYX1S8whAzwwyVZ+JH7ONpww+y9whHK8rD5ZT5vIywdmLeFB6e+Vd8
	QxweyF6wF1Ei5QK0+75lVtCyhCLa7Sj8R04q1chs2ifsHdlgg7KD0pvI2wPK9tPHfPWE
	Lg4jbIpRtQBcDjPqQeDPDg0POprUxl4Hq4gzDX1050k3kx28GvFEkv/S4A62JN6fQNKj
	9hEGXy4z5/0l50pRbUQz6jCyvsNzYPgjFrRfLyIsH/r70Znt5PwIexXTow7yXnGwSgWo
	uVLf920/c56FwYBhN5O/P6PMTnj8KFkFaLYY6tXo4h/NKde+2SBEduUDoxPZm+IOF3kz
	eWBg==
X-Gm-Message-State: ALKqPwdBO4wT45o5IT6i1W6z1AMdQgI0dRPpc/XOlqhpAl/cfbYAb+XL
	a7pxtsv5dSCFdgEWEPSbcnPd51pn/bR/FlCBZgmWGQ==
X-Google-Smtp-Source: ADUXVKJyD2MQ5A+/2TCz2RpcVg9Nv+dcdOdaAlNKJVjrZupisSAJPYqwq0OLKGZJD0gs9s0rwy8UPrWJUCHtO7od0ys=
X-Received: by 2002:a9d:2b32:: with SMTP id
	o47-v6mr1007681otb.346.1527238368320; 
	Fri, 25 May 2018 01:52:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:5c06:0:0:0:0:0 with HTTP; Fri, 25 May 2018 01:52:47
	-0700 (PDT)
From: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Date: Fri, 25 May 2018 10:52:47 +0200
Message-ID: <CAEhQi8n2uy8y4OyZ+X1hxcEQk54sAV8Ew-_8NsqD+ri8ctfRFg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: [meta-oe] protobuf fetch failed
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
X-List-Received-Date: Fri, 25 May 2018 08:52:48 -0000
Content-Type: multipart/alternative; boundary="0000000000006e612a056d03e4c8"

--0000000000006e612a056d03e4c8
Content-Type: text/plain; charset="UTF-8"

Hi,

I am using rocko and for some reason the fetch started to fail. The recipe
protobuf_3.4.1.bb

SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"

ERROR: protobuf-3.4.1+gitAUTOINC+b04e5cba35-r0 do_fetch: Fetcher failure
for URL: 'git://github.com/google/protobuf.git;branch=3.4.x'. Unable to
fetch URL from any source.

The strange thing is that I cannot find a branch 3.4.x in the
https://github.com/google/protobuf.

I also noticed that on master you are using 3.5.1 but the same problem
occurs there

SRC_URI = "git://github.com/google/protobuf.git;branch=3.5.x"

which is a branch I cannot find.

What is it that I am missing here?
Would it make sense to use tag instead of branch in the recipe?

BR
Mans Zigher

--0000000000006e612a056d03e4c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am using rocko and for some reaso=
n the fetch started to fail. The recipe <a href=3D"http://protobuf_3.4.1.bb=
">protobuf_3.4.1.bb</a></div><div><br></div><div>SRC_URI =3D &quot;git://<a=
 href=3D"http://github.com/google/protobuf.git;branch=3D3.4.x">github.com/g=
oogle/protobuf.git;branch=3D3.4.x</a>&quot;<br></div><div><br></div><div>ER=
ROR: protobuf-3.4.1+gitAUTOINC+b04e5cba35-r0 do_fetch: Fetcher failure for =
URL: &#39;git://<a href=3D"http://github.com/google/protobuf.git;branch=3D3=
.4.x">github.com/google/protobuf.git;branch=3D3.4.x</a>&#39;. Unable to fet=
ch URL from any source.<br></div><div><br></div><div>The strange thing is t=
hat I cannot find a branch 3.4.x in the=C2=A0<a href=3D"https://github.com/=
google/protobuf">https://github.com/google/protobuf</a>.</div><div><br></di=
v><div>I also noticed that on master you are using 3.5.1 but the same probl=
em occurs there</div><div><br></div><div><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:small;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">SRC_URI =
=3D &quot;git://<a href=3D"http://github.com/google/protobuf.git;branch=3D3=
.5.x">github.com/google/protobuf.git;branch=3D3.5.x</a>&quot;</span><br></d=
iv><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline"><br></span></div><div><span style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">which is a branch I cannot find.</span></div><div><span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline"><br></span></div><div><span style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">What is it that I a=
m missing here?</span></div><div><span style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">Would it make se=
nse to use tag instead of branch in the recipe?</span></div><div><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline"><br></span></div><div>BR</div><div>Mans Zigher</div></div>

--0000000000006e612a056d03e4c8--
