Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7F84560F21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 21:27:30 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id e14so8549832iej.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 14:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MAWA8qyd4zWFvAiIi5BHy7EMxkQqvbUJFbA90W0MLzc=;
	b=gtJFOILiYNI8qVj35piLny2kpLui5pRgDTd/9oWYfTd02oFSxspAvFYoUwyDP0ytnl
	gClx1wY3k9Dkjoxnc6bjsFkkNzeSBQhFh3zLj+A1SbtvGT4heXugYTo6DTkaeiMclqfU
	K9ACoTFAkX4ZT78r5L99pBpxK2MNC1ABtXJUP1B46T3ootZtZ39ajX4aOce+IH6780mQ
	LGqdg2BGkXl60DNVyLi1ViEcu3JBUL54tk7nV7AVz9F7+wQycShHNN+elYZv256qGciO
	1iBtSDuWcuPGyxtu4DW0gG2/o6BLLGI6euATpkSI5t1Nzi5WBr0rEiX1Ic8vmosEAoXO
	2xdA==
MIME-Version: 1.0
X-Received: by 10.42.223.134 with SMTP id ik6mr7867258icb.4.1379366852023;
	Mon, 16 Sep 2013 14:27:32 -0700 (PDT)
Received: by 10.50.216.195 with HTTP; Mon, 16 Sep 2013 14:27:31 -0700 (PDT)
In-Reply-To: <1379364756.4770.20.camel@x121e.pbcl.net>
References: <1379071094.3484.245.camel@ted>
	<CAMKF1so0f+8uJnqTxK0b+gkhhQAcjsAsVYZp8E_V5pEiL1heuQ@mail.gmail.com>
	<1379143167.4071.100.camel@x121e.pbcl.net>
	<CAMKF1srExVG5j4t+LdSnD3cJNJftNmykhUCRBz9wXQrv6-qH9w@mail.gmail.com>
	<1379364756.4770.20.camel@x121e.pbcl.net>
Date: Mon, 16 Sep 2013 14:27:31 -0700
Message-ID: <CAMKF1sqAEM1FdGjrS9ZnOPYrHac7U1a_TAZK_NfcHUhY=-n9MA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: Add big warning about antisocial behaviour
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
X-List-Received-Date: Mon, 16 Sep 2013 21:27:32 -0000
Content-Type: multipart/alternative; boundary=001a11330a163adc0e04e686df13

--001a11330a163adc0e04e686df13
Content-Type: text/plain; charset=UTF-8

On Monday, September 16, 2013, Phil Blundell <pb@pbcl.net> wrote:
> On Mon, 2013-09-16 at 09:24 -0700, Khem Raj wrote:
>> On Sat, Sep 14, 2013 at 12:19 AM, Phil Blundell <pb@pbcl.net> wrote:
>> > On Fri, 2013-09-13 at 21:24 -0700, Khem Raj wrote:
>> >> There are cases where we have bsps with 2.6.3x kernels and libc
>> >> compiled against 3.10 assumes syscalls
>> >
>> > That is a bug in glibc.  It should not be doing that unless configured
>> > --enable-kernel=3.10.x (and this is the whole point of the
>> > --enable-kernel option).  If it's assuming 3.10.x syscalls under
>> > --enable-kernel=2.6.x then it is broken and should be fixed.
>> >
>>
>> we have OLDEST_KERNEL = "2.6.16" and thats not a problem. However one
>> case where it showed up was when building udev > 164 with kernels
>> where accept4 call was not wired for arm e.g. since udev looked up
>> definition of SOCK_CLOEXEC which it found but that 2.6.32 kernel
>> really did not support it.
>
> That sounds slightly different to the problem you were originally
> describing ("libc compiled against 3.10") but I think the answer is
> basically still the same: it is a bug in udev, and udev ought to be
> fixed.
>

if you check for kernel version yes but its not wrong by testing a given
kernel API which it is doing

anyway i think the notice that rp added is good in general and may be will
help folks to upgrade and unify kernels in long run
> p.
>
>
>

--001a11330a163adc0e04e686df13
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, September 16, 2013, Phil Blundell &lt;<a href=3D"mailto:=
pb@pbcl.net">pb@pbcl.net</a>&gt; wrote:<br>&gt; On Mon, 2013-09-16 at 09:24=
 -0700, Khem Raj wrote:<br>&gt;&gt; On Sat, Sep 14, 2013 at 12:19 AM, Phil =
Blundell &lt;<a href=3D"mailto:pb@pbcl.net">pb@pbcl.net</a>&gt; wrote:<br>
&gt;&gt; &gt; On Fri, 2013-09-13 at 21:24 -0700, Khem Raj wrote:<br>&gt;&gt=
; &gt;&gt; There are cases where we have bsps with 2.6.3x kernels and libc<=
br>&gt;&gt; &gt;&gt; compiled against 3.10 assumes syscalls<br>&gt;&gt; &gt=
;<br>
&gt;&gt; &gt; That is a bug in glibc. =C2=A0It should not be doing that unl=
ess configured<br>&gt;&gt; &gt; --enable-kernel=3D3.10.x (and this is the w=
hole point of the<br>&gt;&gt; &gt; --enable-kernel option). =C2=A0If it&#39=
;s assuming 3.10.x syscalls under<br>
&gt;&gt; &gt; --enable-kernel=3D2.6.x then it is broken and should be fixed=
.<br>&gt;&gt; &gt;<br>&gt;&gt;<br>&gt;&gt; we have OLDEST_KERNEL =3D &quot;=
2.6.16&quot; and thats not a problem. However one<br>&gt;&gt; case where it=
 showed up was when building udev &gt; 164 with kernels<br>
&gt;&gt; where accept4 call was not wired for arm e.g. since udev looked up=
<br>&gt;&gt; definition of SOCK_CLOEXEC which it found but that 2.6.32 kern=
el<br>&gt;&gt; really did not support it.<br>&gt;<br>&gt; That sounds sligh=
tly different to the problem you were originally<br>
&gt; describing (&quot;libc compiled against 3.10&quot;) but I think the an=
swer is<br>&gt; basically still the same: it is a bug in udev, and udev oug=
ht to be<br>&gt; fixed.<br>&gt;<br><br>if you check for kernel version yes =
but its not wrong by testing a given kernel API which it is doing<br>
<br>anyway i think the notice that rp added is good in general and may be w=
ill help folks to upgrade and unify kernels in long run<br>&gt; p.<br>&gt;<=
br>&gt;<br>&gt;

--001a11330a163adc0e04e686df13--
