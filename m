Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 778B0C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 07:59:33 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.145316.1783324765271945595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 00:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JBF3Sl8w;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso18455575e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783324763; x=1783929563; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wr0h/mJnCSJXg4SV8JbAK2gN3APVh4sAtdcWYPK2qxk=;
        b=JBF3Sl8wtO4uemX90+o4j9y81YS0B34a2xf4dcjG/Ktu9r49TjHeLSliy/5yLuPPTi
         LIbNo2jiSdAazJ5x/7kKSCV1eheoI9lmuFYkfpJtysPcbBLCrXqpTD38zVLpoWhDdkbf
         bqzNqZ+3yLiIJgLjf7PKLQw3Rt6jKR6pdb0e0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783324763; x=1783929563;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wr0h/mJnCSJXg4SV8JbAK2gN3APVh4sAtdcWYPK2qxk=;
        b=Fo4e8qpwj9LCx9iniPhMQ/+S5jk2ETylRX6khGnheCiIWwxGd63wnE2ln4Df0UVjWl
         k5NZiuPP3OJtALrKW9MhSMtXPGwjtbiBSQy+0+F5dQjsqNb6ZBqA3aKhD4G1aYBXfJEx
         yXq68abuZ8cBLO+xqPpAjgDm7e1Zdb3nr0h5gzpt1RsxZIuQlQDBPm4KUjGjuz/ZTxi6
         fID9pfNpqL44nay4/HUxmuvT5TqIzT2n6NS9cwEBQFH4ly8+A0k6t509SKGSHSmilecq
         bx8xYV8IPZh2NOQP1NgQdWvHkgjnRAI0gCe2ItgKtt2qZ6jFIw3qJLqUZttQrZX+JdSc
         7yZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXj2Nupl7BA8kct4f+SIkv91O+Pvbxq9YjM1MzE/0jQz2K6qm4avaYsT4VaboXAS9Y0ZOGW3r1wpyh743guJsd5Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxdif8OhWWbohqXV/4pKhYHNLfcN2ecdReSech+OaiA3Y5KE0AG
	1A5R1fq9nM4BC+XRXY6y3ba6k6Cf6de1AHYZKSvame54HFVVxGl3wlRiIvTkQ3eBWfA=
X-Gm-Gg: AfdE7cllLb2vhwiCYA8PHtd52nUNZYADKmx5g25JkzHBfz0e8zDzDrrGQnhzFP+Yx2/
	1YbGMA2hDmSCMFXsRfTPQAi1UW/uuNkXHYOWxam2Or2t7QbS9XxdvXmckhMdqSB9grqitZlebrh
	m35h6NvBuYqjICTCTGTY9Jkgk0jjD8vLmIrennapUG+tMJAP7kaW1MoScMETbusziPcDf2W42IL
	Ilz9/STGTnFgl8MkqVFyG+t52Ou5tjYvSytWy17DT6SgxvwVXNghz3bAonqqHXM3/aBh3ptGduc
	64DzQlyaiduT94PDEUNHlwJO6Fvei46rxb3kYLFOe0OcfmDhYx4L8SIk5XOGNBslGA6JYc9SZp9
	/bbds2Y5im8nGTvB5TiRzhjzXclt+60k2FxalladOWktWiTDlguehwEOmAalnBV3u0gfigYDmVy
	8FJnk31IeC1o8U39c=
X-Received: by 2002:a05:600c:19c9:b0:493:c984:db9c with SMTP id 5b1f17b1804b1-493d11cefd5mr101469985e9.2.1783324763483;
        Mon, 06 Jul 2026 00:59:23 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm332745955e9.2.2026.07.06.00.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:59:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 09:59:22 +0200
Message-Id: <DJRBVA1RDACS.3AD63SNCFOM6D@smile.fr>
Subject: Re: [wrynose][PATCH 1/4] bluez5: fix set volume failure
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <jinwang.li@oss.qualcomm.com>, <xiuzhuo.shang@oss.qualcomm.com>,
 <mengshi.wu@oss.qualcomm.com>, <cheng.jiang@oss.qualcomm.com>,
 <quic_chezhou@quicinc.com>, <shuai.zhang@oss.qualcomm.com>
