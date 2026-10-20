Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2035.1792481012979070305
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nEmfCSdg;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso234890f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 00:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792481011; x=1793085811; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBhmtRwpuhPLRB77cKfofjzvBgIJE2y/04W+hfJLncA=;
        b=nEmfCSdgSLAanxzhs2yslVSR5PrRa6QN2FxtQ1EelQOq392w2x2W9rgxDK2ox+ADhm
         RkXHsVStSU+NHxXSAgbLjca2nMAmiW2dcFDgfxAR8OTVeLnbPYoqiaJ6SdwYhjMyU2s2
         CGRL/Ncin0jGQv0IgHRA92FcYXaowxEjOrqlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481011; x=1793085811;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SBhmtRwpuhPLRB77cKfofjzvBgIJE2y/04W+hfJLncA=;
        b=IP2Bf0+lYZvasP95RfxHBSvvvtbgZZv2zXPX58OdgPZck6AWargkM6Dn2CK8E/ZMuy
         mena5sFjQ0qoKdo5aIGDwfYWo6S2WCxGkeQRvJ2moe1kUl4QWijArA8jNOEKLlWWr4yY
         sbE6c2PFA91+3FV4YnWcJbTyCDml2RJKG0wjEY9o6IzvyLajG+lVJLowQn7OpepEUu8h
         LgoLvwbCeZ+phuEaXfDLNaOZTcnG7KsD7nryawoBLnDhcpo/IemL2HDlP/eluK+ypDk7
         fWlgSSFMCMdgA5JIR9/1gKxvQXCPzMv5Q75IEPLN3SyJdZl1bgFlBBMvs6UsuFodHoIh
         jFqg==
X-Forwarded-Encrypted: i=1; AKwUvBxyDUdFu9G6FOlw4dcjGc7NUHQUocCudRUSpZPr64M4IZ+A7MaK35vg7fm7ign7jxdT2tc9lyXnn+9r7JsNoc8P3A==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKSCGSdn+DVxWzIndxpZ7vj9aiYQTFHoM5Y49NgOKARTve1oXWw
	s1mZM1UTW8m7If6BWHTmC9auYi4m4Ncd10d1nSMA+vnDT3phV9O6Odaam9vCoOL+VOk=
X-Gm-Gg: AYBFou1wIrxRSR8AbOV6e6CAI8BrTSr5UJHyFUrLqlrt5hAWb0DTZNvjv11hOCV1J63
	/IejKyfMEYnVXayivSiqDyAmcb4He0I6cbMaZtpRnaOLP0ilT3uu8GRBUjybYgZ3DOR9Xep9oSk
	yAOAAOAet5u69uJm5TtMHqJCMusQlkaTgZIK6uauPl+OiPCrwyyYLroJv1h8CMjxsmD7ElLhlpm
	//7tuF7TF9VtOsp7ZniL0VVecLNOc9oN/p5gdRSWyw59pP+lXLjNCPQ/+pqBBgX29rufIaGhG5x
	eh4/z/zRV+fTVduNoF/gUyLBMuwc1MWlUB/51Pp+nNvKT56CIFztUDrWQl3Ld1jSzN1+n/uVNhp
	MPs/Z3sfbHGP8nBNXx8V3llmeWILeUbO8y3ZZM95327+5zvGYwZH+RHbGn8u5akgYVu7bw4OQ4N
	SKB6n7siIfrM4RPnsDBwJu6FDkeBApbFmfo9yoYBGIOf4eW2JSTrGgQq0K6+4pus0bKZ+j1MQHQ
	bRQvW3oG2GrbhqjYxhkDoYq/qHHKsPih72Vh/kGjW22mbc8FWmik+9AeLxEGK4gSAaL0t8=
X-Received: by 2002:a05:600c:4e04:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a1f4c7f3c6mr26942335e9.5.1792481010897;
        Tue, 20 Oct 2026 00:23:30 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a02-8440-a50d-9979-1d13-70a0-c696-7744.rev.sfr.net. [2a02:8440:a50d:9979:1d13:70a0:c696:7744])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e701f272sm62385285e9.1.2026.10.20.00.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:23:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 09:23:29 +0200
Message-Id: <DM9HHJQJKNC2.2HIGFFU25U1S4@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jakub.szczudlo@nokia.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH v2] libarchive: fix CVE-2026-15028
X-Mailer: aerc 0.20.0
References: <20261012110033.11294-1-jakub.szczudlo@nokia.com>
 <DM91OKWLPVM3.FEZC67AJPXQB@smile.fr>
 <2200835.1792477541899712457@lists.openembedded.org>
In-Reply-To: <2200835.1792477541899712457@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248238

On Tue Oct 20, 2026 at 8:25 AM CEST, Jakub Szczudlo via lists.openembedded.=
org wrote:
> Hi,
> we talked about it in version 1 but I forgot to mention it in commit.
> Anyway this CVE was fixed in 3.8.9 by cherry-pick:
> https://github.com/libarchive/libarchive/commit/22ffe8e8e459970f3bc86b026=
7493fc4aa8249b8
> that is both on master and blacksail.
> I can mark them fixed there if you would like to.

Right! I lost context there. I'll add a note into the wrynose commit,
that will be enough on our side.

Could you contact NVD and report the erroneous data?

Thanks!
--=20
Yoann Congal
Smile ECS

