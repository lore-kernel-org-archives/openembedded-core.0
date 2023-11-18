Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF00C2BB3F
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 19:13:15 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.14767.1700334786485201307
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Nov 2023 11:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FxuXnDk9;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-66d13ac2796so4228626d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Nov 2023 11:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700334785; x=1700939585; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kpj8zOTd2WL15JJ61UR50XQRkNGgt8N7YBTuOmpcIl8=;
        b=FxuXnDk9Qq21h4ulo71+ZOLqWPnYnXj2wHKXD7yWkXgKLz8xRiQcLz0ikCDWtJ65Zd
         RRUxncrnYjUKT2OHPnrQ31ZOkod/RVEkCx3SrizthzKV7w0HX+i3LqmDZOlyoA3k+7sW
         CvxQTLsdddQdB5FPZOE3vPzNLpNylNpj5LRXB62KqtGctxqtINwJHjh6MtOXg7Bvdqvj
         HzpZhSxfFlcHhEyJkJARbXz1gm3jG4D7fPDn+E2WpjJtc6MCm0NUm8YcJWE9DpilW2bU
         hx94bm+mHv8tgfjZe0bTmikZKKJRaiPjzJXLPxH5O9NUBaHyGeCLRQK63yRyhUl51Pu1
         wj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700334785; x=1700939585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kpj8zOTd2WL15JJ61UR50XQRkNGgt8N7YBTuOmpcIl8=;
        b=Yry3UHkun1ZbahuSuntdhyGVpvo7d7qa9SJPY3j8B7+sEAAJztq+iGE3qPja8ZWkut
         VS2lTw7J2P4KY3EtHjZdJmd9WkHK+l3M4jjEL0Qvl7BTcWYDoO6dMvYRJGviVZhOAIws
         zUi+RVuXBRiA68GmW7eEkLuQPIf0U8wyfH+bYJlyFfFNqFbKZao7MWWl21olNo6KXL4M
         NocbggHHXpyX+8qT5qhQnZpke5E2KV12yGVAa8Qyfq0EVLnQiXzFTPwQ8usgwMjgtpNA
         Nymj/WXanJKXT+DnEB6VEFZTR4YMvlagP/DxxsewBbloYqaMuyVN1XGYL+XK12vJGEWz
         fPaw==
X-Gm-Message-State: AOJu0YyOM8mRLSMhauamlhrNL5E6mJuXZy1SlFXXcl1ABgjWDg+UuMBq
	4uhbVBeXMQMkVr3wTTMItz09/0BA3gN0OW9cLgYI3ETM
X-Google-Smtp-Source: AGHT+IGK+q6bsxzjnj049S03snDZeJGg3XRCbXjZrWVqUPZ0aF+PExCIFdeLenzMQHV4uPdIIFMtjfZRPKIkrOT6QkA=
X-Received: by 2002:ad4:574a:0:b0:66f:b851:bf4d with SMTP id
 q10-20020ad4574a000000b0066fb851bf4dmr3931027qvx.4.1700334785420; Sat, 18 Nov
 2023 11:13:05 -0800 (PST)
MIME-Version: 1.0
References: <179873E1B6040C02.6542@lists.openembedded.org>
In-Reply-To: <179873E1B6040C02.6542@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sat, 18 Nov 2023 20:12:54 +0100
Message-ID: <CA+cAkeofOq5rDdDdGq2pWEbOadtAYyaHdEp-0i-30A3sgybi2A@mail.gmail.com>
Subject: Re: [OE-core] Migration dunfell to kirkstone , init manager issue
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e26179060a720a76"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Nov 2023 19:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190866

--000000000000e26179060a720a76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I saw in log.do_rootfs that update_alternatives task links /sbin/init to
busybox.
I saw also that the default config (init.cfg) have CONFIG_INIT=3Dy (in
openembedded-core layer), dunfell also had it too but, in the end, it was
not taken into account.

I'll look further about busybox config and update-alternatives class unless
someone here have a clue about what is going on.

