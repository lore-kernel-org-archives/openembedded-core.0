Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52258.1795433984042812654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 03:39:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dnQhKgEf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a32576da88so1807190f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 03:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795433982; x=1796038782; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p1HIRjQ/VX4G49C55tcs4r1A/8djQo6CwN9mtnhYuM4=;
        b=dnQhKgEf+1w+jlGR8tDImi4mf+pNsoXV4KyXsO5yXoRTmcLA95yNSlgrto0O+aZMLC
         NExyCL/R4KDL5pWCgGt03IMCJYEAGZ1MpSifY/2OR/7eimbfNMOBMOcTi1sEsPxuKpXt
         D1SQ1l1cEGe2jQ2aVhmS/mB/ttZFPZ5Xq9wno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433982; x=1796038782;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1HIRjQ/VX4G49C55tcs4r1A/8djQo6CwN9mtnhYuM4=;
        b=vSbkVRBjHjevS//KXMhP3FZHwCgpTIdidpZhDTi4+pqRP36/HX2KQ2g2BpuMsakvED
         MJs8fT4lwRUSsBUahNicKVCBAYqsF5HvI+k+F/6C26lc5Vyyug2uiENW7lTQE6a3lDoQ
         1NZcPinv+vfN3PqTT4frld9ffcWh7gG5nN8KzkKrg5xciRhuWaM8JhgAmz0iQOMbWx8m
         qitTfOxj4uMaZnIx4t9TK+cb54mbCTQxqPqgVpnJftjOkGjiqqRpMrDKvdXQ2lqsv4Wx
         vPDHEh8WXzIs3k9+/mNCHmYWmOotGEZx6WcdDv0SYU/f19yxaS6iLXkHZ0VSRVURXQY+
         hvHQ==
X-Forwarded-Encrypted: i=1; AL+hErGlWM1EjNsW6GSEQ9EThGYlWCikAPgIyt+h0eGNszc5qXRjYNqhziAneo8k/YmUcDr+/WPasL1di6z4huKf34z8pA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/uleptxNbtlcMIxuNrtgYvsNkQYuXhY8P469JaDjKKNgRvyBqo
	++xCSdwlQXLQDvGc2HS0QILOXy0pIfVs7wBVQvaIiobKT8DOjf6mAdCA89TQR8GPcpyVSS1/6iB
	u1Lx6nP8=
X-Gm-Gg: AZFdTZesudLEqoMW9NQgPIJAlXaYyYTM7U+cGqjdSPlnuc8+RRXXCR3rjidP3INQsH2
	wg0VK3H3rdcecClmDDj+DWsq+iJK9B58wRHL9XAjP34ZXz4xogxFVwq+HWLYZiN93twBbUBuwDO
	bM445H9+f4sPEL/nh+QoKN/zzL1Y4pgYGVwNQVNC3LeB7dS049j5fI6UmXwOXbwpzaxgKSzu7Ql
	rmy5Xo0Mnyphnjt/L/sgK4RG2mJ4cjqMU7IUla0ewUngyAN7OpoXQsHZzG6z8e0ZKRC+Hk5x6Xt
	hLIlnn5IS16zNMRGSI7OeV2bfBY4bnjPudYta9lJ9aJQrWNnEfZsWdxg2h9xpsFZGKGayzK0lko
	l+v5LzpFX7jSxcEfkm5+lzao7MTA5IS0CMOXuz5ZJnqrL8HVDybzwmNSwX1OBaEuJMAHfSLhzW4
	XiNqni5/WL1t3r8oqCZDiSRdykfdhB3ylknJBAfQrqdxFt+evGP7NKnPsGwpXa0hba3Uv8d+4Y6
	ARjtEnbrS7GAJYpx6dNr1qSgauvV5Nx9us3uZr+EWiDphGRPj7CbtRpKRmBqUmpuNoxPZibmnff
	EgkUa06RTMbTcovB+FK04Az900oTxs8496pMrQgpfYpP37bsEE0T/bVjY7b7Rk+QI4lqlBAEZM+
	/OyBRZfw/KHUBffMf/Q==
X-Received: by 2002:a05:600c:6092:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4bb8892bb67mr214030625e9.19.1795433982201;
        Mon, 23 Nov 2026 03:39:42 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:dfb4:14bb:eea0:b8da? ([2001:8b0:aba:5f3c:dfb4:14bb:eea0:b8da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm24931877f8f.55.2026.11.23.03.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:39:41 -0800 (PST)
Message-ID: <a16193f4de16a23bd5f89ec3ece8ee96de8a8ffa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] staging: allow special handling of
 initial-recipes also for native
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joerg.vehlow@emlix.com, openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2026 11:39:40 +0000
In-Reply-To: <20261119055929.3286725-1-joerg.vehlow@emlix.com>
References: <20261119055929.3286725-1-joerg.vehlow@emlix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 11:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250903

On Thu, 2026-11-19 at 06:59 +0100, Joerg Vehlow via openembedded-core wrote=
:
> Sometimes a native recipe also needs bootstrapping (e.g. for ada,
> rust or go)
> -inital-native recipes are already handled different in bitbake.conf
> (both suffixes are stripped).
> During staging for the esdk these packages should also not be staged
> in the sysroot as they might conflict like libgcc-initial does.

initial recipes are target/nativesdk only as far as I know. Where are
you seeing these -initial-native recipes? Our rust build process
doesn't have them, nor does go as far as I can tell?

Cheers,

Richard
