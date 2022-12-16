Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031B6C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 21:38:22 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.7165.1671226697238992090
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 13:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TxGkT2Aw;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id i15so5457471edf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 13:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HbLTxCpj5Z2MkoPKcAF3gelvmRtfhm0WdfUQR5KNVq0=;
        b=TxGkT2Aw9gRgVKO8iJcDQxRvH5ZbzJGBno0Vixy2VyiiBFjavEpKLxm00Q4zi+pNXT
         GfMsQmwGvK78CWPEl51hWLreQoBShEypnWRQeLHJpTlNT/ey0s2dBG6Woxr/c75j0w70
         7NgHG2didD7z25gpls5JYZq0EvfU/GSUyrWVozj8CIxcQQxpvXzyljCRouSCKlsE1AFK
         NMJX7rgO4i4BQGqM8ChIkGgMYL/5CuiZD8UVMq5u/xvmIt4mt6imYxMzWqIYRGNTWMuH
         yXOaXvb07k8szyJwj+m7Kq33MyCM+VE4FxqHyNjiaq7ej67NVil+AxiFntveAN2NYOPw
         3A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbLTxCpj5Z2MkoPKcAF3gelvmRtfhm0WdfUQR5KNVq0=;
        b=PSx3yIhY9btxJkhElrGVnuGevam29o5atWgxw9OVF7UxKf0HtEATUUQywvlIhotLu/
         +GmvGV/ibfAdh8hgln6oTGFt3rl5/UwtpYH6xF5cdLzyQm3sai1Tss9WgKd6bKVJH1XW
         +boof3I3VN6iWizOs+SZBR0tLX6QkbKO3jhDahefnzP24TOCGmzpjbyLfriQcFroJrRA
         qXlkWEa0pQDqlUW8/33mP8kAS9zOt0ge/fCZT8AKDnIJdtQ1ivDiwwCWoBDpor3XdNQB
         K2mFIRNMgf2zz0oPCX50xasxPnNS8O7sf98P3UkCIRsuYUtUsksXT0TIzRw0obaISA9V
         wpbA==
X-Gm-Message-State: ANoB5plrenfygmTrotG80j5nhYZc+XxwfiEBwgMcXtSqHpn2A8JH5oOi
	U43r0AHkC42Bk5CQ6Vk79Bz0+89j1+DOFyCCBFs=
X-Google-Smtp-Source: AA0mqf5X1ZCiP9dDAEiZf+mpqscms/gc/kqi4TAxp6eVUKIAyZqUr4zFlzGQjH4qXfaXOXeFmEahMFLwKeO/fCrfn+A=
X-Received: by 2002:a05:6402:59:b0:46f:dac1:82e7 with SMTP id
 f25-20020a056402005900b0046fdac182e7mr2219030edu.105.1671226695512; Fri, 16
 Dec 2022 13:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20221216154511.341054-1-alex@linutronix.de> <d7ec026b-4343-a133-5462-034655a9403d@kernel.crashing.org>
In-Reply-To: <d7ec026b-4343-a133-5462-034655a9403d@kernel.crashing.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 16 Dec 2022 13:38:04 -0800
Message-ID: <CANx9H-ChoVO6YcZ+SwZK_8AkSh7Tjmk29efjSMojktR3XBPaZA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH v2] qemu: update 7.1.0 -> 7.2.0
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000086777505eff8c988"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 21:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174764

--00000000000086777505eff8c988
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 16, 2022 at 1:37 PM Mark Hatle <mark.hatle@kernel.crashing.org>
wrote:

>
>
> On 12/16/22 9:45 AM, Alexander Kanavin wrote:
> > Disable slirp by default: qemu no longer carries libslirp in-tree,
> > and enabling slirp requires providing external libslirp first
> > (available from e.g. meta-virtualization).
>
> I think disabling slirp (by default) is going to be problematic.  Most of
> my
> configurations and those of people I work with use slirp.  Forcing people
> to
> include meta-virtualization in all configurations may not be reasonable
> either.
>
> I suggest that we bring libslirp from meta-virtualization to oe-core to
> preserve
> existing behavior.
>

I agree. This is a strong case for adding to oe-core.

>
> --Mark
>
> > Another noteworthy change is:
> >
> > x86: TCG support for AVX, AVX2, F16C, FMA3 and VAES instructions
> >
> > ... which means both meta-intel and qemu x86 targets can
> > now fully utilize Haswell-and-later instruction set with benefits
> > for performance in emulation and on silicon.
> >
> > Changelog:
> > https://wiki.qemu.org/ChangeLog/7.2
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174763):
> https://lists.openembedded.org/g/openembedded-core/message/174763
> Mute This Topic: https://lists.openembedded.org/mt/95712037/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000086777505eff8c988
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Dec 16, 2022 at 1:37 PM Mark Hatle &lt;<a href=3D"m=
ailto:mark.hatle@kernel.crashing.org">mark.hatle@kernel.crashing.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 12/16/22 9:45 AM, Alexander Kanavin wrote:<br>
&gt; Disable slirp by default: qemu no longer carries libslirp in-tree,<br>
&gt; and enabling slirp requires providing external libslirp first<br>
&gt; (available from e.g. meta-virtualization).<br>
<br>
I think disabling slirp (by default) is going to be problematic.=C2=A0 Most=
 of my <br>
configurations and those of people I work with use slirp.=C2=A0 Forcing peo=
ple to <br>
include meta-virtualization in all configurations may not be reasonable eit=
her.<br>
<br>
I suggest that we bring libslirp from meta-virtualization to oe-core to pre=
serve <br>
existing behavior.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I agree. This is=
 a strong case for adding to oe-core.</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
br>
--Mark<br>
<br>
&gt; Another noteworthy change is:<br>
&gt; <br>
&gt; x86: TCG support for AVX, AVX2, F16C, FMA3 and VAES instructions<br>
&gt; <br>
&gt; ... which means both meta-intel and qemu x86 targets can<br>
&gt; now fully utilize Haswell-and-later instruction set with benefits<br>
&gt; for performance in emulation and on silicon.<br>
&gt; <br>
&gt; Changelog:<br>
&gt; <a href=3D"https://wiki.qemu.org/ChangeLog/7.2" rel=3D"noreferrer" tar=
get=3D"_blank">https://wiki.qemu.org/ChangeLog/7.2</a><br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174763): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174763" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/174763</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95712037/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
95712037/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000086777505eff8c988--

