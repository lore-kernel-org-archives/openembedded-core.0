Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30842.1793873176620917291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 02:06:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=gO4Wlq2C;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so14920395e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 02:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793873175; x=1794477975; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JLQ0B5dQTDgYxDr9QTIViw+V1TWk+LQM2VhqucxE80Q=;
        b=gO4Wlq2C44VFWCOnvFR/KZjnfWeBVi7HpU4GkrAaCUEbd7BD7ro2MRUkflcC5tlxTT
         HP3iwg6Bk1eYFZ1lFixeq/Rr0N/vs0CNlPzuZlrHa3vPft6zqp9OZzU3/xD2ova1N7wH
         Tm545TN2Y335dmjrILVat1GZXQwdBemjLqJ4/9U5oG4bm3LmZmwlU/jfPqWq7X7haBJf
         uSa+9Sfkk293JXe0eOG3BcROTDfwNMfuO6cSNjyMHWOHZi3u/gXsO2NMV5EMp9pf12Es
         ndp6AI+pAXa2ziMkdUTauZP8uGmVPRBlAiKQu6HQlPrQrvaGLT93EwI6M664GYNIl6US
         wGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873175; x=1794477975;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JLQ0B5dQTDgYxDr9QTIViw+V1TWk+LQM2VhqucxE80Q=;
        b=IytCXgjqBhVY8iHVI8D2CheJSQQG1/e1SW4FITDkAm/cDLjs+sox22tmYy8BUbZfpH
         qjq1auHEuIyObpHPP819uzMmJarbzvgx//5Jry+QiEOu05m8dr64lwNFlUIhXC1/9VzS
         t+LU6Wa5XdZFFQRZdZbvLCDN7Wh5U3wfQ+bmABfwRJobu4ntVs4Fro85J1mB24/NE9rG
         0pglK3yk7V2/4e7BnAnJpFOdDX+cMei5lyHKfQAetgyfGbVEk6zlmAXBHN+2Ey5d+v1N
         FjlFA9vni2DQ28WdclpXEWWYssOUSt66EoGZnfiJ1kz4R4Wmhu2Gil89+a7m0zPLdBRf
         Gb+w==
X-Forwarded-Encrypted: i=1; AKwUvBwxr+9wi9LWTdi1U4sK2XQ0cQJ3N0BQfCkfs5ImDr5MBL0YGib5qN/ngU/w4N02GdphSJbRxXBlaGJJ2fH05Rh1RA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9rjkeZufp1Oa24traHq/SQbWhCzHsQR1ofv45kVIVruG+AC2CR
	cDDJIChSR5ZvgbDBJ0lfedNVTUso63CLD44kZU97oUdDZon6wnVlsEA/ppito8TODXJ/zt+Nt23
	Cscn2iE8=
X-Gm-Gg: AYBFou3jMGSPBW81E2S+np1Yfp5ZMnHbVNuzYWBHiitRh9YlX5DHzPfMRBUHXvLFjgT
	fU+a++BaOCmdrNTTj+O660PdB0LSh3LF++7N3rt62xOMQMdNY2PRGjVzsMTO0ykPgPC1zjZLXma
	2pBhZju4i0LaIwkFEbFYkFQlnhenRnaNZybM6XMx1vf19kRv4Fbl1wRtJ2aYg3bk/SeOeZN20+D
	tLjT1vFigfraW5x2s47weDNNRbFV48tnelTSQnYu5Ck4+RLXVlLmoYecpZvOUXzmx3tpq5KHJZt
	r3VCeyX/Pepq3IISnxJhpbQxOw2HL8UirgJBqAYPFEufRuMte318xPWl9kmHsO2REDqNC0CmaXx
	Q5uPs9hzfSWB+BGpMkxZQNSzmI44kTsgnGKN96RLeZ84hAYmYAnI+urznKChUG5+L7ewfr0bA2Z
	NwjEwE5SDa4F/Q2Kq6EHAkrlk8R2kZD4+swC2Csg64tpDWJUVapohGRNner2n0yi5h8NXgBNcUD
	hu17aSN+b1w76cjrSO2+GMpTvngRMqheb1DYWM3aZOPh0+/iduUT4QsseXa6lFhdlXHNX537Puh
	G5Slp+aqdI+m4AEgYA2zwTjuaT82Y9nVIw4vv/7d3wSJW6EB/jTdRw1iJ9oOA56IpJKUpNxscjC
	dszllpjuOHO1SASonDk8NGcrcvxkLqIIaqLex7Q==
X-Received: by 2002:a05:600c:34d4:b0:4a2:d7e:5ccb with SMTP id 5b1f17b1804b1-4ac182dca99mr455438105e9.15.1793873165528;
        Thu, 05 Nov 2026 02:06:05 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm163806775e9.3.2026.11.05.02.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:06:05 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 11:06:04 +0100
Message-Id: <DMN6YR8G2OMU.1POIRTW2BGU0S@smile.fr>
Subject: Re: Recall: Re: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "G A, Abinivesh" <Abinivesh.GA@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <00JZM110RUU4.4KMF3UH0MQTZ1@sj0pr11mb5895>
In-Reply-To: <00JZM110RUU4.4KMF3UH0MQTZ1@sj0pr11mb5895>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 10:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249525

On Thu Nov 5, 2026 at 6:39 AM CET, Abinivesh G A wrote:
> Abinivesh.GA@windriver.com would like to recall the message, "Re: [scarth=
gap][PATCH] ffmpeg: fix CVE-2026-75143".

Hello,

The "recall" function of your mail system does not work on public
mailing lists nor with any mail client that is not Outlook/Microsoft.
It only send empty mails that only add noise to the mailing list.

Please do not use it on the Yocto mailing lists.

Thanks!
--=20
Yoann Congal
Smile ECS

