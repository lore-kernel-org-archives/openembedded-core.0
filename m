Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id AA74F60B65
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 08:12:15 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id o28so7202723qkj.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2020 00:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MMLhhF88nh4n3mmp408TSLqqasFtKEitKtviwrduYzs=;
	b=jdpyo4H06R79XyM3WXeEvvZxaXqkqDvtiGxwGt+drPTrY7Ch2QdURje0bJmowAowMn
	mRK/AAyKgZNSGsyh71/pR+5xy/7oTFA8gYFKgQiu4brAOMHTlF2z/tD/j7W9MGi5jF8E
	TRLF8DVaL5dZKp+bssjzCjjgGR4d4zMf4ZMZ1sPVJzNDmirSz5Kpdw9YBGDsEh9VNed/
	6jFfrmGOeXguqTYZVG9RmtoEuXJa8gxx7NC1ylu+ppqerUrTGnyKqdJGgJNM02QUwk2p
	pjqWpwU6coMuFYjTU2f0Yb0FNIk7J3AqNE3q9DQlBhDGB2XE40FQMWg5lFizRMAfk/o4
	65HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MMLhhF88nh4n3mmp408TSLqqasFtKEitKtviwrduYzs=;
	b=NnNPnWmDOLSGPAhmgheGzhdSYKSVm7NX1ee1sBkXakMcB/Y2xcxLzeFUugl4P5QYdV
	diZWzn80taOQifBJTet2EEe4hQd7wExJJR62FT1w92vtHVjbAvD5q9Nehy2IV4sADYdm
	Xo8tb8Jq+/hryXoUYQjdYkEyz0jtAn48wJYigq/mjAlrUMDx4R3FyvAZGTpsUJgdMhVy
	EiLOFZ6a2NyGYWmYObxFMLIzFl43cPxSjA2SlQD9QvIjwPDSDdY/nelo7Vs1fr1ON2oJ
	7owj0D8m/zo5biMFpg4iI+QYB5rNHPo4XJoi+49ZbSdRe39d8j7rw8Kur9B16jGARHpl
	h6Sw==
X-Gm-Message-State: APjAAAXlLf804RA0Scvl6LMYeLhyqHPON050syDryBiQcshhWtEDu+2N
	mA4ojZpHnT2qDkePhAckVviRIHkZyK7nLSQi6Vw=
X-Google-Smtp-Source: APXvYqwHQqACODsswZk89Oc5gEFEW1DzBBpaTglmTYCQJ0Ll+xlBEX/ckBZJx5nh3o3V5g68aTpCQ45uWkxj0VYQub0=
X-Received: by 2002:a37:e47:: with SMTP id 68mr11148841qko.17.1583050336216;
	Sun, 01 Mar 2020 00:12:16 -0800 (PST)
MIME-Version: 1.0
References: <20200301014301.805156-1-raj.khem@gmail.com>
	<20200301014301.805156-2-raj.khem@gmail.com>
	<6ebd8c098cac7dab116f9043e7b64fe9b3376601.camel@linuxfoundation.org>
In-Reply-To: <6ebd8c098cac7dab116f9043e7b64fe9b3376601.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Mar 2020 00:12:05 -0800
Message-ID: <CAMKF1spJ_aBK=JdZvr0yFLEHBgYeQcZhUFHBaHDcHt=J05O8=g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] dbus-test: Fix QA host-contamination errors
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
X-List-Received-Date: Sun, 01 Mar 2020 08:12:15 -0000
Content-Type: multipart/alternative; boundary="000000000000f3a99c059fc6a0e5"

--000000000000f3a99c059fc6a0e5
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 29, 2020 at 11:57 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2020-02-29 at 17:42 -0800, Khem Raj wrote:
> > Errors like below are fixed
> >
> > bus/connection.h is owned by uid 1000, which is the same as t
> > he user running bitbake. This may be due to host contamination
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/dbus/dbus-test_1.12.16.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Why aren't we seeing this everywhere? The autobuilders don't show it
> and no other reports. What is unique to your setup to reproduce this?


