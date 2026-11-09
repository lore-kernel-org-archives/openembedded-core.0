Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7688.1794264210142570059
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 14:43:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=EmUrYHWl;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so10132095e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 14:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794264208; x=1794869008; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9O9LcGGaAZpPfmg1HlzWKCXeEVAGRhbnGk3+g1LAZFw=;
        b=EmUrYHWlEbkSwcNXuOw7wpXeHNJqGlzhYNlreN5TwUqO4l3T2QXcQsC4hygOjRuwVh
         ghOyJi0lqdpErtnDFgwLJhVJmKg6IVYVsWJbTzncJ/CNp0C4MId7DaOTN69oi7GQNKzN
         eWqiL/KDNjNVyhvCXB7cqGJ151nj4MD1XGa+sQvCSrFqakwpn5dyMHhrk1ZmKuwrTk3q
         M8+jPEGA47b0pE/RMg+/m5+sZ2IzzyaDt1sQpZ1OU7g0i971svbQcOfTWmfFu6Rf211J
         Bfej/GtA0rZnFReyrzn8drf2F2oF/GN4WyLyZcwgjTvO9yM7Mq2N5NcTs9v023Ns2mB5
         rFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264208; x=1794869008;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9O9LcGGaAZpPfmg1HlzWKCXeEVAGRhbnGk3+g1LAZFw=;
        b=WeWiJL6984zrnQ0/uRvRGd2owslEQTSJnEqMMQP90lBuAeKB6FPWEmGei5dU+aznb4
         GQ53moVeuOvUr1BvdU4JodxbdFMRWLQq2R/tnCuV/Qh6jELIdh/tL5Tep6OxyFQiJrQv
         72ObY5t+5c0SwioEjnFC3DS0Ksdwk3/EL6IgI65zRvCllg6G1dxmE2AxlvlAFlPi2xm7
         0E+lb9wqe62iZ43LlKKtZS6ExrsWJ+U7nUpTNZDqvieDQebbs89p1e9zpv5pccXLxvsf
         PbLywk0VPX+pRRu/dedoUOTBc91MRWYx1RyvBpYpPo4NsrRApC/MrGrMzfC7s8ePBVE8
         S1kw==
X-Forwarded-Encrypted: i=1; AL+hErFcVuk2W0+4huzjob3zO0t2wXxH5UBAzGO+BGsDlbcOesWONB4St2beUPBUNDHTmk+Kru/9Cpe/EMlTFrvHCqCxug==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8922fQySaQNabNLPLvu8tO1n9/8oA6qZXbal2k+XwlItTEpMgA
	xiTCtCY7sygTIrfzXyB+exbSp7IYx3d1eBdUg3LicWeOHFTup+kYJyEvETbORTfyFGQ=
X-Gm-Gg: AYBFou17BUdg6S3rqZwtFeiCDjdZjUn25V7FQ4PqBciBXZHiq+82aQE3haSCmMGwPwT
	jBi8TD19M0xe3/GMdTJ5/pqfJpVQSdBwNE5PRFOF2dMIxpn8iEnzIUETRCl9mwjxp0fpa4DaIpM
	YrkofOWtArk5wUl2E3EYGdOPMSZp7FkZKgc7nkQ1vZLAydiXwjzN7TSLhHeNOAM7sp90XoTQhO4
	z6VWCnKURTEf8KiiW5zYSa3kOGV1ftg/a9PpEm94+DuQh7fSlhop17QaYy+jnDeAkVGwVRT9ZS0
	RxcmawcdbsZrwj0dmFe/J81GNSQ/BdE7Xd2YPQlLenzdno5tZFZ7dQ+jUY88HOkx9SMHstUV4z8
	CVlQssL6inluMgqlSd/YEuQUWG6ceVFqkzXi+XtWqEpN2bO5MX2aHj0yAH+2T9uBQaC8yv8oQGu
	8ddzNAIiUPt/HznHMBQAyDjqO6AyfiMIdTp1ex/zuoajlH2JkYif+byaKE9TfvA2RXwuQJMdSf/
	oPLjMs74sB8uCKopnEZer7pjQ6/QDVAFLzYLTdG0KaTW+41CoS/epi2bEWDc0MFDv+BRCVjDzav
	O1Hq4OEkvZls6pvbLJw0PWAMSqh8dqbU9T0EtFTrkRdf46X97IRMnRh6Zttwot6LqW6KMjaTpgH
	iZfolVfTIQrVEvxNC
X-Received: by 2002:a05:600c:4e8a:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4ba02345745mr10997985e9.12.1794264208341;
        Mon, 09 Nov 2026 14:43:28 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d9df5csm24794875e9.0.2026.11.09.14.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 14:43:27 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 23:43:27 +0100
Message-Id: <DMR1KTSW5FKT.1P6PEDH59FE7B@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 1/2] dropbear: add follow-up patches
 for CVE-2019-6111
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261023192914.159339-1-peter.marko@siemens.com>
 <DMQU8C661EIP.20I8FSF0VPP9L@smile.fr>
 <AS8PR10MB5073B9D7D28749124C032589FD732@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB5073B9D7D28749124C032589FD732@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 22:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249878

On Mon Nov 9, 2026 at 11:37 PM CET, Peter Marko wrote:
>
>
>> -----Original Message-----
>> From: Yoann Congal <yoann.congal@smile.fr>
>> Sent: Monday, November 9, 2026 5:58 PM
>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [wrynose][PATCH 1/2] dropbear: add follow-up patc=
hes for
>> CVE-2019-6111
>>=20
>> On Fri Oct 23, 2026 at 9:29 PM CEST, Peter Marko via lists.openembedded.=
org
>> wrote:
>> > From: Peter Marko <peter.marko@siemens.com>
>> >
>> > Pick additional patches referencing this CVE from 2026.90 or 2026.91
>> > releases.
>> >
>> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> > ---
>> >  .../dropbear/dropbear/CVE-2019-6111-01.patch  | 364 +++++++++++++++++=
+
>> >  .../dropbear/dropbear/CVE-2019-6111-02.patch  |  43 +++
>> >  .../dropbear/dropbear/CVE-2019-6111-03.patch  |  34 ++
>> >  .../recipes-core/dropbear/dropbear_2025.89.bb |   3 +
>> >  4 files changed, 444 insertions(+)
>> >  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-
>> 01.patch
>> >  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-
>> 02.patch
>> >  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-
>> 03.patch
>>=20
>> Hello,
>>=20
>> Should'nt we also backport this commit?
>> https://github.com/mkj/dropbear/commit/16ce059ed8e914e210af67e199041943e=
c747
>> 034
>> | scp: fix recursive overwrite check
>> | Non-recursive transfers were incorrectly disallowed to an existing
>> | destination.
>> |
>> | In addition, the destination check logic was wrong.
>> |
>> | Fixes: 61bd0e3 ("scp: Disallow -r to an existing directory")
>
> This is a good find.
> I'll send a v2 with this patch added on top.

Thanks!

>
> Peter
>
>>=20
>> Regards,
>> --
>> Yoann Congal
>> Smile ECS


--=20
Yoann Congal
Smile ECS

