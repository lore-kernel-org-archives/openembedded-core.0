Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15162.1794154005673206739
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 08:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fWdXpH61;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b0cf2c0785so863337b3.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 08:06:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794154005; cv=none;
        d=google.com; s=arc-20260327;
        b=LxK0iMkAm7G0DHhibJ2zkg9o2qedbSRVGLYJTjOyL+Theeg1nQB/SgX7Z2iimLoL31
         nZ5V1azxciEIYgLLaqWfBBPoJrDjrzKw5npd9G2TveS2bGlEzGzcJK13U+ksdwwWXVJ1
         afzF5gG6oD3wRsXCgAzgr9CaRD7XOXrvO+Rtk8m7ucHQPOp+QLsknYCNDw3JiQpPdGcx
         Gq6NMpDZMG20pjlq/iaxgqmAKUaYQwpqSbx50oj83MTk9Jcc7kjgwj/I00xBb8y1n4A6
         v82FFxhVsNAF5Ll18u1NvzPhJMMEouVsFce4So9JPB6ZwLW5xnfjX8u+3Lv7LX3KS2+2
         bIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dWkjcYfj1UjyDFA0D6eA96XaqS71x4dThiGuwqDOjbY=;
        fh=1OhkTCE7SeWDLzlx5UncT1DuIRvei4gwg2D8aZxYMzE=;
        b=a2MEOE7kCoONtUawkhRTJ2kxi9zGTReBCuallYEJh/6JvppWP6LEUuLimuK0q1b7h1
         lEqWOeGxInsewl7NsJ27zO0flQSygw1/cz/bzJ90f09YQXkmPfIAEXN1+uOiK02LNlMe
         /eNWHWXzR7dTAgmM3ICGpPuhAxu/5WGjWcT5lL+OGcXCJKg71FtYrIsnt8MvHmCvpnpN
         dJKAg6k1WL9C71t1J0isBtScBRUYQ87Znce/8KT8SDHBwu8kJs0wREn6hQQRjPKFsrCS
         Fgcwv4QglvX35cVxcXTxcDl5AxSJv5YZcq11v/IQjiGRGGGJvdrnqnDOX94DFVhhdX3X
         MgOg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794154005; x=1794758805; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWkjcYfj1UjyDFA0D6eA96XaqS71x4dThiGuwqDOjbY=;
        b=fWdXpH61YT8B2BM5N3zONMASMEZFoJFVCIXNNw04el4saqCJIN1TkJHtvipfb3pXBS
         5t6A3LLUAw+Xlyj9x+JqsD/vhCNL14SS5QFeJmvSMwudSG6q8fklh71Joxn3rmQqSo0o
         L6Wsvqrtq+esoDmqvTYZTivaCNa40VQukEEMnD3lxIAAtGZbhbGZGZZCR693D1qftWID
         tdgW4Ub8XeYC9quuPjDL52v2eDPqlnFC/m8FPwyT8j6id7Bfba8Je23Qzg72/JJ9lDZA
         VjtpQaHAksIT9hpuJn4t2lEQnvnyB0lllTw5L5VqBFM+Z2JEq2Mru7TUARvVzQ0T1fuG
         D5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794154005; x=1794758805;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dWkjcYfj1UjyDFA0D6eA96XaqS71x4dThiGuwqDOjbY=;
        b=SeK+RST/4cRjgIxc3+YHOrhRPP/iNkJm/qjmeHLokHFXheQxmmZ36Jnd1bFlQQt5eF
         alAykQb+qkn5BGe0qFr5xVgqFZPp0ZrX+Y+92Gk5bGBVkIgojyqK+e6Qi9LHXNWxGQEu
         ls5WrigJ6jxfMba/EopmMITgtA3hUGQAYE+I7ZcufymOt2rg4YfLnc8aTYLjW5eKivWx
         ef3HA2C39XM7GIuzQ1AIA6koPz0K2u84MLRkMWMChn/U6Tgzi2GrUBUvph4bCqciFd/5
         rf1LQFt2Sp3JXqyvvpEy5ciVli+e0kliNdRTnhq8hSDV8rnWfjxcZrL/t/n3fpsbPNme
         jLYw==
X-Gm-Message-State: APuU4Z+vqtZ7NWvMiKxnq1snkvwjdc5VXIHUmN9q/DfjiZHxNa58sYN+
	i1mxJqBYfB6l2ho0OK4y1gykiI7ubQ2qfhr4F5XtWSjRE1eJOT/VTIjJjeHKTKYTzlnmMiuNCNh
	/48A6dJK3oCKJxYT1Fa9TNk43JwnYuesNkQ==