To: "Wei Deng" <wei.deng@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260626093920.1079859-1-wei.deng@oss.qualcomm.com>
In-Reply-To: <20260626093920.1079859-1-wei.deng@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 07:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240217

On Fri Jun 26, 2026 at 11:39 AM CEST, Wei Deng wrote:
> From: Jinwang Li <jinwang.li@oss.qualcomm.com>
>
> Backport upstream fix for AVRCP volume initialization failure when
> AVRCP connects before AVDTP.
>
> Upstream-Status: Backport [bluez/bluez@121e5ca]
> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Hello Wei Deng,

While this has the author "Signed-off-by" line, it also must have yours
as the submitter of the backport request.

In this case, I've replaced your series with cherry-picks strait from
master so, no action needed on your side.

Thanks!

> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  ...t-volume-failure-with-invalid-device.patch | 46 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-transpor=
t-Fix-set-volume-failure-with-invalid-device.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index c792cc9c66c..c09a759244e 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -71,6 +71,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
>             file://0001-Revert-shared-shell-Don-t-init-input-for-non-inte=
rac.patch \
>             file://0001-tools-Work-around-broken-stdin-handling-in-home-m=
ade.patch \
>             file://0001-gatt-client-Fix-use-after-free-caused-by-reentran=
t-c.patch \
> +           file://0001-transport-Fix-set-volume-failure-with-invalid-dev=
ice.patch \
>             "
>  S =3D "${UNPACKDIR}/bluez-${PV}"
> =20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-s=
et-volume-failure-with-invalid-device.patch b/meta/recipes-connectivity/blu=
ez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch
> new file mode 100644
> index 00000000000..b5846dec47f
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volu=
me-failure-with-invalid-device.patch
> @@ -0,0 +1,46 @@
> +From 8a80f70c23ca5f93b1db7e3956cc7ee28c1fa767 Mon Sep 17 00:00:00 2001
> +From: Jinwang Li <jinwang.li@oss.qualcomm.com>
> +Date: Mon, 9 Mar 2026 19:18:26 +0800
> +Subject: [PATCH] transport: Fix set volume failure with invalid device v=
olume
> +
> +When AVRCP is connected before AVDTP, an invalid device volume causes
> +the target to reject registration for the EVENT_VOLUME_CHANGED
> +notification, which breaks subsequent volume updates.
> +
> +Fix this by initializing the volume to the maximum value in the AVRCP
> +target init path when it is invalid, allowing the controller to
> +subscribe to AVRCP_EVENT_VOLUME_CHANGED.
> +
> +Fixes: fa7828bddd21 ("transport: Fix not being able to initialize volume=
 properly")
> +Suggested-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> +Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/121e5ca=
79be559c5374f8a54c6fb6e233e383379]
> +---
> + profiles/audio/avrcp.c | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
> +index 724b46c59..326dfdab7 100644
> +--- a/profiles/audio/avrcp.c
> ++++ b/profiles/audio/avrcp.c
> +@@ -4296,9 +4296,16 @@ static void target_init(struct avrcp *session)
> + 	if (target->version < 0x0104)
> + 		return;
> +=20
> +-	if (avrcp_volume_supported(target))
> ++	if (avrcp_volume_supported(target)) {
> + 		session->supported_events |=3D
> + 				(1 << AVRCP_EVENT_VOLUME_CHANGED);
> ++		/* Check if transport volume hasn't been initialized then set it
> ++		 * to max so it works properly if the controller attempts to
> ++		 * subscribe to AVRCP_EVENT_VOLUME_CHANGED.
> ++		 */
> ++		if (media_transport_get_a2dp_volume(session->dev) < 0)
> ++			media_transport_set_a2dp_volume(session->dev, 127);
> ++	}
> +=20
> + 	session->supported_events |=3D
> + 				(1 << AVRCP_EVENT_ADDRESSED_PLAYER_CHANGED) |
> +--=20
> +2.34.1
> +


--=20
Yoann Congal
Smile ECS


