Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14307.1793090647712983773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 01:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=kr8H3UAp;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso8198005e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793090646; x=1793695446; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g5AG9FvmG/fLh7inV5WCLHKX3nNCJ6UwPdLCQC7fkdE=;
        b=kr8H3UApC4YrVbt+0YuKwXCIlv4M0cPCAtUVGFbJKOu4gcaSqR4V9x0r6kh0819F93
         L5Mvq8RpVPOxFiEePqP/PYmNkakY13B/eoKVTtENp5QLuRexsw+mWDABWZVo3z/zdbcJ
         f8LQJY7mBl7d00BrW5s46iqPYJ7x83vnhKdgypn+JMF3wFAATj4qYJwlQrP3Bq4aA44o
         TDWSDzdatrAPdQPew1IexPRfCddoh1vEgLvEFDlSmNdbAJAjmqX8rcPbuSrGbNrbuof0
         X2dJ+3fo5aFmVtq1lIVB3H2j6TYkgVaxBOOS22hsaM189ZBExXMZxN54EmGP6R6iLZQ6
         cRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090646; x=1793695446;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5AG9FvmG/fLh7inV5WCLHKX3nNCJ6UwPdLCQC7fkdE=;
        b=JwdSJnMDPe9zhCrnTNTceHunoXn05MiTf6zcR7NtrNseNP5HsglJbISc2vxKAALT1r
         yKfEmBJx84KxmQdX56dwOYylnDxKaN4GpS+Jad2NeEh+FtxpGcC6CC+HGrcN0Y6qd2iw
         adczrPMIhwXN7QRexXOnkidtaWvSSE+EL7D+DRYUq2lnmxIU4f7ZU5jBzgF/2MZJ/S52
         sgw+RZmZOcnK0Y5SVWcb10aVjonZdR/+fcmtTfyc8WJ4hWkMX6pMoSp5QKJiOKRKJn5T
         FC+nW/FQZRwURYJ6ZL4y7xpzwkPO9G6Y6/Y/ftWQsuEGdcoOZoparQCJ8BF6ZawWruKd
         m5yg==
X-Forwarded-Encrypted: i=1; AKwUvBxsg+z+HSDPrU1Y+U3vtQypjtkcKFg3I0nweIigO3u4n9FnMK91/vA50WevE9fx6WyPvyznAeLAYH5LZT2da1ffLg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJFJDQmiPLFqjbyA5oBfBIsBrfV6vltbJC+Y90c9qGevuVKKnTT
	Y38c2v0AtOUrK/NQnDZmfbmGiLOAc0juwCKcBPWh7ggHqz6jEZFGnJBvMuni2AYvCVk=
X-Gm-Gg: AYBFou1oRcFQRIK7yhnPAUKFseUHez4RaX3AbG+SEoWrYXrpjgcBFNnSKirWLdyAvlx
	rK07S+o2I86HUGA2nC4VBMZRGfByIxVJDtp7RbmoOIsuC40YoNjy+CKinAr92fM0L/0vhHPn8vp
	xeh3Yidvp3RCxGn0+JuXpCZ+MdDjUghNDA0kIB3l6ceOsusZHGLISsWXhKVWZYqvKOQZWUBsn6A
	g1TBAanp5mc3vNmY6zLYtUCz8tnoKL4pYQwrobnwMJiWOmh2hu15f400mYwVf5lEg81WSKf52ae
	gIuFeTuS0dR2iHuG0xZ1sQk20+iB2/7IT3xpgC89Id7MVZMjoz4UM+h8Lej6WX9T9jVLwA+g/BK
	hTvBYghY/K8yHAVOmQHAo14feuWqS5GKBSr+BuhmziG9sgBmYmYALOyfLVwe/WAdifd3PZn77jT
	/Sc5tocOcl07sUAUKLy8hDZH2nRQKYKwIJPFgBw7Oqsf4328XBNvfYTfMtxNTT6e1GmWMsiGpQV
	+ha8e2LYqqAm2V6CqXLB52FvDF9CImmeNbv0CDqAj3miyKqUz0Q99gXfLQzOY0+V10hEGz+MU35
	YqRm8/h3dGXx5qzigpWPo3motGDWPgdXugZvZCbFC48=
X-Received: by 2002:a05:600c:1909:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a35ac95fa0mr162292905e9.16.1793090645722;
        Tue, 27 Oct 2026 01:44:05 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08643dsm199654545e9.4.2026.10.27.01.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:44:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 09:44:04 +0100
Message-Id: <DMFHL2HT2BNT.9OO9PUN4ME6Z@smile.fr>
Cc: <cheng.jiang@oss.qualcomm.com>, <wei.deng@oss.qualcomm.com>,
 <mengshi.wu@oss.qualcomm.com>, <jinwang.li@oss.qualcomm.com>,
 <xiuzhuo.shang@oss.qualcomm.com>, <chenhong.zhou@oss.qualcomm.com>
To: <shuai.zhang@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] [wrynose][backport] bluez5: Abort
 continuing response on fragmented CT replies
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261021090017.683390-1-shuai.zhang@oss.qualcomm.com>
 <75823d78-77f7-4c1e-ab72-147fbc1130cb@oss.qualcomm.com>
In-Reply-To: <75823d78-77f7-4c1e-ab72-147fbc1130cb@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 08:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248720

On Tue Oct 27, 2026 at 8:22 AM CET, Shuai Zhang via lists.openembedded.org =
wrote:
> Hi Maintainer,
>
> On 10/21/2026 5:00 PM, Shuai Zhang wrote:
>> Send AbortContinuingResponse when a Get Element Attributes reply
>> arrives fragmented, as the CT side does not reassemble fragments.
>>
>> Backport upstream bluez commit 249e2bedf ("avrcp: Abort continuing
>> response on fragmented CT replies") to bluez 5.86.
>>
>> Fixes PTS test AVRCP/CT/RCR/BV-03-C.
>>
>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>> ---
>> Changes for v2:
>> - Fix subject prefix to [wrynose][backport]
>> - Drop Upstream-Status tag from the commit message
>> - Keep upstream Upstream-Status and both Signed-off-by lines in the reci=
pe patch
>>
>> Link to v1: https://lists.openembedded.org/g/openembedded-core/topic/pat=
chtest_results_for/121863269
>> ---
>>   meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>>   ...inuing-response-on-fragmented-CT-rep.patch | 63 +++++++++++++++++++
>>   2 files changed, 64 insertions(+)
>>   create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-=
Abort-continuing-response-on-fragmented-CT-rep.patch
>
>  =C2=A0Just wanted to check if there are any updates on this. Thanks!

Hello,

I couldn't take this for the current wrynose cycle, so, it will have to
wait until the next cycle, in 1-2 weeks.

Regards,
--=20
Yoann Congal
Smile ECS

