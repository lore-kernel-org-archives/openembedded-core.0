Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B054AC19F2B
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 11:22:54 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.3517.1659612169846929252
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 04:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oe+Bu7Ei;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id z4so7138177ljn.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 04:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xgO2DU8HRMWvpDqc4KwopD751Pf2sXOIzGg98OiShZg=;
        b=oe+Bu7Ei9iq18//xaqYvkQMD5wEKAHJZlYy4zgRkhiEi1x7C6uQinBc4rdYJ/tMCOw
         RGFT6BzFSw48xsqC0IXhsKdpFl1SpBUWnpjr6dgJBDXrA/j7dfAqH6n/4R0am4yhippz
         hTbIrnevhkeo7p5cB+GGKSzydkhHYEmplCNsl0uCHuW4hTrivwx1EFKDDEfLvNyPn42w
         /LRkSQqHfxXLgzMJzgVjjwa15yUFCUzFnm7rLFPQ3vQqYyJ5erfzMOMFCBtCzuwEYdZU
         4oAP8jZpR8d7/ADvIZzijpYFaSVsSIQPkFF6d8FrDncChWbglH2moLDcWtypBB27u8XL
         oeew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xgO2DU8HRMWvpDqc4KwopD751Pf2sXOIzGg98OiShZg=;
        b=CjcSamOxmN4QfAjTbATKx/S99JIK7ieVnHvXZd7g87yF2i9WJn1E8V393Gk76LdE8q
         K3k9h6smLWSPvvopJBl697Fw55j00FgOLX0bmUzgpuHwsaI8xYzAV7Z8i/S14XufpWWW
         EIeNEJvROcaCXaaIksm3fBxCl58Yo4p/ZwOdA4OxrfiJ+MyBxMZfhxonwbp4TzzP1SGe
         2QU+g7Egyrp6ar3Hh/TNzs5r5RxJWRtGwg0pBfkZEu/1Q36k0v+9ZZKRBl9haiRpYyQE
         FMz/q7OKeRh4Ru/MVrjb5oNloO8TshXqAEXDa7j2VG9Ys2fHkdPaIWo+xT0MoL9xOibT
         oU6g==
X-Gm-Message-State: ACgBeo1F0Mjk0fQfEX+mbXA2+9vR2bzV+yLwA8x5iQGZWqwPNRyN9KOz
	i4wAWEnHBlLvfxoz47unk0UQFS9gDkiCxOPEbEw=
X-Google-Smtp-Source: 
 AA6agR5mfCNPANXcRDSvAvUHk+NZf0jg5+AIpc3KKLCRTJNQa33OHXtE9+XFs75ngHxvsb/taM2uLGt1uXi6+9KIZVo=
X-Received: by 2002:a2e:83d0:0:b0:25e:4afd:b28d with SMTP id
 s16-20020a2e83d0000000b0025e4afdb28dmr416784ljh.507.1659612167596; Thu, 04
 Aug 2022 04:22:47 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CA+chaQf5nGwAaLifnZxghK2dHiesGo6mpcFpb_PR=fFgp-7vsA@mail.gmail.com>
 <19859.1659612044516984045@lists.openembedded.org>
In-Reply-To: <19859.1659612044516984045@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Aug 2022 12:22:34 +0100
Message-ID: 
 <CAMKF1srmciHbCxqtTAnvUszVpZ0qeNWptFFBus88BqgQGgXEsA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] glibc : stable 2.35 branch updates
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b6f1f905e568911d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 11:22:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168843

--000000000000b6f1f905e568911d
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 4, 2022 at 12:20 PM Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
wrote:

> Is there a fix available for this issue and was it taken to glibc
> branches? I checked glibc 2.35 branch now could not see any new commits
> available.
> If there is any fix/workaround required then it should be patched in '
> *meta/recipes-core/glibc/*' OR if it is a bug in glibc then it should be
> corrected by glibc. It seems the mentioned issue is still on-going and no
> fix is available yet.


Another thing I am not sure about is if there are fixes which will uncover
latent bugs we perhaps need to look into that closely and document it out


> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168842):
> https://lists.openembedded.org/g/openembedded-core/message/168842
> Mute This Topic: https://lists.openembedded.org/mt/92807904/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b6f1f905e568911d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Aug 4, 2022 at 12:20 PM Sundeep KOKKONDA &lt;<a hre=
f=3D"mailto:sundeep.kokkonda@gmail.com">sundeep.kokkonda@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Is there a fix available for=
 this issue and was it taken to glibc branches? I checked glibc 2.35 branch=
 now could not see any new commits available.<br>If there is any fix/workar=
ound required then it should be patched in &#39;<em>meta/recipes-core/glibc=
/</em>&#39; OR if it is a bug in glibc then it should be corrected by glibc=
. It seems the mentioned issue is still on-going and no fix is available ye=
t.
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Another thing I =
am not sure about is if there are fixes which will uncover latent bugs we p=
erhaps need to look into that closely and document it out=C2=A0</div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168842): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168842" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168842</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92807904/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92807904/1997914</a><br>
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

--000000000000b6f1f905e568911d--

