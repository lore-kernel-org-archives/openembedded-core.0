Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE53C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 10:42:42 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web11.5666.1639132961036889284
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 02:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M/Kid+o9;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id o1so16008040uap.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 02:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VVsoBmFxBwbMechMUPfUTpEJmdLxECnIu61g/tz7aPs=;
        b=M/Kid+o9iFJVGvFSzXATsKKJpLWBpIwr7B1KxCywpX0SibxaOgC8d3aQQdp6fC3P1H
         j+xkd2Q5XBy456txCdpzlUH9qtMxO4KRnc53Zj3/dW8mlmRm4PRF07hZZuac2f9NkLxF
         XrjacLjewrtuxI3Gy7GEL/ijZTn7IzyY44JCL5SDeSngUTDhpwcxA37OjrojmGJ3BceY
         XGcuIVBIfHZSw5krsink9+gPPnXCsnJRbHZuJmUYZbwy+ffHv+uMQ8QQcUY+ozLbW3bQ
         Vniuk6oBZaA7Ta/Y+w+Jr2ipa42P5/B7O3VoPEv1SiSYGM81ZNdUUXQaOgP16OmWGlT1
         kjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VVsoBmFxBwbMechMUPfUTpEJmdLxECnIu61g/tz7aPs=;
        b=jfZWjLlmPfbVOQZoDYEvEkp2TkhatIj99BgBm5/aXg+0igqJgVjmFj5m8IySJoESK0
         N2Hf1ogNbjJbNl5LLLMF4k2lJiKAKgsFiJrrUwtQYpybC3R4o3P0I1jiKGY5Tu+Nu1eO
         DAHrG0qpBbgJcbE0HFIlzuMeO7yMOHlIpvX8PD00L6Qazk113t3wof7o45tknvGebZ2X
         7WpTuJFW6Bpt+BG0igzJ7D5SpJ4kyYoZyMli4Pf/ZaTJAuoZ/xeehOxwfX1abYSCWMVb
         qWi9H/zQjWEfvCZBezpd+krKm2GgYR8JcwqrAs7F7ee770PAw+sbfy/7Mj+NH4xYwDLD
         2eCA==
X-Gm-Message-State: AOAM530ZBeEodFH3BCfgZhqSi2uVyFv3cLRZ2LX1bps9pqMrEcqwGAMj
	gUNbySTA5GJ3SiNfXPV//NtXU6he6fk21A64/AI=
X-Google-Smtp-Source: 
 ABdhPJwT9/xCkoQMNRpCjd+HDSxavPsVmau4HkHZMIYUTUAAWZAI7Lr+Ntt5GspYbiptaUjvUhhjtKZSIBqCBEhUWyw=
X-Received: by 2002:a05:6102:38d4:: with SMTP id
 k20mr14543826vst.42.1639132958865;
 Fri, 10 Dec 2021 02:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20211210021241.31413-1-mingli.yu@windriver.com>
In-Reply-To: <20211210021241.31413-1-mingli.yu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Dec 2021 11:42:27 +0100
Message-ID: 
 <CANNYZj-fLHHvP1HmHTr00Gfp7TF5S=5DnUfCUZ07P9cC0E0=OA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bootchart2: remove wait_boot logic
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c0c1eb05d2c86159"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 10:42:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159493

--000000000000c0c1eb05d2c86159
Content-Type: text/plain; charset="UTF-8"

Thank you, but please submit the patch upstream first. We're tightening the
policy on Pending patches.

Alex

