Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3302.1794618067661774667
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 17:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=YHir3Wfp;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so20809105e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 17:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794618066; x=1795222866; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WaGDs8axYBr0iorlj7l+1W1LmVyDE0O126rhz53CQ+s=;
        b=YHir3WfpFmaqLyiwxmW1Y+dTdEDQ44eafuvl6yIYkha4AFaDHq60328gSZvsuGnFvU
         VZzl0/7qisO9cLo7E6I8hPk9bfzprbkJrkLsvun1Blky3RlHukkp5KB5TcnnqyLEICRw
         JIJARVRBLie2aC1Mq964OrKZy25h7fuvc1qgtqkIySht0v5J2/Z+FBCTWKF6E0bNLEwY
         oHyHU1nb2cf+AmE2SBmrqoB/6gihtAZaKSVJYFcdpookc/VD5F8JH/AbCJYj8Z56HqHG
         xFoHEnKIHzYfbyBisTU8XbPt20vmOqwnwuuLNzfA3DR/yui3CfRLZ7vXD8jemHijVc/f
         U8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618066; x=1795222866;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WaGDs8axYBr0iorlj7l+1W1LmVyDE0O126rhz53CQ+s=;
        b=OAqMVS4wqwUfohIwLOazvbUpdI6Q28+FEHOE3t7CKEdy6wyQnbWFMfPeJzJ7phTRP5
         BKIyecLzzuQST8FX1AgBikd+YfOS+liF9EOAX+8nhjku+KyTtgJBMVTbrYW9W0uuUE6U
         a+kQTyEMLvt4+fWiILQbvPp2cEsh3iy4cEHTm9C8WpjALSV2p7RxMSH4twklubX/Ea2U
         ijmdlxiHLKVc3VgqqG/AWQpVmHNAkAS2POxQflPp9j3KgR9jd7+plGQ5vbigoQ/P1Yio
         5w0XIrZmM+aXOs7MuK2RAsVZW3LgdJtM4r1s7Hngg3xSDhGkjus+wLILjrb32pCyuMkH
         CL8A==
X-Forwarded-Encrypted: i=1; AL+hErHrZ2vaILgeDm4zeC1vrGPVVnmMkJtHQKugkBCJkk1I9kNthr0LU6k2/1fpXtY/GYt+kTZg2UDEE1r+VULqFuIM4w==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9OpTgiYzZum0K/NKvjl3s9tyrrsALKxldyPFPacgZSsDU23FNg
	rZl2IO0zqFmQc/FU52X6RA2nLD+Jp+IZdCjFvIGC/F2tWU3zA4OWfQHGf5FepTdmt8s=
X-Gm-Gg: AYBFou3AvZV+eU+e1JBiFaVKjy2uau9x2QQD5MItULF2L51vXI2DSBjN/4x4n5f+R3/
	+2aUvL0ii8q4Rk8DmqLu8KhiqOi2zdqZjln2lER/TGlCyLfvjKLoy0jGKyusXWsUvrBF2lwT0Ok
	dN6lEbkMi+Ve8kAUQaJ6fQ7SoFy1MB5C/tJyGm/O8gZ8iQEJx5uxSchkLsBqFZlmIrPdKzOBsL3
	BJ5LZsBwiWCz/laRWvY/W4pkfV4JbchEAONCP4dCKtjSAWO1P7O/4XwQhQqYuOSbu0vEZ7d2Q8W
	F2qxWboTXX8ylx6lRsOLqTeNWltCh5JVX0eKu6vNgTGmLKgmMnYRWmTK4iBj7PoeuKgprre56OS
	wxFT6pBjPf/qxm9wZu4a2ts1VGuzkOF8oMEVuvMTiGgrFSa6Q+UCDGhdrNrLziHZWzAsL0X2B5G
	fSk+s16LdgQAtD58mIGqEd673caEa0wlAth/DkZkRzQWL/X9fiPpLl1QsjihaBECPjib18bJNvo
	HaoF11yGq8KxEuBHXXdNFOdS6hR3Kl8NGBmXlivayU+dVGWOaaKGWUuHvw/+xiINXwcg+MCGPBq
	3BayP6R/hoNUWzU7RRJ5+szwHPWVZPDLoFLMronbym7XxOVvgXP3VPYvtbCAw9r4XyAV+RfVNHC
	NK8kpTY8xpB8/2hmDHA==
X-Received: by 2002:a05:600c:859c:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4bb55a9646dmr71732195e9.22.1794618065745;
        Fri, 13 Nov 2026 17:01:05 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00d795e58479169e39.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d795:e584:7916:9e39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm90947675e9.4.2026.11.13.17.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 17:01:05 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 02:01:04 +0100
Message-Id: <DMUJ0DJH2W8I.1GYOXI6STGEH8@smile.fr>
To: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][PATCH v2] perl: fix CVE-2026-12087
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>
X-Mailer: aerc 0.20.0
References: <20261104105552.2044799-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20261104105552.2044799-1-jakub.szczudlo@nokia.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 01:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250192

On Wed Nov 4, 2026 at 11:55 AM CET, Jakub Szczudlo (Nokia) wrote:
> Backport patch to fix CVE-2026-12087.
>
> References:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-12087
>
> Upstream fix:
>   https://github.com/Perl/perl5/commit/de19a0b0ad1900fef976c5c1400bd8f11e=
c6c6cb
>
> Tested with ptest
>
> Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
> ---
>  .../perl/files/CVE-2026-12087.patch           | 161 ++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.42.0.bb     |   1 +
>  2 files changed, 162 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-12087.patch

Hello,

This series now conflicts with "perl: upgrade 5.42.0 -> 5.42.3" from
Jaipaul:
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D52984&arc=
hive=3Dboth&state=3D*

Can you rebase this "fix CVE-2026-12087" on top of Jaipaul series?

Thanks!
--=20
Yoann Congal
Smile ECS

