Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.950.1794936716632835779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 09:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TWtS0qvE;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b30cbfa628so40150497b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 09:31:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794936715; cv=none;
        d=google.com; s=arc-20260327;
        b=DTj7L145VoMcNHrQNGVsd+H4LS0lXJr9+lfXPoW/OwRR1nQGQWf/RHeFnxtISsceOH
         ZdheTXU/hAvcbexrLpXOwYczx10aR8pEMo70MEFlY4n1FjViMiija6wjNBbAjCcU+SrK
         +YvW39CdMHLp/uiBA7mZKdLSd3SnnnvPkaZook0uQDzoEuF+088/EC4LaNaH8q31rcku
         AT/1pQM9CiJmVV2RzIKORItX+mJ+H0DzZ278JWpazBK7VW9nJt1TR93T2LKk1ra0pbT8
         O9fD7x8oQmQRuFqvDR+CJsW6hLFadeJSRqQVewyn4R2GphebozJIoRLTXVSc2BKbAmK1
         BYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eyrIhh4i1Y7qMDd2ji//BBYmm7PHmYMNLcA0qvD8tXc=;
        fh=wJLD6zetCfjYthwLiAEels19uL6o2/FT2mHHrVoI57Y=;
        b=kVX1DEjPd0Jz43MbrW5Qc+Hbk7/5ytA3BW0JVXrP9ODP4zRIOdmLDLlaN1jvUHhkI7
         p11IVsEgtAES7fxsQD2Za8jyu/n4FRU4L57y7wm1akGmaZdOJXW9Y8MetTpyaHm6WLMr
         F5zDjgUJpFZavu5Ewgxxzz1taJYshuda4kMjcV//gbUoctGThnx2YDpUkfBmzOOBxOp/
         LRWPupiNbsIAby+DvA32/Rfo8cJ2nRktvCBkbQ6/i61ZKESlpP3fxdrlYexZv+MWnU85
         7k6d3d8MTJhHf0R2SLMFeCprTfec7Bm003qU83rLlR3FbwsN1dDFKvqJ9GTfodhGa3Kr
         /I7w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936715; x=1795541515; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eyrIhh4i1Y7qMDd2ji//BBYmm7PHmYMNLcA0qvD8tXc=;
        b=TWtS0qvE8DN8L0Q1uDEkq9l4PD5xYmI1VNV+h0tB82PHE4RRHJqD81kHKg8j0eBScB
         tEET4+VYgNI/IQ36bScGvNlg46dkUwUUtp0NVhds5emh/r41UGtteYuYhYJHAoIVwTKK
         wWcvNmoHhZ/yIsr+FhQTmMonVUBYzM0XRDtwazG0Ktjrh3z6QqGKEUuYGkug8Ljwu6lu
         EcdFNBMF3OvLlH/c7Vr0cJ2oftNH63W1hhSJzwFyvvydLTOWeWrx/GAouHUv0ozpYg6F
         lEnizWBGr9vGOndEXkvoTqGgfNeZExfogHl5F6Irmhsej7yP4lHQBCTPsLXOTpOfX10d
         gXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936715; x=1795541515;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eyrIhh4i1Y7qMDd2ji//BBYmm7PHmYMNLcA0qvD8tXc=;
        b=v9ANHFk7GyUxLxEOH9VUyFF7xacdXZZmEAD+Qm8d7dJ+GMl2m1sLvOE1nsEMBm0dso
         1KwkQ2jBaRVgXr+DZ9yN4rOAWLjx7xDfz0UKc7LMlpvfJkY13aJ28bqhIeW/p4H9K1ok
         CQCLsR6imMQ76EC4oIgfJxJaI0wTVDTGCXAbrRLLvYn00vW6eW9Ua1MeVKvASFAAuX1O
         4EgRz5C2M9f3U5dyMx7NZbqlvT11MGMNTrlqzC8T5KaqRbQz+hSocZdbMEstD7Q9xNI7
         sN3v+79p7qS8keYa0KRjgCDT9PqbOjiDrg8zoHH4KjIl99T/R7vjn21Z/WMhBOPoU8k3
         8Grw==
X-Gm-Message-State: APuU4Z+gH+BiLUmmeG6yg9zpKF+fjbMM83ZKWUV3r/rKkUtMN95QNOGJ
	t1c0wpkna1A1mGP07JZmSTKhGtYi0pkDmGLXfNXQQQhceOFoLC8J4Eoa5x4zBCN2K8ceF+2EjJ2
	V/sAx+6laIPux2Fj6H8RPkRc91oaEoIg=
X-Gm-Gg: AZFdTZe/jY1czmnsLJI44UuH1qiIEV7/Pvpcskcr7Mel9P/dtsLty9pklxBHEM/uqNU
	15KEkkzFWjdVp9fQZaFMoe1IDksSBHJfnE7wTkiOkmvFBwpfv2Gw06wCHVqAUeSbiOeOdh9D2wi
	SbUXNP4vAbz//MpTQ958/SVcqpaMo+EwaksRmkHIIJPxqOFmAEH0vqeL8dsHDhVBs9sgHJurC/t
	ap0uzOCxD1kNF49la9xUvEs1tkdCMBZS/M4/LhjhzeVBkYRLlV9tVPLb9BlX6BrKn1r0lNyHmWG
	67FUP2YOFF2fhaJmJX7R3bHePFBfe3PnwmIjbGlHtCwdxEvc7MMjp2jvtAKtOLQi0rASRulcf8d
	HMIQFpaAN5djTZ9XTmXiKohYUrAgDuHWQkrcmDEqfH/jUSekDtIoWHQJ5Qhug5u+Rgh5iETJb
X-Received: by 2002:a05:690e:150b:b0:67b:ec5a:2075 with SMTP id
 956f58d0204a3-67dd401a0f4mr125763d50.78.1794936715485; Tue, 17 Nov 2026
 09:31:55 -0800 (PST)
MIME-Version: 1.0
References: <20261117120155.3986876-1-sean@geanix.com> <20261117120155.3986876-4-sean@geanix.com>
In-Reply-To: <20261117120155.3986876-4-sean@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Nov 2026 18:31:44 +0100
X-Gm-Features: Aa3M54rLdpwAnOhlE6IXOFgPx2Ve0ECiGAtb1gAtriT2xSWCVv91_EntZOcNnPM
Message-ID: <CANNYZj8S=HnSE8UN8hpVF4OfNQaaXu3W8MCaJCGjujfAJbOsvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] oeqa/selftest/incompatible_lic: build
 the SDK in NoGPL3 core-image-minimal test
To: sean@geanix.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005223b006607c456d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 17:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250465

--0000000000005223b006607c456d
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 13:02, Sean Nyekjaer via openembedded-core <sean=
geanix.com@lists.openembedded.org> wrote:

> +ERROR_QA:remove:pn-core-image-minimal = "license-exception"


Why is this added? I thought the point of the patchset is actually fix the
error, so the test should ensure it does not occur?

Alex

--0000000000005223b006607c456d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 17 Nov 2026 at 13:02, Sean Nyekja=
er via openembedded-core &lt;sean=3D<a href=3D"mailto:geanix.com@lists.open=
embedded.org">geanix.com@lists.openembedded.org</a>&gt; wrote:</div><div cl=
ass=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">+ERROR_QA:remove:pn-core-image-minimal =3D &quot;license-e=
xception&quot;</blockquote><div><br></div><div>Why is this added? I thought=
 the point of the patchset is actually fix the error, so the test should en=
sure it does not occur?</div><div><br></div><div>Alex=C2=A0</div></div></di=
v>

--0000000000005223b006607c456d--
