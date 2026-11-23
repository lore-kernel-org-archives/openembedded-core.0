Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53488.1795439307096523414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 05:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=nS9rjGO1;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so2565772f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 05:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795439305; x=1796044105; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4DEgX2e75HWpWcuVT5hhUxeRi+i6dcgQ/Kn089gFCY=;
        b=nS9rjGO1LE0EayvjsN+oEyafFVn9rqaFXBDleqR5Esm06ajAUxtjeW5R7X33Fd4v7C
         LzM89WcD5jB32GjgqoMs0U4RsA3Cpdnj76kdAcOf5KZbKY44mTNrHaoRKmQIlnCkUPwS
         HQr33nklPNc81ez4ftyhnk14q838O18MN5UNCoil3TTcFGseoKfX5DjIqo4QssZobeGC
         ULmOBUeFHVvlntvM0aDdOxOtfFNsWdMcbhi8crGKJ5pzOycB3oBk+3WR/fgLtj+hfihy
         TIeZb9k2Os7wLx5Wyl6sM9UZc+NgAK25rKoeAuUSsUAc4UdyF5igi3sMHj69RcoWBFVw
         Qiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439305; x=1796044105;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z4DEgX2e75HWpWcuVT5hhUxeRi+i6dcgQ/Kn089gFCY=;
        b=CyhM+iYJuJUDMUVtdCsQ5YEWciZ4LsnvNMIZ8KKGJyZUfFCuFGUB2Ri7fNt8MfHc2l
         kvLDljPYT+VvX0P/hudBCkTQYr/ISW6XkK2XR2COsIbpcWXSnrrJ/qTt3P7MoyRhEASi
         dsPjFtYpSOY3emoew1/3kIyw7vr1NjhI0WTVncHUho6YCvZgq8zn4suNLgzNtaiAAk4E
         45khIp25C15NHZ/nTauMHS4aQMphpQxLgcihSmjZx2b3kpa8pabAZvlzxV7jEbzDEwH3
         mLx7huojQ4fQLL4fojQ2X5h4K8ui8urSg0eAOr08mN6aP45ZtBYwle8xMlFARZx8NV1K
         qFjQ==
X-Forwarded-Encrypted: i=1; AL+hErG7KmUP9MfoggzLIxhblV4zllce1I5bMqrm7rXCXnp+luZyx5L9XscUqnApMvo91L3P19K/Qo8Jd9vWslWzXZHLTQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z97h1FJ0A4VaQr67QhrcPwbpcF+Em1MkCef5/J+dXnorO0VJ0uu
	y2OpgEsobyoTAhE1dtj0O4LFIpHMyq39eKaN28A6dHEPtvGrcvWHGs6vxhsd0jE5+1E=
X-Gm-Gg: AZFdTZcUYWJ3U3IgN4FbgBrlrx0BgWsuZVYd37DP3rvNjcyPOQDzsQ9OVvsxswk/yyI
	O6uTp5t51zJ37TwgopBAW0ov+YYkqqAZ2cVytU/NPI1WcMQBkdYcRt7ZcNTldMuzo9+zHqLsCkj
	VurT9E6DwUAyLjqMhN4xF8hdwj8IpeOXNGzHFCidJK7jd7lKZReDMQFiawcSXDcMoObdu3K07te
	9FepwiH6dPLvVEPEHaVK/N9+QZkmGlVRmFYPxbwZz4NebYt4Uw40D2PCQAmiNBgRkyQgcGFEssy
	C1xC1v7rhfFPsmMmTRmTtG7B0PHghbGwqz9WmRxj5aUYtPn+uSn+BIn6n5WBdSDbNlAvO/LybOr
	yu5akWNo+G326wV+hQ3fnahvE0MUf656qf0Bg1yM885Ous1oOZIjvxD0aCiih4ze1b512eVNRoi
	A1f7bW8MptuNA2O954y80F3OWB6J+xNkwAxnopzqJ8faAizGJLEnL/5vtFzlUAR3wdlHSPlCx/Y
	/oexJkWRtH3u9zAs3l6KRrEMALKNmrNjvy0ZeSNCUIJsCXBOudq0dGChzhi0lchdrGXDuJ9TVH3
	+0uAsWf0glo6N10Xj6oazUZY4w/Pfr6zs0xpPOrRewckwAI3dGMpFusqYVGfuJureALXHzAo5JN
	8ogZayDifA1rwbBXQcQigYSe0V4BgJrBCpAY=
X-Received: by 2002:a05:6000:250e:b0:492:7efe:3fc4 with SMTP id ffacd0b85a97d-4abb4b86685mr22733747f8f.21.1795439305274;
        Mon, 23 Nov 2026 05:08:25 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm22653765f8f.48.2026.11.23.05.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:08:24 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 14:08:24 +0100
