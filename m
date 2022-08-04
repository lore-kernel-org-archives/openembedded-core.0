Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EECC19F2B
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 11:36:54 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web12.3678.1659613009869912409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 04:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h/2bdcIt;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id q7so21781880ljp.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 04:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z3az/N0kBRLojU5oyTLQ6Lc7WobXs4Y4oKvpVGtuIvE=;
        b=h/2bdcItNX1slF/KJetVMnD7TNR8BAs1Lbx+sQioYWENAswmT6MxF23efDRgI62Fzs
         v8+OOSNGs+a6GibEU3Xo308Zjj3QXCq5w//k+8BHF56SPL+B7ldjtZV3GoEvr2vIlP8M
         /U1diR+TbhdHObjf5jyl/Q8NH7FxqsvN/slpYLLIelUlPSSYNT3xywMspMW3U1TOH80P
         hlmvQbbObxwTSnaEygN+VW4ZiKSC1LJ5uPr25EM5/tJhTi7uFXlTD4kQ6XZ6cF7QgP7o
         R4ykdEzeZ3hCK8Ku2KqCMCLbswzO5mEYoFoPddQnMobJfWqz479DeOQVESy45lariymb
         6s0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z3az/N0kBRLojU5oyTLQ6Lc7WobXs4Y4oKvpVGtuIvE=;
        b=T6IAbdzGpPU/rEsT4o9LxXobl+phylVVP9qME8PRb80qZMSqsqQJS5XXogZbiaaC0Y
         zdzLFO0nhTUYzgOHCan27+G+HcMtA5WTtQltgPbctXlhTINfqMpuQ4smD/BeT3g5yZeA
         j2uBR8Lad/3f50hPfQLXbWspQELqbgjz5/D/dhMT3IuTiqTrPWNd595YXoG8kGC6Stb9
         rIwicQ0bo5CNC0DaMTSeJdUmMK6TeYAGGG94y9SIw487dPhhu1kOAQDmVxgnh3P0bAUZ
         aF0hY0bpG/L6ZjL/RkpwFo9UQ1+wRPsfgsQTGVsWWwBOB7jhGVLGDSyXD8QV5RgeqBfg
         nUuQ==
X-Gm-Message-State: ACgBeo3Tp5QmSR0A02zKfQu8HwGqbp9t/ukEuX9ybe9MzQjjkM48x8eS
	egX6ikAZCb+EG+X4wPYWa1FTa56mKLU9F5KF53c=
X-Google-Smtp-Source: 
 AA6agR6Br6J6+KVsDVlbDe5mOnJ+D6d4k8Cvchj1bidXOH3Z3GDdElO33Vrkl7J1fjB5gZ7WnfQeo4uRpd+ftp8Pz58=
X-Received: by 2002:a2e:a4a7:0:b0:25e:49ee:9e5b with SMTP id
 g7-20020a2ea4a7000000b0025e49ee9e5bmr455702ljm.483.1659613007790; Thu, 04 Aug
 2022 04:36:47 -0700 (PDT)
MIME-Version: 1.0
References: 
 <f870b8169472e6737c99c74779e5680b935d57ed.camel@linuxfoundation.org>
In-Reply-To: 
 <f870b8169472e6737c99c74779e5680b935d57ed.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Aug 2022 12:36:35 +0100
Message-ID: 
 <CAMKF1spReLumv7Hc_683PRMgYSBSdh4oYW+YEtuiGEWof0kv2w@mail.gmail.com>
Subject: Re: [OE-core] pseudo deadlock in rust via malloc backtrace
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cb47ac05e568c37f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 11:36:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168844

--000000000000cb47ac05e568c37f
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 4, 2022 at 10:05 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Just to note that where we've been seeing pseudo hangs in rust, it
> seems jemalloc calls obtain_malloc_conf() which calls readlink() which
> pseudo intercepts and then calls malloc() which loops back to jemalloc
> which deadlocks. What fun.


I guess pseudo is doing this extra malloc right ? Maybe disable
instrumentation in jemalloc when building non target packages. This might
avoid the issue at least

