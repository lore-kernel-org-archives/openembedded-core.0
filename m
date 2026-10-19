Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38926.1792427347933195443
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 09:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qk4dLuVJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so10213665e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 09:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792427346; x=1793032146; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNgrtXORu7E4T6Ves1ZXfdCfZQDAG2BLb37vaCXl9hE=;
        b=qk4dLuVJ2Ewm3Lx0BtNByThO97+qtPnuCDADX77vstGtJNZD6XWU0owUg1zjMIyC66
         dlPDIY5ZmnKVwGXeJwUVFiwEl33AjpOuM0DbGGz9FsmtsGPB3BNE7iIXss3QIfIK+mH+
         P3gKfBRWr0qe4XI/KP8G3041sBh/U4tucL7YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427346; x=1793032146;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNgrtXORu7E4T6Ves1ZXfdCfZQDAG2BLb37vaCXl9hE=;
        b=dCpvbnYPJ1NLFkl7GHNSdkB2dGyUgQVPmoKotp6jmI2p008R9QZxmTp3YUA756F0Gm
         2R0Ol9kB8NAKS5C0T55vQ1eO4e6ejwDpkkvOOeqfFj+Xd437I/Ktw7Clu/XwIs+ihA02
         gKws1XsmPw9jIwCaQJ4bLxzqyBS1CdbEuuEDF6hWoLp0csSr4uNTTLUc6ov9XHodoYiW
         TP6XiUOTW2Y9bvtf2FlMUk7Q90FXbzDSTB2iAWkabUr0km+osoWmcx8PSAqTBn12iTgj
         TGLioCbv7cK3oeRytepl6c+ObiySdocrNXbTfs7tUGXYqGgUHO5GyFBfxE496UD3R0AS
         AB6g==
X-Forwarded-Encrypted: i=1; AKwUvBwdYRIIDL4M9G1X0oh7gN8AoQAaGfFH8htesz9ARPKaOh863dXYRzJM7XkBBZeTlPyxh4Q+TzVkIiu2iIbbSqOEPQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJWi16yAeVKDTK9XjgPGUdpcd0r5Ewhg8hevFkNe1dIFc1vFZHe
	67dig5Zfa+/PSaYmpA8cEZH4Hnio228io3X/8L3c/J+O+Ms4ySjQ7mmRcMyRO5MIo1M=
X-Gm-Gg: AYBFou0pgNQnakruUZELkqF6wiCLXpNLqPYgIVZy1pjmPIYEIorodzKt1g3mRO4Jcjc
	yGlyL0btkbhukfPw7ovlJPBb1Brk3oXry0DCumkUPrS0iDYFwWzhAG0XsRVDsrHRtA/tcwh3bwf
	gdEYuWzlrl3I5wpOAWoFNVonvSHVGdlrwkkLC98WzaLnW2KfWEZi6HrjjqiALLf3lxMz78fIhbD
	jZKgxTVMogJo3JI2q1Y6Xb89R+WY02OlUCc1UIjrO1jXQJfeSmYqL/wfGQWeSJMLDFRv6H7FwEH
	YCDDIROWdoYIhG6RJXbPnSf9DgYFqzXC5fNmWQeTncTMGv0spP1BvJNfg7jflb5K2NJtkTqmOS/
	gXphts/XukHWMPnucG18tTtafKcV4KqRGtjUivGzHipCaSOR90gxzPBFuc4dQYGKrAhTCbYaEPI
	x9FYrDEA6S6ierLiBTlThOnKjPMeToBQE55gPtM5bgYAMI7BsByywQEWIo7zGOcdUJDF4YvNqYp
	6lXVKGgiG6Pn1eB1QMn+LeeK5hWTw2LYfgurU9xlG072kHT9wHuK3+9G4YXdQ==
X-Received: by 2002:a05:600c:8709:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4a1d760536cmr167377815e9.13.1792427344858;
        Mon, 19 Oct 2026 09:29:04 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a24sm24493656f8f.49.2026.10.19.09.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:29:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 18:29:04 +0200
Message-Id: <DM8YGQD3JEF9.38I4XOG3YVEX6@smile.fr>
Subject: Re: [OE-core] [master][blacksail][PATCH] stress-ng: Inherit
 pkgconfig
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261019125142.3407486-1-pkj@axis.com>
 <DM8UGZKR7J6J.1VNILIXTWOKFX@smile.fr>
 <DB5PR02MB10213A79139833095C2138813EF982@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213A79139833095C2138813EF982@DB5PR02MB10213.eurprd02.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 16:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248197

On Mon Oct 19, 2026 at 6:17 PM CEST, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Yoann Congal <yoann.congal@smile.fr>
>> Sent: den 19 oktober 2026 15:21
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-core@=
lists.openembedded.org
>> Subject: Re: [OE-core] [master][blacksail][PATCH] stress-ng: Inherit pkg=
config
>>=20
>> On Mon Oct 19, 2026 at 2:51 PM CEST, Peter Kjellerstedt via lists.openem=
bedded.org wrote:
>> > The use of pkg-config was introduced in version 0.21.04.
>> >
>> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> > ---
>> >  meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb b/me=
ta/recipes-extended/stress-ng/stress-ng_0.22.01.bb
>> > index 548edf292b..adf9331cd7 100644
>> > --- a/meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb
>> > +++ b/meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb
>>=20
>> Hello,
>>=20
>> master and blacksail have diverged, blacksail is still on
>> stress-ng 0.22.00.
>>=20
>> I'll ignore [blacksail] for this one.
>
> The problem was introduced in 0.21.04 (as mentioned above), and the=20
> fix is needed for both master and Blacksail.

Agreed but this patch does not apply on blacksail (which is at
stress-ng 0.22.0*0*). Can you check&send the upgrade so I can apply this pa=
tch
on blacksail?

Thanks!
--=20
Yoann Congal
Smile ECS

