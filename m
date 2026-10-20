Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2332.1792483069349058934
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lYMPNMXY;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so23426475e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 00:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792483067; x=1793087867; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ZsQk2zx/WBgnfWBglgqHzJ++jMGd7v+EmFqaTKpwoo=;
        b=lYMPNMXYafc4sFAIydk3rjnCXJkJKVcgONWIlRaPcFufMd5ykW16GIoG3ZW0UhBIvb
         pOR0cURzry1nzkcD7hvsnRQTqQSuSKzwlq+ttI5lWyyFfpQ2t2gpDGGdquNOVEcaRcza
         Tsk0iNVhURjFxa5AFhjWpi1+hN+JycHz3JwAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483067; x=1793087867;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZsQk2zx/WBgnfWBglgqHzJ++jMGd7v+EmFqaTKpwoo=;
        b=QP7JSv5pZ1NilSgnn7365o3o5u3XBdxHbDBEtCFvvX9N1HZOLrs1BkLK1lJ2/+hjVi
         uyLFioGBuXp95OZh0w66oZoPCQAxsFKUVxVT0NWLuKQ2TiaLKQOOXveeh/s4z1N7it/4
         rPSns0LQyz5hkQbw40hZLq5ICZXfGnTIjuP7qroXStGG1MGz3D2SI502U+eqDdTGOSch
         FTlh+SkBctCRiKZqy0LHMmOs0WdpBOOvbQqfSGwPljCqRsGJm9m/hNkNYqSQyBb6+xbZ
         TzCkZIB4L4AMbF/yp1zURtCFqEOJCmnBIbeyMsUMskG1HCdWrWEziz29HzeBJYp3C1hV
         yA3w==
X-Forwarded-Encrypted: i=1; AKwUvBw/jRwL3Ysov8CcR2l2UdjnvlDZit3+JWSwjiE3QWUtZTZCuHJOodqwotdD5OSzqfZ/A7BTGypwPpEzqt7MQMsEhg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLOEoX2ZJNHmcyMJJSDWRXJeWerVKeUafBPbLj77h69VuvrLAry
	uCvRwjBQfCJmtz4Y8LUL/GMIuPacr9XD23K1TH6L9S87097Ut8+QPqpjgyeHY5YZx60=
X-Gm-Gg: AYBFou1jsR8Mo8lqAbfIGZMqQtl3LmmPaRxIqT03CsxWYn939I0LFtWi9Iuubj6X3/W
	0NfV5KpCz1dSOrYnmb1fNKoIWmVUFDaaWik7t88wlYFi1vGJHZ1vwI5fN2a92I/yVci+fKFzU0H
	H+XoAixmjUXsAu0waztMUkrHYnWCmqajM9xLFhT7ZPN24XfPl2a3MDife8ixSB2RXquJmuE6ozN
	tTWN/Om2XTDga5WM+EGozmUEVIIn2Jg13G2u55ZNw3Qls8W9O1SrOhaYVDjmluS7Ui7iYnZZ2PA
	RW3Fp641CxPFAFMdEV4dbLrdjCW44d2dOHeikheFDrNjytnAKH82txMERtcxiQsOPGiv6H4zTvr
	ioqnY6oTVQdbxTs2Vyasb5cQTwJyU5/2BNox37sBHzzJIxTHRUTW/4hyG1RlGHunC8XE5hxzlb3
	KtnOGnyIJOH92BOhHAQU1pukgzaMv8r5pd6nHrgh+1RWDw8jOF6pMBTxCvNl1245IiiU13eBUlG
	Mw9S7SwBafGx6QRlxV/YFdOLQHXMAXP5acQquX4JqKO1nv5CyeTHFmsAWvu54JzpR3XR0o=
X-Received: by 2002:a05:600c:c16a:b0:4a1:acab:234c with SMTP id 5b1f17b1804b1-4a1d75f23a1mr208757725e9.10.1792483067416;
        Tue, 20 Oct 2026 00:57:47 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a02-8440-a50d-9979-1d13-70a0-c696-7744.rev.sfr.net. [2a02:8440:a50d:9979:1d13:70a0:c696:7744])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc952d63sm334535445e9.2.2026.10.20.00.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:57:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 09:57:46 +0200
Message-Id: <DM9I7SSWHOKE.TOUEIMFGVMET@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 4/5] bluez5: Fix ABORT response being
 discarded
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <cheng.jiang@oss.qualcomm.com>, <quic_chezhou@quicinc.com>,
 <wei.deng@oss.qualcomm.com>, <shuai.zhang@oss.qualcomm.com>,
 <mengshi.wu@oss.qualcomm.com>, <xiuzhuo.shang@oss.qualcomm.com>
To: <jinwang.li@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
 <20261019082346.3287363-5-jinwang.li@oss.qualcomm.com>
In-Reply-To: <20261019082346.3287363-5-jinwang.li@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248243

On Mon Oct 19, 2026 at 10:23 AM CEST, Jinwang Li via lists.openembedded.org=
 wrote:
> Send the ABORT response after transfer_complete(), since it clears
> the pending tx queue and was discarding the response first.
>
> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  ...x-Fix-ABORT-response-being-discarded.patch | 44 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fi=
x-ABORT-response-being-discarded.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index de9835e5a7..db650acdd0 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -79,6 +79,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
>             file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch=
 \
>             file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
>             file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.patc=
h \
> +           file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
>             "
>  S =3D "${UNPACKDIR}/bluez-${PV}"
> =20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT=
-response-being-discarded.patch b/meta/recipes-connectivity/bluez5/bluez5/0=
001-gobex-Fix-ABORT-response-being-discarded.patch
> new file mode 100644
> index 0000000000..5c0d7414ee
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-respon=
se-being-discarded.patch
> @@ -0,0 +1,44 @@
> +From 38a88cc433e0bc3cccb6dab126e484fc06ccd8bb Mon Sep 17 00:00:00 2001
> +From: Jinwang Li <jinwang.li@oss.qualcomm.com>
> +Date: Thu, 27 Aug 2026 16:36:51 +0800
> +Subject: [PATCH] gobex: Fix ABORT response being discarded
> +
> +g_obex_drop_tx_queue() in transfer_complete() clears any pending tx,
> +so the ABORT success response should be enqueued after transfer_complete=
().
> +
> +Fixes the following PTS test cases:
> +- OPP/SR/OPH/BV-27-I
> +- FTP/SR/OTR/BV-02-C
> +- PBAP/PSE/PDF/BV-06-I
> +- PBAP/PSE/PBF/BV-03-I
> +
> +Fixes: 7a35c12a6ceb ("gobex: Fix segfault caused by interrupted transfer=
")
> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/d094be1=
0ff0cc9d48714d35557e0fd297f36f907]
> +Assisted-by: Claude:claude-sonnet-5
> +Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>

Hello,

Is that commit included in master and blacksail? If not, can you send
the needed upgrades/backports so I can merge this here?

Thanks!
--=20
Yoann Congal
Smile ECS

