Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B2B7D6078E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 09:46:32 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b184so18750604wma.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 02:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nJBkw/mfhVgYByv+GAe1sokjhfkQDM2Ii2slZHpF2zU=;
	b=miplKzKlfauQPy27Z7IDmpSKc45uG0OpQd7zryTvYxJ1EXZ2ZO9yq7KarrasK5NMZJ
	ZyIxwA+aVJSw1yQ6YQnEoCuBKsDjNXtpl8HIGNc1FjKFmRdsAz4ek2JIMXWdn+IK5sSX
	FpP6WBvAqxEE5oSpsFXPTyn4olMCTK/gaKkA61OILJJ58xL/erhAZlCkFyA7xuCTcb+W
	eu9UfIS5bWLH6NgtpQDrlnGlxoI49KWtP/zPQEK6v+PzHflO5tAc6bc7kLxGr8qWUwO7
	b/xQK5F6SA3KGrY/lEOKeiC+rfqHCQ8B/Nvq2LQPH6+tQmktRDjZt91VzTU5Wy59KUiB
	thSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nJBkw/mfhVgYByv+GAe1sokjhfkQDM2Ii2slZHpF2zU=;
	b=DoOyAUTdh+ne/Be3FhbWEbgmSb2f0UN+E6bQ7H/YCVpPToXRZZOFJeO52NQ/mMwv7L
	Y8vo9+Vz1ZhEQJnDVkye2KoR6bpD3HXhtclTLvrycyprf9CgSIkddDdvvWlY8EodMl2Z
	c+6bhO3UL05d/7sf77Jnksx4uZNZ3+JV/VYubLMY5A59tXobHHtMbMLT0AkrkZYn9dyT
	8/8vQGRKf2gRU0ORt0AHMLhW/WTTrqoLEMYDoZ0T/k4JkGx3ig+FVgCPjEAoqR2cwXxz
	wz0EM4OfS0XtmTWzQSNffcmSniajdeANsuy0tJaWwS16ZgVmNbsCweRPGRjgZQ2jQrUi
	s/GQ==
X-Gm-Message-State: AA6/9RmD20FAh4CRWJsnySk1f5Rx7iHRaOwCER2UkKILDxr4dTFP2leyQQKUBs60B67GJdEQY59K+Q8V2u2jEQ==
X-Received: by 10.194.235.69 with SMTP id uk5mr2095913wjc.162.1475574393199;
	Tue, 04 Oct 2016 02:46:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.159.203 with HTTP; Tue, 4 Oct 2016 02:46:32 -0700 (PDT)
In-Reply-To: <CAJTo0LbiDauWC1Te7+Oj2kupL+pJDx1XFUFQL2t76Gx+Hh3naA@mail.gmail.com>
References: <20161003171453.9151-1-Martin.Jansa@gmail.com>
	<CAJTo0LbiDauWC1Te7+Oj2kupL+pJDx1XFUFQL2t76Gx+Hh3naA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Oct 2016 11:46:32 +0200
Message-ID: <CA+chaQc3eYQwQd0rozMhFFRt_PDztdxFWdhkurxMZDs23rEE8A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemtap: add dependency on boost
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
X-List-Received-Date: Tue, 04 Oct 2016 09:46:34 -0000
Content-Type: multipart/alternative; boundary=089e014940048be050053e06efae

--089e014940048be050053e06efae
Content-Type: text/plain; charset=UTF-8

PACKAGECONFIG would be nice

I don't use systemtap, I've just noticed it failing in one of my world
builds after recent boost which probably remove native boost from sysroot
between systemtap's do_configure and do_compile and caused this failure.

On Tue, Oct 4, 2016 at 11:21 AM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 3 October 2016 at 18:14, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> +DEPENDS = "elfutils sqlite3 systemtap-native ncurses json-c boost"
>> +DEPENDS_class-native = "elfutils-native sqlite3-native gettext-native
>> boost-native"
>> +DEPENDS_class-nativesdk = "nativesdk-elfutils nativesdk-sqlite3
>> nativesdk-gettext nativesdk-boost"
>>
>
> So why does systemtap appear to have floating dependencies for ncurses and
> json-c?  Should we be expressing this as a single DEPENDS line with
> something like different PACKAGECONFIG for target/native?
>
> Ross
>

--089e014940048be050053e06efae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">PACKAGECONFIG would be nice<div><br></div><div>I don&#39;t=
 use systemtap, I&#39;ve just noticed it failing in one of my world builds =
after recent boost which probably remove native boost from sysroot between =
systemtap&#39;s do_configure and do_compile and caused this failure.</div><=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Oct =
4, 2016 at 11:21 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
oss.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_extra"><span class=3D""><br><div class=3D"gmail_quote">On 3 October 20=
16 at 18:14, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.ja=
nsa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D"m_-3323152482522887008:2bh"=
 class=3D"m_-3323152482522887008a3s m_-3323152482522887008aXjCH m_-33231524=
82522887008m1578b8daffc1c92c">+DEPENDS =3D &quot;elfutils sqlite3 systemtap=
-native ncurses json-c boost&quot;<br>
+DEPENDS_class-native =3D &quot;elfutils-native sqlite3-native gettext-nati=
ve boost-native&quot;<br>
+DEPENDS_class-nativesdk =3D &quot;nativesdk-elfutils nativesdk-sqlite3 nat=
ivesdk-gettext nativesdk-boost&quot;<br></div></blockquote></div><br></span=
>So why does systemtap appear to have floating dependencies for ncurses and=
 json-c?=C2=A0 Should we be expressing this as a single DEPENDS line with s=
omething like different PACKAGECONFIG for target/native?</div><span class=
=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><br></div>

--089e014940048be050053e06efae--
