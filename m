Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id DEE8B71AA2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 14:58:44 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id w63so232082533oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 06:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ejcMbcPUTWP+y3DiXhO2/jxeLiZybblAzikz0C6Fmiw=;
	b=QlxHVw9RZMfb+a8cSAbCAWlvRSzQTL2oLQR/DaHoIeqc7p2+uohnIZVvHted0mH3eV
	EOfWy2hB9cCnmBJmB9OO7feyTeVXMaSoLMsF64KR+6WZtDcdyEznj94RZRGAuUPyc0b7
	RSSk3ZRE8dpz4KfpGdj/Laa4NIaxDC/qTPTPxqyJG5m+PtqRje0lRBKZm7YE/Cr0cF5E
	KyTJEdSxoz3tAmGN7YUEGvMfPlmcF9l8PUIYtHcuXYbcUELEk10pistpqd/mY4Y912c1
	5QUOXECZ+fRBvzGvESY1pBOQRHIgxQvJJYImhk8XLo3G12lXjEsBBsnGvNWkfLkihNcP
	V7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ejcMbcPUTWP+y3DiXhO2/jxeLiZybblAzikz0C6Fmiw=;
	b=W+GEm1P44fTjj9vijXXibeJxeZ8qI+5LxM1KoGawMoa6HRwBNXqkK8dADTebuuDhEM
	jIg30XY3ET/3DdwvVsnbVS5RN94txBjNn8h5VxSLDTPN7FOSNW0kgk0vtVuaPozmoiMM
	Efju5cAZYfgPmXhERdY3IKxB0c3Jl8jr7jqqMIm++LRTp0Pcyr83bX7+v+Ywz3QLFhuW
	tO15JCosYaHwqySYXpnD5867nfxuWQwldCtuNuEg81rQJ24FiwtN/Gpulirde0Qvi2Om
	rWhA/tUejYF9R2kAp9uLbDhagHZmXs90x63urkNhgVcYUs9n4twSJ3PuA1pzgrnvVYuZ
	JG/w==
X-Gm-Message-State: AKaTC02H0WekDY3BkfAaRbUnA+GSTw4SqSjnOjk1XM5v7NtuVFj71ChEwH7b9s6ecoGo9joMlia/V3vikSyaEw==
X-Received: by 10.157.21.112 with SMTP id z45mr21738496otz.70.1480517925827;
	Wed, 30 Nov 2016 06:58:45 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.14.20 with HTTP; Wed, 30 Nov 2016 06:58:25 -0800 (PST)
In-Reply-To: <79e963e5-84c3-808b-754b-ed284775b60c@ginzinger.com>
References: <79e963e5-84c3-808b-754b-ed284775b60c@ginzinger.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 30 Nov 2016 07:58:25 -0700
X-Google-Sender-Auth: s9bztIi6atMV_7LkWC4xIHhp-YI
Message-ID: <CABcZANnP2iCY62gsVNsmzEgBqJy6f3tXTKKyKb-=d-0ojgrp0w@mail.gmail.com>
To: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: tslib 1.3
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
X-List-Received-Date: Wed, 30 Nov 2016 14:58:45 -0000
Content-Type: multipart/alternative; boundary=94eb2c19018c0d798e054285f146

--94eb2c19018c0d798e054285f146
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 30, 2016 at 2:39 AM, Martin Kepplinger <
martin.kepplinger@ginzinger.com> wrote:

> I found some discussions on tslib in your archives and want to give you
> a little update. I'm not even sure core is the correct list for this.
>
> I'm working on tslib for quite some time now. The project page is
> https://github.com/kergoth/tslib and has been for quite some time, and
> I'm maintaining it there.
>
> With version 1.3 there shouldn't be any need for your environment to be
> compatible with tslib's API, as tslib/tools/ts_uinput provides an input
> event device to use:
>
> https://github.com/kergoth/tslib#use-tslib-via-a-normal-input-event-device
>
> and you can run it as a daemon (ts_uinput -d).
>
> As of now tslib-1.3-rc1 is out for testing. It adds a new multitouch
> API, but ts_uinput should work for single- and multitouch devices and
> there shouldn't be a need to wait for Qt or X tslib wrappers to
> implement tslib's API or to even have them at all.
>
> The more feedback we get, the earlier we can consider releasing it as
> version 1.3.
>
> I hope this is useful,
>

This sounds great, thanks again for taking over as project maintainer.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--94eb2c19018c0d798e054285f146
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Nov 30, 2016 at 2:39 AM, Martin Kepplinger <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:martin.kepplinger@ginzinger.com" target=3D"_blank">martin.k=
epplinger@ginzinger.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":12c" class=3D"a3s aXjCH m158b4a0eb01ce9b0">I found some di=
scussions on tslib in your archives and want to give you<br>
a little update. I&#39;m not even sure core is the correct list for this.<b=
r>
<br>
I&#39;m working on tslib for quite some time now. The project page is<br>
<a href=3D"https://github.com/kergoth/tslib" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/kergoth/tsl<wbr>ib</a> and has been for quite som=
e time, and<br>
I&#39;m maintaining it there.<br>
<br>
With version 1.3 there shouldn&#39;t be any need for your environment to be=
<br>
compatible with tslib&#39;s API, as tslib/tools/ts_uinput provides an input=
<br>
event device to use:<br>
<br>
<a href=3D"https://github.com/kergoth/tslib#use-tslib-via-a-normal-input-ev=
ent-device" rel=3D"noreferrer" target=3D"_blank">https://github.com/kergoth=
/tsl<wbr>ib#use-tslib-via-a-normal-inpu<wbr>t-event-device</a><br>
<br>
and you can run it as a daemon (ts_uinput -d).<br>
<br>
As of now tslib-1.3-rc1 is out for testing. It adds a new multitouch<br>
API, but ts_uinput should work for single- and multitouch devices and<br>
there shouldn&#39;t be a need to wait for Qt or X tslib wrappers to<br>
implement tslib&#39;s API or to even have them at all.<br>
<br>
The more feedback we get, the earlier we can consider releasing it as<br>
version 1.3.<br>
<br>
I hope this is useful,</div></blockquote></div><br>This sounds great, thank=
s again for taking over as project maintainer.<br>-- <br><div class=3D"gmai=
l_signature" data-smartmail=3D"gmail_signature">Christopher Larson<br>clars=
on at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Sen=
ior Software Engineer, Mentor Graphics</div>
</div></div>

--94eb2c19018c0d798e054285f146--