X-Gm-Gg: AYBFou1cqUrep1dLiItB74r5mviFusbc0IzrprQXkmmRO3pWiWvxusTyW1poHoDoybn
	pv0d87r1Kfm4MValB7bz4Wrr8OjFr0OucF0H08a5jqHhEW41OKKrJyxJ+NwfFaBTsB1LQUDn2w5
	C7XnczRVgqMwk3tchrdG5ELXPn6bIH41oknBpPQ7Hp1VdWLGAtmgxsJ5nCEEE+lVP+F+2c1I3qq
	etQDTUQMZghVcAE40iiBomxWYn76ZuvInuI/Ty8q1sN4AlbwbSS9m8Kcg600qhNYxtG+ezW2VMk
	N09r4U9GLv8zuI7lqFo9FkgLsn2zBND4aTyyxJb+F3zrnXROOT8z7Q3d8jsdgBHKzHmPid1HYb8
	tX021d9saEAjmiUpD2jawqm1Z33A3itCPFfYCxqAar17vDkjq5ZARZnLAUykYSGH94ObCvQRpv6
	qlQxJXsAkn44Wd3YTKQlpaZ26Z3ThAuRZLXZmLTWTqNQyn1cFEdcA0EoiRtiA905qJ/ilpM/11/
	hUksVanz5Ayy+F3VeX07rnKmnNxeC2xWMtz8Z5+KsiNByc7dzSEa82Pu5GingVfjtpQKjpY1F2/
	M42IDBdXWul6Y3Osr3I6KEGf7M0WMPPJeqIYS0RkctAUjIxCMfVgxdLVwUa9f4zNHFw17WCbnuF
	Dsp2nf7sCwrNBxnOIUU6fzw==
X-Received: by 2002:a05:690c:c50d:b0:8b3:141c:b6c6 with SMTP id
 00721157ae682-8b36cb09617mr7567977b3.41.1794154004213; Sun, 08 Nov 2026
 08:06:44 -0800 (PST)
MIME-Version: 1.0
References: <20261108073103.1232032-1-khem.raj@oss.qualcomm.com> <344401.1794136625546968468@lists.openembedded.org>
In-Reply-To: <344401.1794136625546968468@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 8 Nov 2026 08:06:17 -0800
X-Gm-Features: AclHuK9cFKk7M4e6k74yVhJU09YQFpm3y88p_WZXWLzZXg13TozkgJdzOHhi7mo
Message-ID: <CAMKF1spT5h6qRr5qvc_i3xkCPOgQKpPDeZkWwM3Ptv6oUQx71w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] packagegroups: Add clang to the SDK
To: SunilKumar.Dora@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000017f395065fc60856"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 16:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249756

--00000000000017f395065fc60856
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 3:17=E2=80=AFAM Dora, Sunil Kumar via openembedded-c=
ore
<SunilKumar.Dora=3Dwindriver.com@lists.openembedded.org> wrote:

> Hi Khem,
>
> Is it intended that this is unconditional? meta-clang gated the SDK
> bits on CLANGSDK (default "0") and had the target libs as RRECOMMENDS
> under toolchain-clang. With this every populate_sdk builds
> nativesdk-clang (0 -> 98 entries in task-depends.dot on master,
> nodistro/qemux86-64).
>
> If the opt-in is meant to go, maybe gate on SDK_FEATURES like go/rust?
>

yeah I think SDK_FEATURES is a good idea. Let me try it out and prepare a
v2.


>
> ~Sunil Dora
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#249754):
> https://lists.openembedded.org/g/openembedded-core/message/249754
> Mute This Topic: https://lists.openembedded.org/mt/122155324/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000017f395065fc60856
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 8, =
2026 at 3:17=E2=80=AFAM Dora, Sunil Kumar via openembedded-core &lt;SunilKu=
mar.Dora=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windrive=
r.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div>Hi Khem,<br><br>Is it intended that this i=
s unconditional? meta-clang gated the SDK<br>bits on CLANGSDK (default &quo=
t;0&quot;) and had the target libs as RRECOMMENDS<br>under toolchain-clang.=
 With this every populate_sdk builds<br>nativesdk-clang (0 -&gt; 98 entries=
 in task-depends.dot on master,<br>nodistro/qemux86-64).<br><br>If the opt-=
in is meant to go, maybe gate on SDK_FEATURES like go/rust?<br></div></bloc=
kquote><div><br></div><div>yeah I think SDK_FEATURES is a good idea. Let me=
 try it out and prepare a v2.</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div><br>~Sunil Dora</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#249754): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/249754" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/249754</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122155324/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122155324/1997914</a><br>
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

--00000000000017f395065fc60856--
