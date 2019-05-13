Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id C3AB77DF0B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 15:29:41 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id g190so6131178qkf.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 08:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Jh2hgMuCnB5uci6pRXzNrQxkWv/NHIZ/icSPVw7W9dI=;
	b=QYUffoborJbzZE4XV5z9+Us8oZ1zEAfSfccmmBF5LWf1Iakt1riljnPETNSgiMV1Cr
	y7vDxaDieXIV9+ZvDXS3iLk9tIxzJbGRAHmPlLBdwSSDk6VdZUAz4S/DvXk8DctR8O14
	zFO7rpdY1VS27aY2ilSOmeozLzN508MZbFOhMrzgadO/TFWV9FgVDFnltYbeoHOYmwqg
	DRRe8MXEuF3c6csHPth+MWdzLYMDK/aH9VfihjxICKDSme3JFg9u3mO4OdhVgpYWyW6k
	Nb4NZ/FLaBm7XVpaMyJtzvRVARH2yIfmHy85mcKrLVzlv0u8aJJgcNm0LrvdYiNIGPM6
	2c9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jh2hgMuCnB5uci6pRXzNrQxkWv/NHIZ/icSPVw7W9dI=;
	b=rOG7wB2Vw1jiAXst58LXtItgz7YmkuqV0KqtQk4Boj3WJNBoXN1U29pEGfAzeRdr6W
	ooLAUPbYMDKYo264UoKMXWkvgzcTTT7/rcSstAw9FWe2RG3q31D9lDviUvufpPpm0MZC
	2+qETU0d0NirI1e4RF3kX9A2oYimIVGL8ejaCV4J4LeDOXLqbmiWUYG1u+XN9QnJ6/u2
	T9Vqhsjn0rMM2kPzYS5ZaoQjXCJXoNGJ3fVV37/kZR+MA6iJ/mVe0q9QmQ5GuP2J0sy5
	L/YimqWsk7FPkGJt8tooCpN/bddrJykJ/w15RQhkJwk+RIcADZzhEnuorWooHaDArSJT
	TSrA==
X-Gm-Message-State: APjAAAWNdZ/XSVgIu4IEkq7PKR3MkKPB6jxsC2pXYogA+488weruAKgF
	YfyumKFxZLk1ZZOAh1+yvQcuMp7NhVwmaGb3Otc=
X-Google-Smtp-Source: APXvYqwLUAwJnTZAV7ZS+YBLlqvz4BDoxo8nY1ZJJOj0StQfMFSjFtWs4PrZbS0XXQAVScHWFaCLVQNLNMlsF9h14gg=
X-Received: by 2002:a37:8d06:: with SMTP id p6mr23173535qkd.315.1557761382331; 
	Mon, 13 May 2019 08:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190427113714.30173-1-schnitzeltony@gmail.com>
	<d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
	<CALbNGRSBsq7c8AAdpHUfkYytbeBMddDns5R7HeQ=9bWZU_OLyA@mail.gmail.com>
	<a45f59b03312a7693bd5d4e4ae04c600@basmevissen.nl>
	<CALbNGRT_FRQfA0jpP7DHsFOxnt97JW-KEjyGXOkW9V2w+Ujgyw@mail.gmail.com>
	<CALbNGRR_YxL=+u7Kc5x8OiTXLFhRjqK_jp53xB5Q_9WZS-rZ+Q@mail.gmail.com>
	<ec77d08feb85f543bbc79372d276092c10336035.camel@linuxfoundation.org>
	<b53e6c90-2a8d-7ae7-b5f7-e7a80b258da3@gmail.com>
	<ceb5ee6b-3965-de63-4237-805a6a97e92b@windriver.com>
	<2bb4d4b8a5c395ed9f0647bcbd1945cf2ef280bd.camel@linuxfoundation.org>
In-Reply-To: <2bb4d4b8a5c395ed9f0647bcbd1945cf2ef280bd.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2019 08:29:31 -0700
Message-ID: <CAMKF1soG8dkt-TRfddXxFLEq5RwkgjTtGmuNteSwtVtgXD16bA@mail.gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte-native: reduce c++ requirements from c++17 -> c++11
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
X-List-Received-Date: Mon, 13 May 2019 15:29:42 -0000
Content-Type: multipart/alternative; boundary="000000000000d6b9800588c695f2"

