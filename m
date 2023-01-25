Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C62C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 08:03:24 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.40592.1674633797301891373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 00:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z9U/Y2JM;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id o20so27592025lfk.5
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 00:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q8sVCyIEl95rqQT9XrChF13HUPZxc6nonz/Sidadbto=;
        b=Z9U/Y2JMTQyh0P+l+k3s84Ad4kpR5j2zrPeAuC1d9TYseneWT3DVM/oyS0doxbfbom
         htfmtI2DnXg7QK5VL3PpzQ2QGxUFyOlbN0Mi+oM7MFR1YWxOReBt3ZqWMXDuqUQAcyHL
         oAdZQqZkikMy1DQ5Q7vzncWMFCz1PzC50eLTEnH1B++ssN/wA6jkvbeU4x3OUMQmTng1
         RBKqBZyyKsRFW8dJYbaEpePvR47TUeCRqjiFkCC3TG1D0W1NGv+3cA7nT/IKVINX7fHz
         0bIH9ya9gGoLy5quQGAuNuO/8+cE7fZ51Ui/sAfQ+zY//kEgtubfLLvfCPZbshkEHWk4
         SqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8sVCyIEl95rqQT9XrChF13HUPZxc6nonz/Sidadbto=;
        b=HLJDyId68wYAb6Q4nthqjhZKWwSIpxde0p5MgvLIlsir/QUfwaCTfa8lVzDjNJsxx4
         XTAi8GAUHUKZfpNOkupsdtN0kgI1NSFz9yCamr6PMldCHp+y+ioSM3e1YVbZ3iu5N9aQ
         P7hqRtxUPost+2X1BOZPxKDdWyZ+XDyAjuRyNbxAgp/UUaJ1QfnP0KM5f8vTQKWzmRAA
         piUOmDQ1uXoK3IBarWSo0TKeLX1B2Z3b5EjOwRbvzuNHiKtteEXtO6CvPsVjCPYuAtXy
         rAsnM19x4VdCcTLD3WAlh2uTn8WGRk9IOQ/yrE0HoP0wtvX+Cwq5T5Rq/MSyFtn+sp1W
         GAAA==
X-Gm-Message-State: AFqh2ko47wAPjiZ50XTj7ww8CPsa5kcRzymQt4zX9Ec/2Blo7iEQDe8f
	eb/9OF5mzWh2VONata1QxuglaVFHxkdKIYD8vd0=
X-Google-Smtp-Source: AMrXdXtoVRdAgzmtIYfx4eJnySlTyOFt3aR4uHTnCy1qN0QOJhGpXI9U+xjwwQ0R9aUaSw4xSYtdBejd3MRFGVOcxiA=
X-Received: by 2002:ac2:46ef:0:b0:4b5:62e4:bff2 with SMTP id
 q15-20020ac246ef000000b004b562e4bff2mr1495965lfo.492.1674633794660; Wed, 25
 Jan 2023 00:03:14 -0800 (PST)
MIME-Version: 1.0
References: <173C0B9603DBAB46.24231@lists.openembedded.org> <Y9DgI+HyBTGNmiFa@nuoska>
In-Reply-To: <Y9DgI+HyBTGNmiFa@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Jan 2023 09:03:03 +0100
Message-ID: <CANNYZj-Qq8rOob5y2mkdLczFzwNx3Hr_CHKbn370fe3CVa7EQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/14] oeqa runtime tests when qemu hangs
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000075b14005f31210a2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 08:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176342

--00000000000075b14005f31210a2
Content-Type: text/plain; charset="UTF-8"

Perhaps you could show a sample output before and after all the changes?

Alex

On Wed 25. Jan 2023 at 8.54, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:

> Hi,
>
> On Fri, Jan 20, 2023 at 04:44:36PM +0200, Mikko Rapeli via
> lists.openembedded.org wrote:
> > I get a qemu hang on kirkstone, swtpm and optee. One of the
> > optee-test/xtest hangs the qemu machine in some kind of deadlock.
> > While this needs to be debugged and tested, the oeqa runtime tests
> > also hanged and never returned. Thus this patch set. With these changes
> > qemu deadlock is detected and with do_testimage() task eventually exits
> > with all correct tests failing and the hangin qemu system killed.
> > There are a lot of debug prints added by this patch set but I don't of
> > any other way to debug complex python code. strace output from the hang
> > doesn't tell where the deadlock happened.
>
> On #yocto Richard said he doesn't like the large amount of debug prints
> here. If there are some specific ones I should drop, then please let me
> know. I think the logs in do_testimage() are quite readable with
> these enabled. I can follow the logs and see target debug output in
> larger, multi line chunks. I can see if an ssh command on target is
> waiting for output for a long time, and output of the commands comes in
> larger clear chunks.
>
> I have a complex boot sequence which includes firmware, kernel,
> initramfs, rootfs encryption etc before entering login prompt so
> collecting all logs from the boot is criticial, and the boot takes a
> long time too so seeing frequent output in do_testimage() logs is also
> important. The chunk reading of output data really helps.
>
> Cheers,
>
> -Mikko
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176341):
> https://lists.openembedded.org/g/openembedded-core/message/176341
> Mute This Topic: https://lists.openembedded.org/mt/96401356/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000075b14005f31210a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Perhaps you could show a sample output before and after a=
ll the changes?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</di=
v><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed 25. Jan 2023 at 8.54, Mikko Rapeli &lt;<a href=3D"mailto:mikko.rape=
li@linaro.org">mikko.rapeli@linaro.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)">Hi,<br>
<br>
On Fri, Jan 20, 2023 at 04:44:36PM +0200, Mikko Rapeli via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> wrote:<br>
&gt; I get a qemu hang on kirkstone, swtpm and optee. One of the<br>
&gt; optee-test/xtest hangs the qemu machine in some kind of deadlock.<br>
&gt; While this needs to be debugged and tested, the oeqa runtime tests<br>
&gt; also hanged and never returned. Thus this patch set. With these change=
s<br>
&gt; qemu deadlock is detected and with do_testimage() task eventually exit=
s<br>
&gt; with all correct tests failing and the hangin qemu system killed.<br>
&gt; There are a lot of debug prints added by this patch set but I don&#39;=
t of<br>
&gt; any other way to debug complex python code. strace output from the han=
g<br>
&gt; doesn&#39;t tell where the deadlock happened.<br>
<br>
On #yocto Richard said he doesn&#39;t like the large amount of debug prints=
<br>
here. If there are some specific ones I should drop, then please let me<br>
know. I think the logs in do_testimage() are quite readable with<br>
these enabled. I can follow the logs and see target debug output in<br>
larger, multi line chunks. I can see if an ssh command on target is<br>
waiting for output for a long time, and output of the commands comes in<br>
larger clear chunks.<br>
<br>
I have a complex boot sequence which includes firmware, kernel,<br>
initramfs, rootfs encryption etc before entering login prompt so<br>
collecting all logs from the boot is criticial, and the boot takes a<br>
long time too so seeing frequent output in do_testimage() logs is also<br>
important. The chunk reading of output data really helps.<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176341): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176341" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/176341</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96401356/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96401356/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000075b14005f31210a2--

