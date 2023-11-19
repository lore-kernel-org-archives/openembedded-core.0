Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E973CC072A2
	for <webhook@archiver.kernel.org>; Sun, 19 Nov 2023 10:27:59 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.25778.1700389672436455635
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Nov 2023 02:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gSZbIQFy;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-677f8d5978cso7884866d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Nov 2023 02:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700389671; x=1700994471; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P0hsrw2wvcUjTDSZNdJhao21xe3btaRqbXCaKpg0kmc=;
        b=gSZbIQFyEfRxfCYdnXx59AvSKmG+8cVDbJkMCatsTgTFApjk0KXz4Sw68TVUXq0iWC
         PBBDjguo2A9MSg82T8ESWnJ0oq3LgDXnaw0WBhpPQnAJkJL8OjFcv1PiCD2GgD/TW0qA
         jHSWNX7R8Y772OBZ6S0AIiquQmSLSg6z6YnTUEcprkbfBS7z9cgU+zF9McNiFhyIvCfO
         Iwa0NrmWF18Q/TVitQuyT3J8jahBf0G7R0Y6Uvd91jLGMJ+g4akbpTBfVmr/PZLcQFCk
         CCzQPFJ9Tuc8m40yIeFLu7DagExCXsLsj8nvt6W+RSC/uEx6Us6RWZ1xveuJRX8AYep3
         ZkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700389671; x=1700994471;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0hsrw2wvcUjTDSZNdJhao21xe3btaRqbXCaKpg0kmc=;
        b=a99kLf7KjgleCw5JfXEEpl/zw252OdF0jXpkM7q7HmI9jH3GZylL7anC8Ez4UQYgnK
         bxD2JQKD2GshVYt4EIwXjjPBSnBKLjhELg/vu74D+D/OZAN1KMr+asmQsV1TNp8oa+Y7
         YF6DeqBuTAeikbNYxvMn4Wk1RQQ7spReKdjXA48J3jv3Dtg9rbxvtfKq0Mi8zBY/LaE/
         X7POA8ysmlr5swWLd73phENIjN3Gx3zJP/bZCGz9DdZTcyxj+lJtAb47b2WmJaHD3A/f
         kW3iTgcPppJ81xMngxmZjeUd5FNkWJRBIYqGCp1X3iXkQZB4uF+4i8lREoUHUD5gGQfx
         /jFw==
X-Gm-Message-State: AOJu0Yx6MJ4F5cWPyGsumF0JQyGWMQ9TI85kMWpbmnIifhGa4VXncO7i
	YC6UOiH4KHgGgs2fHEjBkDDiqwNQfhENrFjz6N1ASkcG
X-Google-Smtp-Source: AGHT+IE94Pqbv32wkuedPuJA5bxWBuT+SG/HjDd27eM/7r8HjlC67vvFDeBZPt7wcYxMZ3SYXM66CYiesIlV9t6u0e4=
X-Received: by 2002:a05:6214:c83:b0:66d:139f:34cd with SMTP id
 r3-20020a0562140c8300b0066d139f34cdmr5693114qvr.13.1700389671331; Sun, 19 Nov
 2023 02:27:51 -0800 (PST)
MIME-Version: 1.0
References: <179873E1B6040C02.6542@lists.openembedded.org> <CA+cAkeofOq5rDdDdGq2pWEbOadtAYyaHdEp-0i-30A3sgybi2A@mail.gmail.com>
In-Reply-To: <CA+cAkeofOq5rDdDdGq2pWEbOadtAYyaHdEp-0i-30A3sgybi2A@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sun, 19 Nov 2023 11:27:40 +0100
Message-ID: <CA+cAkeo3cYR=pFipM_EYWys7F3RKpkZGMUfvyZePi2gbVg3Hrw@mail.gmail.com>
Subject: Re: [OE-core] Migration dunfell to kirkstone , init manager issue
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000056e99a060a7ed277"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Nov 2023 10:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190870

--00000000000056e99a060a7ed277
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 18 nov. 2023, 20:12, Fr=C3=A9d=C3=A9ric Martinsons <
frederic.martinsons@gmail.com> a =C3=A9crit :

> I saw in log.do_rootfs that update_alternatives task links /sbin/init to
> busybox.
> I saw also that the default config (init.cfg) have CONFIG_INIT=3Dy (in
> openembedded-core layer), dunfell also had it too but, in the end, it was
> not taken into account.
>
> I'll look further about busybox config and update-alternatives class
> unless someone here have a clue about what is going on.
>

In the end, I managed to get back systemd as init system by adding an
append to busybox and set explictely "CONFIG_INIT is not set"
I gave up on understanding this change of behavior towards how it was done
on dunfell (simply set INIT_MANAGER=3D"systemd")