Le ven. 17 nov. 2023, 16:51, Frederic Martinsons via lists.openembedded.org
<frederic.martinsons=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> Hello,
>
> I recently started upgrading my system from dunfell to kirkstone and I
> started with a basic (but custom nonetheless) qemu image that I used in
> dunfell (before starting machine/distro specific ops).
>
> After several corrections , many thanks by the way for the various
> convert scripts !, I managed to get my qemu image built on kirkstone.
>
> But when I didn't manage to boot it correctly (I used qemu-system-x86-64
> of my  host)  and every second on prompt I got these messages
>
> process '-/bin/sh' (pid 143) exited. Scheduling for restart.
> process '-/bin/sh' (pid 144) exited. Scheduling for restart.
> process '-/bin/sh' (pid 145) exited. Scheduling for restart.
> can't open /dev/tty2: No such file or directory
> can't open /dev/tty3: No such file or directory
> can't open /dev/tty4: No such file or directory
>
> I looked into it more and found that the init system is set to busybox
> (/sbin/init point to /bin/busybox.nosuid).
> My system needs systemd as init manager  and I verify that I have set
> INIT_MANAGER=3D"systemd" in my configuration (I even perform a bitbake -e=
 to
> check that this is not overridden).
>
> Can someone please tell me where to look (which log file, or some oe tool=
s
> that I can use)  to find why systemd is not used as the init manager ?
>
> Thanks.
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190853):
> https://lists.openembedded.org/g/openembedded-core/message/190853
> Mute This Topic: https://lists.openembedded.org/mt/102649719/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e26179060a720a76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I saw in log.do_rootfs that update_alternatives task link=
s /sbin/init to busybox.=C2=A0<div dir=3D"auto">I saw also that the default=
 config (init.cfg) have CONFIG_INIT=3Dy (in openembedded-core layer), dunfe=
ll also had it too but, in the end, it was not taken into account.=C2=A0</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll look further abou=
t busybox config and update-alternatives class unless someone here have a c=
lue about what is going on.=C2=A0</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Le ven. 17 nov. 2023, 16:51, Frederi=
c Martinsons via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hello,<div><br></d=
iv><div>I recently started upgrading my system from dunfell to kirkstone an=
d I started with a basic (but custom nonetheless) qemu image that I used in=
 dunfell (before starting machine/distro specific ops).</div><div><br></div=
><div>After several corrections , many thanks=C2=A0by the way for the vario=
us convert=C2=A0scripts !, I managed to get my qemu image built on kirkston=
e.</div><div><br></div><div>But when I didn&#39;t manage to boot it correct=
ly (I used qemu-system-x86-64 of my=C2=A0 host)=C2=A0 and every second on p=
rompt I got these messages</div><div><br></div><div>process &#39;-/bin/sh&#=
39; (pid 143) exited. Scheduling for restart.<br>process &#39;-/bin/sh&#39;=
 (pid 144) exited. Scheduling for restart.<br>process &#39;-/bin/sh&#39; (p=
id 145) exited. Scheduling for restart.<br>can&#39;t open /dev/tty2: No suc=
h file or directory<br>can&#39;t open /dev/tty3: No such file or directory<=
br>can&#39;t open /dev/tty4: No such file or directory<br></div><div><br></=
div><div>I looked into it more and found that the init system is set to bus=
ybox (/sbin/init point to /bin/busybox.nosuid).</div><div>My system needs s=
ystemd as init manager=C2=A0 and I verify that I have set INIT_MANAGER=3D&q=
uot;systemd&quot; in my configuration (I even perform a bitbake -e to check=
 that this is not overridden).</div><div><br></div><div>Can someone please =
tell me where to look (which log file, or some oe tools that I can use)=C2=
=A0 to find why systemd is not used as the init manager ?</div><div><br></d=
iv><div>Thanks.</div><div><br></div><div><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190853): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190853" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/190853</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102649719/621=
3388" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/102649719/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martin=
sons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gm=
ail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e26179060a720a76--

