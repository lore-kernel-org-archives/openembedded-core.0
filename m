Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id DC3B96B436
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 03:27:25 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d17so5468668qtj.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 20:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k5kqi9gMiZdP6G8uo9Nt6WPHw4lGt11LqKkkPnl4NU8=;
	b=PIt6Jyb2pYTC+Fzs3Lt4zOXTqYLtpMKsxsYwPPVJHkO9T5/KtxgwCG+/mO7eGudTbL
	dn/OAhDOgQSYKQVLumA7ON88xyE7nef/telQhWSj9JEMzyGMnvZabIcSgFF65tJDCoC3
	7YGgnvtnkIMcOAB2upW83BZvmw68ZoTcWmfb6fGE2GEy+G+HImQK48lQ1Tec4UW2NYcC
	dpsaeLwhBCqsXQKX6Cxj0TQcwbLRBcu0SG2v7VW6vqaCQeQfwxi72zAUtLWnLLH5jSve
	CQukac/OTI7xnsJ26sYhviWYbpPQHJnIHQbPGkdQJL3Dh8H2duBG1YJJNuaTez/Kw0FU
	H7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k5kqi9gMiZdP6G8uo9Nt6WPHw4lGt11LqKkkPnl4NU8=;
	b=PpFee+C5zm6kNx0LEpFgTAkYTI/wQJ1nN7csjhWT0EwNRhoMvOFPZJXN9oGrd4GBYp
	yFq4RFcxKLiiw25ddBLGmrwEKNyth8hE3g3wFvrd/lgAgngbEtl9H/PkQ/U7/ys8apHL
	ztVhv1n3K6mwDpB9CBpSYvw7NxraJ2fjhkHSZJe6z3aEabDw8gtsBkl8UYiRbReOIIia
	rSae4oQNYgTFPL5FaJUgURf2WYLJ021KLKRzmuY74g7WIqnqZ/Q8q3VGl9k/5PjNHBuu
	m0xPvGlDcU8CcL5fZ8D6zf3ybEqtS743r/zmaQ5i3DC6iC8W1WKDMPBh6qluiy373lnc
	B0rQ==
X-Gm-Message-State: APjAAAW5qmTS2L50cACPzXhNIbKyMyfnvpDdIyVbYPv8pdErF0gPvDJZ
	fX0HrUinbtAbLFc/FdvIiTH2kI6f55co0r5XPt8=
X-Google-Smtp-Source: APXvYqw8QVxjIGBql23A6Lk02P30bKZgE6C3QZFvH/J2GL70//YQZJ7wl7Zbtg7YD2yWXQasPMj/deD+ZoCajx5oOrE=
X-Received: by 2002:aed:3f1d:: with SMTP id
	p29mr115439967qtf.378.1561087646431; 
	Thu, 20 Jun 2019 20:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<0f5adba2f96da9396faa1e70f9eed84118cf735e.1559950879.git.timothy.t.orling@linux.intel.com>
	<CAMKF1sq5aOZ+6CSP+G88+JCYd4zMb6ZSe5MP5KWSSofPRbe4Ow@mail.gmail.com>
	<CANx9H-DLg1_vSEi1bBSSLCmycdyEa2MiJjZ9d=Owsc5bsR-GBA@mail.gmail.com>
In-Reply-To: <CANx9H-DLg1_vSEi1bBSSLCmycdyEa2MiJjZ9d=Owsc5bsR-GBA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jun 2019 21:27:15 -0600
Message-ID: <CAMKF1sr+Ffk0nCd3aVhGfsdRreFX7cpqEAqH8606LMqg=-ijww@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] scons.bbclass: use python3-scons
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
X-List-Received-Date: Fri, 21 Jun 2019 03:27:26 -0000
Content-Type: multipart/alternative; boundary="000000000000a100f7058bcd0aff"

--000000000000a100f7058bcd0aff
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 20, 2019 at 6:18 PM Tim Orling <ticotimo@gmail.com> wrote:

>
>
> On Thu, Jun 20, 2019 at 6:37 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Fri, Jun 7, 2019 at 5:50 PM Tim Orling
>> <timothy.t.orling@linux.intel.com> wrote:
>> >
>> > SCons has supported python3 since 3.0.0 release, use it.
>> >
>> > [YOCTO #13381]
>> >
>> > Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
>> > ---
>> >  meta/classes/scons.bbclass | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
>> > index 9ee7d1587d..a8ddae35f7 100644
>> > --- a/meta/classes/scons.bbclass
>> > +++ b/meta/classes/scons.bbclass
>> > @@ -1,4 +1,4 @@
>> > -DEPENDS += "python-scons-native"
>> > +DEPENDS += "python3-scons-native"
>> >
>>
>> some packages haven't upgraded to py3 but use scons see
>> https://errors.yoctoproject.org/Errors/Details/249271/
>>
>
>
> Thank you for reporting this. I was of course expecting some breakage and
> am committed to fixes. Please do report any other issues.
>
> Latest mongo release appears to be 4.3.0 and appears to support python3:
>
>
> https://github.com/mongodb/mongo/blob/89e7419a897b2270931c9c029abf6de555d83e0f/SConstruct
>
> Is this an aceptable upgrade? I am not savvy on which versions are
> desirable.
>

Yes for master this upgrade is fine

>
>
>> >  EXTRA_OESCONS ?= ""
>> >
>> > --
>> > 2.20.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--000000000000a100f7058bcd0aff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jun 20, 2019 at 6:18 PM Tim Orling &lt;<a href=3D"m=
ailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div><br></div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 20, 2019 at 6:37 AM Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, Jun=
 7, 2019 at 5:50 PM Tim Orling<br>
&lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" target=3D"_blank">t=
imothy.t.orling@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; SCons has supported python3 since 3.0.0 release, use it.<br>
&gt;<br>
&gt; [YOCTO #13381]<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@linux=
.intel.com" target=3D"_blank">timothy.t.orling@linux.intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/scons.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass<b=
r>
&gt; index 9ee7d1587d..a8ddae35f7 100644<br>
&gt; --- a/meta/classes/scons.bbclass<br>
&gt; +++ b/meta/classes/scons.bbclass<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -DEPENDS +=3D &quot;python-scons-native&quot;<br>
&gt; +DEPENDS +=3D &quot;python3-scons-native&quot;<br>
&gt;<br>
<br>
some packages haven&#39;t upgraded to py3 but use scons see<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/249271/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/249271/</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Thank you for reporting this. I was of course expecting some br=
eakage and am committed to fixes. Please do report any other issues.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Latest mongo release appears t=
o be 4.3.0 and appears to support python3:</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div><a href=3D"https://github.com/mongodb/mongo/blob/89=
e7419a897b2270931c9c029abf6de555d83e0f/SConstruct" target=3D"_blank">https:=
//github.com/mongodb/mongo/blob/89e7419a897b2270931c9c029abf6de555d83e0f/SC=
onstruct</a></div><br></div><div dir=3D"auto">Is this an aceptable upgrade?=
 I am not savvy on which versions are desirable.</div></div></div><div><div=
 class=3D"gmail_quote"><div dir=3D"auto"></div></div></div></blockquote><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Yes for master this upgrade is f=
ine=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"gmail_quot=
e"><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt;=C2=A0 EXTRA_OESCONS ?=3D &quot;&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000a100f7058bcd0aff--