> Le ven. 17 nov. 2023, 16:51, Frederic Martinsons via
> lists.openembedded.org <frederic.martinsons=3D
> gmail.com@lists.openembedded.org> a =C3=A9crit :
>
>> Hello,
>>
>> I recently started upgrading my system from dunfell to kirkstone and I
>> started with a basic (but custom nonetheless) qemu image that I used in
>> dunfell (before starting machine/distro specific ops).
>>
>> After several corrections , many thanks by the way for the various
>> convert scripts !, I managed to get my qemu image built on kirkstone.
>>
>> But when I didn't manage to boot it correctly (I used qemu-system-x86-64
>> of my  host)  and every second on prompt I got these messages
>>
>> process '-/bin/sh' (pid 143) exited. Scheduling for restart.
>> process '-/bin/sh' (pid 144) exited. Scheduling for restart.
>> process '-/bin/sh' (pid 145) exited. Scheduling for restart.
>> can't open /dev/tty2: No such file or directory
>> can't open /dev/tty3: No such file or directory
>> can't open /dev/tty4: No such file or directory
>>
>> I looked into it more and found that the init system is set to busybox
>> (/sbin/init point to /bin/busybox.nosuid).
>> My system needs systemd as init manager  and I verify that I have set
>> INIT_MANAGER=3D"systemd" in my configuration (I even perform a bitbake -=
e to
>> check that this is not overridden).
>>
>> Can someone please tell me where to look (which log file, or some oe
>> tools that I can use)  to find why systemd is not used as the init manag=
er ?
>>
>> Thanks.
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#190853):
>> https://lists.openembedded.org/g/openembedded-core/message/190853
>> Mute This Topic: https://lists.openembedded.org/mt/102649719/6213388
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> frederic.martinsons@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--00000000000056e99a060a7ed277
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le sam. 18 nov. 2023, 20:12, Fr=C3=A9d=C3=A9ric Martin=
sons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com">frederic.martinso=
ns@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div dir=3D"auto">I saw in log.do_rootfs that update_alternatives tas=
k links /sbin/init to busybox.=C2=A0<div dir=3D"auto">I saw also that the d=
efault config (init.cfg) have CONFIG_INIT=3Dy (in openembedded-core layer),=
 dunfell also had it too but, in the end, it was not taken into account.=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll look furthe=
r about busybox config and update-alternatives class unless someone here ha=
ve a clue about what is going on.=C2=A0</div></div></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">In the end, I managed to get=
 back systemd as init system by adding an append to busybox and set explict=
ely &quot;CONFIG_INIT is not set&quot;</div><div dir=3D"auto">I gave up on =
understanding this change of behavior towards how it was done on dunfell (s=
imply set INIT_MANAGER=3D&quot;systemd&quot;)=C2=A0</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><br></div><div dir=3D"auto"></div><div dir=3D"a=
uto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le ven. 17 nov. 20=
23, 16:51, Frederic Martinsons via <a href=3D"http://lists.openembedded.org=
" target=3D"_blank" rel=3D"noreferrer">lists.openembedded.org</a> &lt;frede=
ric.martinsons=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
Hello,<div><br></div><div>I recently started upgrading my system from dunfe=
ll to kirkstone and I started with a basic (but custom nonetheless) qemu im=
age that I used in dunfell (before starting machine/distro specific ops).</=
div><div><br></div><div>After several corrections , many thanks=C2=A0by the=
 way for the various convert=C2=A0scripts !, I managed to get my qemu image=
 built on kirkstone.</div><div><br></div><div>But when I didn&#39;t manage =
to boot it correctly (I used qemu-system-x86-64 of my=C2=A0 host)=C2=A0 and=
 every second on prompt I got these messages</div><div><br></div><div>proce=
ss &#39;-/bin/sh&#39; (pid 143) exited. Scheduling for restart.<br>process =
&#39;-/bin/sh&#39; (pid 144) exited. Scheduling for restart.<br>process &#3=
9;-/bin/sh&#39; (pid 145) exited. Scheduling for restart.<br>can&#39;t open=
 /dev/tty2: No such file or directory<br>can&#39;t open /dev/tty3: No such =
file or directory<br>can&#39;t open /dev/tty4: No such file or directory<br=
></div><div><br></div><div>I looked into it more and found that the init sy=
stem is set to busybox (/sbin/init point to /bin/busybox.nosuid).</div><div=
>My system needs systemd as init manager=C2=A0 and I verify that I have set=
 INIT_MANAGER=3D&quot;systemd&quot; in my configuration (I even perform a b=
itbake -e to check that this is not overridden).</div><div><br></div><div>C=
an someone please tell me where to look (which log file, or some oe tools t=
hat I can use)=C2=A0 to find why systemd is not used as the init manager ?<=
/div><div><br></div><div>Thanks.</div><div><br></div><div><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190853): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190853" rel=3D"noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/=
190853</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102649719/621=
3388" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/mt/102649719/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-core+own=
er@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:fred=
eric.martinsons@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">=
frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div></div>

--00000000000056e99a060a7ed277--

