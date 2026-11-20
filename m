Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3949.1795173660859670899
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 03:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=htlvCHJA;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55d3563e50eso1065091cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 03:21:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795173660; cv=none;
        d=google.com; s=arc-20260327;
        b=MAGQwmFJ3IHKHACpOvsS4Hr5mteeJnAoK53IlKN25NK4faab9510/QLvxEnOGVWjJh
         z1H604JalFZe2d/P2LcdTRxCRrURMLbjFbhm0SE1SgHeI/oCFCKCNFDOs2jCxqIxGA72
         c89X3T4iR9IEv4foXwCHUpMarjoS0ykZOD9BVJHJWtzA5nb3iOfFbyyNSZmO7cv0N2ys
         /tMbDBQn79/OWSl8TxjNQxL3N5bU4cHRuaIIGVASMhdYo5P3E4xu8nPxj1yhT6QSqiTe
         /M63whIMYKFziNej3Tqo3YxypX79/DsxhMiUU2Vl8SxivuHM4ynE9HMQVJwMcFnREUzU
         wnmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JDKAh4IjHmQdR8/V8+iE+nXmYn4Y9XD7AnasgQgwyCk=;
        fh=IC/tc8M9riuhTPZe9SgWUojV/LHwB5OjnsMXdT8HSMo=;
        b=CamTEemYTu+sOdTBVGfbxAHZ69AS4YzetrQIIiapm2Mwox/SvieupVqdnGejvPSY1m
         Y4M3TwT95Tc900ZFyrzYx5JWrJq27pjN7tBcEqg6PdkpoV3OQ/kJuaP4G3gNGv3/KW2X
         +KmKGoKW1PtS1My+uUurxMeIDUoV643MRY/DR+r1trhY/tEc1Gs4wzDS/zsfQ3zkrON7
         0tSEuQKPrVVk1lDoIjN8txJSeU1FUBIUhR6T7TB8fBGCW49oWenrIXXznAvJ+h3Vlfrf
         VENmkqFmf2wNwrb8X900/yUAwmx6xfFCEkpgRPrEVr8R1qt8Oyb8kebqNZfvkWKlpM67
         yoag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795173660; x=1795778460; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDKAh4IjHmQdR8/V8+iE+nXmYn4Y9XD7AnasgQgwyCk=;
        b=htlvCHJA6t0ZouivP3FjdNLZ0UoCJUJiMNqnx7JXVAK/fMxeD/6WydqNWvheqcSu4t
         0oIZF8O/jCL3UliIihGAiqS27cgarfT+5NyqB3Ele58uyq//NkdBH1V1VQIzJHadeXfE
         axCixPHo4CKPeRfjenyXQ6+0/nxt8h57J7ixvYBkQTGnneDL6ygv7J7y1aCzFKEFrFux
         XRqqU/yjCgsX85ZoXEoKedHFr/0x3LY1ZC1i8D6ZTBhQc/CttDPH/IuQPsRpQD85WgN7
         iia5DxfP8U3u32J8UqH+QumWaig2RIh3LVb6veEXEy+HLvSTnWzwysvGU1V/NQkO9IR0
         WIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173660; x=1795778460;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JDKAh4IjHmQdR8/V8+iE+nXmYn4Y9XD7AnasgQgwyCk=;
        b=yoGmPIolWI1nSsv4jTTxUIHDdDOSIUEyee15tYqpLXOl4FHGrj8d9MmLhxa/fId5Vn
         QF9dqJJyYyfF93p6wFXQWE3oeACOGjWeBu9hR9MxtNC18uzvdrXfhH17NUBpIEZakti7
         G8JXPjk0svzMsPvjHS6We1t4pBHF2Pdra+iRryT+fMzJ/l0dtmfkjKG0HDW9L5gbm63w
         sifOi89g/AQiZ27Uz6aL9M8+CVLqbFcVMMFXtE8nDO9LB4H+UnWbDW03NVi1FAXUoqg+
         aHLJlGGHF83th0+EA1xNn5SNIo6BcUpx6JnrKzGcNPzxCgJrm91I4y7siSXsQ49elXZv
         MmYQ==
