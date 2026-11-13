Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9561.1794571891887825073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 04:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JxydESSR;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6767d92cde6so783005d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 04:11:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794571891; cv=none;
        d=google.com; s=arc-20260327;
        b=CR9GM3Qm86fxk4CWxdfnJVsOoRitilT7JBfqBfay6BiUPc5LE7lRl13yXi1BnUUAxK
         skfDetqfsBzAvlF+VeTkkv7Qxsp0Z1jt25CyzpTaj6X5jAUW8Uamrz932w94UZ/PA/rP
         2sqpnJf7ZO1LXw+6D/KCieLDaXyYUtMU5NjjQJtR8fDsG1LwrV3TtmwrFv6skW9okCa2
         LS3OjBtqKCJyhQI9wlFdYKt6bEKNPy9ZR68cKibh8QLV270IHL56FVFpBb5XvpOQTdTp
         zChL+j+eoKPBmuxNHR6NfsCx8XhqBqjMwadMnsDco9XfuVyqmcQq/DAf0p30OlSD+ijp
         9mOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yaTaFurxSq8ZevDnRV+AK4cdKluFp2noFNI1i8gr+yE=;
        fh=FxPQcvcPQCuYv5p+cTI4sfqaVBcM23gFaSmq5pfnDY4=;
        b=jc9ZyMyy4vehTpOkM4VfIJ2GljtlHxErbcekc4FKLsiit9upyvmwLdd8QMPb/2d7ZI
         ffO4yOYgN0sSWBxFE789xZsLDpLnR58vhJqZkJj3ekwPFP9/u72mS6piFds7pceNuEtu
         0udMdF4WzhVvwCgtDAyGE5UPreBscPiGNjiZSF6du/yP4yDwboUsaDpJmQCQs8Cow4wx
         55qWQCgtgV8QoZvaedmPql4tQcTQAAK0PxyKb2GwF9AUJXT8JeueWYFOrHd2LWKXqBAT
         75DHFqvaF5LliZ8PgDWN6q773J/6AZ65Sat6+At4QVDQT0+QBx0Z8mPgST+sATSDrKDL
         Pu/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794571891; x=1795176691; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaTaFurxSq8ZevDnRV+AK4cdKluFp2noFNI1i8gr+yE=;
        b=JxydESSRnUaN6xuE4SBBWG//ykfsvzpT6T01zTLu4gt/G0tHJ22/yxBT3nagmNrnr8
         hjGeMcxpqZazauN1kR6eQ0MvVDkwS1uMDQGh7x38FChUc/UJiOBBDWTTpKHY9GgHfX4E
         cCVQm5weLNnL0XFJ+pv5T2KWn7r6SHe3m2kFsbz2GU++Ss1caI+IhkP2mXUrx57y88Sa
         TsluZXaaMCVCskcDu8Xv8Fs35562QM5uDZMUlNFffGiWh/tXoQJcBfDj9USiyiDucAXH
         EMtPf8WpjyE4E2NOQ7RAhBSr8lXQGcjszE4AcVJttudIHJeEdbPeG9PzI8BdrhgJGsYO
         eIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571891; x=1795176691;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yaTaFurxSq8ZevDnRV+AK4cdKluFp2noFNI1i8gr+yE=;
        b=xEEONmEyAdxKCo1t6arNh4kL95su65F6I9UWBS6YPAjcz3oAX3wKGy6nXno1SyNMHu
         9pXvWKXQMzCDKVYRuBOtWNyJM0VBGAgPuJvhxGmt2dWmOxIQN+edVt+halZJPcNTDZPM
         e+tTNfazqmv02ULt/M2EYUo7c46dl0IkGTX6MGASgr8pztL5T+094q3NVSrWDVfWmG90
         HZHJgOdmTmI5HnDL0dsGtTeiqnRIwshE4hGGwNwSdXWz6Ad24mSo291kdw6fcLWBrbjk
         TKORRIUCYqeDcsfY2YM+rlZprGhsHSjy1QRjLJay45s/gk1JM+9BQ80QUExv3kv6Otvy
         1V9g==
