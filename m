Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 46CCD606D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 03:53:26 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id ik10so47863911igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 19:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=g2duY0ORiuXhFQmeSXes5oDOiAOo4FZWccgWOSziP80=;
	b=trehbymSdFtMKg38VXU095v91cxKq3BtACDi8vr6wpajm/fznLbVV3Bc+944auqYj1
	qnF6rbkkg8pTHgTwmfdd/zomWDJ3/Uxb4j8f3QZl4dB6pfPMri43M62iHFDdlP1Fg73z
	ILHYBTTph85COEwAhGI25qDUktIBiODYuDEMJYRc5E7ebjA2ZPtsaUTg6ikbLJR95WBF
	wsat9WpJ36Z3uA5pLFpnSU0VyX2tPyRfMa9GkhXZqSXL+5tpW56zON1NXqcLHysydVJE
	eYcNkAGscz4dTDXWluROYKZVLt2q7gVF7aO1FIndM0q1heKO232DjxlmvkAjyGAWocdH
	fweQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=g2duY0ORiuXhFQmeSXes5oDOiAOo4FZWccgWOSziP80=;
	b=SfvgpIbFseaNITEd0s695C1lZYCjlOQY8tPfgcFTtMXxMcD/UHoxDy8rdYhpYGlUPv
	qHuDW6PgLR5yWuybS1IWmhPAbEMt/VjuXn0uycx/iF/nUDI6QIjV/MyuOLGc0jqXgHjk
	Tw2SD8XO6Hbd4suzHMfqIS84qDlw9aALSk4um5WhlEentz5xunohSAqtHNQsyHwqTqG0
	ucmU8ky8sCcj+TIXL7I2SxNciAGHxYbsviJuL1+PvD+q57a8tHsBgFEBf7sRqWh01vp3
	nkJO6ecX171PtJ0/M181YdfdttAixOcO1PYWCmzlNiLB9Q7qYijwd6eQu1uTk4/PJxsg
	uBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type;
	bh=g2duY0ORiuXhFQmeSXes5oDOiAOo4FZWccgWOSziP80=;
	b=aDP1gKH2cbYOJo/33f8uoQ6BDAYo7z+pVOsb3O+p//BQ5CjCItglqdKeIgGNxIYrIF
	toVAi56g4mqWf3uiFq9sF+4Rd4LjRK/1XzWJTfAqUQgL/kxb4dI/5aKQadT+U8pQ/3Kj
	LuBJpW3/yDM6qurZouF0Zdjust432T2pdBtMCbWL7pt5Sf9DyXvXgPOg273QCwZcdaHu
	ETqKmeNXWrMcdt2+j70OGOPFLvXkZysVuKcLQpQod1Eat6NHDE6qo52ZrQqcAPNjVPCQ
	+Y8lKOW7SqUpmNCl2QtF586Zo3CiX/ZESHNhnjCuWSwpyrHZkUL2LFqK35r9tbh41u3G
	mZrQ==
X-Gm-Message-State: AG10YORuuNkoKdUR2iEWR7f1eCpKBj1fvEDF1IkAQlUYtdEf7meZtCocdXPZblFJOdEr5WdzfO6QlK6kI7yZpg==
X-Received: by 10.50.79.165 with SMTP id k5mr9514977igx.10.1453089207658; Sun,
	17 Jan 2016 19:53:27 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.104.194 with HTTP; Sun, 17 Jan 2016 19:53:08 -0800 (PST)
In-Reply-To: <569C57B1.2070309@electromag.com.au>
References: <CALbNGRTiMGfhtvtt+q_SFsKMpMMP-Y7XKQHUc2upqTNXnYrEmA@mail.gmail.com>
	<1448017370.2788.16.camel@Saturn.local.all>
	<CABcZANnHb700FZynO=aTXmzcJ-1k2S_v7hWXDGeL96mc427kJg@mail.gmail.com>
	<569C57B1.2070309@electromag.com.au>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 17 Jan 2016 20:53:08 -0700
