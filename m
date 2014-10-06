Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 14A85717CA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 14:30:40 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id l13so5085329iga.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Oct 2014 07:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=d7GTYyVsYKyze56Sifzb1vn+da0Jis4vekbEB30aXAI=;
	b=k/v5iwx5hbjyfnoRhKL7HzJdeZB3/pjTM81f71TDvogKKfXEWZfIiCfw0vYVNs9fD5
	YlpQEuPoRfdJqfju3NHTCYBg+uB4dlW+PGHcLijvxUv2VZQDhiaQwp5HW42kxZJNjwi4
	jsEy/6usfIXlr1tYMo003rzY8mH9X610iAUIhBpvcC2PSbgMscTblxxHO5UBo/SwtxqM
	HatdjomC8XDfl+AVJ+/I6xSXTwXsqf/+B0w40DbmQpYDRuFtF/oFhnR9kEySSu32uu3z
	S00qhYeTv5eeQdrxbwJVQldEPYt3pMhQE582oJg9LCdRveFOLQjvO2Aya8L2TcJ4rXEp
	HbqA==
MIME-Version: 1.0
X-Received: by 10.50.87.99 with SMTP id w3mr22557477igz.4.1412605841188; Mon,
	06 Oct 2014 07:30:41 -0700 (PDT)
Received: by 10.50.179.5 with HTTP; Mon, 6 Oct 2014 07:30:41 -0700 (PDT)
In-Reply-To: <CAJTo0LYakD7wSHpGMwEYnz_v2xoBv-hiD9zXmHLP72VrVT0oKg@mail.gmail.com>
References: <1412550979-15317-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LYakD7wSHpGMwEYnz_v2xoBv-hiD9zXmHLP72VrVT0oKg@mail.gmail.com>
Date: Mon, 6 Oct 2014 07:30:41 -0700
Message-ID: <CAMKF1spq=NefNnf4UB6jEurF2+0amt1x3PHT7dX2yOqgaKR=fg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH] gnome-desktop-testing: Fix build on uclibc
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
X-List-Received-Date: Mon, 06 Oct 2014 14:30:41 -0000
Content-Type: multipart/alternative; boundary=089e0111b8545f2dd70504c1edf2

--089e0111b8545f2dd70504c1edf2
Content-Type: text/plain; charset=UTF-8

On Monday, October 6, 2014, Burton, Ross <ross.burton@intel.com> wrote:

> On 6 October 2014 00:16, Khem Raj <raj.khem@gmail.com <javascript:;>>
> wrote:
> > +From b1de2c6290bc0651fe87a8c4fb52e7a0a5fe6322 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com <javascript:;>>
> > +Date: Sun, 5 Oct 2014 16:01:49 -0700
> > +Subject: [PATCH] gsystem-subprocess.c: Enable GNU extensions in system
> C
> > + library
> > +
> > +This should export O_CLOEXEC where it is only
> > +available when _GNU_SOURCE is defined .e.g. uclibc based systems
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com <javascript:;>>
> > +
> > +Upstream-Status: Pending
>
> Shouldn't this be in master before backporting to daisy?


Yes. It should be in master too, I was not sure if same patch would be
needed on master when I sent this one when I sent this one

>
> Ross
>

--089e0111b8545f2dd70504c1edf2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, October 6, 2014, Burton, Ross &lt;<a href=3D"mailto:ross=
.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">On 6 October 2014 00:16, Khem Raj &lt;<a href=3D"javascript:=
;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#39;)">raj.=
khem@gmail.com</a>&gt; wrote:<br>
&gt; +From b1de2c6290bc0651fe87a8c4fb52e7a0a5fe6322 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &#39=
;cvml&#39;, &#39;raj.khem@gmail.com&#39;)">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Sun, 5 Oct 2014 16:01:49 -0700<br>
&gt; +Subject: [PATCH] gsystem-subprocess.c: Enable GNU extensions in syste=
m=C2=A0 C<br>
&gt; + library<br>
&gt; +<br>
&gt; +This should export O_CLOEXEC where it is only<br>
&gt; +available when _GNU_SOURCE is defined .e.g. uclibc based systems<br>
&gt; +<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"javascript:;" onclick=3D"_e(ev=
ent, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#39;)">raj.khem@gmail.com</a>&=
gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
<br>
Shouldn&#39;t this be in master before backporting to daisy?</blockquote><d=
iv><br></div><div>Yes. It should be in master too, I was not sure if same p=
atch would be needed on master when I sent this one when I sent this one=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
Ross<br>
</blockquote>

--089e0111b8545f2dd70504c1edf2--
