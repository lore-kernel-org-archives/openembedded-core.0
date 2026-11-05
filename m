Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5622.1793910432423249265
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 12:27:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DC+7IyJR;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91ea2e29d90so5764896d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 12:27:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793910431; cv=none;
        d=google.com; s=arc-20260327;
        b=FiwIKvZUqmprYddCcOSwcQAAgZ01PxdAXBCGt/6C2FXBKbU/bKDBvfuE45bUmcpxb/
         tsJ882A3k8PWvkYkwYcgV6/0Chv7T7kHZhlKh1C6YhxCC2TUVc/72HY5Gmmfsccb5cQQ
         QfdnISBwaj5hbN5pHEDnOjgxDY3XbDod4DGugVo2yTY+tQnErHWwi9vsBp7PM6xEjhTN
         hODanK/3BfNbHXo3xXKrb/IQbbZJ34Zda3XoxXX2Kn8M8JfTZooGBjPY/4YrhZ2BYgtd
         H8QoBSIacGpC90fDuSiHukqrcYXNvlWhGvTnnPhwO5KCg0RKV4y4FUm1EZtZ3qc4xURi
         9H8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/udfPvmnNPIauocsqTCDXGp20kz4sHPRcZa5jSObO70=;
        fh=RjULCJOwF62uOXSxCw0adLgJmH1Gk2cfNmyTWZGL0cA=;
        b=GDupC1sK9KgwCq/UwzlwKpJR+ivx+PeN0NoJQwhST6+BrjVGTE8OxdtVcpRo1zklyY
         8zmy107K22kLl2I6HrNvHjHzLteymDc4ne887eGVKF4NKwRHZ4/i/TBuzl6SWEf4lAll
         lebZAS51NttSJA5SMekkRWv9luxPjEZgCV8a/8iz3apU8Pj7AfOW20nvf3FSrjf3GNyh
         eWkBZ1hGPpKQPNUn58V6LIwcsTsQ5+QM544SqeOne/623ext9mVp3oVF1Qy4bF6jEhqO
         UDEa7pECCRVIVtTAAEsmwLsYG7jiyDWFoIBhcQ3F7MN8aDBPvLRU+/y9WVw5rTn+RqPT
         CQcw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910431; x=1794515231; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/udfPvmnNPIauocsqTCDXGp20kz4sHPRcZa5jSObO70=;
        b=DC+7IyJRQj4Ufyi+73042EnEtzUFt1GAh/Qk+TozZUxX9TigsFJ+2zGpW2V+FYhtQF
         qtOUrVq5A1o23VCc1wBXDtblz+u0/JXxkN5joFaSO/msKsWnT7WcsLNAH3/Lsmr9ucSU
         FOIZUJTB/mSIllo1/7uPuT/DGtdjLnU0L4H308+VWl8vYTJhTXBDcoLsT6i764O4NEej
         i/wao59civSJrrfKXgtgU/Yj5pwX2m9vArfF0uWTZSQMFjX7EJpoR0FJKE1kXwIPxF4M
         hwZctpWdSV3iAaYV+UIyLmrOEVZCMSjb6jsQ1vAGXK1z43engHfONJi+Y7188syFvINm
         V8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910431; x=1794515231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/udfPvmnNPIauocsqTCDXGp20kz4sHPRcZa5jSObO70=;
        b=P04p3e+B1khSVaLNl3UGgsckEAdnXjA4xYSsNi/3e4Z4VVc9Qw4seliFWhfb4Os39y
         i2X4HD0CebK1en3NimvZDqw0xtex6uEaLOBnV/ls6N3kpWHTjlklSw/Yt/dwB/C7bkms
         AhMD5a5qVbjE1EohwPcSGMbWm62ST7yG+qHbI3mdD1FMavGdI89kvu/l+e2Dpyb0wR9Q
         DsJQvX7h7gFeKeectqwPGyUxb0GK3M6x5RT3p4WPp8560T6L/GTRotXcA5KmfqWQXvK0
         21485a5TJCNtH1TMYUIWAO7AmPnGTmywHXg2g+KFsMWbBwA2L54kmvaU4pg+W0APa/VD
         RZcg==
