Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3203.1794219554191649941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 02:19:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=RPSB6JHz;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490f38e9688so534142f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 02:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794219552; x=1794824352; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/7w5ySIin6VfnyQBcZ2ejONxVm7rqX53rIk//KHXlPQ=;
        b=RPSB6JHz8qt9LJGxKXQV2SMjxOJ7z5uErX7SukbLgaqDdHHUFvqiUQIdJyeB480hsm
         4siwQOQiPZ8xozD2lPf3luq0uVNO30sHbl2ATZ3fCdb+ZF1qnYXvaZusJjd8YdBiXCUI
         x2zaJVQfliWJBrAWT0qKRYDDfD9nCzMTUfUtBoLq6ELco/XcG5vM3gENa5lZR+uX4jAI
         aElqrFaIiP9VpXNI85DwsqQHWSRJUzSbyMX2aVbi5QdAWh4G2a1GFomn4YMPbU0fMdrb
         IRsSOWhm29DIcurpNZiRB4MF17DmyzSO+5fxnNjWq7AAnrbYXgOXIoQi9BuoY6HuXFIm
         SLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219552; x=1794824352;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/7w5ySIin6VfnyQBcZ2ejONxVm7rqX53rIk//KHXlPQ=;
        b=0J1ya47tRQd4IqKTA1qf38AwTg0WqRer6jUu0Uu04G1rT5IbyW+trfBLLMfPMhjwVd
         MWLtg33PqKdAhFPmhIn4Ij3QiQxEioBgk/eA8dc3/xCpYxmdZkKa+m6cBrXg4zH90zf0
         h0km459SLtFQqG2kDld5gUQuj1tcTBKTO0oHFNXCwGdO88QW/hzUG1pJtBuCwmpeIlBx
         kUepH1RdxLeLpyNNc/7jTM0Bau9oV1WhIqTt/uGNKYwJxGL81A3zVA2nlX2zcGJPAY8d
         5cI/Vwdhflnp8Bl+ULU54uBA8CB3F2bdk24Z446pcqB7ok5Jkc1pK24/Kq0J2XXWdF7h
         FJnA==
X-Forwarded-Encrypted: i=1; AL+hErF4dtDTL8XxfDRpmyhOOGDBFvIauTrv53vXF9yEREs6vLsY/A/fl0aH6yiijEfaHVcHbis0i+D4oSRulQvK1a7kPA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8cuE0EFQJX+/CNp11Ias34UtHSjIwJwNotKgFuciKIBps4PTt6
	81BcIGwGvrRAIBlwdM/KUKV+/KGW/VVoG8SyrnBqxmYnWsPn01SB606ZhzrRd9+VuPc=
X-Gm-Gg: AYBFou2EUAZbj54Gu7m5VHFdpLQa5d95NhQurND4eVTyOZ1P+lsekauVa9GcMUcpYx6
	ALg1ILm0rIWJm26qwMzos77ENpoLoLrUNeqxPIAgTEmCTrC47ImoG7WNmI6DPjAvxGHtaVA389T
	EnQkIhYCuUhwLE5Yxs9o29uS/ME5lZ9Nbx0G/kIeM2s28k2Jtx5L/tK5t0krN5Kw99QMh6n5nOX
	S9RzsjofgUR22Bx+TR/7s62vpAYaflknf7Qiu/O1PHFmVjcUWzXq6b3ibP6EqpDnIQitR08S2UC
	a5KejTINFkz8pGONnv6do2u6KgklWVqja7TB2KN9us1E/r75ro1wceXyoEk3pJUE6Xaxzwwoyce
	UpZiUppNTumFXZSGP8AdkO2ykZSUjlYdiwiiQVJgcW5tdAAghXiggfGWhyGIKXwMdmmiGLoCJIz
	o3kifmPPdwCQBgFmGawKDMZc4TkFAx6LB1wTAv2XyBjg3jIyuLW5DrQH+byyJpxT3o3+G3jv23I
	2+rL8Ckd1GL6zv0q5ONySm8Z1nsAjXuVtBUql9OYgObGVmWVpjj4FYzz6Rdz265Ygitwz0o5UIt
	r+vHKoKdLtbf/oKvZhv0ywCZiPW0VBnsWEOGfwd6l9sg3c8FM9WggB1gZAdKP6oWGJiEXLNHrgt
	Tb2VITVdIUnYC5A==
