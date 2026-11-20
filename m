Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7454.1795215946117988033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 15:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=XPiKcRoO;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so12484025e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 15:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795215944; x=1795820744; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJyzrq73UjU2axzLyfPAdToEvQGa4VzkhkJsd1A5N9o=;
        b=XPiKcRoOEl70LeVnwKDcuilZDAlcZgTVj4NHYVr6hx0HC3GPlfX/QQGAhH0nQvV03L
         3LStmzsIGjVAkW1zg6h8ED08YUIcdzfGqv8+48YhiCt/uCn48RhSKRj8AJ79I6+kmb2M
         rALrFdEchpPUgF2Pjsnguge1eibeqL0un8M/zb+OF/gW8ZEEAEqVH4f1IQfcicnKK6tM
         6o/WHH09gty/yvvmAYAjn4UG4TY0gTF5TVKgNH1EtiQZkdVVpDwfl2tOjQkRql0KrDLr
         lg3KOUuNNPOlK4lSM7SqYylK9qt+DoROBZubwiOI8Fuvu3VDaFaoYF35C+MNz8iNGabA
         np9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215944; x=1795820744;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJyzrq73UjU2axzLyfPAdToEvQGa4VzkhkJsd1A5N9o=;
        b=pNH13r3QMrWzi5Z12dk670XLAoooU+CVpPycEPNBr5CCh0IIdSSnHcIBfMy304IBtF
         CtnaP+XicZlMZBackA9QcdZ7ub0rf3RiDIM/WjL8xGV5bAUGtF8YkE+tdHKSoisepPvS
         o65SUbvSSjaZfywLNi24qwtOZSlpXQ+bI60yVxkFkOO6kGv7JfDN+JPjOcEpYy9zu+rI
         ILs6NQcD0BiL06769qY1WMsIvczCTQgyzSo2C+tfj9Da+FWWEtAC2Dooj1t0WlBmui44
         K+TVFgSQAm6V6XMFvUc6Lz2Vx9dlTN25duy7ke3wiUgxdVi1no3wHZMFCmHuYJRZ7yT7
         lyYg==
X-Forwarded-Encrypted: i=1; AL+hErFtkUCSqpF3rK64nSynpmPt3tOQ3WCThJtnBnNBTleBueXI0pFTp+Fcx3kglQ3zz0Q4KjeG04tDNc9enPGXH6xxzA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8L4ZC4Hh8tDgLBzI7+sEbrOylc08DIore9sFPqg5T29ocAzx0i
	E1PnBj7W3QyTdlelJu9hPgI02G7IciNSlLElhJBgGdLvoE0fotXdupazb6rQbhzor90=
X-Gm-Gg: AYBFou29rJRKMujcP+3Vp3r9Oh6J6PXY97jbzdykN/IO8QOaGfGvYbsFRpF6tC8KY9e
	rzC7j1hCRy8IrlQvP0yo3CicvzseaAfmgcAarUphy9W3HjxbhITI600S2s0vYf2eU2vIa7mpoSt
	menE70P3PBgl8P3+M1FA7hiXFjHhnnj4IF3F/vSuTsssFPpmfX4jzNORflHyk42P4gX4Qppfhic
	LqgftHY5coNPpeD0+cyEQ3i1RTZf647Tg6BsGkFGUN93FH7MvgfXoMNs4eRcUqlf1byTuOBhnPi
	OeQ5PAh/1T0yFOsLZBaKzrKlh/aji8ZYAsHfzlPMHVkRoYDiBMm+Sw2FVtY8WT4fXiBZfTGvHSL
	DfDThp3qj9xmo1AEEdXCcFlpN5m/my8b71qyCQ+K6BRzGlJgpGHFralG59qDfLPMs2mlrDc4EMw
	nxj8IIR8uF2fyfA9te6bqWF7WxWQ1APSprVnW9kvAKR5xCOeNReT+CQ9Li4fSIZppP88lU67bjS
	gPsNMoEsdwNU5qwI5DliGeH9Fn9Q8XgzXiQNUMt4XBZE5ndBKH0z9mc9lzDhzIcRqTelnyat0My
	Zk7Qwc7McNeS7dmfOL5hpoN8Me3onrfF3F3DAnaERJxMrRXvnIW+o/BM84TU5J0xHOvykQh5atI
	ExUxNU7KBZdZ/MHe2
X-Received: by 2002:a05:600c:5251:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4bb8881e837mr94885335e9.24.1795215944410;
        Fri, 20 Nov 2026 15:05:44 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00b03901bd7f693780.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b039:1bd:7f69:3780])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm14667075e9.2.2026.11.20.15.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 15:05:43 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Nov 2026 00:05:43 +0100
Message-Id: <DN0EXVAABCIP.YDZIYTDBHKP0@smile.fr>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 1/1] openssh: fix CVE-2026-106587
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261016035448.3083867-1-hthakar@cisco.com>
 <20261016035448.3083867-2-hthakar@cisco.com>
In-Reply-To: <20261016035448.3083867-2-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 23:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250825

On Fri Oct 16, 2026 at 5:54 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1]..
>
> [1] https://github.com/openssh/openssh-portable/commit/526fd2771342f36142=
099bec82c49ce0457c5016
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-106587
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../openssh/openssh/CVE-2026-106587.patch     | 76 +++++++++++++++++++
>  .../openssh/openssh_9.6p1.bb                  |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-10=
6587.patch

Hello,

This patch is blocked pending a blacksail backport:
See equivalent wrynose thread from Mon, 09 Nov 2026:
https://lore.kernel.org/all/DMQR3DP72ES8.3KANJDXOTSO63@smile.fr/
I will now drop this patch. Please send a new submission if the above
situation changes.

Regards,
--=20
Yoann Congal
Smile ECS

