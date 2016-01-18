Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 251696FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 02:55:41 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id h5so40106218igh.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 18:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=vgT/FRzKndGaKnLGs88anlIs4/QFynT9Bv10Km/1yYM=;
	b=AZzgaxT17886jMiOHdKaRNfrAQKnyKAJJpVyW+Z/1l1u1fxDVEfcgvlddHK/T+xZgj
	wwNDQlVoS+FjdN+gXJdbVA/6LdkJnI1bgd/+yiE4lp7vjO29hDl5675gkdgRHahMZdWE
	5VIFLJXK1F0vsNk4jMUPvuxw3uIGqHgVkC6TlGzwt7qXIxrGilb5VkyeoUBVi5BYxKfa
	gDFfsYmMt/hKXtb8OpO538Epi8rHfG/hQSCY1t13mZeQk0b6e9/1EfeegIk/U1hzsYTe
	X8wAD1Io3sbicNh0ho/KF9ZDoBvmhgV8+ozoKkp9+LdPxEzKQ3qyp5i0rGcPXhcA3LpM
	8yDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=vgT/FRzKndGaKnLGs88anlIs4/QFynT9Bv10Km/1yYM=;
	b=MDT4ViNAvoXSuN0DhrcmyzYpDyo2dEocWIglZ2KWVd/pB8KL+ousYskaT9odCltgHc
	OM7mI6y+ZnhHZ8FQNvAt1ALU726BYVf+M5xKnDg1vrRLHidCwJOl0QnesczNnNSsXbOi
	Ee2RaG8bkQ6JZDHsK6g9nGl9647IHsj8dexwpHRqpuGDb+NoG7/rVJYwl0qmw0KUcENL
	ny0mOrZbPwTcw1Zp7e+0Br2rnuBHCoNLUBNN4cffnkrMk6RiOn4pwqUHjWzSnrhpeZif
	rhOH9ctjvyGc8ICaI1qGYanp05ZLczxw10+FR8hG1WgQ0vhfY1s13HO2is4FBUN6K7aE
	2CTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type;
	bh=vgT/FRzKndGaKnLGs88anlIs4/QFynT9Bv10Km/1yYM=;
	b=YI1MIgbA9bc+nE5KYJ6HW3kH9raucuU7b3wFhkpSiz6z+SnoaETNhsaOapB1C8iJX6
	zjsyCnI9Ldd8mbjrYJNLaQEd60GW+CEqU6FOFNoxORahHp46MNFLeo+uignryzvA7vdQ
	NxIvQlqQxUk6K6ywzRyOY5LWAyGSyYZqW8eazslMS6mqAitkT7Qf0TojKGV7s18eTvnA
	Ok87csUSm/G8pRKVaKEub1jRihccGFKncnDHukMUE01QFFUUT+SJfLeFVqsojQW/LC+f
	La0g7aVzB3LceLpWQYVuZsg5MS7f39eahOwJYIlcJV0Vp5PFvYHowBpnvqeBr+mI8Jbw
	suqg==
X-Gm-Message-State: AG10YOS+W5Ti9GorJt9eiooG09HvD8+ATWoqu2tEdjdw/k6NUxHwLzEblK9yObguaYlPDFJwqGaYa9HWj4TTjg==
X-Received: by 10.50.109.167 with SMTP id ht7mr8704097igb.38.1453085742209;
	Sun, 17 Jan 2016 18:55:42 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.104.194 with HTTP; Sun, 17 Jan 2016 18:55:22 -0800 (PST)
In-Reply-To: <1448017370.2788.16.camel@Saturn.local.all>
References: <CALbNGRTiMGfhtvtt+q_SFsKMpMMP-Y7XKQHUc2upqTNXnYrEmA@mail.gmail.com>
	<1448017370.2788.16.camel@Saturn.local.all>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 17 Jan 2016 19:55:22 -0700