On Fri, 10 Dec 2021 at 03:16, Yu, Mingli <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> When boot with "init=/sbin/bootchartd" as below:
>  # runqemu qemux86 bootparams="init=/sbin/bootchartd"
>
> There are two bootchartd process after boot [1].
>  # ps -ef | grep bootchart
> root       101     1  0 03:27 ?        00:00:00 /bin/sh /sbin/bootchartd
> root       103   101  8 03:27 ?        00:00:02
> /lib64/bootchart/bootchart-collector 50
> root       106     1  0 03:27 ?        00:00:00 /bin/sh /sbin/bootchartd
> root       792   106  0 03:27 ?        00:00:00
> /lib64/bootchart/bootchart-collector --usleep 1000000
> root       794   725  0 03:27 ttyS0    00:00:00 grep bootchart
>
>  # /sbin/bootchartd stop
> [bootchart] bootchart-collector started as pid 596 with 2 args:
> [bootchart] '--dump'
> [bootchart] '/tmp/bootchart.3lXpVDAq3v'
> [bootchart] Extracting profile data from pid 204
> [bootchart] map 0xbed9a000 -> 0xbedbb000 size: 132k from 'bed9a000'
> 'bedbb000'
> [bootchart] read 135168 bytes of 135168
> [bootchart] reading 150 chunks (of 150) ...
> [bootchart] wrote 18760 kbB
> [bootchart] bootchart-collector pid: 596 unmounted proc / clean exit
>
> But there still one process exist after the above stop command finish.
>  # ps -ef | grep bootchartd
> root 202 1 0 09:09 ? 00:00:00 /bin/sh /sbin/bootchartd
> root 629 516 0 09:10 ? 00:00:00 grep bootchartd
>
> Remove the wait_boot which used to wait the boot process to finish to
> make sure only one bootchartd process and meanwhile we don't need the
> wait_boot logic because we either use "/sbin/bootchartd stop" to stop
> the bootchartd manually or install package bootchartd-stop-initscript
> altogether with bootchart2 to stop bootchartd automatically after boot.
>
> After patch:
>  # ps -ef | grep bootchart
>  root       101     1  0 03:36 ?        00:00:00 /bin/sh /sbin/bootchartd
>  root       103   101  6 03:36 ?        00:00:04
> /lib64/bootchart/bootchart-collector 50
>  root       596   592  0 03:37 ttyS0    00:00:00 grep bootchart
>
> [1] https://github.com/xrmx/bootchart/issues/94
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...ake-sure-only-one-bootchartd-process.patch | 68 +++++++++++++++++++
>  .../bootchart2/bootchart2_0.14.9.bb           |  1 +
>  2 files changed, 69 insertions(+)
>  create mode 100644
> meta/recipes-devtools/bootchart2/bootchart2/0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch
>
> diff --git
> a/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch
> b/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch
> new file mode 100644
> index 0000000000..0d6c20c47c
> --- /dev/null
> +++
> b/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch
> @@ -0,0 +1,68 @@
> +From 988ca784d4840c87509e770a21d5d22105af8668 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Fri, 5 Nov 2021 11:18:07 +0800
> +Subject: [PATCH] bootchartd.in: make sure only one bootchartd process
> +
> +When boot with "init=/sbin/bootchartd" as below:
> + # runqemu qemux86 bootparams="init=/sbin/bootchartd"
> +
> +There are two bootchartd process after boot [1].
> + # ps -ef | grep bootchart
> +root       101     1  0 03:27 ?        00:00:00 /bin/sh /sbin/bootchartd
> +root       103   101  8 03:27 ?        00:00:02
> /lib64/bootchart/bootchart-collector 50
> +root       106     1  0 03:27 ?        00:00:00 /bin/sh /sbin/bootchartd
> +root       792   106  0 03:27 ?        00:00:00
> /lib64/bootchart/bootchart-collector --usleep 1000000
> +root       794   725  0 03:27 ttyS0    00:00:00 grep bootchart
> +
> + # /sbin/bootchartd stop
> +[bootchart] bootchart-collector started as pid 596 with 2 args:
> +[bootchart] '--dump'
> +[bootchart] '/tmp/bootchart.3lXpVDAq3v'
> +[bootchart] Extracting profile data from pid 204
> +[bootchart] map 0xbed9a000 -> 0xbedbb000 size: 132k from 'bed9a000'
> 'bedbb000'
> +[bootchart] read 135168 bytes of 135168
> +[bootchart] reading 150 chunks (of 150) ...
> +[bootchart] wrote 18760 kbB
> +[bootchart] bootchart-collector pid: 596 unmounted proc / clean exit
> +
> +But there still one process exist after the above stop command finish.
> + # ps -ef | grep bootchartd
> +root 202 1 0 09:09 ? 00:00:00 /bin/sh /sbin/bootchartd
> +root 629 516 0 09:10 ? 00:00:00 grep bootchartd
> +
> +Remove the wait_boot which used to wait the boot process to finish to
> +make sure only one bootchartd process and meanwhile we don't need the
> +wait_boot logic because we either use "/sbin/bootchartd stop" to stop
> +the bootchartd manually or install package bootchartd-stop-initscript
> +altogether with bootchart2 to stop bootchartd automatically after boot.
> +
> +After patch:
> + # ps -ef | grep bootchart
> + root       101     1  0 03:36 ?        00:00:00 /bin/sh /sbin/bootchartd
> + root       103   101  6 03:36 ?        00:00:04
> /lib64/bootchart/bootchart-collector 50
> + root       596   592  0 03:37 ttyS0    00:00:00 grep bootchart
> +
> +[1] https://github.com/xrmx/bootchart/issues/94
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + bootchartd.in | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/bootchartd.in b/bootchartd.in
> +index 7979ef9..f0e466d 100755
> +--- a/bootchartd.in
> ++++ b/bootchartd.in
> +@@ -183,7 +183,6 @@ if [ $$ -eq 1 ]; then
> +       else # running inside the main system
> +               echo "bootchart: no initrd used; starting"
> +               start &
> +-              wait_boot &
> +               # wait a little, until the collector is going, before
> allowing
> +               # the rest of the system to charge ahead, so we catch it
> +               $USLEEP 250000
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
> b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
> index 59fcd8c78a..87f7631ddc 100644
> --- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
> +++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
> @@ -94,6 +94,7 @@ SRC_URI = "git://
> github.com/xrmx/bootchart.git;branch=master;protocol=https \
>             file://bootchartd_stop.sh \
>             file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
>             file://0001-bootchart2-support-usrmerge.patch \
> +
>  file://0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch \
>            "
>
>  S = "${WORKDIR}/git"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159489):
> https://lists.openembedded.org/g/openembedded-core/message/159489
> Mute This Topic: https://lists.openembedded.org/mt/87628040/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c0c1eb05d2c86159
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you, but please submit the patch upstream first=
. We&#39;re tightening the policy on Pending patches.</div><div><br></div><=
div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, 10 Dec 2021 at 03:16, Yu, Mingli &lt;<a href=3D"m=
ailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">From: Mingli Yu &lt;<=
a href=3D"mailto:mingli.yu@windriver.com" target=3D"_blank">mingli.yu@windr=
iver.com</a>&gt;<br>
<br>
When boot with &quot;init=3D/sbin/bootchartd&quot; as below:<br>
=C2=A0# runqemu qemux86 bootparams=3D&quot;init=3D/sbin/bootchartd&quot;<br=
>
<br>
There are two bootchartd process after boot [1].<br>
=C2=A0# ps -ef | grep bootchart<br>
root=C2=A0 =C2=A0 =C2=A0 =C2=A0101=C2=A0 =C2=A0 =C2=A01=C2=A0 0 03:27 ?=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 00:00:00 /bin/sh /sbin/bootchartd<br>
root=C2=A0 =C2=A0 =C2=A0 =C2=A0103=C2=A0 =C2=A0101=C2=A0 8 03:27 ?=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 00:00:02 /lib64/bootchart/bootchart-collector 50<br>
root=C2=A0 =C2=A0 =C2=A0 =C2=A0106=C2=A0 =C2=A0 =C2=A01=C2=A0 0 03:27 ?=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 00:00:00 /bin/sh /sbin/bootchartd<br>
root=C2=A0 =C2=A0 =C2=A0 =C2=A0792=C2=A0 =C2=A0106=C2=A0 0 03:27 ?=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 00:00:00 /lib64/bootchart/bootchart-collector --usleep=
 1000000<br>
