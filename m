Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 46692736B6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 11:21:58 +0000 (UTC)
Received: by obkg7 with SMTP id g7so114899971obk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 04:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fv7Ny1q3Mv4+h1xVqaMDgVl7FJ3Z1kRYYoS4v1eKpIM=;
	b=VoV8lcF70z8/Et7TMfHhuo+siLbgnaWQwCKPzkdvbeewViFMegnIDRwbiblWT+mRyc
	1zH7G/NSLHeqlN4hvsqDaxBZDtWRKCVnZAbTtEOticlmEFzTkzFz472GDYnUNEiBMwcF
	E0rcE687kJ1bJs25HJE2DdQv9iVblPwYjoCXyv2wKwMR/0RKiQWcOWgp8BnH8a0mdyc/
	sXoOwsDvBXXSoGBtB6Au/Jyi7IdkwGZo6filCpBwJ1ZlINrB/qvIazh7fsXN4tIv6uvl
	O/ZDja1M6K0LRY/9GXoOpPeFssiZvZoryTJxjBVKv9wORI0fYSTdsAIbBmnLyAYyV4Ld
	0Itw==
X-Gm-Message-State: ALoCoQlNqxdSY0QmpirYUX2kSFwy1WImMyuJ/HTAPE0ydBwFXdPXQ+hB0upH6GXrNp5HUJ/QFNaZ
X-Received: by 10.182.129.167 with SMTP id nx7mr12509130obb.36.1441106518840; 
	Tue, 01 Sep 2015 04:21:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Tue, 1 Sep 2015 04:21:29 -0700 (PDT)
In-Reply-To: <CAMKF1sphYcMNjCOqgT5+yc0uWnpmjrAVBcxhbnczAZT1prY1qw@mail.gmail.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<cover.1440680489.git.jussi.kukkonen@intel.com>
	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
	<7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
	<CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>
	<CAHiDW_FTdPR1gP12VLfVtijg5NVpYPCm_3vmDga-O_8KoHkDag@mail.gmail.com>
	<CA+chaQe6ayG9k1Hh9sqN+EaBr8GskHMWVQ_L9LqycVhSJN3YqA@mail.gmail.com>
	<1440843517.32588.7.camel@linuxfoundation.org>
	<CAP9ODKrn8285URXOwLeR2Z_M=sAj0Y0MR_ZsL_D4mbA=UHi_zQ@mail.gmail.com>
	<1441029218.26554.21.camel@linuxfoundation.org>
	<CAMKF1sphYcMNjCOqgT5+yc0uWnpmjrAVBcxhbnczAZT1prY1qw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 1 Sep 2015 14:21:29 +0300
Message-ID: <CAHiDW_Hf=bYWFaReJRnk3WyqB+uPNtKAS=C3EqQfbGgfpBoR3w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Tue, 01 Sep 2015 11:21:59 -0000
Content-Type: multipart/alternative; boundary=089e013c5b3023b687051eadc2cf

--089e013c5b3023b687051eadc2cf
Content-Type: text/plain; charset=UTF-8

On 31 August 2015 at 17:38, Khem Raj <raj.khem@gmail.com> wrote:
> There is alternative suggestion. I think all this is happening for
> nettle which we have GPLv2 version in core. There doesnt seem to be a
> full use of libgmp elsewhere.
> nettle can be built using mini-gmp, as well I think that route should
> be explored. That also keeps the us honest with our motive of moving
> all gplv2 legacy packages to layer of its own in future.

Is it actually possible to build a working LGPL2 version of nettle with
mini-gmp? I did look at that option (and the "--with-mini-nettle" option
for gnutls) but couldn't figure it out.

With our current nettle (2.7.1) the problems are
A) it doesn't actually have a "--enable-mini-gmp" option: only one test
binary seems use mini-gmp
B) the gmp files that are included are actually LGPL3 (so even if we could
use them, it would not help the end goal much)

- Jussi

--089e013c5b3023b687051eadc2cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 31 August 2015 at 17:38, Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<div>&gt; There is al=
ternative suggestion. I think all this is happening for<br>&gt; nettle whic=
h we have GPLv2 version in core. There doesnt seem to be a<br>&gt; full use=
 of libgmp elsewhere.<br>&gt; nettle can be built using mini-gmp, as well I=
 think that route should<br>&gt; be explored. That also keeps the us honest=
 with our motive of moving<br>&gt; all gplv2 legacy packages to layer of it=
s own in future.<br><br>Is it actually possible to build a working LGPL2 ve=
rsion of nettle with mini-gmp? I did look at that option (and the &quot;--w=
ith-mini-nettle&quot; option for gnutls) but couldn&#39;t figure it out.<br=
><br>With our current nettle (2.7.1) the problems are<br>A) it doesn&#39;t =
actually have a &quot;--enable-mini-gmp&quot; option: only one test binary =
seems use mini-gmp<br>B) the gmp files that are included are actually LGPL3=
 (so even if we could use them, it would not help the end goal much) =C2=A0=
<br><br>- Jussi<br></div></div>

--089e013c5b3023b687051eadc2cf--
