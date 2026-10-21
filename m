Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8457.1792578694219361753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=lbUtLlQM;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so4083215e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 03:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792578692; x=1793183492; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QzldzHkLum/Vk2/eNIGq0mscyyWDJtsg9OHu/SQ465Y=;
        b=lbUtLlQM3D8ZV2vgeE7OTfR1l80IGbordF2PddB4XkYsbf6ZcABHJVA++kvfRF6vb0
         Cu1qFyjcgKp8y/jyt3D8Jstrp1tBzVI4cfaE3S4OZHVW53nvsCBdXI8rNIBdU9UvFtw/
         JtsHk2T3sxYZoZXmW+Srs+n8BYmcjoG8RQ+iNoV/YgqTOI6MplB/Ip2lOn7kR18AIIt9
         jIgVIXo/iSPxGY8b2n/6R1ep4sy1/Bx+VZOkCoKGCyaK977NE/wFAOAR6x7hipT3Ne2d
         KorirHO4w8rNbrNAWHHECw/CnkIY9HOvjjXT2/myJACiABjMxvH5uTdl+yNG4KbkAYir
         Ap/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578692; x=1793183492;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzldzHkLum/Vk2/eNIGq0mscyyWDJtsg9OHu/SQ465Y=;
        b=yISJSu6341RYoGf62OylQEgyIusH8VqTglyHry45ofyy+ZGacqMlN/7dsLN5Y7P7zA
         dazH9Bw/mEphzgHy9W9F91Kyxt8iaGwIJmNCmkSeaAzmHmBwv/SMp4vzXtNuHMV0FTNA
         fundjBgpJdx0D+JfTXO8F6CbqTlsZwAZvCPDqwt05Rw6+TnekwDQc/XeFSo6qKmOOqz4
         R0x7aAk4IW+ERRVU0yQZu4DnLXZGVw6MQWWC6A0l/pWapi/a73rSgoc92raDY6Kd4qkG
         XzyYOmiv/9/1ipP5U+fEYKidt7eHKHJ3Aq6ctZGq94e3yV1lwC1yNGeNTC6tTQongIYY
         EqaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzk9/XDUbBPHqssQOUTtgI2u6M7SDPLJegp91XvKyezzyeTkPSF4LKaEW3QpALt2jUzktEupo34i2cFyf1ET9WrZw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLFNVyZ1wEFBPqNkWOhIM00jvNolsfvUqJIYtaJBhrWHRYq3vlR
	CV3/TNnppnQAEKeGEmJ4bm+40MhvaYtTgbKKfhSvpk7C5lJxHRpqlMrmK/vyd8hnGEk=
X-Gm-Gg: AYBFou3jV57K0d4o+DMW2doDHE+4EcGbVpLO8/EVn5ggFF7V1Pdp3C0iWRFvOwv8Lie
	U3wPWk143E+xHn9wgWecQeAidFFyDYGM6kSPexG46C0JYxmlPqIzziYM96kXr3uoT8v5++BHfiP
	K0eXGrE3LbUufAd29n7L8COG+Pf2Ex2pnGyIklSTSwKoiBjevoWtiXpg7ov8f6m0rO1/o7RbAXg
	FH0aFx6kKriWyu8ymGB0lyFO9Jdgm42fd++eLdWusMsZc+X7DLJA4KG2KM/ahrNUfJM9AugSLp1
	EFxxRhl7ve0xvCb5q2o57CemEPV7cuomh24Zp9MWnnlrk1zRzU6UDTJN2PkK4xeUzHTng8/clNI
	fbZM64T0XklXaRUvmp9zopSMQEMaGBTjxkz6cZGTiR1GwQ5bgopE+NeWwxKHmk0A3dXIgrBfWAb
	NnNiqDhIo4S0l6koENjsvNsQt7t5pDruWoMK0VgfwLw6gc4WZOUSwxUYMaP+QEI9SsajoNlq21k
	VKPlIF7tkxVZC1S5Yu7aH6k1SJk/JxWypZQSLEd0wJ5EmuAxX5j6JnG/yPas05v1+HEnAMeJ0F+
	shqeTNB7JrUuhlGIr/0ggplr9zS5apM1CzqUbvwPLUc=
