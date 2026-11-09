Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3030.1794218715886663018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 02:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=eA3icrFg;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so6480435e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 02:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794218714; x=1794823514; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4u5b2HfoBmOy74z8uhtPoTesMSs8ZnxYqlTwYM8xZw=;
        b=eA3icrFgNkiBDSmfmOzuKu208PkAaLlsNgCXZ7QJ7iJ/HNI82zTx6COSGCHZKow3zT
         /0zlDjCKgBko4uhR1gYdwC16Q2s9dOpcx8U2H5P60/a7fT7sThC0zky32g+SPYWQtgRB
         OOH1yxnYQI+OTETjOLIO45AOWpt5ZVzee7Sjs5vYbdiAyrJEkczrRGSMspzXOvVAZGBc
         F1o0wXwifp/vNerMgJ1a/CRyM3KaZwh2C9xLs3dpGg/PPZnmpelsQFo5doOXVv3Rv0ls
         esKoTaCTDxMBDnMObeFQcvXIN0zAGtaYQkxCszOlW3t2F9cjtuB/UmnQkexRfIgfrnt6
         7++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218714; x=1794823514;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M4u5b2HfoBmOy74z8uhtPoTesMSs8ZnxYqlTwYM8xZw=;
        b=D4kGAz2rX1MgHr1IHR8u+EtrbyDTK/zkohrbsCBobElCLkuqcqvRDsGYik9DUpuzcC
         LmBdKe1hPiCetWrluzSBX5gETqXuhxSPxR8oilAHShn1wcxUgLvEGlFTbvgoKBktRcUr
         cbqAmRoUGbouo3EONvUnlGufPZy7Wy5PSYW92AU49h+PEeBpTQlIJ+IWbL4rkC4c4DEz
         jA4l9qH3oYcYG9gx03oj4svlFWk8wJQTJxbk7XlfZm6FwpgUjaQluLpddqlei6BGiqDl
         h+U54ugVVmcIjeB2Pamh+S2sqIIB2aCXvqGjS5z9/g4RkRcysCov4uePnHQZOBn3DY0Q
         uzEA==
X-Forwarded-Encrypted: i=1; AL+hErEQOYnDB6LgVhy/8s79TTazBPl0Ax4YMnTGV3IMfuZYi6LR5G5EGsOEblm1dAA7d3ZeCkvBVFQTnS+BFdBBuqHU4Q==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8Od/EM12DsnXe1q9zRwL4i2OCiN+OwaDJ+iDq3bzG58ykETWsY
	tCyMZT4ZrUsGqJmCAYy04T1RwAOghVsIrLjVSC+9trDPXSzZo6aQ4fEDG614ee6pqt0=
X-Gm-Gg: AYBFou3SFqP600BoLQn1i6gk44vkgxqvCB2B9LMCx911pufDAiDEK1PwZ7yj71kovMd
	6SyJZ3VPeAcNGEAgAWnpuB/m00wPen089kApDt1PCwBHnNlft9RX6JE8yafG/mQYyIgqGEjbqfQ
	BqEcvW0eytU+8nro2UB1gQ5bS6tucz+HvMtvJz2osZdN4oNQFJ7wUZ8kD40+qYErD6qzaQ0yx3j
	bTMN2Weotlw5KsOWDMorApsOeVj+uyyk8cmEHFLuXvoK6sk0vEt3WxqBbxAd/L/JA2b6jwaU8Kc
	lbyVmL9XKpHexjdH1X0u7ST83ZeRo3IlwaTlDSYBI75GoV7ZKZe4G6od8b8Hw+lzzVhVJowaY+t
	yaLAqANYrJ1CJlVuVcdb8loEkERjuHJ0hZHuKt2QsWVi/O6xzEBXlkcLg6dHyJvf0dJDZ2moVIH
	rRXo+vcVNZS9g6jQegSPQRbGDJGDyza6vbpngbww/LhbM+HKP0iag8ZPzihnzoQI3Ii7C2uhn3t
	2xB88pKEAk2zHOHrIm1c8tTgmW88j8cICwwB0TFxBIc9l+dfcyfLmeVCdUEi9OeZ9JymRrRGIAG
	C3F6QZG3TAAJki4p3i8TE2dWEkQrKahyp3U60RJ/43HnHjBtds8Ptn8Vx84o2KvFGhUKequdd3/
	PFvZvbtOvjb7VwA==
X-Received: by 2002:a05:600c:a00d:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4b963c8e853mr53373275e9.21.1794218713750;
        Mon, 09 Nov 2026 02:05:13 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm131013925e9.1.2026.11.09.02.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:05:13 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 11:05:11 +0100
Message-Id: <DMQLG99XHPGK.3DZPVLXXZQXGS@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] alsa-ucm-conf: Backport Arduino
 Monza UCM support with DP audio
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <kumar.singh@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261109080809.4186466-1-kumar.singh@oss.qualcomm.com>
In-Reply-To: <20261109080809.4186466-1-kumar.singh@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 10:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249799

On Mon Nov 9, 2026 at 9:08 AM CET, Kumar Anurag via openembedded-core wrote=
:
> Add UCM2 configs for the Qualcomm qcs8300 Arduino Monza board
> (VENTUNO), covering HiFi playback/capture via Line1, Headphones,
> Earpiece, HDMI1 and Headset, followed by the Display Port audio
> support added on the Arduino VENTUNO-Q variant (HDMI2/DP0).
>
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---
>  .../0001-ucm2-add-Arduino-monza-support.patch | 193 ++++++++++++++++++
>  ...Arduino-Monza-add-display-port-audio.patch |  53 +++++
>  .../alsa/alsa-ucm-conf_1.2.15.3.bb            |   2 +
>  3 files changed, 248 insertions(+)
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0001-ucm2-=
add-Arduino-monza-support.patch
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf/0002-ucm2-=
Arduino-Monza-add-display-port-audio.patch

Hello,

Adding new board support is a new feature and, as such, is not
acceptable per stable policy[0]. So, I can't accept this patch, sorry.

Regards,

[0]: https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stab=
le-lts-patch-acceptance-policies

--=20
Yoann Congal
Smile ECS

