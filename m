Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11498.1793366748074394130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 06:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Y0A5yvS+;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso387103f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 06:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793366746; x=1793971546; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxPKVHRvb4PlQ6T4Sx1skR6ljyQ9ljZ75maIgJ2sfeM=;
        b=Y0A5yvS+vlvPzWOWo5cDPedLw0ZbbC0CcIt3gK5D9qrM/MX60SGVIPjwakYGJLglkx
         i6HIam/MDXJsJZsw5MXtIJ1DE/fe2k512enLwoP351mW18r5cxN4tuuJBx8ijoDLFmHF
         WoSJfBufNfAgfnNP1yO820+Hr4nS3EuEvb73lyYfJ79zO612lmkq/IDU2GNpZ7omYKqr
         sr+jSh1o5lS3L0/ci+EoYwAReutkzV695Ndrap+vwuI4gnKsvyn5KbXvdTnlge8yz9xo
         2eDklhMcWyKdHXAYemKWGo92z9PEI0velgS/fnRdH612ET2v1ZAYn+zBw9EO7rjBXvva
         ZZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366746; x=1793971546;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxPKVHRvb4PlQ6T4Sx1skR6ljyQ9ljZ75maIgJ2sfeM=;
        b=XRmID4+rwQBfVZZJeW6iSUnT3R0u0L6ODzmZcJmVamDJvSyVWv1qj4RVmRmNhoc4HO
         9WOjlBul3sN+zm8eVc4wYsDiu65Lwjka2C6FP8eQww6fJqRC08enSMr4x42y3PN4uiJh
         MMDGyfQY7MtPsh3PP6Ym2R/fRu5z7+/KmRwllFb6ZFisQPhgi9X+Ln46JawXAlhfqjfA
         5paq1G/Adm7OpJdL1WuQsTEdW/Bv49XLUr6MMZaW2rQoz6d+Tcmb9bnT3q8RVY39uiOo
         mqo0Ts6QeXuQPsLNOVUeXD0UAbdwQ45vVyhlHo2VDvCB1QCyLGQztHbrppoyg2MkMze0
         LOMg==
X-Forwarded-Encrypted: i=1; AKwUvByVnuY0KxWZjlDSeYNjtZiuJPPCwyFlcxShtmI5RK4xdAJ+5egQ33P1sHC5K5j+hdI9ej7ZzoaWHY3y3PuCdVQjFQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKOwbNnK6GjzFJ42ZLxNgG/AenkEkYksnBiPTTXAhbiBb0JL68x
	B3BysMKIuYRvwdkQM62dy4yQwobr1RJrIBbCq+0xkvW/U7dR3OwNfVhYtUopZ+fukdo=
X-Gm-Gg: AYBFou3YDViwvU46yMQBQ9xLw0rHVdm8SU2eRHhby0UjBr4sh9F3Vsy2bSkVecKW7Wo
	hwU5z0JSVIC+vIDJcjbHd5md591DuurqJAfMFJJAyfnyCaUM1xeUroZbsJdDsah8hTQoFkoXPgV
	74d1tZ2N6NMhVoAwYuqXbihCLKwcuQTWxQqf2DuCOMp01pHg9asjqeU9dseG8mgPgT0Tms6pDbH
	35e4NuM2B7DIE+LiK1iVRWYbdr0DeS4+SoGJPyuTn1+XKmRj4cMvzhtUlCmsrd8edQmB79EPNh/
	XLDZM1BC/pUrAP0MMLYHMAarc5yEfpKgT/5EiLxBiGfrQBpsgrPYSWr59pfd8llTbbBBrztP+kG
	imhbcXbRPjSh0QW4hmkC4cBNzfSnKL34MWz9XWKEgQzXMogd6SInsx7uw8F+sM088kzNYoIzNd7
	qJiq1sqL06yB5M6kPyzqxtzd452u6CawBXTdZvJ54gza3kbMoG02HSyzgJrYYrQZD4dM2eXnCW0
	yTFkQJmt0sSxS7Ikuv+BTVOnNqfTFx5PWnjyenVl06815+gSUNsifoggwizzEZtcKvESRTPe/1r
	laEwVMyPtmm6p89AbAaMYbctmjBbQ3pruVDbZ1U+xu7tehjhyVlWwANGK7HD0xZZqiVJvH9qHjA
	81XrUTXldi2Xt8L4b
X-Received: by 2002:a05:600c:3f0a:b0:4a3:7344:13b4 with SMTP id 5b1f17b1804b1-4ac1709a2d0mr51484645e9.14.1793366746100;
        Fri, 30 Oct 2026 06:25:46 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a0a3495sm43991475e9.4.2026.10.30.06.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:25:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 14:25:45 +0100
Message-Id: <DMI7GDCWUAVT.2F5IBL7MTJR2D@smile.fr>
Subject: Re: [OE-core] [PATCH scarthgap] b4-config: Add configuration for
 scarthgap
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261023-b4-scarthgap-v1-1-6a85c3fec09e@pbarker.dev>
 <DMHOVC3580CN.26K60XV4TXQHN@smile.fr>
 <7ed3a9b73c814ee1eed9efb56f1c03600e680f87.camel@pbarker.dev>
In-Reply-To: <7ed3a9b73c814ee1eed9efb56f1c03600e680f87.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 13:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249040

On Fri Oct 30, 2026 at 12:57 PM CET, Paul Barker wrote:
> On Thu, 2026-10-29 at 23:51 +0100, Yoann Congal wrote:
>> On Fri Oct 23, 2026 at 12:41 PM CEST, Paul Barker via lists.openembedded=
.org wrote:
>> > This should simplify sending patches for scarthgap using `b4`.
>> >=20
>> > Signed-off-by: Paul Barker <paul@pbarker.dev>
>> > ---
>> >  .b4-config | 4 ++++
>> >  1 file changed, 4 insertions(+)
>> >=20
>> > diff --git a/.b4-config b/.b4-config
>> > new file mode 100644
>> > index 000000000000..5876a9f2691d
>> > --- /dev/null
>> > +++ b/.b4-config
>> > @@ -0,0 +1,4 @@
>> > +[b4]
>> > +  send-series-to =3D openembedded-core@lists.openembedded.org
>> > +  prep-pre-flight-checks =3D disable-needs-auto-to-cc, disable-needs-=
checking
>> > +  send-prefixes =3D scarthgap
>> >=20
>> > ---
>> > base-commit: c9b000059a37241c5b97426f0aadc012b13bd20f
>> > change-id: 20261023-b4-scarthgap-31cd33af24d9
>> >=20
>> > Best regards,
>> > -- =20
>> > Paul Barker
>>=20
>> Hello,
>>=20
>> Are you sure there are no bad interactions with combo-layer and
>> poky.git?
>> When we started adding those .b4-config I avoided doing it for scarthgap
>> because of that.
>
> Yeah, I like to use b4 everywhere now but this is a challenge. We
> probably don't want a b4 config in the poky repo as it's likely to
> result in patches going to the wrong list.
>
> We could add this to file_exclude in combo-layer-scarthgap.conf in the
> poky-config repo. There's only me and Richard going to be pushing to the
> poky repo so we should be able to make sure we both have the config
> change.
>
> Best regards,

I propose to continue with the patch in this review cycle but let's
remind ourselves to keep an eye on .b4-config not ending up in poky.git
at merge time.

Regards,
--=20
Yoann Congal
Smile ECS

