Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15201.1793632792331593446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 07:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=q/SiYjH/;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4ceb15dfd7so14132666b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 07:19:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632790; cv=none;
        d=google.com; s=arc-20260327;
        b=Huy2wbSdXFzWMuPXEuyfXYlcK3OaKOdWGlUO8C63ZExSohPwkP7E4ea+LZKhX1pa2A
         DI43FHLMSR54WqxgO+vwNxoenaTQ/kZ5x+ZBKCUV7nK6o0lJNjVnJzslbjgVLeMLs47h
         MEnXlhcrhK8u/W+5WfX6rIE+gyZ3HMMNo+0oyTcOvVemBGlWQXLSVyAC3TU2i378g5RT
         8IGKHCwkm36WuUHC98xf8oyIIWCy6klngEFWnZL0rsgPzUrLN4UNgL0p62uNhMZaXkzz
         3hhZPYYEN0lUM/JtHAE1GhEme3LzhLwhTBFEmN3uOo1/r6vxSnM1LHasKwZU7GATNXNJ
         yBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5jIqCo1EcTG3JA//0bS7RjbueWRJtA89KTxTx7wCIjs=;
        fh=Oyp0vZkthY33qxuTu49euvFnXWw2uEogdk3yUFh22TY=;
        b=avwLXjvQWRVXJFfrySHUPfnAFzZ6zlj+Bt3/yHq4MA5RK6dPfZiN6PgfVKEiHWjdvg
         IzKBhuWkjIwxIU04/hP9jNmQiR9uE1TFTqt162jipCph3JZf4wEI6m3SEQK7B+Mw/i/G
         sFb2JeBrOuepVeDh1LoCYVNUs93C4ZoS5JxMDaZ+/NKKCXXfliox95Iy+uliaWBgWOIm
         zPNoGSuguYEXxspjzqDxagRm6fJd+R1/nFuPOZjefxbBbw1qOLLw+HAnvcE2sQY6DU7s
         BnRJ/4tXB5afJh6jhSgWeoiLic5jPnPRC8qT1NEweHZqsA+6CnMiIgBh0igiYINV+pG3
         Sy7g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632790; x=1794237590; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jIqCo1EcTG3JA//0bS7RjbueWRJtA89KTxTx7wCIjs=;
        b=q/SiYjH/BI3C4pkR/aabvF7r/idXMtoLe0YGyuPG0nTpGmzERoTxXWwIYXWp4XCU2Y
         A/+soFP6p+eQRt5HVWtYD9UPSqWFzFUvWPonQAe1+lhBq2YQzpUgy2ScO4A2XYsKwQOH
         0qTSqALzE9ZYYIOiLr3wvtd7wwPADxvoYZc7sAgpefkVhOoe6K4XXPreZhfVFZ47fOx+
         kvgRZqtpVheTMwZn9QTnASLEIuB9eqJINvAdeluwIUPw8ODxE58AmsAxQEF3ELQs8nr4
         VMijG99TQaRIDfFd5/OL3PiivYn+tPJPuHae9Hh9Ov4txCrNSrHec5n6XFBTIsvH8p7k
         71FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632790; x=1794237590;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5jIqCo1EcTG3JA//0bS7RjbueWRJtA89KTxTx7wCIjs=;
        b=IoZU/qWgQlXn5SZ7yP8Xw7zBL8Xu7GP/1J3biUac43/Jqj5NNazEy4ZWWGSEUJvxrM
         YObj9cmemfrxeBpEJVofvWMAw3pOdnwDKb0J02KOuhZZTLGdtwlfpKOzXEkLTNbPzpd1
         /gQCxBGwhXjTRGN6W25pfm49jxlu111C69iMc5Z5Yv0wahs0W81resGdXXsmA/GyOng1
         3ZtDIaL17H/m8ecaioD/SwiGf/7wAXhdFnm0Pr9D7Z5BFXajbVd8qgvgS2xZC9ky1hJn
         JDj+imzfeX9s2ThlwM3Jtq292io4wFnrJLiPoJfIcBHf2buLU/BZT8n46L6XjHS4zzOI
         DgKA==
X-Gm-Message-State: APuU4Z+qDBrO83f/gzJeqWYSm3dkZsKEfukb/TP+e0i03NHRtYkjBW1e
	yrJcLgGGUek5iNs+AUujqlOFYVRawznfIRWh8mxRRpvVCQCuJS0SF5nrqPrbAkreSTLQiBC0+0p
	hES28w9J0ct5WN/5nlr1+YIOyT+4f6uA=