X-Gm-Message-State: APuU4Z9tiWup5Iwn2Og3a5pOsCjuTkAcT6tML3b3sTs8QQwvVNF/SFzp
	ygUt+t5kx4HLpnDH/8rLDrNBHP0uLN0P1QsvC0PRoeoeRXI8xB/CDe/9nO225fVmGuakCNUhw4t
	AyzLqqsQf+PnMSSP03kO1uZx81MhuFP65UA==
X-Gm-Gg: AYBFou30h19N3m6HRTSqnpiB8wvZE0KM0GkYSjzigCKmMMwoFxD1wLa5GtfcS2qAhNC
	TRZrdP80RzaWHkH2HZJqCtpC0xOpkSk8T+BKpu/NqU1AoMF4VhZFucfMnSvx/+oZ8nSghqLjXlv
	ZhaeV7kwZvTVDr2wxEHbiHzgcw8Lu9PyxqnlLNxeZc1QW6/SVCPDpeZFCSSa2Elg5HsiWdSoYbP
	eLaY6UHkLkX5GQIYE2YgKtY9s+eTCmLCL5NfYx5LYlPjZ0mbM6y48z5/4AiX+5wUtZaC6Q83j2R
	FlfmcWBU18LBifMsZZQs3AmjtkqC9i2Ein6prpi9DOqLgbD29tMkBkTEFLLPRurmg2oScIyhTo6
	T9LUVWD3rs/0mkpHw8JXYgh+TwGxobd+/DscnCQCg1n6DGXMQU0xnWpQkmb5jY/nBy+dL1UE=
X-Received: by 2002:a53:c2c4:0:b0:67a:82b0:3c95 with SMTP id
 956f58d0204a3-67d897c862fmr1155208d50.103.1794571890879; Fri, 13 Nov 2026
 04:11:30 -0800 (PST)
MIME-Version: 1.0
References: <20261113101537.3586467-1-sean@geanix.com> <20261113101537.3586467-2-sean@geanix.com>
 <CANNYZj-stM_rpnBi9FRhBvgu+seUOyMY4iYB4qenQX9kSMrZoQ@mail.gmail.com> <7B8E3511-F97E-4B4C-A33B-33A04ABE85A3@geanix.com>
In-Reply-To: <7B8E3511-F97E-4B4C-A33B-33A04ABE85A3@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Nov 2026 13:11:19 +0100
X-Gm-Features: AclHuK8iq4LZdJ5_jvs6Ls4L3nqwLMYgYCFJjBOJlegtgoTHwH7sPWmD9Ot9k1o
Message-ID: <CANNYZj8tQ77d71dezuozkM7gUCAXOwn-R=+czFxsJT6qH7HigQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/selftest/incompatible_lic: test
 INCOMPATIBLE_LICENSE in populate_sdk
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001471a306602754a1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 12:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250166

--0000000000001471a306602754a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Nov 2026 at 13:03, Sean Nyekjaer <sean@geanix.com> wrote:

> Would you like the tests to be reduced to:
> NoGPL3InImagesTests()
> ...
> - bitbake('core-image-minimal')
> + bitbake('core-image-minimal core-image-minimal:do_populate_sdk=E2=80=99=
)
>
> That would check if we allow nativesdk-* packages in the sdk.


Yes please.

Alex

--0000000000001471a306602754a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 13 Nov 2026 at 13:03, Sean Nyekjaer &=
lt;<a href=3D"mailto:sean@geanix.com">sean@geanix.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Would you like the tes=
ts to be reduced to:<br>
NoGPL3InImagesTests()<br>
...<br>
- bitbake(&#39;core-image-minimal&#39;)<br>
+ bitbake(&#39;core-image-minimal core-image-minimal:do_populate_sdk=E2=80=
=99)<br>
<br>
That would check if we allow nativesdk-* packages in the sdk.</blockquote><=
div><br></div><div>Yes please.=C2=A0</div><div><br></div><div>Alex=C2=A0</d=
iv></div></div>

--0000000000001471a306602754a1--
