Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50932.1795428203863651971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 02:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ABeeRG7w;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so21529765e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 02:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795428202; x=1796033002; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9W7L0uMuOdv72cJ1XLyIIG9vHtLH7hu3yqQFS202SmI=;
        b=ABeeRG7wv+YTmOvnLUTMHTIlI1bC7U03dO+PNtG3DyUo9AtjUzkIzHZe3ywhI4Vhra
         cS4oFqz0Pf8ovRmIwRwwLhq9rPH8EJudOpqbCec8x1fkpJIaACLzXV7lYJpsKE3s+sOI
         ARnAYABwctHyuoTkGcU3w2NJKX10HnwEV7soCyua+xJM/VsNry+81iCgjlenjou8cGoD
         GiVn5V6uw1ffbh0SLT3Od3/g/Uln+GwEbr7p11lV3IwIWqzarwjLcUatmu/ok9m6cq2x
         K01TTFvBzPe+fU9GN7Z7fcM8fSvHSgtt0SN57qVjPXqPNpP31Ru19Je5hBf8VOWNkKRi
         wPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428202; x=1796033002;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9W7L0uMuOdv72cJ1XLyIIG9vHtLH7hu3yqQFS202SmI=;
        b=xFBOq+Li+v7gC3XiilV18Wk2F8yd1pLDBcnLaiogt/cbQ0stW1pKyHVif9QIaxrbJW
         J4G9Gg0DpDPqmz7ZvlD1fxdFrK/U+TDO4ngmewk4V2mzYC2NjZLQH1a+K4Nw8nqfOWJ2
         cnP3xgLjfkYmQIh/SufV4UsLYs6QG9wW5qMakrd9Ttlp0fwnIbL9FOq80Iaiyvr1j64t
         CV1n7JkTto98BnHlsgH1D5VurdmjRs2vhfrYsC96xPViVRYcPD0qtGXMCxvt5pkU/PoY
         XwiOuS/d8MBpfveAd0f36CS/71TKjAJjba9113DQqwq7il4lqqEGAU4m3Z0LwDLSFi2Z
         egTQ==
X-Forwarded-Encrypted: i=1; AL+hErEpjshiEv8IOauitdMfhQeTr5PPE6UVs728qEk+XMgXFzp64v13qene9gXx9E97jUZPiKWPveAdrshjoHFmzmxT+A==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9tPuDWujE7HFq1vlxFxaZRZVPvj2szG3B/ArBuEuFQ4waL0hf0
	pBnKQA1FzSxynvTnq+wcteV8FH0m8M2pmahwawZsZTOrD/n3jnC6toXXmnwKQcPGJMLQX4GrhLi
	GnZ+kLA8=
X-Gm-Gg: AZFdTZddMzIWJrkO+tM/THl+NdNTGn1v01Wy4VhqSvfZqofDHUG4GhC1X2WpEBY8IWg
	rblPhNKC4WLklf1fZqT0VTkyo11ztgnB9bRw1WYrfI530PYeB5mvT5/Or4VvitOLWTog6/BA5L7
	49FYjNS/e2pUO7EE6dJDSPfIxRpKPXxkWr48Hip0UVqKpwPdOmKbMHcoypcotfiQTJZM+sbp2gi
	mNF4VU8sz5LuI0/HRf9EqZaLh6J/nTyOu4b7rjae5XNDSBrUIHETZPamo19aXYkF9ud6uXdhPcO
	iCHieVBQpO4L/PMyDYzuPnW6fwKQXNwLxOjRibRRVeyYGpfubisJzzFS7r9vEZUvHSGmND6nGz4
	l2+WIuKRkHdqnUw2D0QvmHdKOtjgHuxU4/VEhXbUbkpV9kqp3FdhvvflNrL8efmiqGCSkftwJsr
	47Ab9v8EaTMpisIv5A0b05gM9oTDysqzXAG2JzX1yxN6q+rsOyzf7u3HWUgXJrWYtd7MLW+NV1r
	INx4ClgTySfDkmZVBilIHitMK4gLetW/q/Gs1he1AhL8gZQs9UMsy5K0rLf6rgGZOLwe+1zNPzE
	/nOiG4NeYtYmVBzAR0SotgVAoZsw9bDsySekjeegGBQDmMQUPDG44p0Fk3U48pH209ssTowTQGg
	tgFGw7L0r82YXCA==
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb8880988cmr238148605e9.6.1795428201877;
        Mon, 23 Nov 2026 02:03:21 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm131268975e9.3.2026.11.23.02.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:03:21 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 11:03:21 +0100
Message-Id: <DN2I6H0KND4Z.302IVF6X8C89G@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 1/2] curl: fix CVE-2026-87864
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261030085350.13089-1-adarsh.jagadish.kamini@est.tech>
 <105529.1793873653631988994@lists.openembedded.org>
In-Reply-To: <105529.1793873653631988994@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 10:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250894

On Thu Nov 5, 2026 at 11:14 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> Hello Yoann, Adarsh,
>
> I submitted the five-patch curl v2 series on October 23 [1] and
> the twelve-patch series on November 4 [2]. I have also prepared
> nine further patches on top, forming a consolidated Wrynose stack
> addressing 26 additional CVEs.
>
> These comprise 25 source fixes and a conditional CVE_STATUS change
> for CVE-2026-19931. The stack builds on Jaipaul's already accepted
> CVE-2026-80230 fix.
>
> I noticed that Adarsh has submitted fixes for CVE-2026-87864,
> CVE-2026-92388 and CVE-2026-92389. My twelve-patch submission
> includes 87864 and 92389, while the additional nine include 92388.
>
> Could we coordinate which versions to retain for these three CVEs?

Hello,

In this case, I took all 3 from Adarsh.
My general rule of thumb for choosing between similar fixes:
* I review first the one I received earlier
* If I have to decline it, I'll review the one received after
* Rarely, I'll take a later patch if it is easier (e.g. a focused series
  instead of a large one with rejected patches in it)

We have yet to define a method to avoid duplicating work. But, in the
meantime, I suggest to monitor the mailing-list so check if someone sent
the fixes you are working on.

Regards,

>
> [1] https://lists.openembedded.org/g/openembedded-core/message/248493
> [2] https://lists.openembedded.org/g/openembedded-core/message/249332
>
> Thanks,
> Darsh
>
> On Fri, Oct 30, 2026 at 02:23 PM, Adarsh Jagadish Kamini wrote:
>
>>=20
>> Backport patch to fix CVE-2026-87864.
>>=20
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2026-87864
>>=20
>> Upstream fix:
>> https://github.com/curl/curl/commit/3b547de301342b347fb3c6ea6ae797
>>=20
>> Tested with ptest:
>> Before: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0
>> After: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0
>>=20
>> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
--=20
Yoann Congal
Smile ECS

