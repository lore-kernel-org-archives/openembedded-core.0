Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6043.1794695709034201447
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 14:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=QMKfFIfd;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49a92144733so816444f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 14:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794695707; x=1795300507; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+9B3ciZlBw1/nbLNl4SFu/5CHsXh/IAj/tGiTn2Us4=;
        b=QMKfFIfdLv2G8E9Q39bcvVJAmIdLPvVtd/kP+58LvdG/0wQKEKhTJDzfuMtHiyb+Lo
         UNwEJBPxM6z85qE3RHChiNyOEmtcCoIs8Q8nLRH/85rgcFLJnNNjIoOISkXEtNuef41N
         0U0dLgnETNoUeXF1hIZRCoKMAogCK6aSc6xH5A8TH9b6FR2JAb/4TFVyYlP3yw0n5tpz
         PweS7NurCR4OxkU4pa5rR+l82x31F0/ogyDejlhXTDYUxxsvBKtqSBwn1yzb84r4XGAs
         797MEbhNsk5J1AqsXGO9/DbVuzUhkb4O01Qi4fPMeiGK0UJDwoROekmTQQ5KCC0A7Njg
         98sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794695707; x=1795300507;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+9B3ciZlBw1/nbLNl4SFu/5CHsXh/IAj/tGiTn2Us4=;
        b=t5lmadbN/baymP76jZwuYwrxiFFD1KoUmKS8UqZNpR265cCvfD5xp5mnEc1i0SHHRF
         OYJiIDY+/6SOcD0cQTwYGI2/Ym12abQg/tfdkmV6rNQubZeskbJTIR+HqDh0BOAaqXdx
         5Zbg9Hj7B6dR2uTO8pfBwNLcUJHJCOdE/QfHev+76Oc03StZezfDwH7e3II5q15QJLqg
         hSSkBcvMcnIRgt71z0qpkqGQ/VTX/LLjYatFv3UuxFO3BG2ZGQSKVGn/sWDb2S8uj/UT
         sDnLbWAVzjTooQd4Q0nrQQ/goVvcFL4fJZxPlIWz+u1N0LZ7o0d1EvWMCpJwfVVI3h21
         4WRw==
X-Forwarded-Encrypted: i=1; AL+hErGfEGrg2pculbeCNalph5M9GcFN/bJG3O6ZtyRgSKIgd5o3hh8grJ96IZ4wiQ+2TotC0l1kAsOyyOPzHx3Xt+ATzg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9+vbV4FqpnxNF2lwgeCAGcDZAkdTyvGv3C9DOGeujgjPsmTjQZ
	rzCy6vle4VRLtrYmo6akkmS5td6UpvSDHoQi+eKO6Qx9fusUzs3CQVI1La3KMF6BMf8=
X-Gm-Gg: AYBFou3KpgC8coQ4coI1dlm6QfCq98juWBrfne8BdhIDBWEsIvFgDf0sCPdoryhgBkH
	KQhTrk/tgoWJxRob3fEi9iTBipmAzYXRLzT8ZikaMGs/mS4koV9x6JD7I5s7bmU48DH6VLgoLGv
	ZMvhS6Ea3scWCW5HP9QMZ00Id7pAPaeUNu3OreBVUVWsgKe+NG4fLbRAsj/9ZG+hnWxa9lv8nF6
	c+P8RlTmwu9wUi+gmAAhiOInZxYfVFjFsrYr3nNPIALtQgrkJUuEvYCdd2M36TZPNQ3E2BZ0bNx
	Av6AkbnijjI9C5EYJYX+AEa6KUH1PM5OPvHzHWJ1rs4zNlaWNLic+YCgIaFp+Q0w8+Zpw9BbOfD
	tLdm/N0Fp1Q2pzpSBTcIMKbM5UmssyXQNYaxSXk83Fgj2nKLdxKJsYKuq1iddFowAZxHJbW0GSU
	xyRHLpdjmZkD5w571ViLlDaQugWxf9Q8mz0lRlyw3mwEKv+ODKUcdVxScpeNtrWcTCdeoOfAtSG
	FB6brFFKr05COxou1PV4y3ng3JzKVJ1iEdRfz1fPXAqFoNAHFnb3iXiXo7O6ztArNQvFKrpDoO4
	UkLiWklrhQRjYYWA+UdsesjORqkIJX51KXhA+meXWYGN6pppqNgo4Tn+bO9jbcIbenXsgKrvy1E
	6pcLMbDd1dbjllbwF
X-Received: by 2002:a05:6000:240b:b0:48c:6f3a:fe30 with SMTP id ffacd0b85a97d-49c712ac861mr14096556f8f.15.1794695707009;
        Sat, 14 Nov 2026 14:35:07 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm12289394f8f.41.2026.11.14.14.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 14:35:06 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 23:35:05 +0100
Message-Id: <DMVAJ5D3PNP8.7Z2P3A5JP5TQ@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH v2 06/10] systemd-systemctl-native:
 rename to systemd-tools-native
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261027110126.9383-1-jaipaul.cheernam@est.tech>
 <20261105110930.52643-1-jaipaul.cheernam@est.tech>
 <20261105110930.52643-7-jaipaul.cheernam@est.tech>
In-Reply-To: <20261105110930.52643-7-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 22:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250213

On Thu Nov 5, 2026 at 12:09 PM CET, Jaipaul Cheernam via openembedded-core =
wrote:
> From: Ross Burton <ross.burton@arm.com>
>
> We plan on building more than just systemctl in this recipe, so rename
> it to -tools-.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit ff985de4df46945a92ae4ca59e54c930b7640c9a)
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  meta/conf/distro/include/maintainers.inc                        | 2 +-
>  ...-systemctl-native_259.5.bb =3D> systemd-tools-native_259.5.bb} | 2 +-
>  meta/recipes-core/systemd/systemd_259.5.bb                      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-core/systemd/{systemd-systemctl-native_259.5.bb =3D>=
 systemd-tools-native_259.5.bb} (96%)

Hi Jaipaul,

This one is definitely not stable. A user might have a bbappends on
systemd-systemctl-native and this would break their code.

How about we backport the needed(*) master systemd-tools-native updates to
the wrynose systemd-systemctl-native?

*: e.g. I don't think "reduce dependencies, add comments" is needed or
   acceptable for stable.

Regards,
--=20
Yoann Congal
Smile ECS

