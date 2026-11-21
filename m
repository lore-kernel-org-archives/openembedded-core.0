Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21703.1795286024757600983
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 10:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=O0/xSQIL;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso14739275e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 10:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795286023; x=1795890823; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QHNpoapUrWUljVflxUuWXwOo0+llaHKYLYtNq+7tImc=;
        b=O0/xSQILD+zVhzismSslfdcpKIfucAWaXEcr4alsDYXbdIj12zhvK5SWtNa+lGXE0y
         vNqTzSTIB60TJIAokx6efO4rbeep4h2krg9GxY7NH5/MIbWbVOuuO+a3hQDe3XbQ415G
         T7JPvhBfp5Nvx43Qu1kRhLrm3U/SU9ZtTb4f2gETn6OC8/bKfe/vMDsWgrxmp4l6PjBF
         i2okSrfiVeTaDvlaMpuW004Ng3nrl0cTyva+53rZgJJ7fLW2e/n0Gz4HZZncJ8MBtgha
         0d+88kXT68e7AxjFtUTq+jFASmaubgUi0sSFDZJ3jHJRaV6VmX1NXZ4Hq1U/Z/elB3Cf
         Q6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795286023; x=1795890823;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHNpoapUrWUljVflxUuWXwOo0+llaHKYLYtNq+7tImc=;
        b=p9F+jcnQRgBxc2J+0ArNAO82lNjMsbKPA0kDptZOaYiFvSlIv+yngdrz4b7Z632Wwq
         L5mUmMn6DcAKv0jT6qSrcWuoucIZ50H5nA1FyBvJsKMcel6tCBtG7rhpSiLy749MubEF
         ECIBMing5KRbidEVCqNmAkI11iwzxRy0gMSRdoSR/93751utVFOgnW4nx8vAzKI+8VA6
         J7LBTUenucC7QDh79ItncUP1cHInYIFezhkKp4jdSB+OWu48+Mv/Nx3pmmJEsL6J3KWH
         Tw4cUl6al71JMkA5s+z5tXcAFtOcoESYDl37TEde3Z5om4O0ok/DDGuaElhsZZMQVctV
         EQvw==
X-Forwarded-Encrypted: i=1; AL+hErHODR97h9ct7W7MHGTxSblR/eVioWbhIMVQjbocXKPFMdMI7tw1jFPJaiQzRBcICWgmk/hKTC1+ajlGhSTpY/U5Kw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/tmXl8SJgyl5pLx758M24reuyxbrmq0ahs2/JncwN9+Yl6fooO
	cy8cSD5Nzjmkf4iCefbb0sIAzTh7XVRFxxTCzr5U6KR6qPBgbSaigwGSw4FaWLGz8gM=
X-Gm-Gg: AZFdTZeQr1JWJnEVqW/xqWY8JJrn0JDSnWVJcYP6L/3y+9Aj4O9CYZPU0+xWeNVRPX5
	He60Pag1dJ+fOiEgzsnnUgigSxbJRvAL7/Eqdt+HBh+71WPE0cpHnAiyjavcv+RwKShwHq0hNHh
	AA7r39R9fgw2YuD0D4C2hVkZAlN4xpoa7kplq+IAbFL7uyGD/x4tYsc79HWv6q1dOhRc+cYewks
	uXjUZ7gK83eVKlicT0BPYpfw00E/uA+W525UdkRUOaVdpnaiNr/KAq7E7mefiBXbO780TyJpIqo
	nedaJ4Vza7U/WYys/uekhWjWdBTJfpfUXdzgUqwHUpo3CZ3ZpvA3/C3wejhMAr1Akui0JgYrxdx
	3+aG2SKYitHAh8C+Hm+2kvlCCkt7RbyD/3YwKDlHBGaI3sDDOiitKsL2YhOWImdXQs5OQSCZrni
	6hmyGf/VO2p+TN+4cGuZp80NIijfY94ibyhtWdO2j8v4Mkwy6dX2PqpHwBe5oH+Fq3o8sbS2DNf
	mKEg0Dd1roSujW6XTXLcuGztBaEU0KxTsDFXQShLFkUyMpqEb8eN45KqRQmhcZQB1A0PEk5S5d+
	lCHIRc+obtu9zNr3MoxV73e1VY44eAXwRSWUksCroaw5KIiG05PhJOvP175n/cav9Fb3VP2Juto
	RTo6Y4GJ8CyOebRJH5A==
X-Received: by 2002:a05:600c:a086:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4bb887c34bcmr157514045e9.2.1795286022828;
        Sat, 21 Nov 2026 10:33:42 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa0009d38a8173e0a09d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:9d3:8a81:73e0:a09d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm377851415e9.4.2026.11.21.10.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 10:33:42 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Nov 2026 19:33:42 +0100
Message-Id: <DN13S4TY0UFW.2VLT7G2WN9AQR@smile.fr>
To: <arpitpa@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 02/10] sqlite3: fix CVE-2026-119373
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
X-Mailer: aerc 0.20.0
References: <20261106085405.3517095-1-arpitpa@cisco.com>
 <20261106085405.3517095-2-arpitpa@cisco.com>
In-Reply-To: <20261106085405.3517095-2-arpitpa@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 18:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250854

On Fri Nov 6, 2026 at 9:53 AM CET, Arpit Patel via openembedded-core wrote:
> This patch applies the upstream fix [1], which prevents a buffer
> overflow when merging FTS5 detail=3Dnone prefix lists with negative
> docids. The GitHub mirror commit [1] corresponds to the SQLite Fossil
> check-in shown in [2].
>
> [1] https://github.com/sqlite/sqlite/commit/e1c9934f9f11a499029abb020ea71=
5a08970da80
> [2] https://sqlite.org/src/info/a7f8c92f62
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-119373
>
> Signed-off-by: Arpit Patel <arpitpa@cisco.com>
> ---
>  .../sqlite/sqlite3/CVE-2026-119373.patch      | 56 +++++++++++++++++++
>  meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.p=
atch

Hello,

FYI, from this series I removed 2,3,5/10: those CVE fixes were sent a
day earlier by Jo=C3=A3o:
https://lore.kernel.org/all/20261105141827.2142719-1-joaomarcos.costa@bootl=
in.com/

Please help review them, during the review cycle.

Regards,
--=20
Yoann Congal
Smile ECS

