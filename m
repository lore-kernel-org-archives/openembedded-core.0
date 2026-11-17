Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18173.1794922701699091910
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 05:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=fnG8J74n;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: bastien.jauny@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2681162f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 05:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794922700; x=1795527500; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0/F0JIj/XgOmYqPbSUQbrOmN85VXk6rqd5+iToj8rSs=;
        b=fnG8J74nTIQ6HXTdn/GyZWt+IWUeU1F+djRuIJmPwt4n1q1t94N9Wz/tgkF3GoLlE/
         cogVG6n+6FqNHaXZRA6ts/gqkvC2e7IEBiIkaUJDunDC7vE/MA3RF5HeiCDWsRBmNEgm
         Ngd6lY4e8N0+gk6CtnQhPR3vK3oAz23Yry5qQucNiwjHQX32lHG0lVMnGeqog6FIUhP5
         GBBNp50HmKZbDpwR28nn9OTwzrY59t/gM6XaBNPDwknpBLrDmhb9oD9SXcXSV4Syx7kG
         ShB2RlLCJ/yYj9skEGf4lL3L3OTqnCen8xC2sijWfNY+YLyOCxb4buW2wzHPch/R6Za6
         fsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922700; x=1795527500;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/F0JIj/XgOmYqPbSUQbrOmN85VXk6rqd5+iToj8rSs=;
        b=vVuv9+o44oSAtAcSNyF5SVR1D8EtPU7/uV4XkwkjPmsVGbnVd56tj+eOzIW56ln/dL
         3INiEK7b78OO2PHQoANIMovTqRl8On8OS5WGS5+ziRUHPnqfa93ExQK5JOtbi4vIZNGa
         V6uvxWOSfkxRalySFx/FXr+Yj0lAe3kbg9OfpMojEvYERK88FnJmHeFjv8+LrySqpDlm
         efWyrEDY1bgrz5J7SnnxVK/RgvH9CwNlSmjP3Q0IzWIYgBqJg3rzmff0dzJqhSh4Fqad
         iaJxWjymU/TcM2VymNzMvl+mDz9u5xroBgwg63OHBilFL8r4l99WPv4ALDszkmoOckL4
         vwVA==
X-Forwarded-Encrypted: i=1; AL+hErFmDhZmnavzaCa3EHSXq2NQyhWanGEHXzg2EKIS5YTzRjfWqrHT7ajke4IyCdo+XSnhNXLTrbt91zuEF2Tu0/CDJg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/7Jk26r4tK+0XfVeVl7Ib7VekuydV+5vgMymB4nBC9eHDPaTaV
	M2rZwNH+fmu7L++CMWWqJXHkruWNjtN4EuiucHuV5/g9mFTVd3jgH2WfuCH4zVt2mRw=
X-Gm-Gg: AZFdTZdJGMWtV8TqAfcvK30WID4toiLRGCQ1tXlT7LGeQZ8/XVzohxDQVKgWMoBKA0+
	yq16aldqEV1v3c5eEzCPxO0vw44wTsih1QVwfG4PyKVpb3vos2hapq8mdTfwW9Oygv/6pd4EosM
	t9hKNJIYOGJgO3ngb3e4LNU1jVZbIGD6qRgKTP03yk+EweA92HztIOhKY4YH3UV2MsMIaDzAU8Q
	NyldeWBD6xzG9lHChx4RubL07OC08yXLF6VjMbSpDcmnwKkAE7qyeIxkG7lZon/dSp1iDwMF+SC
	/STxXXkYy+rLy7o4lKxOYpmmqs/syqc87rbA+CETbeaNjh6FGFTOqi7wmTM21Xd5KVv+bFJ3pue
	ZHJvW6rScknQQqzU6cO7OpiZKTPzFKjrnpXt1NqAC2TJNMcHFXuQs89wHLO1O/hee0AxPykBkz5
	AwaNRLEXiVxHdjjy1mwH+Yqje/mBFSDviG4SRhLm5vL/FidlZjoIPc5z2WTaIPw+0AzvaSt7zWd
	5RkZkJT2SQS4pK15icRCXPiF+m1AZm+JmHknkFo1871787crCape0VFfK9YMogd86EuK84v7qel
	t32SgRFJszy0ehxq0CJ/qfYQiNnCkcks0iEYxg6Ctdz6S/asl5nSM3n8RvudKlJXHkJ8z1DYrqK
	j/GSTiaklY2SyY1Y=
X-Received: by 2002:a05:6000:2611:b0:4a4:9c15:82d0 with SMTP id ffacd0b85a97d-4a49c1583cdmr2959943f8f.4.1794922699726;
        Tue, 17 Nov 2026 05:38:19 -0800 (PST)
Return-Path: <bastien.jauny@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f77fc47sm28344995f8f.22.2026.11.17.05.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:38:19 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 14:38:18 +0100
Message-Id: <DMXIZS6KZMCE.1YQ4WZ8SY4GCN@smile.fr>
Cc: <thomas.petazzoni@bootlin.com>
Subject: Re: [OE-core] [scarthgap][PATCH] expat: fix CVE-2026-117610
From: "Bastien Jauny" <bastien.jauny@smile.fr>
To: <joaomarcos.costa@bootlin.com>, "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0-38-g09b49b623995
References: <20261104142512.1562219-1-joaomarcos.costa@bootlin.com>
 <DMMIRR2WICTU.2CVIAJ7I966Q9@smile.fr>
 <d7345f9c-3bb6-4b33-b800-c0b116287d3b@bootlin.com>
In-Reply-To: <d7345f9c-3bb6-4b33-b800-c0b116287d3b@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 13:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250452

On Wed Nov 4, 2026 at 4:12 PM CET, Joao Marcos Costa via openembedded-core =
wrote:
> Hello, Yoan
>
> On 11/4/26 4:08 PM, Yoann Congal wrote:
>> On Wed Nov 4, 2026 at 3:25 PM CET, Joao Marcos Costa via openembedded-co=
re wrote:
>>> This vulnerability, marked as High [1], was fixed upstream [2] since
>>> 2.10.0.
>>>
>>> Backport the fix to expat v2.8.3.
>>>
>>> This backport is actually partial. PR#1444 adds a second commit providi=
ng a
>>> new test case, but the code uses helper functions not yet
>>> defined/available. A few other commits would also need to be backported=
 so
>>> that the test compiles at v2.8.3.
>>>
>>> [1] https://nvd.nist.gov/vuln/detail/cve-2026-117610
>>> [2] https://github.com/libexpat/libexpat/pull/1444
>>>
>>> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.=
costa@bootlin.com>
>>> ---
>>>   .../expat/expat/CVE-2026-117610.patch         | 30 ++++++++++++++++++=
+
>>>   meta/recipes-core/expat/expat_2.8.3.bb        |  1 +
>>>   2 files changed, 31 insertions(+)
>>>   create mode 100644 meta/recipes-core/expat/expat/CVE-2026-117610.patc=
h
>>=20
>> Hello,
>>=20
>> You just sent "[scarthgap][PATCH] expat: fix CVE-2026-118370" which
>> conflict with this one. Even if I have tooling in place to handle this
>> kind of conflict, I'd rather you send conflicting patches as a series.
>>=20
>> No need of a v2 just for that but something for future series.
>>=20
>> Thanks!
>
> I considered the series, but for some reason I thought these orthogonal=
=20
> fixes would be easier to review if sent separately. My bad!

Hi,
This commit has been submitted to wrynose but is also needed upstream.

Could you submit it for blacksail please?

Thanks,
--=20
Bastien Jauny
Smile