X-Google-Sender-Auth: EZv7ITN1oyy5t-P1tPh4e9FORNM
Message-ID: <CABcZANmY_dEJGuheHSD0NOAWZf+08r8NLtFVDi-j9Dww1RHC8Q@mail.gmail.com>
To: Phil Reid <preid@electromag.com.au>
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
X-List-Received-Date: Mon, 18 Jan 2016 03:53:27 -0000
Content-Type: multipart/alternative; boundary=089e013a032e0cb180052993b291

--089e013a032e0cb180052993b291
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 17, 2016 at 8:10 PM, Phil Reid <preid@electromag.com.au> wrote:

> On 18/01/2016 10:55 AM, Christopher Larson wrote:
>
>
>> On Fri, Nov 20, 2015 at 4:02 AM, Max Krummenacher <max.oss.09@gmail.com
>> <mailto:max.oss.09@gmail.com>> wrote:
>>
>>     Am Dienstag, den 17.11.2015, 09:46 +0100 schrieb Andreas M=C3=BCller=
:
>>     > Hi,
>>     >
>>     > this bugs me for a while and I wonder if I am again the only one
>>     > facing this: I get floods of warnings for sourcecode files as
>>     >
>>     > WARNING: QA Issue: qtserialport:
>>     > /qtserialport-dbg/usr/src/debug/qtserialport/5.5.99+5.6.0-alpha1
>>     +gitAUTOINC+2575d33fab-r0/git/src/serialport/qserialport_p.h
>>     > is owned by uid 1000, which is the same as the user running bitbak=
e.
>>     > This may be due to host contamination [host-user-contaminated]
>>     > WARNING: QA Issue: qtx11extras:
>>     > /qtx11extras-dbg/usr/src/debug/qtx11extras/5.5.99+5.6.0-alpha1
>>     +gitAUTOINC+d64ee96f0d-r0/git/src/x11extras/qx11info_x11.cpp
>>     > is owned by uid 1000, which is the same as the user running bitbak=
e.
>>     > This may be due to host contamination [host-user-contaminated]
>>     > WARNING: QA Issue: qtxmlpatterns:
>>     > /qtxmlpatterns-dbg/usr/src/debug/qtxmlpatterns/5.5.99+5.6.0-alpha1
>>     +gitAUTOINC+94136d4280-r0/git/src/xmlpatterns/type/qbuiltintypes.cpp
>>     > is owned by uid 1000, which is the same as the user running bitbak=
e.
>>     > This may be due to host contamination [host-user-contaminated]
>>     >
>>     > I checked PACKAGE_DEBUG_SPLIT_STYLE is not set globally - few
>> recipes
>>     > set PACKAGE_DEBUG_SPLIT_STYLE to debug-without-src.
>>     >
>>     > Help appreciated
>>     >
>>     > Andreas
>>
>>     I see this also in my builds. The warnings clutter the build output
>> in a
>>     way that makes the warnings mostly useless. Who will spot the one
>>     important new warning in the hundreds of host-user-contaminated ones=
?
>>     A fresh build of core-image-minimal today gave me 54 of these
>> warnings.
>>     All but one (glibc-locale) complaining on source files.
>>
>>     I checked a few recipes and most of them were not even using a custo=
m
>>     do_install but autotools generated 'make install' with something lik=
e
>>     'cp -p src/* dest/' or so.
>>
>>
>> Yes, this is the most common case. Usage of cp -a or cp -p means the
>> build ownership is retained, and no chown is run to fix it.
>>
>>     Even if I know how to do it I think we should not patch upstream
>> sources
>>     to suppress a warning introduced by the downstream build system with
>>     loads of false positives and then have to maintain the patches as
>>     upstream is progressing.
>>
>>
>> Either we're calling the upstream buildsystem and not running cp
>> directly, in which case it's a bug in the upstream buildsystem, since ma=
ke
>> install will result
>> in non-deterministic behavior in the ownership of the installed files, o=
r
>> it's a cp -a case, which doesn't require altering upstream with a patch =
at
>> all, only
>> recipe modification.
>>
>>     I haven't looked into how one does it but I'm inclined to switch of
>> the
>>     warning globally, e.g. in local.conf.
>>
>>
>> Blindly disabling them will just result in ignoring a problem. Files in
>> the target filesystem are owned by your build user, who most likely does=
n't
>> even exist
>> on target.
>>
>
> For me the issues are all reported with -dbg packages.
> All are source files in /<packagename>-dbg/usr/src/debug/<packagename>/..=
.
> Last build had 126 packages with the warning.
> Including things like:
> gcc-linaro-4.9: gcc:
> /gcc-dbg/usr/src/debug/gcc/linaro-4.9-r2015.06/gcc-linaro-4.9-2015.06/bui=
ld.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/gcc/tm-preds.h
> is owned by uid 1000, which is the same as the user running bitbake. This
> may be due to host contamination [host-user-contaminated]
> systemd-226+gitAUTOINC+4211d5bd13: systemd:
> /systemd-dbg/usr/src/debug/systemd/1_226+gitAUTOINC+4211d5bd13-r0/git/src=
/udev/scsi_id/scsi_serial.c
> is owned by uid 1000, which is the same as the user running bitbake. This
> may be due to host contamination [host-user-contaminated]
> perl-5.22.0: perl:
> /perl-dbg/usr/src/debug/perl/5.22.0-r0/perl-5.22.0/ext/re/re_exec.c is
> owned by uid 1000, which is the same as the user running bitbake. This ma=
y
> be due to host contamination [host-user-contaminated]


