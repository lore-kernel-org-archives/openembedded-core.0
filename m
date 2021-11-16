Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2FDC433FE
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 17:59:42 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.106.1637085569035524544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 09:59:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lkmk3VGq;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id bu11so140857qvb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 09:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xiRXuyAMsU5m7n9SY4T/wgnWDBMgpKFXBBvYVGVW+pw=;
        b=lkmk3VGqCKTcvs6awJDkKdzdhq/Zs2Iev4ohfKDsAN/1GK1Hu5X+OJO5jZX5oHOgN0
         lnsenTtuQLipKOezXjCOs8z0VqBS3JpnJHw8dB92J2WxHkAg8GmgSjtWU61N4jmNBZaE
         wwFyUvkyQr1muniKhggnY3A1S1gugiOHpvYs/G7Z1Zx2LGv75NGATVyNezZ8NWiyJ+E6
         gowAereT4f7biaNQI12Zk90jiwnDGkLwlU1saZEBECt8WR81dlpTSOtSL3Nxz1Wc+bcU
         2UsPTHrVs5L4C5SjQjJSSwbGiwqbX3Kipr4xxkLsx83ktt1lrgwbM4Vacx5MkHP1pHrl
         xavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xiRXuyAMsU5m7n9SY4T/wgnWDBMgpKFXBBvYVGVW+pw=;
        b=QPRift78RBs852JdxxFC2ANRL/IWhpWxKzQw+bS6VyDfqZjIE0kdIIZ/NIDR9sn+o5
         d0PKPZdVUJMNg57v/88K1kO5aIbzVrWW9ZBHpIA5pTaVvtzamiH2kDJiZcrTtfoGHZix
         /qMj2yAIXuc5VJmNthtErtFHxyxbbp3wJZYBB/D+AkDoBWu3tE72Cw7rJNOiwA8bIlCV
         sOSJ9sHCeSXtn1OgZfi80R+7vVkMwRFX6Kf4Kudh2u6f3vj9zC1PoiY19mAVn0z39M/0
         kz4qMRoIhAyZnBgT8evQxtfT4fpltGqpzuHAXz2jImU3lPFPpNt3v7EYyuzc6QL9L2Xw
         5jXA==
X-Gm-Message-State: AOAM531jn+R7KFyarfjPcALcMfRAzksFSjJVsVz/3fP+CerMc42zR579
	W5EIdkBJL6i+3L1J5XFLShBQiYaltezZ8BWEhEU=
X-Google-Smtp-Source: 
 ABdhPJwyn9Xo3K8UfJRRIbt7loNSVRWGr+BHbuJCauaXuodVdwkDqWqKEYYXfhbuR03xrtCa3Bl46MCS8ubIWDREDg0=
X-Received: by 2002:a05:6214:27ee:: with SMTP id
 jt14mr48066780qvb.5.1637085567748;
 Tue, 16 Nov 2021 09:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20211116014413.419573-1-jim.wilson.gcc@gmail.com>
 <43d925b8-dc03-21a5-10e1-361b2894373f@gmail.com>
 <CALNwTfy6n-hf+0MOPXhdaUdJxT+ARDYdCyqtNbqYbmxk4B70Yw@mail.gmail.com>
In-Reply-To: 
 <CALNwTfy6n-hf+0MOPXhdaUdJxT+ARDYdCyqtNbqYbmxk4B70Yw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2021 09:59:01 -0800
Message-ID: 
 <CAMKF1soGjXYJJsxbSAmXYb-QDvPv0wqTt+92mr5+1MY-4N5hUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb-common: Add --with-liblzma-prefix in xz
 PACKAGECONFIG.
To: Jim Wilson <jim.wilson.gcc@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 17:59:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158369

On Tue, Nov 16, 2021 at 9:55 AM Jim Wilson <jim.wilson.gcc@gmail.com> wrote=
:
>
> On Mon, Nov 15, 2021 at 6:14 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On 11/15/21 17:44, Jim Wilson wrote:
>> > This fixes an arch linux gdb configure error with liblzma installed.
>>
>> this looks ok to me. Although I wonder why gdb's configure is not able
>> to find it in staging sysroot automatically, I have seen similar
>> behavior in gmp and mpfr in past as well.
>
>
> I have no familiarity with the OE cross native build system.  I didn't sp=
end much time looking at that.  There might be something wrong with gdb con=
figure, or there might be something wrong with options or environment varia=
bles passed to gdb configure.  But since we already passed the --with-expat=
-prefix option to configure, doing the same for liblzma was the easiest way=
 to get this working.
>

yes, this patch is fine in itself.

> Jim
>