>
>
> #0  0x00007f3806c84bcf in __lll_lock_wait () from
> /home/pokybuild/yocto-worker/qemumips64/build/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
> #1  0x00007f3806c8aec2 in pthread_mutex_lock () from
> /home/pokybuild/yocto-worker/qemumips64/build/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
> #2  0x00005629da227a0e in malloc_mutex_lock_final (mutex=0x5629da45a288
> <init_lock>) at include/jemalloc/internal/mutex.h:155
> #3  _rjem_je_malloc_mutex_lock_slow (mutex=0x5629da45a288 <init_lock>) at
> src/mutex.c:85
> #4  0x00005629da1ffddb in malloc_mutex_lock (tsdn=0x0, mutex=<optimized
> out>) at include/jemalloc/internal/mutex.h:221
> #5  malloc_init_hard () at src/jemalloc.c:1739
> #6  0x00005629da1fa2ee in malloc_init () at src/jemalloc.c:223
> #7  imalloc_init_check (sopts=<optimized out>, dopts=<optimized out>) at
> src/jemalloc.c:2229
> #8  imalloc (sopts=<optimized out>, dopts=<optimized out>) at
> src/jemalloc.c:2260
> #9  _rjem_je_malloc_default (size=101) at src/jemalloc.c:2289
> #10 0x00007f3806c998fe in strdup () from
> /home/pokybuild/yocto-worker/qemumips64/build/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
> #11 0x00007f380b19da1b in pseudo_set_value () from
> /home/pokybuild/yocto-worker/qemumips64/build/build/tmp/sysroots-components/x86_64/pseudo-native/usr/lib/pseudo/lib64/libpseudo.so
> #12 0x00007f380b19dbb9 in pseudo_init_util () from
> /home/pokybuild/yocto-worker/qemumips64/build/build/tmp/sysroots-components/x86_64/pseudo-native/usr/lib/pseudo/lib64/libpseudo.so
> #13 0x00007f380b16bd01 in ?? () from
> /home/pokybuild/yocto-worker/qemumips64/build/build/tmp/sysroots-components/x86_64/pseudo-native/usr/lib/pseudo/lib64/libpseudo.so
> #14 0x00007f380b19125d in readlink () from
> /home/pokybuild/yocto-worker/qemumips64/build/build/tmp/sysroots-components/x86_64/pseudo-native/usr/lib/pseudo/lib64/libpseudo.so
> #15 0x00005629da1fe07b in obtain_malloc_conf (which_source=2,
> buf=0x7ffca80e7cc0 "\320~\016\250\374\177") at src/jemalloc.c:980
> #16 malloc_conf_init_helper (sc_data=sc_data@entry=0x0,
> bin_shard_sizes=bin_shard_sizes@entry=0x0, initial_call=true,
> opts_cache=opts_cache@entry=0x7ffca80e6260, buf=<optimized out>,
>     buf@entry=0x7ffca80e7cc0 "\320~\016\250\374\177") at
> src/jemalloc.c:1038
> #17 0x00005629da1fdcac in malloc_conf_init (sc_data=0x7ffca80e6310,
> bin_shard_sizes=0x7ffca80e6280) at src/jemalloc.c:1445
> #18 malloc_init_hard_a0_locked () at src/jemalloc.c:1505
> #19 0x00005629da1fff46 in malloc_init_hard () at src/jemalloc.c:1750
> #20 0x00005629da1fa2ee in malloc_init () at src/jemalloc.c:223
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168839):
> https://lists.openembedded.org/g/openembedded-core/message/168839
> Mute This Topic: https://lists.openembedded.org/mt/92809824/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000cb47ac05e568c37f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Aug 4, 2022 at 10:05 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Just to note =
that where we&#39;ve been seeing pseudo hangs in rust, it<br>
seems jemalloc calls obtain_malloc_conf() which calls readlink() which<br>
pseudo intercepts and then calls malloc() which loops back to jemalloc<br>
which deadlocks. What fun.</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">I guess pseudo is doing this extra malloc right ? Maybe disable i=
nstrumentation in jemalloc when building non target packages. This might av=
oid the issue at least=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"a=
uto"><br>
<br>
#0=C2=A0 0x00007f3806c84bcf in __lll_lock_wait () from /home/pokybuild/yoct=
o-worker/qemumips64/build/build/tmp/sysroots-uninative/x86_64-linux/lib/lib=
c.so.6<br>
#1=C2=A0 0x00007f3806c8aec2 in pthread_mutex_lock () from /home/pokybuild/y=
octo-worker/qemumips64/build/build/tmp/sysroots-uninative/x86_64-linux/lib/=
libc.so.6<br>
#2=C2=A0 0x00005629da227a0e in malloc_mutex_lock_final (mutex=3D0x5629da45a=
288 &lt;init_lock&gt;) at include/jemalloc/internal/mutex.h:155<br>
#3=C2=A0 _rjem_je_malloc_mutex_lock_slow (mutex=3D0x5629da45a288 &lt;init_l=
ock&gt;) at src/mutex.c:85<br>
#4=C2=A0 0x00005629da1ffddb in malloc_mutex_lock (tsdn=3D0x0, mutex=3D&lt;o=
ptimized out&gt;) at include/jemalloc/internal/mutex.h:221<br>
#5=C2=A0 malloc_init_hard () at src/jemalloc.c:1739<br>
#6=C2=A0 0x00005629da1fa2ee in malloc_init () at src/jemalloc.c:223<br>
#7=C2=A0 imalloc_init_check (sopts=3D&lt;optimized out&gt;, dopts=3D&lt;opt=
imized out&gt;) at src/jemalloc.c:2229<br>
#8=C2=A0 imalloc (sopts=3D&lt;optimized out&gt;, dopts=3D&lt;optimized out&=
gt;) at src/jemalloc.c:2260<br>
#9=C2=A0 _rjem_je_malloc_default (size=3D101) at src/jemalloc.c:2289<br>
#10 0x00007f3806c998fe in strdup () from /home/pokybuild/yocto-worker/qemum=
ips64/build/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6<br>
#11 0x00007f380b19da1b in pseudo_set_value () from /home/pokybuild/yocto-wo=
rker/qemumips64/build/build/tmp/sysroots-components/x86_64/pseudo-native/us=
r/lib/pseudo/lib64/libpseudo.so<br>
#12 0x00007f380b19dbb9 in pseudo_init_util () from /home/pokybuild/yocto-wo=
rker/qemumips64/build/build/tmp/sysroots-components/x86_64/pseudo-native/us=
r/lib/pseudo/lib64/libpseudo.so<br>
#13 0x00007f380b16bd01 in ?? () from /home/pokybuild/yocto-worker/qemumips6=
4/build/build/tmp/sysroots-components/x86_64/pseudo-native/usr/lib/pseudo/l=
ib64/libpseudo.so<br>
#14 0x00007f380b19125d in readlink () from /home/pokybuild/yocto-worker/qem=
umips64/build/build/tmp/sysroots-components/x86_64/pseudo-native/usr/lib/ps=
eudo/lib64/libpseudo.so<br>
#15 0x00005629da1fe07b in obtain_malloc_conf (which_source=3D2, buf=3D0x7ff=
ca80e7cc0 &quot;\320~\016\250\374\177&quot;) at src/jemalloc.c:980<br>
#16 malloc_conf_init_helper (sc_data=3Dsc_data@entry=3D0x0, bin_shard_sizes=
=3Dbin_shard_sizes@entry=3D0x0, initial_call=3Dtrue, opts_cache=3Dopts_cach=
e@entry=3D0x7ffca80e6260, buf=3D&lt;optimized out&gt;, <br>
=C2=A0 =C2=A0 buf@entry=3D0x7ffca80e7cc0 &quot;\320~\016\250\374\177&quot;)=
 at src/jemalloc.c:1038<br>
#17 0x00005629da1fdcac in malloc_conf_init (sc_data=3D0x7ffca80e6310, bin_s=
hard_sizes=3D0x7ffca80e6280) at src/jemalloc.c:1445<br>
#18 malloc_init_hard_a0_locked () at src/jemalloc.c:1505<br>
#19 0x00005629da1fff46 in malloc_init_hard () at src/jemalloc.c:1750<br>
#20 0x00005629da1fa2ee in malloc_init () at src/jemalloc.c:223<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168839): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168839" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168839</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92809824/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92809824/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000cb47ac05e568c37f--