Sounds like a bug in the packaging code, likely straightforward to resolve.
Open a bug in the bug tracking system.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013a032e0cb180052993b291
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Sun, Jan 17, 2016 at 8:10 PM, Phil Reid <span dir=3D"lt=
r">&lt;<a href=3D"mailto:preid@electromag.com.au" target=3D"_blank">preid@e=
lectromag.com.au</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 18/01/2016 10:55 AM,=
 Christopher Larson wrote:<div><div class=3D"h5"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
On Fri, Nov 20, 2015 at 4:02 AM, Max Krummenacher &lt;<a href=3D"mailto:max=
.oss.09@gmail.com" target=3D"_blank">max.oss.09@gmail.com</a> &lt;mailto:<a=
 href=3D"mailto:max.oss.09@gmail.com" target=3D"_blank">max.oss.09@gmail.co=
m</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 Am Dienstag, den 17.11.2015, 09:46 +0100 schrieb Andreas M=C3=
=BCller:<br>
=C2=A0 =C2=A0 &gt; Hi,<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; this bugs me for a while and I wonder if I am again the =
only one<br>
=C2=A0 =C2=A0 &gt; facing this: I get floods of warnings for sourcecode fil=
es as<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; WARNING: QA Issue: qtserialport:<br>
=C2=A0 =C2=A0 &gt; /qtserialport-dbg/usr/src/debug/qtserialport/5.5.99+5.6.=
0-alpha1<br>
=C2=A0 =C2=A0 +gitAUTOINC+2575d33fab-r0/git/src/serialport/qserialport_p.h<=
br>
=C2=A0 =C2=A0 &gt; is owned by uid 1000, which is the same as the user runn=
ing bitbake.<br>
=C2=A0 =C2=A0 &gt; This may be due to host contamination [host-user-contami=
nated]<br>
=C2=A0 =C2=A0 &gt; WARNING: QA Issue: qtx11extras:<br>
=C2=A0 =C2=A0 &gt; /qtx11extras-dbg/usr/src/debug/qtx11extras/5.5.99+5.6.0-=
alpha1<br>
=C2=A0 =C2=A0 +gitAUTOINC+d64ee96f0d-r0/git/src/x11extras/qx11info_x11.cpp<=
br>
=C2=A0 =C2=A0 &gt; is owned by uid 1000, which is the same as the user runn=
ing bitbake.<br>
=C2=A0 =C2=A0 &gt; This may be due to host contamination [host-user-contami=
nated]<br>
=C2=A0 =C2=A0 &gt; WARNING: QA Issue: qtxmlpatterns:<br>
=C2=A0 =C2=A0 &gt; /qtxmlpatterns-dbg/usr/src/debug/qtxmlpatterns/5.5.99+5.=
6.0-alpha1<br>
=C2=A0 =C2=A0 +gitAUTOINC+94136d4280-r0/git/src/xmlpatterns/type/qbuiltinty=
pes.cpp<br>
=C2=A0 =C2=A0 &gt; is owned by uid 1000, which is the same as the user runn=
ing bitbake.<br>
=C2=A0 =C2=A0 &gt; This may be due to host contamination [host-user-contami=
nated]<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; I checked PACKAGE_DEBUG_SPLIT_STYLE is not set globally =
- few recipes<br>
=C2=A0 =C2=A0 &gt; set PACKAGE_DEBUG_SPLIT_STYLE to debug-without-src.<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; Help appreciated<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; Andreas<br>
<br>
=C2=A0 =C2=A0 I see this also in my builds. The warnings clutter the build =
output in a<br>
=C2=A0 =C2=A0 way that makes the warnings mostly useless. Who will spot the=
 one<br>
