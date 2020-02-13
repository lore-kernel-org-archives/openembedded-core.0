Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9A3EF60C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 16:52:36 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id a33so2490561uad.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=42dPiYon94iL+MjObUzZK7Ro6jKB6ALio+4cY/sxnA4=;
	b=Oourh74K2pk0nTiJysnDOsL9cCUsUIXWw+J6EiNGxS9a4eEisdvN9viMywvnRmOItT
	myUxPTVz7usmkeDraYbhL68mFy9bekFux4Kn4GpzA2HT5BJ1mgpWQtnTwKhDXtQhLxMS
	4fnKQ0YFmdzOF/P/qmjY06mqxWmkDWE6Sk8tPAcWShXsaEwzcb3z5CW9HPEZQ/83167Q
	kx1XXz0GoG27UtiezCafU0Qja65g0dkJuIK1jUvXr3y1+XU1EdrJ90gto2EqCcbEhAs1
	AzZ4j31o2NnBTa9lS6GtENkOsSuV5rXeE3h00ko/9xMazmoKMDmuJEypIPeMIjtVH0dU
	SU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=42dPiYon94iL+MjObUzZK7Ro6jKB6ALio+4cY/sxnA4=;
	b=E0/QC/ceIwUkC/RRlxeFA4XycLeBorJJrSEuA1NQSpAQ1GtKf6n0Kb/+h8fCiP1WtE
	KHenvF5Z+1FYyns5EQG2PstJ13dTipmfykusZuBbUg3TlHqbJ16nIEjRnbd9YK9kOYsl
	Ycdk9r591cij4XyKfD/KPqKgDV+0m8HcZS6VLBDpvTbzt4CUL5wfuVQ6u5nJmpkVl7Rb
	Dze8I7BcrjreVb5yNtxtW1s6+OlGg6XekjG6gMh2uWo/eAGZrxAdE9yj1JRIvLRSCEJ1
	JrW9FVlLyFyL7pCu6elyWKC5Jm5/Ae8Lmf4GETw0JXLJ02Ls//TRnhnqL/qJcrktoJOJ
	EvqQ==
X-Gm-Message-State: APjAAAUeF8ukhSRvkjU22XX73ngpqrVJbRBY5bSys/9gE4epua7m2Aix
	v1DtTGRGIQ1+v2xlfojAan36Ke7hKEWnqI5xYWo=
X-Google-Smtp-Source: APXvYqx5YIoMrprP4JYv+yKFBLRPVe7wigaBwgImCqS4D7rVkzs62YbQg51KR9JfG1PlhbriXzHObtO5RWIfENBhltM=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr9489442uak.22.1581612757422;
	Thu, 13 Feb 2020 08:52:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
	<CANNYZj_T=J2fs39fpPKQjC5rGSg_opTeUGzPokeiU-5jwhRzTQ@mail.gmail.com>
	<CAMKF1sqJTPVFALwd0qx+zfWq3MsmhVL=n58CDMns1MwJH2mTsw@mail.gmail.com>
	<CANNYZj_C7i+2QKaFqjiDh0DFYYuYO7eY72wTR9NKz9JEjDtjCA@mail.gmail.com>
	<CAMKF1sot=-RJ0O-HLQRHWsi4OUHhUKsyi9WzoZiXOJrvaX_QGw@mail.gmail.com>
In-Reply-To: <CAMKF1sot=-RJ0O-HLQRHWsi4OUHhUKsyi9WzoZiXOJrvaX_QGw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2020 17:53:06 +0100
Message-ID: <CANNYZj_7pG5EGjOR2BW3beJ3J__37GR29XZFaRotvuG9KFCnOQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] recipe updates, testing fixes
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
X-List-Received-Date: Thu, 13 Feb 2020 16:52:36 -0000
Content-Type: multipart/alternative; boundary="000000000000941786059e77eaad"

--000000000000941786059e77eaad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Feb 2020 at 17:44, Khem Raj <raj.khem@gmail.com> wrote:

> I'd like to request that these two are held back until we figure out what
>>>> is going wrong with the rpm test (see separate thread).
>>>>
>>>
>>> We already know what=E2=80=99s going on what more
>>> Do you want to know ?
>>>
>>
>>  As the rpm maintainer, yes I do. The test is not being skipped when it
>> should be, and I'd like to know why.
>>
>
> I see that as separate issue orthogonal to these patches
>

Merging these patches will exclude rpm from images, and so will mask the
issue, so it's not orthogonal.

Alex

--000000000000941786059e77eaad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 13 Feb 2020 at 17:44, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><div><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);paddi=
ng-left:1ex"><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-sty=
le:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_quote"><div>I&#39;d like to request that these two =
are held back until we figure out what is going wrong with the rpm test (se=
e separate thread).</div></div></div></blockquote><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">We already know what=E2=80=99s going on what more</div=
><div dir=3D"auto">Do you want to know ?</div></div></div></blockquote><div=
><br></div><div>=C2=A0As the rpm maintainer, yes I do. The test is not bein=
g skipped when it should be, and I&#39;d like to know why.</div><div></div>=
</div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I se=
e that as separate issue orthogonal to these patches=C2=A0</div></div></div=
></blockquote><div><br></div><div>Merging these patches will exclude rpm fr=
om images, and so will mask the issue, so it&#39;s not orthogonal.</div><di=
v><br></div><div>Alex=C2=A0</div></div></div>

--000000000000941786059e77eaad--