root=C2=A0 =C2=A0 =C2=A0 =C2=A0794=C2=A0 =C2=A0725=C2=A0 0 03:27 ttyS0=C2=
=A0 =C2=A0 00:00:00 grep bootchart<br>
<br>
=C2=A0# /sbin/bootchartd stop<br>
[bootchart] bootchart-collector started as pid 596 with 2 args:<br>
[bootchart] &#39;--dump&#39;<br>
[bootchart] &#39;/tmp/bootchart.3lXpVDAq3v&#39;<br>
[bootchart] Extracting profile data from pid 204<br>
[bootchart] map 0xbed9a000 -&gt; 0xbedbb000 size: 132k from &#39;bed9a000&#=
39; &#39;bedbb000&#39;<br>
[bootchart] read 135168 bytes of 135168<br>
[bootchart] reading 150 chunks (of 150) ...<br>
[bootchart] wrote 18760 kbB<br>
[bootchart] bootchart-collector pid: 596 unmounted proc / clean exit<br>
<br>
But there still one process exist after the above stop command finish.<br>
=C2=A0# ps -ef | grep bootchartd<br>
root 202 1 0 09:09 ? 00:00:00 /bin/sh /sbin/bootchartd<br>
root 629 516 0 09:10 ? 00:00:00 grep bootchartd<br>
<br>
Remove the wait_boot which used to wait the boot process to finish to<br>
make sure only one bootchartd process and meanwhile we don&#39;t need the<b=
r>
wait_boot logic because we either use &quot;/sbin/bootchartd stop&quot; to =
stop<br>
the bootchartd manually or install package bootchartd-stop-initscript<br>
altogether with bootchart2 to stop bootchartd automatically after boot.<br>
<br>
After patch:<br>
=C2=A0# ps -ef | grep bootchart<br>
=C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0101=C2=A0 =C2=A0 =C2=A01=C2=A0 0 03:36=
 ?=C2=A0 =C2=A0 =C2=A0 =C2=A0 00:00:00 /bin/sh /sbin/bootchartd<br>