=C2=A0 =C2=A0 important new warning in the hundreds of host-user-contaminat=
ed ones?<br>
=C2=A0 =C2=A0 A fresh build of core-image-minimal today gave me 54 of these=
 warnings.<br>
=C2=A0 =C2=A0 All but one (glibc-locale) complaining on source files.<br>
<br>
=C2=A0 =C2=A0 I checked a few recipes and most of them were not even using =
a custom<br>
=C2=A0 =C2=A0 do_install but autotools generated &#39;make install&#39; wit=
h something like<br>
=C2=A0 =C2=A0 &#39;cp -p src/* dest/&#39; or so.<br>
<br>
<br>
Yes, this is the most common case. Usage of cp -a or cp -p means the build =
ownership is retained, and no chown is run to fix it.<br>
<br>
=C2=A0 =C2=A0 Even if I know how to do it I think we should not patch upstr=
eam sources<br>
=C2=A0 =C2=A0 to suppress a warning introduced by the downstream build syst=
em with<br>
=C2=A0 =C2=A0 loads of false positives and then have to maintain the patche=
s as<br>
=C2=A0 =C2=A0 upstream is progressing.<br>
<br>
<br>
Either we&#39;re calling the upstream buildsystem and not running cp direct=
ly, in which case it&#39;s a bug in the upstream buildsystem, since make in=
stall will result<br>
in non-deterministic behavior in the ownership of the installed files, or i=
t&#39;s a cp -a case, which doesn&#39;t require altering upstream with a pa=
tch at all, only<br>
recipe modification.<br>
<br>
=C2=A0 =C2=A0 I haven&#39;t looked into how one does it but I&#39;m incline=
d to switch of the<br>
=C2=A0 =C2=A0 warning globally, e.g. in local.conf.<br>
<br>
<br>
Blindly disabling them will just result in ignoring a problem. Files in the=
 target filesystem are owned by your build user, who most likely doesn&#39;=
t even exist<br>
on target.<br>
</blockquote>
<br></div></div>
For me the issues are all reported with -dbg packages.<br>
All are source files in /&lt;packagename&gt;-dbg/usr/src/debug/&lt;packagen=
ame&gt;/...<br>
Last build had 126 packages with the warning.<br>
Including things like:<br>
gcc-linaro-4.9: gcc: /gcc-dbg/usr/src/debug/gcc/linaro-4.9-r2015.06/gcc-lin=
aro-4.9-2015.06/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi=
/gcc/tm-preds.h is owned by uid 1000, which is the same as the user running=
 bitbake. This may be due to host contamination [host-user-contaminated]<br=
>
systemd-226+gitAUTOINC+4211d5bd13: systemd: /systemd-dbg/usr/src/debug/syst=
emd/1_226+gitAUTOINC+4211d5bd13-r0/git/src/udev/scsi_id/scsi_serial.c is ow=
ned by uid 1000, which is the same as the user running bitbake. This may be=
 due to host contamination [host-user-contaminated]<br>
perl-5.22.0: perl: /perl-dbg/usr/src/debug/perl/5.22.0-r0/perl-5.22.0/ext/r=
e/re_exec.c is owned by uid 1000, which is the same as the user running bit=
bake. This may be due to host contamination [host-user-contaminated]<span c=
lass=3D"HOEnZb"></span></blockquote><div><br></div><div>Sounds like a bug i=
n the packaging code, likely straightforward to resolve. Open a bug in the =
bug tracking system. <br></div></div>-- <br><div class=3D"gmail_signature">=
Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, Open=
Embedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Men=
tor Graphics</div>
</div></div>

--089e013a032e0cb180052993b291--
