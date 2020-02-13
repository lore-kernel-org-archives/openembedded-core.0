Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD6860F06
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 16:44:35 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id p7so6282102qkh.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1RyQAyA8gWoCxILuNdfU4fy9nnuyJCW33XetUTyi/Eg=;
	b=bKqibxLf3jb63JSf9N2OTB38j9HxSmEdHzExgcFWgBcVclL4linkWQ5BvNp5ZYlIiT
	Z36LyhI3AZpc+A+VisPXOtOafW02Mr85PEMcvZ67USgAaM+tDuB/fRX85CxnCOTv9MFb
	w6G2DzZnOOpLemkcpNNr+RDOMBpnkQQdI4W4WFdjPDmunZYGnWa+pNSYLiM3pOuzc6ty
	+EHYiFl9nVvNVxpyc1If++mjmeATU5VxsEyoyje6LIA9tNd9RamE9P3zAwbWKCvReOho
	1dXQCSNANqwFBOGsgr1s+CDPkK3fwo/T72A8a4jlQ8/QN3uuiyCBrhXT9tY3+d5A6nvg
	zPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1RyQAyA8gWoCxILuNdfU4fy9nnuyJCW33XetUTyi/Eg=;
	b=f/Kfn1GktFr6vx65163bcfoxQPlri+aG0tJCaJAb/oSbD0E7yaFUgIhjUKBHjokcMP
	+bt4z3dL9MzreWUP7HUDyCGkGJMwY51tcW30t9vg7pAf4hnzhXtaYWKQMAhR8iEcbTXw
	tnIxqcWu7g3z6yDD0TCDGPs+OJspTl5YA0C07beGCZvFdnSJ7CdBNlXBFCALFFp+4BrG
	9TwFspMzURdT/ezzAt7bTfTb6kgRcpjWaGrfbrq7aUqfWFBWhc7ZsXq0CpSMfjZxsidA
	rtSMQKrBFkjiGMSngqVepH+BqAV9Tk5qh2xUSaNqi73JbVrUION8TkmRSU3/UzqfKjQU
	lCXA==
X-Gm-Message-State: APjAAAWEnOEKRsBoKJUkr36rNDNQuRVxRCSLHEz8xtj/skjhxRjLWhVU
	zQ7Mau2h7rF/iMVCsZmq56Idw9aZHL+m0YrVmbc=
X-Google-Smtp-Source: APXvYqzmtOlZvR6QZVCUbEoYHv/jlxzYtAFDZ9NFzIwQxpd9G6AGCy2ZmbFbNwzLi39/DesGFrZG9qRIushsIozc5bo=
X-Received: by 2002:ae9:e88e:: with SMTP id a136mr389913qkg.71.1581612275847; 
	Thu, 13 Feb 2020 08:44:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
	<CANNYZj_T=J2fs39fpPKQjC5rGSg_opTeUGzPokeiU-5jwhRzTQ@mail.gmail.com>
	<CAMKF1sqJTPVFALwd0qx+zfWq3MsmhVL=n58CDMns1MwJH2mTsw@mail.gmail.com>
	<CANNYZj_C7i+2QKaFqjiDh0DFYYuYO7eY72wTR9NKz9JEjDtjCA@mail.gmail.com>
In-Reply-To: <CANNYZj_C7i+2QKaFqjiDh0DFYYuYO7eY72wTR9NKz9JEjDtjCA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 08:44:25 -0800
Message-ID: <CAMKF1sot=-RJ0O-HLQRHWsi4OUHhUKsyi9WzoZiXOJrvaX_QGw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
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
X-List-Received-Date: Thu, 13 Feb 2020 16:44:35 -0000
Content-Type: multipart/alternative; boundary="000000000000dfd6c8059e77cd24"

--000000000000dfd6c8059e77cd24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 8:19 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Thu, 13 Feb 2020 at 17:07, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>>> I'd like to request that these two are held back until we figure out
>>> what is going wrong with the rpm test (see separate thread).
>>>
>>
>> We already know what=E2=80=99s going on what more
>> Do you want to know ?
>>
>
>  As the rpm maintainer, yes I do. The test is not being skipped when it
> should be, and I'd like to know why.
>

I see that as separate issue orthogonal to these patches


> Alex
>

--000000000000dfd6c8059e77cd24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 13, 2020 at 8:19 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">O=
n Thu, 13 Feb 2020 at 17:07, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:=
rgb(204,204,204);padding-left:1ex"><div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-l=
eft:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>I&=
#39;d like to request that these two are held back until we figure out what=
 is going wrong with the rpm test (see separate thread).</div></div></div><=
/blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">We already know w=
hat=E2=80=99s going on what more</div><div dir=3D"auto">Do you want to know=
 ?</div></div></div></blockquote><div><br></div><div>=C2=A0As the rpm maint=
ainer, yes I do. The test is not being skipped when it should be, and I&#39=
;d like to know why.</div><div></div></div></div></blockquote><div dir=3D"a=
uto"><br></div><div dir=3D"auto">I see that as separate issue orthogonal to=
 these patches=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>A=
lex=C2=A0</div></div></div>
</blockquote></div></div>

--000000000000dfd6c8059e77cd24--
