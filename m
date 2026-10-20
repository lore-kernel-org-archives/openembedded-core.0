Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2334.1792483083948494641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Wioujm/q;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1611102f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 00:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792483082; x=1793087882; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jEfjnA4lXSFTTapIMxAaEUMv27KN2Hogp1T94fckXbk=;
        b=Wioujm/q7gQYfks/ng/t6fdrB2e+y30mxzpODkJsaLcYjrgC9lhiSTXd/dssfRVoEA
         dRsfzn2GKjUkaJb4Af3+saLeMaExNzLew/r5O2vgo9HYtOQ/vOUSBuTYwSj4Fs6KP6D8
         nNNIeXAGovPjXGMJ38uKXWMNseJC8n5LuWzGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483082; x=1793087882;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEfjnA4lXSFTTapIMxAaEUMv27KN2Hogp1T94fckXbk=;
        b=eyaVtaeB4xzg4gx+vVWMyT6qBNEuyIT/DSwDti6/0AwLEz6WkhPWIC/5MKl60fWxNV
         nCKYZXTGOSnAE6kP4K65ynP4TKkgI5DDzFkeD2FqYJJkf6CwYdTU6meFJ2wiLLY9LfhT
         C2t2TLnAXPjJ4884fcRnIfuGXrhADjW8kaVmx+0kpJ7zeC9qrXAXkC+SmlMJStnLrGVY
         DD5QF54SxLjJUm8cnKflb51EE/hV/3W5BDmwkZ7vvU2/9mmlQtLfzmDzezZuSGeMwUdJ
         ZiSIpK7NRjFy+HZ4kqGz+LhV6HjYf1QxJ1G2fKEtdronP5GNZTddkTaJ2EhC1v9cLMui
         YTsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdtOAPHd4PFGrUrkXQNBbh0FNVir4pF2Qq0wiYRgnmMSjHJlpiKozN4QjxTH01ghlfbeRwD8PINeBYTFGIHPS+ZQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLQuo5AgBVCPn7lU8Y9oHA3sPPuQMwm6VYuNBc09mPY+TFPpmz0
	fhlKndyPTJBszpyjJvC02TZ/YI3L3hEO0bbebR0ZHjA3pcyckMEqtmQNIaldbjKd8yk=
X-Gm-Gg: AYBFou10N29azQ8RGq0W6+GA40krqroJQrR/j6vkfpxDbfnCqlosTyBMJ88hGo39Wo/
	i5MzWwXleF/oJ8U0z7B8hCcpb8g2XrwcOpPiGvHQbNmca1X9fNfFRBLmvA4FFNvMM+usfdEBGIP
	7zQXUCFgTTPO0Yfzx4b7+UYifg/j/vxYayGsght+2WySD8JgSajQwWnJTSFIyoRcGbI7M+lZaLD
	5Ztp1mp7XXaZop+x3lx7Akx3Ete3E2g9TUTwrfQnokCOlqZEkmOqc2ey4lfDEsDr96+P2beGuV2
	QeJSVToIb21BaM6zswpERyzh4spiQBljWNENL5YLgUyOQ8WmLlWef85GwXHgxRxEA5Yyno2BIhI
	BAVxQ48tk6tdJDXXZxemvlDaa6oRMgLA12OxiT6E1oBJlqil6k5oDVa94gNaxUgoR36ERCfdsOk
	2FaDtgAUon1A/k8rQAudOso1TRWZYbeQ7ni11FeU+nQnxkkxDw6CmAIaLEsolK6NGKqmfoHInm1
	3oj1AHgrM4P5+kSk3xYS48tbtbHsdUzuSZ2erd+GoOewWI4y3Dg/bXS6EYE
X-Received: by 2002:a05:6000:240d:b0:48e:e28:ada8 with SMTP id ffacd0b85a97d-48e0e28ae03mr16893196f8f.52.1792483082056;
        Tue, 20 Oct 2026 00:58:02 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a02-8440-a50d-9979-1d13-70a0-c696-7744.rev.sfr.net. [2a02:8440:a50d:9979:1d13:70a0:c696:7744])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8185ddsm4224445f8f.29.2026.10.20.00.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:58:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 09:58:01 +0200
Message-Id: <DM9I7ZIVXXOH.17QJPV8LCW8QO@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 5/5] bluez5: Fix u128_to_string
 skipping data[4]
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <cheng.jiang@oss.qualcomm.com>, <quic_chezhou@quicinc.com>,
 <wei.deng@oss.qualcomm.com>, <shuai.zhang@oss.qualcomm.com>,
 <mengshi.wu@oss.qualcomm.com>, <xiuzhuo.shang@oss.qualcomm.com>
To: <jinwang.li@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
 <20261019082346.3287363-6-jinwang.li@oss.qualcomm.com>
In-Reply-To: <20261019082346.3287363-6-jinwang.li@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248244

On Mon Oct 19, 2026 at 10:23 AM CEST, Jinwang Li via lists.openembedded.org=
 wrote:
> data[3] was used twice, skipping data[4] in the output string.
>
> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  ...p-Fix-u128_to_string-skipping-data-4.patch | 33 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pb=
ap-Fix-u128_to_string-skipping-data-4.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index db650acdd0..75d76cf96d 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -80,6 +80,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
>             file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
>             file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.patc=
h \
>             file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
> +           file://0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.pat=
ch \
>             "
>  S =3D "${UNPACKDIR}/bluez-${PV}"
> =20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-=
u128_to_string-skipping-data-4.patch b/meta/recipes-connectivity/bluez5/blu=
ez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
> new file mode 100644
> index 0000000000..338bc228c1
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to=
_string-skipping-data-4.patch
> @@ -0,0 +1,33 @@
> +From 198f4e0785644cea2b2154b383fc4ad354707947 Mon Sep 17 00:00:00 2001
> +From: Jinwang Li <jinwang.li@oss.qualcomm.com>
> +Date: Wed, 23 Sep 2026 11:29:57 +0800
> +Subject: [PATCH] obexd/pbap: Fix u128_to_string skipping data[4]
> +
> +u128_to_string uses data[3] twice causing data[4] to be skipped and
> +DatabaseIdentifier, PrimaryCounter and SecondaryCounter properties to
> +be printed with wrong values.
> +
> +Fixes: 5ee26d43c65c ("obexd/client: Add DatabaseIdentifier property")
> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/8b4a417=
6063831476bc9244d20f43b552e4b5554]
> +Assisted-by: opencode:claude-sonnet-5
> +Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Hello,

Is that commit included in master and blacksail? If not, can you send
the needed upgrades/backports so I can merge this here?

Thanks!
--=20
Yoann Congal
Smile ECS