X-Received: by 2002:a05:600c:1d9a:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a1fdd57a9amr30942745e9.29.1792578692311;
        Wed, 21 Oct 2026 03:31:32 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1b227dsm54688375e9.6.2026.10.21.03.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:31:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 12:31:31 +0200
Message-Id: <DMAG42F4ZSS1.HA6ACTW0CXCL@smile.fr>
To: "Jinwang Li" <jinwang.li@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH 5/5] bluez5: Fix u128_to_string
 skipping data[4]
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <cheng.jiang@oss.qualcomm.com>, <quic_chezhou@quicinc.com>,
 <wei.deng@oss.qualcomm.com>, <shuai.zhang@oss.qualcomm.com>,
 <mengshi.wu@oss.qualcomm.com>, <xiuzhuo.shang@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
 <20261019082346.3287363-6-jinwang.li@oss.qualcomm.com>
 <DM9I7ZIVXXOH.17QJPV8LCW8QO@smile.fr>
 <6f8cb2bb-93bc-48d1-93b8-cf62b7e44322@oss.qualcomm.com>
In-Reply-To: <6f8cb2bb-93bc-48d1-93b8-cf62b7e44322@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 10:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248391

On Wed Oct 21, 2026 at 11:27 AM CEST, Jinwang Li wrote:
>
>
> On 10/20/2026 3:58 PM, Yoann Congal wrote:
>> On Mon Oct 19, 2026 at 10:23 AM CEST, Jinwang Li via lists.openembedded.=
org wrote:
>>> data[3] was used twice, skipping data[4] in the output string.
>>>
>>> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
>>> ---
>>>   meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>>>   ...p-Fix-u128_to_string-skipping-data-4.patch | 33 ++++++++++++++++++=
+
>>>   2 files changed, 34 insertions(+)
>>>   create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd=
-pbap-Fix-u128_to_string-skipping-data-4.patch
>>>
>>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes=
-connectivity/bluez5/bluez5.inc
>>> index db650acdd0..75d76cf96d 100644
>>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>>> @@ -80,6 +80,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/blue=
z-${PV}.tar.xz \
>>>              file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
>>>              file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.p=
atch \
>>>              file://0001-gobex-Fix-ABORT-response-being-discarded.patch=
 \
>>> +           file://0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.p=
atch \
>>>              "
>>>   S =3D "${UNPACKDIR}/bluez-${PV}"
>>>  =20
>>> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fi=
x-u128_to_string-skipping-data-4.patch b/meta/recipes-connectivity/bluez5/b=
luez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
>>> new file mode 100644
>>> index 0000000000..338bc228c1
>>> --- /dev/null
>>> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_=
to_string-skipping-data-4.patch
>>> @@ -0,0 +1,33 @@
>>> +From 198f4e0785644cea2b2154b383fc4ad354707947 Mon Sep 17 00:00:00 2001
>>> +From: Jinwang Li <jinwang.li@oss.qualcomm.com>
>>> +Date: Wed, 23 Sep 2026 11:29:57 +0800
>>> +Subject: [PATCH] obexd/pbap: Fix u128_to_string skipping data[4]
>>> +
>>> +u128_to_string uses data[3] twice causing data[4] to be skipped and
>>> +DatabaseIdentifier, PrimaryCounter and SecondaryCounter properties to
>>> +be printed with wrong values.
>>> +
>>> +Fixes: 5ee26d43c65c ("obexd/client: Add DatabaseIdentifier property")
>>> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/8b4a4=
176063831476bc9244d20f43b552e4b5554]
>>> +Assisted-by: opencode:claude-sonnet-5
>>> +Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
>> Hello,
>>=20
>> Is that commit included in master and blacksail? If not, can you send
>> the needed upgrades/backports so I can merge this here?
>>=20
>> Thanks!
> This commit is already merged into the OE-Core master and blacksail.

Yes, right. Somehow, my tools (and I) missed that.
(patch 4/5 as well)

Regards,
--=20
Yoann Congal
Smile ECS