X-Gm-Gg: AYBFou1iFMzNSFMVGDWFApGvvHN4v3x+6TVZdtQttHfUHGEU+yoqSG9WlTVhp55hqBv
	sEMdk0fpnhqFa7bFAqjeeWHUBy9oUikkXkVJ6DYNa0iPj+SyGFtjdzJwCs0x73cmT17+caLM2zn
	2V/KaPpeWqP4eFXWlkoMua35zP64kGYGJI8zYThvOaz5ygWBQkJZS1U7P99U8htFqThuAy6H0x6
	emmIc7VrhBg+kWSRt/7q4osRjVoArEg99GnznQVJiqrtvYKdMgIbdzOeVhPMBmg3TGcK/s8kwQA
	qBwy8MSHtwRySDRyuRtpMSlEe37ws8YBP8INkwEKESI5c82hbc+T3iQ5UTTqd4cVLZZsL+8bMJP
	XZS3djejiTyWXezZUq+0mSvfSr6K56Ge4T9DWRMHtNDHv3g5KxRMjlfc+JrtOE9KRSceH8OR1/J
	6tWi1m6Q2LCz8BbyVEkFH8U6sEp8LfgtcgVK4CzM0p1vE9y5oGihzRVQaXMgH1mGQ5gnKjISu9G
	AJpJw8Uv7puw0EOQPe6o23INtxufRSQF57w44rY4f1QvtbT2PiXuLFG9XEi5mwT13Qr/r5Ut2hG
	SlSjc92Au7hWzMlLEc917rMcEd/kN1X6yObeUFMOs6RG9iGnkBMhmOfvq4q8dR6FI9IcMojSBFc
	0EgLcIEoe1vDHPNntFD4cCg==
X-Received: by 2002:a17:907:6ea0:b0:c41:7e99:c6c2 with SMTP id
 a640c23a62f3a-c4ca7ac009cmr878485566b.44.1793632790315; Mon, 02 Nov 2026
 07:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20261101154955.1417945-1-khem.raj@oss.qualcomm.com> <DMKL7XPJHDJJ.38S3LSGZG46RW@bootlin.com>
In-Reply-To: <DMKL7XPJHDJJ.38S3LSGZG46RW@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Nov 2026 07:19:21 -0800
X-Gm-Features: AclHuK_cXuAK3Z5c9-8PJGC8DOR05NlzmA-ZT5h2aMEIUIqWg6NkF4EZRvhn0dY
Message-ID: <CAMKF1srL_1ChipxmQGF+f5pqB-3Evo9nRdLx5QOtDNTjr_4fhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] dbus: Let the ptest package install
 alongside dbus-broker
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000530959065f4cad36"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 15:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249215

--000000000000530959065f4cad36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 12:38=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Sun Nov 1, 2026 at 4:49 PM CET, Khem Raj via openembedded-core wrote:
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
> Sorry, we still have a similar error:
>
> ERROR: Nothing RPROVIDES 'dbus-daemon' (but
> /srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core/=
meta/recipes-core/dbus/
> dbus_1.16.2.bb RDEPENDS on or otherwise requires it)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4957
>
>
I realized that I missed sending prior patch on which this one is based on,
thinking that I already did so previously. I have sent a v3 with both
patches in a set now.


> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000530959065f4cad36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 2, =
2026 at 12:38=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathie=
u.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun Nov 1,=
 2026 at 4:49 PM CET, Khem Raj via openembedded-core wrote:<br>
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
Sorry, we still have a similar error:<br>
<br>
ERROR: Nothing RPROVIDES &#39;dbus-daemon&#39; (but /srv/pokybuild/yocto-wo=
rker/genericx86-64/build/layers/openembedded-core/meta/recipes-core/dbus/<a=
 href=3D"http://dbus_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">dbus_1=
.16.2.bb</a> RDEPENDS on or otherwise requires it)<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/build=
s/4957" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/4/builds/4957</a><br>
<br></blockquote><div><br></div><div>I realized that I missed sending prior=
 patch on which this one is based on, thinking that I already did so previo=
usly. I have sent a v3 with both patches in a set now.</div><div><span styl=
e=3D"background-color:transparent">=C2=A0</span></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
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

--000000000000530959065f4cad36--