=C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0103=C2=A0 =C2=A0101=C2=A0 6 03:36 ?=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 00:00:04 /lib64/bootchart/bootchart-collector 50<b=
r>
=C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0596=C2=A0 =C2=A0592=C2=A0 0 03:37 ttyS=
0=C2=A0 =C2=A0 00:00:00 grep bootchart<br>
<br>
[1] <a href=3D"https://github.com/xrmx/bootchart/issues/94" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/xrmx/bootchart/issues/94</a><br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0...ake-sure-only-one-bootchartd-process.patch | 68 ++++++++++++++++++=
+<br>
=C2=A0.../bootchart2/<a href=3D"http://bootchart2_0.14.9.bb" rel=3D"norefer=
rer" target=3D"_blank">bootchart2_0.14.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 69 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-b=
ootchartd.in-make-sure-only-one-bootchartd-process.patch<br>
<br>
diff --git a/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchartd.in=
-make-sure-only-one-bootchartd-process.patch b/meta/recipes-devtools/bootch=
art2/bootchart2/0001-bootchartd.in-make-sure-only-one-bootchartd-process.pa=
tch<br>
new file mode 100644<br>
index 0000000000..0d6c20c47c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchartd.in-make-s=
ure-only-one-bootchartd-process.patch<br>
@@ -0,0 +1,68 @@<br>
+From 988ca784d4840c87509e770a21d5d22105af8668 Mon Sep 17 00:00:00 2001<br>
+From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_=
blank">mingli.yu@windriver.com</a>&gt;<br>
+Date: Fri, 5 Nov 2021 11:18:07 +0800<br>
+Subject: [PATCH] <a href=3D"http://bootchartd.in" rel=3D"noreferrer" targe=
t=3D"_blank">bootchartd.in</a>: make sure only one bootchartd process<br>
+<br>
+When boot with &quot;init=3D/sbin/bootchartd&quot; as below:<br>
+ # runqemu qemux86 bootparams=3D&quot;init=3D/sbin/bootchartd&quot;<br>
+<br>
+There are two bootchartd process after boot [1].<br>
+ # ps -ef | grep bootchart<br>
+root=C2=A0 =C2=A0 =C2=A0 =C2=A0101=C2=A0 =C2=A0 =C2=A01=C2=A0 0 03:27 ?=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 00:00:00 /bin/sh /sbin/bootchartd<br>
+root=C2=A0 =C2=A0 =C2=A0 =C2=A0103=C2=A0 =C2=A0101=C2=A0 8 03:27 ?=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 00:00:02 /lib64/bootchart/bootchart-collector 50<br>
+root=C2=A0 =C2=A0 =C2=A0 =C2=A0106=C2=A0 =C2=A0 =C2=A01=C2=A0 0 03:27 ?=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 00:00:00 /bin/sh /sbin/bootchartd<br>
+root=C2=A0 =C2=A0 =C2=A0 =C2=A0792=C2=A0 =C2=A0106=C2=A0 0 03:27 ?=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 00:00:00 /lib64/bootchart/bootchart-collector --usleep=
 1000000<br>