These are QA warnings by default and in my distro I turned it into error so
they were being reported before too

Secondly this is a Debian10 minimum container running in docker where the
user id is 1000 for the build user other than that there is nothing special

>
>
> Cheers,
>
> Richard
>
> > diff --git a/meta/recipes-core/dbus/dbus-test_1.12.16.bb
> > b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
> > index bea0e74ed0..91e2ba69d2 100644
> > --- a/meta/recipes-core/dbus/dbus-test_1.12.16.bb
> > +++ b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
> > @@ -70,11 +70,11 @@ do_install_ptest() {
> >
> >       install ${B}/test/test-segfault ${D}${PTEST_PATH}/test
> >
> > -     cp -r ${B}/test/data ${D}${PTEST_PATH}/test
> > +     cp -R --no-dereference --preserve=mode,links ${B}/test/data
> > ${D}${PTEST_PATH}/test
> >       install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
> >
> >       install -d ${D}${PTEST_PATH}/test/.libs
> > -     cp -a ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
> > +     cp -R --no-dereference --preserve=mode,links
> > ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
> >
> >       # Remove build host references...
> >       find "${D}${PTEST_PATH}/test/data" \( -name *.service -o -name
> > *.conf -o -name "*.aaprofile" \) -type f -exec \
> > --
> > 2.25.1
> >
>
>

--000000000000f3a99c059fc6a0e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Feb 29, 2020 at 11:57 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat, 2020-=
02-29 at 17:42 -0800, Khem Raj wrote:<br>
&gt; Errors like below are fixed<br>
&gt; <br>
&gt; bus/connection.h is owned by uid 1000, which is the same as t<br>
&gt; he user running bitbake. This may be due to host contamination<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.12.16.bb" r=
el=3D"noreferrer" target=3D"_blank">dbus-test_1.12.16.bb</a> | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
Why aren&#39;t we seeing this everywhere? The autobuilders don&#39;t show i=
t<br>
and no other reports. What is unique to your setup to reproduce this?</bloc=
kquote><div dir=3D"auto"><br></div><div dir=3D"auto">These are QA warnings =
by default and in my distro I turned it into error so they were being repor=
ted before too=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Sec=
ondly this is a Debian10 minimum container running in docker where the user=
 id is 1000 for the build user other than that there is nothing special=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
&gt; diff --git a/meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.12.1=
6.bb" rel=3D"noreferrer" target=3D"_blank">dbus-test_1.12.16.bb</a><br>
&gt; b/meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.12.16.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus-test_1.12.16.bb</a><br>
&gt; index bea0e74ed0..91e2ba69d2 100644<br>
&gt; --- a/meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.12.16.bb" r=
el=3D"noreferrer" target=3D"_blank">dbus-test_1.12.16.bb</a><br>
&gt; +++ b/meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.12.16.bb" r=
el=3D"noreferrer" target=3D"_blank">dbus-test_1.12.16.bb</a><br>
&gt; @@ -70,11 +70,11 @@ do_install_ptest() {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/test/test-segfault ${D}${PTEST_=
PATH}/test<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0cp -r ${B}/test/data ${D}${PTEST_PATH}/test<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp -R --no-dereference --preserve=3Dmode,links ${=
B}/test/data<br>
&gt; ${D}${PTEST_PATH}/test<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/dbus/.libs/test-dbus ${D}${PTES=
T_PATH}/test<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/test/.libs<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cp -a ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/tes=
t/.libs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp -R --no-dereference --preserve=3Dmode,links<br=
>
&gt; ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove build host references...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0find &quot;${D}${PTEST_PATH}/test/data&quot;=
 \( -name *.service -o -name<br>
&gt; *.conf -o -name &quot;*.aaprofile&quot; \) -type f -exec \<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000f3a99c059fc6a0e5--