X-Google-Sender-Auth: z5dV-rKJ5lercE8J-sDyHHx0cY4
Message-ID: <CABcZANnHb700FZynO=aTXmzcJ-1k2S_v7hWXDGeL96mc427kJg@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Lots of [host-user-contaminated] warning
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
X-List-Received-Date: Mon, 18 Jan 2016 02:55:42 -0000
Content-Type: multipart/alternative; boundary=089e013a213c7e223f052992e35e

--089e013a213c7e223f052992e35e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2015 at 4:02 AM, Max Krummenacher <max.oss.09@gmail.com>
wrote:

> Am Dienstag, den 17.11.2015, 09:46 +0100 schrieb Andreas M=C3=BCller:
> > Hi,
> >
> > this bugs me for a while and I wonder if I am again the only one
> > facing this: I get floods of warnings for sourcecode files as
> >
> > WARNING: QA Issue: qtserialport:
> > /qtserialport-dbg/usr/src/debug/qtserialport/5.5.99+5.6.0-alpha1
> +gitAUTOINC+2575d33fab-r0/git/src/serialport/qserialport_p.h
> > is owned by uid 1000, which is the same as the user running bitbake.
> > This may be due to host contamination [host-user-contaminated]
> > WARNING: QA Issue: qtx11extras:
> > /qtx11extras-dbg/usr/src/debug/qtx11extras/5.5.99+5.6.0-alpha1
> +gitAUTOINC+d64ee96f0d-r0/git/src/x11extras/qx11info_x11.cpp
> > is owned by uid 1000, which is the same as the user running bitbake.
> > This may be due to host contamination [host-user-contaminated]
> > WARNING: QA Issue: qtxmlpatterns:
> > /qtxmlpatterns-dbg/usr/src/debug/qtxmlpatterns/5.5.99+5.6.0-alpha1
> +gitAUTOINC+94136d4280-r0/git/src/xmlpatterns/type/qbuiltintypes.cpp
> > is owned by uid 1000, which is the same as the user running bitbake.
> > This may be due to host contamination [host-user-contaminated]
> >
> > I checked PACKAGE_DEBUG_SPLIT_STYLE is not set globally - few recipes
> > set PACKAGE_DEBUG_SPLIT_STYLE to debug-without-src.
> >
> > Help appreciated
> >
> > Andreas
>
> I see this also in my builds. The warnings clutter the build output in a
> way that makes the warnings mostly useless. Who will spot the one
> important new warning in the hundreds of host-user-contaminated ones?
> A fresh build of core-image-minimal today gave me 54 of these warnings.
> All but one (glibc-locale) complaining on source files.
>
> I checked a few recipes and most of them were not even using a custom
> do_install but autotools generated 'make install' with something like
> 'cp -p src/* dest/' or so.
>

Yes, this is the most common case. Usage of cp -a or cp -p means the build
ownership is retained, and no chown is run to fix it.


> Even if I know how to do it I think we should not patch upstream sources
> to suppress a warning introduced by the downstream build system with
> loads of false positives and then have to maintain the patches as
> upstream is progressing.
>

Either we're calling the upstream buildsystem and not running cp directly,
in which case it's a bug in the upstream buildsystem, since make install
will result in non-deterministic behavior in the ownership of the installed
files, or it's a cp -a case, which doesn't require altering upstream with a
patch at all, only recipe modification.


> I haven't looked into how one does it but I'm inclined to switch of the
> warning globally, e.g. in local.conf.