+root=C2=A0 =C2=A0 =C2=A0 =C2=A0794=C2=A0 =C2=A0725=C2=A0 0 03:27 ttyS0=C2=
=A0 =C2=A0 00:00:00 grep bootchart<br>
+<br>
+ # /sbin/bootchartd stop<br>
+[bootchart] bootchart-collector started as pid 596 with 2 args:<br>
+[bootchart] &#39;--dump&#39;<br>
+[bootchart] &#39;/tmp/bootchart.3lXpVDAq3v&#39;<br>
+[bootchart] Extracting profile data from pid 204<br>
+[bootchart] map 0xbed9a000 -&gt; 0xbedbb000 size: 132k from &#39;bed9a000&=
#39; &#39;bedbb000&#39;<br>
+[bootchart] read 135168 bytes of 135168<br>
+[bootchart] reading 150 chunks (of 150) ...<br>
+[bootchart] wrote 18760 kbB<br>
+[bootchart] bootchart-collector pid: 596 unmounted proc / clean exit<br>
+<br>
+But there still one process exist after the above stop command finish.<br>
+ # ps -ef | grep bootchartd<br>
+root 202 1 0 09:09 ? 00:00:00 /bin/sh /sbin/bootchartd<br>
+root 629 516 0 09:10 ? 00:00:00 grep bootchartd<br>
+<br>
+Remove the wait_boot which used to wait the boot process to finish to<br>
+make sure only one bootchartd process and meanwhile we don&#39;t need the<=
br>
+wait_boot logic because we either use &quot;/sbin/bootchartd stop&quot; to=
 stop<br>
+the bootchartd manually or install package bootchartd-stop-initscript<br>
+altogether with bootchart2 to stop bootchartd automatically after boot.<br=
>
+<br>
+After patch:<br>
+ # ps -ef | grep bootchart<br>
+ root=C2=A0 =C2=A0 =C2=A0 =C2=A0101=C2=A0 =C2=A0 =C2=A01=C2=A0 0 03:36 ?=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 00:00:00 /bin/sh /sbin/bootchartd<br>
+ root=C2=A0 =C2=A0 =C2=A0 =C2=A0103=C2=A0 =C2=A0101=C2=A0 6 03:36 ?=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 00:00:04 /lib64/bootchart/bootchart-collector 50<br>
+ root=C2=A0 =C2=A0 =C2=A0 =C2=A0596=C2=A0 =C2=A0592=C2=A0 0 03:37 ttyS0=C2=
=A0 =C2=A0 00:00:00 grep bootchart<br>
+<br>
+[1] <a href=3D"https://github.com/xrmx/bootchart/issues/94" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/xrmx/bootchart/issues/94</a><br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://bootchartd.in" rel=3D"noreferrer" target=3D"_blank">boo=
tchartd.in</a> | 1 -<br>
+ 1 file changed, 1 deletion(-)<br>
+<br>
+diff --git a/<a href=3D"http://bootchartd.in" rel=3D"noreferrer" target=3D=
"_blank">bootchartd.in</a> b/<a href=3D"http://bootchartd.in" rel=3D"norefe=
rrer" target=3D"_blank">bootchartd.in</a><br>
+index 7979ef9..f0e466d 100755<br>
+--- a/<a href=3D"http://bootchartd.in" rel=3D"noreferrer" target=3D"_blank=
">bootchartd.in</a><br>
++++ b/<a href=3D"http://bootchartd.in" rel=3D"noreferrer" target=3D"_blank=
">bootchartd.in</a><br>
+@@ -183,7 +183,6 @@ if [ $$ -eq 1 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else # running inside the main system<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;bootchar=
t: no initrd used; starting&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start &amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wait_boot &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# wait a little, un=
til the collector is going, before allowing<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# the rest of the s=
ystem to charge ahead, so we catch it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$USLEEP 250000<br>
+-- <br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-devtools/bootchart2/<a href=3D"http://bootchart2_=
0.14.9.bb" rel=3D"noreferrer" target=3D"_blank">bootchart2_0.14.9.bb</a> b/=
meta/recipes-devtools/bootchart2/<a href=3D"http://bootchart2_0.14.9.bb" re=
l=3D"noreferrer" target=3D"_blank">bootchart2_0.14.9.bb</a><br>
index 59fcd8c78a..87f7631ddc 100644<br>
--- a/meta/recipes-devtools/bootchart2/<a href=3D"http://bootchart2_0.14.9.=
bb" rel=3D"noreferrer" target=3D"_blank">bootchart2_0.14.9.bb</a><br>
+++ b/meta/recipes-devtools/bootchart2/<a href=3D"http://bootchart2_0.14.9.=
bb" rel=3D"noreferrer" target=3D"_blank">bootchart2_0.14.9.bb</a><br>
@@ -94,6 +94,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/xrmx=
/bootchart.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/xrmx/bootchart.git;branch=3Dmaster;protocol=3Dhttps<=
/a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://bootchartd_stop.sh \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-collector-Allocate-sp=
ace-on-heap-for-chunks.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-bootchart2-support-us=
rmerge.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-bootchartd.in-make-su=
re-only-one-bootchartd-process.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159489): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159489" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159489</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87628040/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87628040/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c0c1eb05d2c86159--