X-Received: by 2002:a05:6000:25fb:b0:492:2b36:a149 with SMTP id ffacd0b85a97d-4942519113emr11585854f8f.25.1794219552183;
        Mon, 09 Nov 2026 02:19:12 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fc31sm9046248f8f.48.2026.11.09.02.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:19:11 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 11:19:11 +0100
Message-Id: <DMQLQYYMKVUP.2W0R64KZ4VG6I@smile.fr>
Subject: Re: [OE-core] [PATCH v2] [wrynose][backport] bluez5: Abort
 continuing response on fragmented CT replies
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <cheng.jiang@oss.qualcomm.com>, <wei.deng@oss.qualcomm.com>,
 <mengshi.wu@oss.qualcomm.com>, <jinwang.li@oss.qualcomm.com>,
 <xiuzhuo.shang@oss.qualcomm.com>, <chenhong.zhou@oss.qualcomm.com>
To: <shuai.zhang@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261021090017.683390-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20261021090017.683390-1-shuai.zhang@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 10:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249800

On Wed Oct 21, 2026 at 11:00 AM CEST, Shuai Zhang via lists.openembedded.or=
g wrote:
> Send AbortContinuingResponse when a Get Element Attributes reply
> arrives fragmented, as the CT side does not reassemble fragments.
>
> Backport upstream bluez commit 249e2bedf ("avrcp: Abort continuing
> response on fragmented CT replies") to bluez 5.86.
>
> Fixes PTS test AVRCP/CT/RCR/BV-03-C.
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
> Changes for v2:
> - Fix subject prefix to [wrynose][backport]
> - Drop Upstream-Status tag from the commit message
> - Keep upstream Upstream-Status and both Signed-off-by lines in the recip=
e patch
>
> Link to v1: https://lists.openembedded.org/g/openembedded-core/topic/patc=
htest_results_for/121863269
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  ...inuing-response-on-fragmented-CT-rep.patch | 63 +++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Ab=
ort-continuing-response-on-fragmented-CT-rep.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index d857c23..2d0ee56 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -76,6 +76,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
>             file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no=
.patch    \
>             file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners=
.patch \
>             file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filter=
s.patch \
> +           file://0001-avrcp-Abort-continuing-response-on-fragmented-CT-=
rep.patch \
>             "
>  S =3D "${UNPACKDIR}/bluez-${PV}"
> =20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-con=
tinuing-response-on-fragmented-CT-rep.patch b/meta/recipes-connectivity/blu=
ez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch
> new file mode 100644
> index 0000000..9b29ffa
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing=
-response-on-fragmented-CT-rep.patch
> @@ -0,0 +1,63 @@
> +From 41a00c93baa48cbd63b182b853e93a946962cada Mon Sep 17 00:00:00 2001
> +From: Simon Mikuda <simon.mikuda@streamunlimited.com>
> +Date: Tue, 9 Jun 2026 23:26:56 +0200
> +Subject: [PATCH] avrcp: Abort continuing response on fragmented CT repli=
es
> +
> +Send AbortContinuingResponse when a Get Element Attributes reply
> +arrives fragmented, as the CT side does not reassemble fragments.
> +
> +Fixes PTS test AVRCP/CT/RCR/BV-03-C
> +
> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/249e2be=
dfacf51fc6c89f43a0adb9a12d761c2b7]
> +Signed-off-by: Simon Mikuda <simon.mikuda@streamunlimited.com>

Simon did not Signed-off the upstream commit. Please do not add someone
else's SoB =3D> Please remove this for v3.

> +Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
 This is fine: you're supposed to SoB the patches you backport.

> +---
> + profiles/audio/avrcp.c | 25 +++++++++++++++++++++++++
> + 1 file changed, 25 insertions(+)

Regards,
--=20
Yoann Congal
Smile ECS

