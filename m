Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17195.1793548533661707059
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 07:55:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TKbIs0sZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b2d149693fso4473687b3.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 07:55:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793548533; cv=none;
        d=google.com; s=arc-20260327;
        b=FpdtCA4mN3iuoYuJvhxjSxnK2RRrLDf6uhLOkNw9kEqccmRZASQuQeAQdd3Vrod/9V
         Ep/McP0A0xx97Nijpji8GYe7TLhIe/D7PprTwe9WZZLC6RceKz/Wyyvp+4UpB8+Zm6KX
         4JWR/ZEtIPM7kIgAsgzfRe5w0ddkmbaFXTOuLmkvJaH9M2gUTqG9+SlG1JOOZmtq8PWc
         R5i8J3UcECwRH0sRK5E1M542+TmU+dk7W1lLgn+SQDYrq56+NYoY4xrqq4T/6DkmoEA+
         W4ONxVT6zXWfOPLYax1RNHLW1rtyKTJyGBMNyh2U7aW+X16vnR/kd850JpMkf7wdID+x
         SYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0kWLPnKwRkSUwAEsMW+ITK2axCVOYR/YTmAioi9yjs0=;
        fh=Oyp0vZkthY33qxuTu49euvFnXWw2uEogdk3yUFh22TY=;
        b=Mzswm1DMQ3j6SxaYH4cMpPp9nv/e1+OVtiQzjXYTEbBDzKPbxVFVE7TObHKvznwj+x
         rIkzhHapGmokBX4mrFpVrnccaF3C5Qpo3umB9p13FQCuYERKCSzYypzSbs9iSIwnUGN0
         qYzAE1qt/T/eG7Bp7CFTKvHPulvr4kYVHv0JBcGRBGfa4YxMZ0spIeXwUn0fN3eQHzwq
         01Tmdenht+hYPFo9596WDs6kIW4/44+r2K99cKxZBYbDEobwytRXkikZklxvTk0abYqe
         +P/4JHmpIPC9vhsMDzP817SINDzp4kRuv7DF9D5IbeIc+Qs/8JhUBtvuTLNqCo/gzlwo
         gVYQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793548533; x=1794153333; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kWLPnKwRkSUwAEsMW+ITK2axCVOYR/YTmAioi9yjs0=;
        b=TKbIs0sZfa3THqTA+ccBRx9qaRZBt0UxJmj2ueZ/oxLcB7LK5nsIBHNH2K6swp14WX
         nAI9yVQGzuDqlnuidt/Te8S0hFdgTvSC7+vaex4qukHI6YVRE31jszyLgoKCze1+Ql5a
         eOWloVCRDSRCx2mMX49iSH+M0F+lTcGOJr902e7wrR7xTepO6lcNJ3EHIWHhrfBuZJCR
         Z+QHoIAr0zooiHvUR3N6qRRd0OKGBqsQB8G87RaGPP8iVaHI6oksCrfp3/tt9OnRaIE2
         1AQQGoyv994V6bPBkdfiUw+A/nZTCr8UsgqQCIAVbV5vOkkyUvyRdbCMHSbWyPP+vB7K
         I1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793548533; x=1794153333;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0kWLPnKwRkSUwAEsMW+ITK2axCVOYR/YTmAioi9yjs0=;
        b=vKL9xnxJLZ2DU9QEFmWXLDfxhTrDmk9XyIAsAAZtaou3DixjqKUgKRPTblmbqo9n8/
         0vHCkWeHfI7uqkU0w64Jvh+Z6uy5tRF1TxuNnkpgL7wp/iAPfIJkFzyYd3n6/eglrtUw
         swbFQyclcguPx+xgbQLg4FJItQfpD2vqTFVWwvvnG9urih1TE5kGHPfw0BeoIdTvN1hl
         V1YHWZt4caI0MFMp4iPaOVR3GpFBOT6XJ01k6RDawnowHLtlDvNcx6f97ZbP27+J84ja
         t/OLtDFGzqgDD/PbY+noq7BtA5NwkB3i/aTTGQ/HMJmaRsqD0DKZQ0C1zYHOzRid0Due
         56PQ==
X-Gm-Message-State: APuU4Z9tkEAXQucVBhyGrUnxaMP3Ymr1hhLjLRmro63PbN1pwWSOnhPt
	QjMBmXkJIygbNAYXvM4QyoGkO8Jint+6HblOEuiZa2bWmhHYojIy96XBd190pOH4Stj8Qeu2Aq8
	j92G2njxjUx257zlkzTWGbRj72ygDr107xg==
X-Gm-Gg: AYBFou2+nb1vRUr3Zz4jPci34ZlmBFHsnD/W3NYEZftKQn41MOv/TG95xCrW3Lp0rbV
	+uvmvcIIPSVr8te2aQpWSiQH3nRbj0ioKhe/AtacJX31fDk6xIyUAonRrb7X/A4nHxUQy0iUmWT
	UkTZC5MczYnDn86uCVJAFvbK6N33osMBI+OZKbA2Fn1ysgTQs6D7jwzuqTqJzWN4BV4KYvsLwKw
	1s9NndHba4A/qICoulYnsGAwaRrskmYaycxa++GUq5gjWxvymyiy0IE+3MYXsciuXBQVPi4H4Yc
	LxSKgnVXBbITmXUrCIQxHHm+om3gLkXy+my0yriMF1A6pBnbMdJmzcpA3KWT1SdcXPB19XbnTQr
	m3NOWS9jjlBKcLs4xY7+BQrmJjMSI8K5jCWnkoJnAIoWBfcTxr1dBa4zqoy35HKH3yFy1NpfJPD
	q4lQrXj6cK9BopSCgWLbI9MMx/tYj9+sj8EjTWV7ZubJlWAQKnSOC3H1Qm9WBkp4YRwBzfJ0KB3
	E8vP3+DKOPZUVrd/Y9t5Fabaj0/VGq/2ouUEcbPhYHNQIsD10WZoSuPyZ11d+ciqEGRd/6NjGzm
	O+oNoY+kZGTOC20uIp4nPIizr4v9CqYQ8kb1Xhvigiv6hRBe2ptw3EysvBze8SN3gJQAJ6OPcex
	/vo4K0EzHUbHsRthKyUFMcXY=
