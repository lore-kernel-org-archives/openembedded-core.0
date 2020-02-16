Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB45605EB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 18:27:29 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g3so16954191wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 10:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PF1Nh3yKQUTfCZbfkmmchkuFSgEXDDZ8j5XS9XtzW6U=;
	b=lv/ZGBBKWjn+7c+Kv1Iyjtm0cMySFBDsflhkSvp8rqD8giVKtelCGYxJVWuhvEIYIn
	fJp8KxUr2oNIVetvIHO7NUdDruhO7j6LFhvrvve2c0rSobVHKO33eUpes9yDm0dR/NlC
	O4QPxZM+qUs2JxQ90vE3dai55eY7CeiuPHdOBDm+rvWR2+UGa6PzAWHIu7oEI0MS/him
	Qk9TrBlxx2TuJ9s+ykuwcKTuWeeMOLrrURjeMYwNc0hr+3qpbxKEi2jG2PWhCrgiXY1g
	FmL75mEWtu5XTu6ZUC6Jqm6vtlXl1bfLQSpiBIOfnJ2Fl41up32IAASTtQLJl3FfUD4P
	hbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PF1Nh3yKQUTfCZbfkmmchkuFSgEXDDZ8j5XS9XtzW6U=;
	b=YCMtc9hEdNcBipTSebS/j2YNX2OkuR4PXTbaTQoXumU957J1C6pKg8lpIZsLWMiWjr
	XFWzF3SWCTy16QDrPwhXuvLW0/DoSBwtUslwYlkJ3NyKWpoSvdmXFWM1YkvH+KZzMAWl
	+UYizKaln2+QtnxBNi2Mr4XL82pEWZim1WMRl7sfoOVChgkZOBJ8LQuOmlF/WRuJ3nKc
	0pZxrMWT71RIGAuAxQNg0DcYt9tJlBBhDw0Sca154pFa5QlEEw5kxtfb6Ss8FM5k/30A
	MCjjj8vg1aZuXUSR+WeETbnINqp8fziN9qyEOGAOVQdslw6vZ3oyw5RCYQfb+Tu847C3
	3pEw==
X-Gm-Message-State: APjAAAXWWFRyed5/Y4ivzFNyzeW7+vRy6tBiWEp2Fhj6lDgvMZXdtQUO
	nE0GjyiW8YjiyHdZSVdBnZR6PH10aHm05ps4ZeA=
X-Google-Smtp-Source: APXvYqyHtHnX3w0Jq4vxPJIeqad1xrQbOk/ZzKtBx3kZworlrArJdXaluqhf8E4t1PNI+8fMT6CJOn862B+0yFXJJ9s=
X-Received: by 2002:a5d:6452:: with SMTP id d18mr16525919wrw.303.1581877650594;
	Sun, 16 Feb 2020 10:27:30 -0800 (PST)
MIME-Version: 1.0
References: <20200212031435.792802-1-JPEWhacker@gmail.com>
	<ae6aa1fd185955181b81170757887c3b19a9767c.camel@linuxfoundation.org>
In-Reply-To: <ae6aa1fd185955181b81170757887c3b19a9767c.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 16 Feb 2020 12:27:18 -0600
Message-ID: <CAJdd5GZJ7CWVfg9jEgybK1aRLqFxFpvd7G-EtsVvfn+WFK-pbg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] oeqa: Run diffoscop on saved output
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
X-List-Received-Date: Sun, 16 Feb 2020 18:27:30 -0000
Content-Type: multipart/alternative; boundary="000000000000711dc9059eb5970b"

--000000000000711dc9059eb5970b
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 15, 2020, 5:07 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2020-02-11 at 21:14 -0600, Joshua Watt wrote:
> > Adds recipes to build the diffoscope tool and run it when the OEQA
> > reproducible build test saves output to a local path. This should
> > make
> > it much easier to debug reproducible build issues from the
> > autobuilder,
> > since the published output can be easily viewed on the website.
> >
> > Joshua Watt (4):
> >   python: Add libarchive-c recipe
> >   python: Add magic recipe
> >   recipes-support: Add diffoscope recipe
> >   oeqa: reproducible: Run diffoscope on saved output
>
> Thanks!
>
> The first production use:
>
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200215-t1s21q9r/packages/diff-html/
>
> :)
>

That's great!


> I am a bit puzzled/concerned about how this hasn't been removed from
> the system yet as it should have been, unless its the hashequiv problem
> with timestamps continuing to cause problems. Need to fix my patch...
>

It looks like a directory ordering issue to me, since the timestamps are
the same. One way to really flush these out would be to use disorderfs (
https://salsa.debian.org/reproducible-builds/disorderfs) which permutates
the order in which entries are listed in a directory, but I think we should
try to get "wider" coverage (more recipes) before we try that.


> Cheers,
>
> Richard
>
>

--000000000000711dc9059eb5970b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Feb 15, 2020, 5:07 AM Richard Purdie &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank" rel=3D"n=
oreferrer">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Tue, 2020-02-11 at 21:14 -0600, Joshua Watt wr=
ote:<br>
&gt; Adds recipes to build the diffoscope tool and run it when the OEQA<br>
&gt; reproducible build test saves output to a local path. This should<br>
&gt; make<br>
&gt; it much easier to debug reproducible build issues from the<br>
&gt; autobuilder,<br>
&gt; since the published output can be easily viewed on the website.<br>
&gt; <br>
&gt; Joshua Watt (4):<br>
&gt;=C2=A0 =C2=A0python: Add libarchive-c recipe<br>
&gt;=C2=A0 =C2=A0python: Add magic recipe<br>
&gt;=C2=A0 =C2=A0recipes-support: Add diffoscope recipe<br>
&gt;=C2=A0 =C2=A0oeqa: reproducible: Run diffoscope on saved output<br>
<br>
Thanks!<br>
<br>
The first production use:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2020=
0215-t1s21q9r/packages/diff-html/" rel=3D"noreferrer noreferrer noreferrer"=
 target=3D"_blank">https://autobuilder.yocto.io/pub/repro-fail/oe-reproduci=
ble-20200215-t1s21q9r/packages/diff-html/</a><br>
<br>
:)<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto=
">That&#39;s great!</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
I am a bit puzzled/concerned about how this hasn&#39;t been removed from<br=
>
the system yet as it should have been, unless its the hashequiv problem<br>
with timestamps continuing to cause problems. Need to fix my patch...<br></=
blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It loo=
ks like a directory ordering issue to me, since the timestamps are the same=
. One way to really flush these out would be to use disorderfs (<a href=3D"=
https://salsa.debian.org/reproducible-builds/disorderfs">https://salsa.debi=
an.org/reproducible-builds/disorderfs</a>) which permutates the order in wh=
ich entries are listed in a directory, but I think we should try to get &qu=
ot;wider&quot; coverage (more recipes) before we try that.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>

--000000000000711dc9059eb5970b--