Blindly disabling them will just result in ignoring a problem. Files in the
target filesystem are owned by your build user, who most likely doesn't
even exist on target.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013a213c7e223f052992e35e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Nov 20, 2015 at 4:02 AM, Max Krummenacher <span dir=3D"ltr">&lt;<a =
href=3D"mailto:max.oss.09@gmail.com" target=3D"_blank">max.oss.09@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">A=
m Dienstag, den 17.11.2015, 09:46 +0100 schrieb Andreas M=C3=BCller:<br>
&gt; Hi,<br>
&gt;<br>
&gt; this bugs me for a while and I wonder if I am again the only one<br>
&gt; facing this: I get floods of warnings for sourcecode files as<br>
&gt;<br>
&gt; WARNING: QA Issue: qtserialport:<br>
&gt; /qtserialport-dbg/usr/src/debug/qtserialport/5.5.99+5.6.0-alpha1<br>
+gitAUTOINC+2575d33fab-r0/git/src/serialport/qserialport_p.h<br>
&gt; is owned by uid 1000, which is the same as the user running bitbake.<b=
r>
&gt; This may be due to host contamination [host-user-contaminated]<br>
&gt; WARNING: QA Issue: qtx11extras:<br>
&gt; /qtx11extras-dbg/usr/src/debug/qtx11extras/5.5.99+5.6.0-alpha1<br>
+gitAUTOINC+d64ee96f0d-r0/git/src/x11extras/qx11info_x11.cpp<br>
&gt; is owned by uid 1000, which is the same as the user running bitbake.<b=
r>
&gt; This may be due to host contamination [host-user-contaminated]<br>
&gt; WARNING: QA Issue: qtxmlpatterns:<br>
&gt; /qtxmlpatterns-dbg/usr/src/debug/qtxmlpatterns/5.5.99+5.6.0-alpha1<br>
+gitAUTOINC+94136d4280-r0/git/src/xmlpatterns/type/qbuiltintypes.cpp<br>
&gt; is owned by uid 1000, which is the same as the user running bitbake.<b=
r>
&gt; This may be due to host contamination [host-user-contaminated]<br>
&gt;<br>
&gt; I checked PACKAGE_DEBUG_SPLIT_STYLE is not set globally - few recipes<=
br>
&gt; set PACKAGE_DEBUG_SPLIT_STYLE to debug-without-src.<br>
&gt;<br>
&gt; Help appreciated<br>
&gt;<br>
&gt; Andreas<br>
<br>
</span>I see this also in my builds. The warnings clutter the build output =
in a<br>
way that makes the warnings mostly useless. Who will spot the one<br>
important new warning in the hundreds of host-user-contaminated ones?<br>
A fresh build of core-image-minimal today gave me 54 of these warnings.<br>
All but one (glibc-locale) complaining on source files.<br>
<br>
I checked a few recipes and most of them were not even using a custom<br>
do_install but autotools generated &#39;make install&#39; with something li=
ke<br>
&#39;cp -p src/* dest/&#39; or so.<br></blockquote><div><br></div><div>Yes,=
 this is the most common case. Usage of cp -a or cp -p means the build owne=
rship is retained, and no chown is run to fix it. <br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
Even if I know how to do it I think we should not patch upstream sources<br=
>
to suppress a warning introduced by the downstream build system with<br>
loads of false positives and then have to maintain the patches as<br>
upstream is progressing.<br></blockquote><div><br></div><div>Either we&#39;=
re calling the upstream buildsystem and not running cp directly, in which c=
ase it&#39;s a bug in the upstream buildsystem, since make install will res=
ult in non-deterministic behavior in the ownership of the installed files, =
or it&#39;s a cp -a case, which doesn&#39;t require altering upstream with =
a patch at all, only recipe modification.<br>=C2=A0<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
I haven&#39;t looked into how one does it but I&#39;m inclined to switch of=
 the<br>
warning globally, e.g. in local.conf.</blockquote></div><br></div><div clas=
s=3D"gmail_extra">Blindly disabling them will just result in ignoring a pro=
blem. Files in the target filesystem are owned by your build user, who most=
 likely doesn&#39;t even exist on target.<br>-- <br><div class=3D"gmail_sig=
nature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBa=
ke, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engin=
eer, Mentor Graphics</div>
</div></div>

--089e013a213c7e223f052992e35e--