X-Received: by 2002:a05:690c:e207:10b0:8b0:d92a:d9ea with SMTP id
 00721157ae682-8b2b673ccdfmr27780337b3.54.1793548532694; Sun, 01 Nov 2026
 07:55:32 -0800 (PST)
MIME-Version: 1.0
References: <20261031205103.458712-1-khem.raj@oss.qualcomm.com> <DMJUDAJQHCD4.3UK0M2DOPO69V@bootlin.com>
In-Reply-To: <DMJUDAJQHCD4.3UK0M2DOPO69V@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Nov 2026 07:55:06 -0800
X-Gm-Features: AclHuK_EtM4EbUCQV-_wf0-Xc1bwTkHreLQSwLMvuk1kaoQVc1RsMMRFkKgvMYg
Message-ID: <CAMKF1sp-SXXk8n9c-CrMeVizVqAL46hhg+Ptn_5eigU+O0ZawA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dbus: Let the ptest package install alongside dbus-broker
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000002dc3c2065f390f0d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249157

--0000000000002dc3c2065f390f0d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 3:35=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Sat Oct 31, 2026 at 9:51 PM CET, Khem Raj via openembedded-core wrote:
> > dbus-ptest RDEPENDS on dbus, both explicitly and through ptest.bbclass,
> > and dbus-broker RCONFLICTS dbus. With VIRTUAL-RUNTIME_dbus =3D
> "dbus-broker"
> > (systemd pulls it in) core-image-ptest-dbus fails in do_rootfs:
> >
> >   package dbus-broker-37-r0.6.cortexa57 conflicts with dbus provided by
> dbus-1-1.16.2-r0.45.cortexa57
> >   package dbus-ptest-1.16.2-r0.45.cortexa57 requires dbus, but none of
> the providers can be installed
> >
> > The installed tests don't use the system bus. They start private buses
> > with dbus-daemon (DBUS_TEST_DAEMON) and use dbus-send, so depend on the
> > dbus-daemon and dbus-tools packages instead and drop the dbus dependenc=
y,
> > like avahi does.
> >
> > With this the images using dbus-broker as the system bus also pass all
> 60 dbus
> > ptests.
> >
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > ---
>
> Hi Khem,
>
> It looks like this does not go very well. Most builds fail with:
>
> ERROR: Nothing RPROVIDES 'dbus-daemon' (but
> /srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/=
meta/recipes-core/dbus/
> dbus_1.16.2.bb RDEPENDS on or otherwise requires it)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4953
>
> Can you have a look at the issue?
>

sent a v2, it should have added dbus-daemon dependency conditionally. See
if this helps.


>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000002dc3c2065f390f0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 1, =
2026 at 3:35=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu=
.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat Oct 31,=
 2026 at 9:51 PM CET, Khem Raj via openembedded-core wrote:<br>
&gt; dbus-ptest RDEPENDS on dbus, both explicitly and through ptest.bbclass=
,<br>
&gt; and dbus-broker RCONFLICTS dbus. With VIRTUAL-RUNTIME_dbus =3D &quot;d=
bus-broker&quot;<br>
&gt; (systemd pulls it in) core-image-ptest-dbus fails in do_rootfs:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0package dbus-broker-37-r0.6.cortexa57 conflicts with dbus =
provided by dbus-1-1.16.2-r0.45.cortexa57<br>
&gt;=C2=A0 =C2=A0package dbus-ptest-1.16.2-r0.45.cortexa57 requires dbus, b=
ut none of the providers can be installed<br>
&gt;<br>
&gt; The installed tests don&#39;t use the system bus. They start private b=
uses<br>
&gt; with dbus-daemon (DBUS_TEST_DAEMON) and use dbus-send, so depend on th=
e<br>
&gt; dbus-daemon and dbus-tools packages instead and drop the dbus dependen=
cy,<br>
&gt; like avahi does.<br>
&gt;<br>
&gt; With this the images using dbus-broker as the system bus also pass all=
 60 dbus<br>
&gt; ptests.<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.co=
m" target=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Khem,<br>
<br>
It looks like this does not go very well. Most builds fail with:<br>
<br>
ERROR: Nothing RPROVIDES &#39;dbus-daemon&#39; (but /srv/pokybuild/yocto-wo=
rker/genericx86-64/build/layers/openembedded-core/meta/recipes-core/dbus/<a=
 href=3D"http://dbus_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">dbus_1=
.16.2.bb</a> RDEPENDS on or otherwise requires it)<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/build=
s/4953" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/4/builds/4953</a><br>
<br>
Can you have a look at the issue?<br></blockquote><div><br></div><div>sent =
a v2, it should have added dbus-daemon dependency conditionally. See if thi=
s helps.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--0000000000002dc3c2065f390f0d--
