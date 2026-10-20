Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7788.1792503794079952386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 06:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hbQil5W9;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso5261305e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 06:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792503792; x=1793108592; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lPSUnWsHFOPFc9F5KTYACe0+YjyLjM8pEMsC+00HQ8=;
        b=hbQil5W9YMIVV+TAIZ6G33/9vSX14s+Gqk1TsE/wAneVHQZmf5HOcDChbDnlzOtI7p
         c3mbGbv2TVEtTfy7QTajDn8NgvfThvEUDntmMEOGdPpaU5frWAgP9gQ1Ut6ShB8rKlXF
         aURVE4T9X/16RlbQRiNPFxXmhlqmOQTLJC06o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503792; x=1793108592;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8lPSUnWsHFOPFc9F5KTYACe0+YjyLjM8pEMsC+00HQ8=;
        b=1j4PlmWmXcmJoU3NJBRqy3wzS6mnKBXv8VObuIwkPbUP/itfcftzFPtFpoJDeLKxZJ
         3Lxb+LlJymvRpYINcUMY5UkHCm+hn2C0WRB5C/AXPpFVZE//S0DrU1oiSmt7zuzD6Z0H
         8luTkYlSAdTa//Jp2uKzW8Ju+5H5rYeNqLjVsnjq22NsNHipv2kMiW6syRtnkGGOlg0H
         N9K9MWbaD3q/tM75E4+5c2zYtzhgjUATgAe4iEV629Efxp/0MHVSlc36S4PyXSQKtXtb
         XS0lzyDGh1GFiiEDRdOv0tDp1ePkTX2kXrbvWW/zmLp18eXDxQ5XAW9ezEqch2MOLCtZ
         +ypw==
X-Forwarded-Encrypted: i=1; AKwUvBzWqqx6di9agKsCTwy4UmFGtDYKh/kvBq7zwioPJzk5aBu3AdmIi8wWKnhuNsg2H3NqDN/KKq19VzvSXWamXyc0eA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJa8haueGyA73oPlCk6QNQWQKCYzH+es0xJGp35EITRE1vtThU/
	oINtJYtZ71oKUcjaUb9XoHdW12HMKVRafrWu2uiPzMjEyHRZmdY2tN0GXtsU8dFZstqntrKcFtM
	PrKpf0tM=
X-Gm-Gg: AYBFou34o6XMUC1u5tjzlJCT1JTuzhCqj57InarfsOy/QNRR8hJ3XfJTHkfD3gT9gK4
	WmawzB4BMFX4Bfpm2pb4QWYbgvrwriMgIFQfMugJJ6ygfpR+oh0JAWgGNQkD7ew7LEQ7PvJGRu3
	1rA8zn2gUVCqxMoBQRkQ4GDW6HE47uGyUPFwfgA/BkxzXqQiHzF/Q904TA0/0PD3iN/WGPU7dqz
	uMY6muImdeNuDHpu42PyzVnRfkTncYxcK/nB14qD5qXsg2aO7ntz0t02EwIygkVqY6OG+HR+5o1
	nWvF9pPSCcKsDRpBETh/Wryfn6W6BkTGBtIIT+SYCmH1xHn5dWfEI73w1HqNleWtcgmei9i5gNx
	3E/5+Fy4NIvvTEok6uY9RJWZLl2jnKQnTIuWCgBuo6jksVNqYVxBC4kddFX5eZSqIFR6BkPhm0E
	/bXT9NOlGYAjLqvcleGarQZP9pcJaWnCK5G/Nn43cc852hNxLh2qBfapQ8xqB4kE+K7Z8TZ6fEQ
	CUDG2DmwhUFoZymplgff6oaX7aOTDcwoHfviXGAOFq9ZKfGTgHzS16su8ob
X-Received: by 2002:a05:600c:e555:20b0:4a1:e57b:667e with SMTP id 5b1f17b1804b1-4a1f4c7015emr32671555e9.4.1792503792197;
        Tue, 20 Oct 2026 06:43:12 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc809csm76881065e9.8.2026.10.20.06.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:43:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 15:43:11 +0200
Message-Id: <DM9PK9L8YKDY.N26OH5ZZOHON@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/5] curl: fix CVE-2026-8926
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261019064320.3978613-1-dkelaiya@cisco.com>
 <20261019064320.3978613-2-dkelaiya@cisco.com>
In-Reply-To: <20261019064320.3978613-2-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 13:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248286

On Mon Oct 19, 2026 at 8:43 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Backport the upstream fix [1] for [2] to curl 8.19.0.
>
> Include entry-selection changes and extended test 685 from [4].
> Keep password-only entries valid for a user supplied in the URL,
> while rejecting passwords tied to a different login. Reset login
> matching state when changing entries.
>
> Include upstream follow-up [3] to cover URL users absent from the
> netrc file, with regression test 1646.
>
> [1] https://github.com/curl/curl/commit/4ae1d7cc2643e4773a136395f12bc02fc=
6867854
> [2] https://curl.se/docs/CVE-2026-8926.html
> [3] https://github.com/curl/curl/commit/7ca5f939c8403db7ede21e2ccb805a65d=
3329ef8
> [4] https://github.com/curl/curl/commit/a327a5bdedfad6b486bca4e0a1a4fdac9=
ab298ca
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../curl/curl/CVE-2026-8926-dependent.patch   | 140 ++++++++++++++++++
>  .../curl/curl/CVE-2026-8926_p1.patch          | 100 +++++++++++++
>  .../curl/curl/CVE-2026-8926_p2.patch          |  84 +++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   3 +
>  4 files changed, 327 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926-dependen=
t.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926_p1.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926_p2.patch

Hello,

Since this is not simple code to review, I've ask my LLM to review this
series. I think it found a regression with this backported patch that
does not exists in upstream's:
A netrc entry with two logins gives bob alice's password.
- With `machine example.com login alice password p1 login bob password p2`
  and URL user bob, the final tree sends bob:p1. 8.19.0 and upstream
  8.21 send bob:p2. (LLM reproduced this on the base and final builds.)
- Cause: the dependent patch removes the if(!specific_login || our_login)
  condition before found |=3D FOUND_PASSWORD, as upstream
  8.20.0 did (8.20.0 is still vulnerable to this CVE).

Can you look into this?

Thanks!
--=20
Yoann Congal
Smile ECS