Message-Id: <DN2M45VC2WEV.2SB302BX0OSBO@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 3/3] expat: fix CVE-2026-118370
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>,
 <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261105091719.1622520-1-dkelaiya@cisco.com>
 <20261105091719.1622520-3-dkelaiya@cisco.com>
 <DN2K9NVN0739.1ZT0ITGNS0QQG@smile.fr>
 <26a1abae-94e5-4a17-ae9b-127a4ad0b924@bootlin.com>
In-Reply-To: <26a1abae-94e5-4a17-ae9b-127a4ad0b924@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 13:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250916

On Mon Nov 23, 2026 at 1:48 PM CET, Joao Marcos Costa wrote:
> Hello, all
>
> On 11/23/26 12:41 PM, Yoann Congal wrote:
>> On Thu Nov 5, 2026 at 10:17 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOC=
HIPS PRIVATE LIMITED at Cisco) via openembedded-core wrote:
>>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>>
>>> Backport the upstream prefix and attribute-index fixes [1,2]
>>> identified by the release announcement [3]. Use size_t for storeAtts
>>> bookkeeping and reject values that cannot be represented by the
>>> existing public int attribute-count interfaces.
>>>
>>> Include the related tokenizer-count correction [4] so XmlGetAttributes
>>> and getAtts do not overflow a signed count or narrow the available
>>> attribute capacity before the storeAtts checks. This closes the same
>>> large-attribute data path; it corrects a pre-existing issue rather than
>>> a regression introduced by the first two fixes. Preserve Expat 2.8.3's
>>> PTRCALL annotations on the tokenizer callback and implementation.
>>>
>>> Validated with the full native unit suite, inline undefined-behavior
>>> traps and an arithmetic boundary model. A multi-gigabyte attribute
>>> payload and BitBake were not run.
>>>
>>> [1] https://github.com/libexpat/libexpat/commit/621cb2c78b253ee023a86bc=
91d6ddb048481c04c
>>> [2] https://github.com/libexpat/libexpat/commit/1bac53c4fc460a03cd9860f=
39501c7979f6750ae
>>> [3] https://www.openwall.com/lists/oss-security/2026/11/02/6
>>> [4] https://github.com/libexpat/libexpat/commit/c67cbc6185d1b494f521f2f=
46280d5982f50f2cf
>>>
>>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> (...)
>
> While I'm not familiar with expat's sources, I get the point of=20
> backporting this extra commit to make sure that getAtts and setAtts will=
=20
> "agree" upon using the same size_t type.
>
> I don't see, however, any clear statements (e.g., from libexpat=20
> maintainers, NVD, Debian's security tracker, Debian's bug tracker) that=
=20
> this 3rd patch is directly related to PR#1450 or to CVE-2026-118370.
>
>>=20
>> Hello,
>>=20
>> If I'm not mistaken, this _p3 never was submitted for master &
>> blacksail. Specifically, it was not part of Jo=C3=A3o's patch:
>> https://patchwork.yoctoproject.org/project/oe-core/patch/20261118103042.=
1825679-2-joaomarcos.costa@bootlin.com/
>> Note that I've taken this patch in my review branch.
>>=20
>> Please submit this _p3 for master/blacksail so I can take this one here.
>>=20
>> Jo=C3=A3o (CC'd), do we need this for blacksail?
>>=20
>> Thanks,
>
> @Yoan: as per my comment above, I'm not sure p3 is actually mandatory,=20
> and the PR#1463 [1] introducing doesn't mention this CVE or PR#1450 in=20
> any way. There's only a 'enhancement' tag (whatever that means), as=20
> opposed to 'bug' and 'security' at PR#1450.
>
> To summarize my POV: not mandatory, but nice to have.
>
> That said, will we apply this same reasoning for all the other CVE fix=20
> backports, or stick with the directly-related patches only?
>
> Please let me know in case that wasn't clear (or helpful!) enough.
>
> [1] https://github.com/libexpat/libexpat/pull/1463

I don't think we want (or can) chase down every related fix like this.
So, let's generaly stick to what is referenced by our trusted CVE info
sources.
That said, if we happen to stumble on a fix, I'm not against backporting
it but the justification bar will be higher (like every non-CVE bugfix).

In this case, I don't think :
> Include the related tokenizer-count correction [4] so XmlGetAttributes
> and getAtts do not overflow a signed count or narrow the available
> attribute capacity before the storeAtts checks. This closes the same
> large-attribute data path; it corrects a pre-existing issue rather than
> a regression introduced by the first two fixes. Preserve Expat 2.8.3's
> PTRCALL annotations on the tokenizer callback and implementation.
>
> [4] https://github.com/libexpat/libexpat/commit/c67cbc6185d1b494f521f2f46=
280d5982f50f2cf
... is enough for that. For exemple, what kind of input triggers the
issue? Why/how does the patch fixes it? Without CVE data to help, I
have to rely on this info to judge a patch.

One quick way to unlock this patch would be to resubmit it without this
_p3 and , then, add this p3 separately if needed.

Regards,
--=20
Yoann Congal
Smile ECS