X-Gm-Message-State: APuU4Z8m/jDflMJemvLiq+suHXEl/UBJpNp1Z8YK2NB8vINgpKyzoV5q
	F9lk/HuEemuJ7GDE3sp2WcNms4Q2aQDVLQWjhtDe+rQIsioQ8ucm1rhVNu/7ZyWFl0QBt+bo9Dy
	2drfWEazEDtCbn4HQZm6ek2L3jHroDmM=
X-Gm-Gg: AYBFou3lA73cflnzopS1+/lOZQH+RLw2+Q8A3/HAfgFYl7iTRdOrtqOFJSFCo/wSdu5
	N9kI+gIbsfcGU4T+Q0yb0gCX2XSknHwflz+DutHuXt6ud7ShWH8Rkhfoq1vkVInmwf9bkx4TvWI
	A199ZGU4Z72FZmtPRHIlxHZWwqiN6WoRkaS+QCZP4o1DHxkc7q0LkmszClMIpRntEnFLVbJ0VLo
	iTLFDNHqJul/yxNxIlArLNmE9lkadZMpoicZzmWE0dHgHOGZ0PrPf/rVa1Cu3ARwjJtVZwqiDt3
	G4uH7M67y9EhGgAKZD6hkU5ZHO5QNJryK7os0LAWr4RPBefV2SNJ5TZelwmSHpdLO/EoaDNF0PO
	e9a6u0YHfwChYer+552oSO+Nw0vNbXcHOXIv89YbEi22uMJy9nSelCjwkndfUlV4Wa47/FcQ=
X-Received: by 2002:a05:6214:3911:b0:91e:7939:dda5 with SMTP id
 6a1803df08f44-91ea98b3b9fmr1328666d6.23.1793910431205; Thu, 05 Nov 2026
 12:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20261105122145.543282-1-stondo@gmail.com>
In-Reply-To: <20261105122145.543282-1-stondo@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Nov 2026 21:26:57 +0100
X-Gm-Features: AclHuK8nfJ_E6mjxH8Y68i3P9IZUWgLAgfGyu6JvkM0w0rRJCjg1DVl8K8hEEsY
Message-ID: <CANNYZj9=G4+jmRx7UJMYbsp2xwDxwSmm+Gv2HxcPJtOen_9LUA@mail.gmail.com>
Subject: Re: [RFC] spdx30: name, version and purl for dependency downloads
To: Stefano Tondo <stondo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, stefano.tondo.ext@siemens.com, 
	bitbake-devel@lists.openembedded.org, Joshua Watt <JPEWhacker@gmail.com>, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>, 
	Peter Marko <peter.marko@siemens.com>, Adrian Freihofer <adrian.freihofer@siemens.com>, 
	Patrick Wicki <patrick.wicki@siemens.com>
Content-Type: multipart/alternative; boundary="00000000000002ce0a065f8d5276"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 20:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249578

--00000000000002ce0a065f8d5276
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 13:21, Stefano Tondo <stondo@gmail.com> wrote:

> I would like your opinion on a direction for the SPDX output of
> recipes with language dependencies. I have working patches for it,
> described below, but I would rather agree on the approach before
> sending them.
>

I'm afraid I am missing context, which is hardly surprising because I did
no spdx work until now. What are the language dependencies? Does something
require or recommend them? Is there a normative document that defines them?
The email talks about how the implementation works, but says nothing about
what the problem is.

Alex

--00000000000002ce0a065f8d5276
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 5 Nov 2026 at 13:21, Stefano Tondo &l=
t;<a href=3D"mailto:stondo@gmail.com">stondo@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">I would like your opi=
nion on a direction for the SPDX output of<br>
recipes with language dependencies. I have working patches for it,<br>
described below, but I would rather agree on the approach before<br>
sending them.<br></blockquote><div><br></div><div>I&#39;m afraid I am missi=
ng context, which is hardly surprising because I did no spdx work until now=
. What are the language dependencies? Does something require or recommend t=
hem? Is there a normative document that defines them? The email talks about=
 how the implementation works, but says nothing about what the problem is.<=
/div><div><br></div><div>Alex</div><br></div></div>

--00000000000002ce0a065f8d5276--