X-Forwarded-Encrypted: i=1; AL+hErEAhOQkeOdghdrP6NVpwS/YCa4FnL+UfLsk0IH4DnmTng9Q6hUbPgCSksral09Lt3l7QLyIwNa3WQPc3rIgtB8dhw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z91H/6p76NwCz+1TxGaFIs2MqP1zoX0xZRj+F1EPJRzj4OexfFc
	ew5pGKajlinpGnEZEYnXVsc6HJmozv9KNy+N/961yyHaQuhBOZbsw+H6+dPib6sJt9nkMX3UNc8
	uBvzgAoagtyx0qcrANlGvqFvvMoFgMnU=
X-Gm-Gg: AYBFou3q3YEgW0nB4Kh/d5AtpJzTUrLJSZe4KDd/VqBq88KZZzmpz/SAQO8kZ2p01X8
	7z3UFl+sNUMb3TYK+z+qOBNmYWWvaVOk+2IB2GpPbvW1Tb17LZDI/5fgUwSzjsjagWLUGHEzX4h
	RgCYgrykJsccmQxRoBMzBrtfdEcUWQUT54unmwis94smmb4zVW+/8UdGy0WwzIKL0B0rA1jMBUg
	cAkxuPaHMhFR46f4GiIauRtFI2J7nmP8JNTp8R+eygBLO1jhhAMslboM9S454AYlBomRzUt4EVa
	N1ethFxZOmJaLka+xx6jaQSxR4vbGIvzGTNh8Nv08qngx6RXf20XOUQQF4V2H7efuzpO0MP1bnX
	RFldIdld/IiHwdTENG311w+VeIhKfUnfMDXsxL04TgwjxjDMYAWN/tWx8oO15AI03JthBXmM=
X-Received: by 2002:a05:622a:1a8e:b0:536:6ff4:6529 with SMTP id
 d75a77b69052e-55d76ac5aedmr48114261cf.64.1795173659632; Fri, 20 Nov 2026
 03:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20261117164151.1362220-1-yoann.congal@smile.fr>
 <CANNYZj9Uj5v-Tb1TrA+TrxrdEyjO+qj25byZ0fWtUpiLHKH-DA@mail.gmail.com> <DMZZRI421TEX.2ACT1HU5QSAM8@pbarker.dev>
In-Reply-To: <DMZZRI421TEX.2ACT1HU5QSAM8@pbarker.dev>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Nov 2026 12:20:48 +0100
X-Gm-Features: Aa3M54r0p5xwQqK5S2iwOi4g81qe-FH_yWTdCNL_2GpLnil_CV7gNcaYmnPvKAs
Message-ID: <CANNYZj-LnL0vvbFki8qarEbJ2GQ8PoCnqQMbLHRbaRBHgEtbJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pseudo: inherit upstream-stable-release-point
To: Paul Barker <paul@pbarker.dev>
Cc: yoann.congal@smile.fr, 
	OE-core ML <openembedded-core@lists.openembedded.org>, mark.hatle@amd.com
Content-Type: multipart/alternative; boundary="0000000000004aea8c0660b370de"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 11:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250776

--0000000000004aea8c0660b370de
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 12:12, Paul Barker <paul@pbarker.dev> wrote:

> If applying the upstream-stable-release-point bbclass helps with stable
> maintenance of this recipe then we should do it.


I'm fine with this as long as future point releases of pseudo (2.0.x, 2.1.x
etc) will follow the same principle and branching as 1.9.x. There have not
been such special branches for any prior major pseudo versions, 1.9.x
branch is the first.

Alex

--0000000000004aea8c0660b370de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 20 Nov 2026 at 12:12, Paul Barker=
 &lt;<a href=3D"mailto:paul@pbarker.dev">paul@pbarker.dev</a>&gt; wrote:</d=
iv><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">If applying the upstream-stable-release-point bb=
class helps with stable<br>
maintenance of this recipe then we should do it.</blockquote><div><br></div=
><div>I&#39;m fine with this as long as future point releases of pseudo (2.=
0.x, 2.1.x etc) will follow the same principle and branching as 1.9.x. Ther=
e have not been such special branches for any prior major pseudo versions, =
1.9.x branch is the first.</div><div><br></div><div>Alex</div></div></div>

--0000000000004aea8c0660b370de--