--000000000000d6b9800588c695f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2019 at 4:40 AM <richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2019-05-13 at 14:34 +0300, Mark Hatle wrote:
> > On 5/11/19 4:42 AM, Khem Raj wrote:
> > >
> > > Can we require centos7 and other hosts which use old compilers to
> > > install the additional packages to have newer compilers ? e.g. for
> > > centos installing devtoolset-7 will fix this issue
> >
> > I think we need to consider disabling this by default, as Ross
> > indicated he
> > wasn't sure it was really required, as well as consider the c++14
> > patch (if
> > standard CentOS supports C++-14).
> >
> > I do think it's reasonable to try to patch this component, assuming
> > it can be
> > done in a reasonable way with a reasonable end result.  (10-lines is
> > pretty easy
> > to understand/support, 1000 lines... no so much.)
> >
> > However, once we get past one component into multiples, then we need
> > a better
> > answer.  Either a set of buildtools the user can build/download, or
> > items
> > standard distributions have that they can install.
> >
> > Unfortunately CentOS 7 (and corresponding RHEL) is ancient by
> > compiler
> > standards, but is heavily used as a replacement is not yet ready.  So
> > this is a
> > problem we'll need to deal with for a while still.  Until CentOS 7
> > era is really
> > no longer heavily used I think we don't have a choice here but to
> > deal with this
> > one way or another.
>
> We avoided the problem by dropping the dependency so we're ok again for
> now. We haven't required special things be installed on hosts as it
> increases the documentation problem quite a lot. We run our autobuilder
> test workers fairly standard for this reason.
>
> The problem is going to get worse over time and the other solution
> could be we require one of our own buildtools-tarballs installed too.
> We have used this approach on our autobuilder workers in the past.
>
> I am keen to avoid extra distro specific documentaiton (and patches to
> detect the conditions) if we can help it...
>

It=E2=80=99s a balance to strike in my opinion sometimes we go out of way t=
o keep
supporting ancient compilers that has its own disadvantages At the same
time if we ask for additional packages for certain hosts this could also
mean that if they were building older releases those may not build anymore
with new compiler so it=E2=80=99s a dicey situation

>
> Cheers,
>
> Richard
>
>
>
>
>

--000000000000d6b9800588c695f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, May 13, 2019 at 4:40 AM &lt;<a href=3D"mailto:richa=
rd.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On Mon, 2019-05-13 at 14:34 +=
0300, Mark Hatle wrote:<br>
&gt; On 5/11/19 4:42 AM, Khem Raj wrote:<br>
&gt; &gt; <br>
&gt; &gt; Can we require centos7 and other hosts which use old compilers to=
 <br>
&gt; &gt; install the additional packages to have newer compilers ? e.g. fo=
r <br>
&gt; &gt; centos installing devtoolset-7 will fix this issue<br>
&gt; <br>
&gt; I think we need to consider disabling this by default, as Ross<br>
&gt; indicated he<br>
&gt; wasn&#39;t sure it was really required, as well as consider the c++14<=
br>
&gt; patch (if<br>
&gt; standard CentOS supports C++-14).<br>
&gt; <br>
&gt; I do think it&#39;s reasonable to try to patch this component, assumin=
g<br>
&gt; it can be<br>
&gt; done in a reasonable way with a reasonable end result.=C2=A0 (10-lines=
 is<br>
&gt; pretty easy<br>
&gt; to understand/support, 1000 lines... no so much.)<br>
&gt; <br>
&gt; However, once we get past one component into multiples, then we need<b=
r>
&gt; a better<br>
&gt; answer.=C2=A0 Either a set of buildtools the user can build/download, =
or<br>
&gt; items<br>
&gt; standard distributions have that they can install.<br>
&gt; <br>
&gt; Unfortunately CentOS 7 (and corresponding RHEL) is ancient by<br>
&gt; compiler<br>
&gt; standards, but is heavily used as a replacement is not yet ready.=C2=
=A0 So<br>
&gt; this is a<br>
&gt; problem we&#39;ll need to deal with for a while still.=C2=A0 Until Cen=
tOS 7<br>
&gt; era is really<br>
&gt; no longer heavily used I think we don&#39;t have a choice here but to<=
br>
&gt; deal with this<br>
&gt; one way or another.<br>
<br>
We avoided the problem by dropping the dependency so we&#39;re ok again for=
<br>
now. We haven&#39;t required special things be installed on hosts as it<br>
increases the documentation problem quite a lot. We run our autobuilder<br>
test workers fairly standard for this reason.<br>
<br>
The problem is going to get worse over time and the other solution<br>
could be we require one of our own buildtools-tarballs installed too.<br>
We have used this approach on our autobuilder workers in the past.<br>
<br>
I am keen to avoid extra distro specific documentaiton (and patches to<br>
detect the conditions) if we can help it...<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It=E2=80=99s a b=
alance to strike in my opinion sometimes we go out of way to keep supportin=
g ancient compilers that has its own disadvantages At the same time if we a=
sk for additional packages for certain hosts this could also mean that if t=
hey were building older releases those may not build anymore with new compi=
ler so it=E2=80=99s a dicey situation=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000d6b9800588c695f2--
