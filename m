Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UOQkr-0004yS-Bl
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 12:53:58 +0200
Received: by mail-wi0-f169.google.com with SMTP id c10so2524225wiw.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2013 03:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=uUG8C0zVi4+S6H04/qcpdLLBtjxWOt38Sksw8bGbUA8=;
	b=BJCI+0o90KsYSF59fOy44X8E7Cc01spnjyx1Y8aZdMyLax0bQwO37D+AsO4K/FzDVU
	+uNl7Z/RKOxANsH+JLPpJALJz+TD7yq/1wIz7qRDaTNgjSnU8SBFMp/Tb8WwHo8C/0Ir
	bseuGoq/DM9AIB1h2bY624XNfNcAszAtqP5FJBnRX/4qUbx48s8ptu31CAtDY8gJ53gP
	gx1d7a1ICKkT4vaWxXGyb5kDHcSPqwbN/0F9+JEQBeOaUW1SqX4Q14qkNenHJnPEzcKi
	43DFrUsgmjLwUemOnb0Va0V4RwbWAOYdFs381SSlAftOn/f0f6YbWUxgN2laglTkFCzX
	qQYQ==
MIME-Version: 1.0
X-Received: by 10.180.82.33 with SMTP id f1mr3535300wiy.13.1365244597872; Sat,
	06 Apr 2013 03:36:37 -0700 (PDT)
Received: by 10.194.243.137 with HTTP; Sat, 6 Apr 2013 03:36:37 -0700 (PDT)
In-Reply-To: <5BDCDCEF-35EC-4641-962B-DFBAE1570201@dominion.thruhere.net>
References: <1365181591-6728-1-git-send-email-ross.burton@intel.com>
	<5BDCDCEF-35EC-4641-962B-DFBAE1570201@dominion.thruhere.net>
Date: Sat, 6 Apr 2013 12:36:37 +0200
Message-ID: <CA+chaQfjyRzcCewTaro50-0aSFxNts51m9jUcZPZrdfm-gDHUw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: make the main package depend on all sub-packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Apr 2013 10:54:00 -0000
Content-Type: multipart/alternative; boundary=f46d041826da49af1b04d9aec7a2

--f46d041826da49af1b04d9aec7a2
Content-Type: text/plain; charset=UTF-8

And also staging firmware files just once to resolve

> WARNING: The recipe linux-firmware is trying to install files into a
shared area when those files already exist. Those files are:

when building linux-firmware after kernel was built and vice-versa.


On Sat, Apr 6, 2013 at 12:26 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

>
> Op 5 apr. 2013, om 19:06 heeft Ross Burton <ross.burton@intel.com> het
> volgende geschreven:
>
> > Whilst splitting out specific large firmware blobs is a good move for
> space
> > saving, it makes installing "all the firmware" tricky.
> >
> > Make linux-firmware depend on all of the separated packages so that
> installing
> > that pulls in all of the sub-packages.
>
> Speaking of firmwares, is anybody working on fixing the clashes between
> kernel-firmware-foo and linux-firmware-foo? It should only be a matter of
> adding RREPLACES to the linux-firmware subpackages.
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--f46d041826da49af1b04d9aec7a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style>And also staging firmware files just once to re=
solve</div><div style><br></div>&gt; WARNING: The recipe linux-firmware is =
trying to install files into a shared area when those files already exist. =
Those files are:<br>
<div><br></div><div style>when building linux-firmware after kernel was bui=
lt and vice-versa.</div></div><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">On Sat, Apr 6, 2013 at 12:26 PM, Koen Kooi <span dir=3D"lt=
r">&lt;<a href=3D"mailto:koen@dominion.thruhere.net" target=3D"_blank">koen=
@dominion.thruhere.net</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
Op 5 apr. 2013, om 19:06 heeft Ross Burton &lt;<a href=3D"mailto:ross.burto=
n@intel.com">ross.burton@intel.com</a>&gt; het volgende geschreven:<br>
<div class=3D"im"><br>
&gt; Whilst splitting out specific large firmware blobs is a good move for =
space<br>
&gt; saving, it makes installing &quot;all the firmware&quot; tricky.<br>
&gt;<br>
&gt; Make linux-firmware depend on all of the separated packages so that in=
stalling<br>
&gt; that pulls in all of the sub-packages.<br>
<br>
</div>Speaking of firmwares, is anybody working on fixing the clashes betwe=
en kernel-firmware-foo and linux-firmware-foo? It should only be a matter o=
f adding RREPLACES to the linux-firmware subpackages.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Koen<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">_____________________=
__________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--f46d041826da49af1b04d9aec7a2--
