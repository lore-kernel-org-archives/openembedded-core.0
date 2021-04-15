Received: from sonic303-22.consmr.mail.sg3.yahoo.com (sonic303-22.consmr.mail.sg3.yahoo.com [106.10.242.39])
 by mx.groups.io with SMTP id smtpd.web11.226.1618520891228412126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 14:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=ZWQwr+Ld;
 spf=neutral (domain: yahoo.com, ip: 106.10.242.39, mailfrom: sathishmls@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1618520887; bh=7Lrrwo2bjL6Bp1pDNqSX0fucDaRmvSFsSEb5xuN+bVU=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=ZWQwr+LdTNklh3me9y6LzncBbZyqQvQ6p43k8cyGW52TsAczf2utihSq6ss+K8YWcIyhB38CnsIEiVf3mxiWDrh3YZT2fs1tPquieQhNtZho/dIz8kfimKErW7wanBss01oYX9SthIjfabOKCQOqgITMgLloQiBMj0j7pZZU8lw8XJnHh5e8fVvQSzL95aPngmTufGbxkql4MHMS5f4mQQ6y25mUcevbrRJYxtWKquPqb+ME/V403vvqRBAZRJxQdSrhf14tNS5grz7SZaB8vQ5f/QvubQpuOz9P49t68iuewReLSxEduVhVisxoVSxpNbxIilh66uOn+hjP1xkWqg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1618520887; bh=zheaUW+/Bgk8OOTuYNYiuuf+liMQfFZNeU/KkwU2pWP=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=AyMXyxLoISjPL2xWOEJMMd/t/3lUJXPPDJ2J6QimTATJ0Rtz4UTsG8sLgrsI6B4xLaAaovE2Nti7cilV1xNbClqe+2lAjDl6Q6Jq95vUZT0WFNDaNi8j7BDiEQjoNb5wPUnxRhKvBLsGzaRH/p0gFMwOCkteqCQfp7+wEvmoqw35DNTNxWhDqNChqOA29Tl9KhXlV4So4aQhj4FuGN0S8kz95uvCqeACUNdi+wk07AyhLSj7rUcAGQnNpdjgSVjRs/r7RmpxcMbSK3Gzs19Yp8VAj+qNMPwLCllmDdKB/d8pJxpQnqxpqwsFhPOZPEqpTTIBZvXkpiYeQrjU95Duyg==
X-YMail-OSG: 3VeiKIIVM1nrFRbXz4U4tlPZl81jtzvZTyDamGo0MpSOFaFR8xL.TBAS5IA.32h
 HlI37Oyw145H_puCHSGONBPop1YWMcotzOOj8sRHFCjURD97eFALou7rjCV3eI.pSn7u79Kd4mVi
 t7RPxyBwGbZxWLZAe10QEZU80x9sHe5skQJ1dBNQWIaxJzZSpAYHsmvhqSu6cY0QtxTofRUdshvJ
 YvALj09scs6eTZxNJfyi0keuz.vGp6yxDdYAMdY7Xns0WxS6mU.a6xMKPetAdrYd8wCBatceBkfD
 eaYfOTGJRi7SPXL3a1HlcG.6QyNkOPuRqnoZ_0dHk49Mwm8fY_0BZiG2UonpTxxdVOG7q..qErsJ
 iEN.Ochvib8DB7eLpNZHb3DYQHWX7KVLv3x_ubUfUvktPqzyuW6YRaeuH.n1UBZeCf.jU24whpGj
 hzw_FMNpzYS1SWwwiAFXTwbJ5WdC_MWXN6jZ5uCriME2zr7GKASCq2GiBY_tTXcLZ0c9b7gFJchE
 k5TevulOutXgtxl89oDT5oWNA4QJqGDhWHCkiqS3R0EDs7NIJQmnkBQL3LiFGqrZ8Nr5u5_ARvNp
 eKhohLpsdIk7B.xVmV4inUDwqUUvUkF0kNvm547QBayclo7TBHrY0aeWNi5oM.3xmmrVnd9HIF2e
 TZ5DUk..q92sJt_fjjCp5f69maza9bJwYYkZHjuGw5z6AK15h2dk6JWoKnANjKciOxXVfaMVGzy.
 6lb_xbtCrxI8nwnYMbyV4f4I5x73ubBM3RQFUW.VUiulT0cxE87igg_P0JZhdtiaPFzPcPWLRRUD
 6VeUvLXmvi78zvnyFaQD3v73GV3R45q.0TBt.4iqI0HOLZdMhAlMOqqGxISmVB3fO7jZg9BHjqd_
 w4X1EazE_ZzLe1sO1LhgbUbCDt31jY54x1olhlRb5N2Am4PwhH4W9TAzoooNmhfPtdk8YxbFTiHe
 5_y4D8NNYqV1Nbtv.iUOQTVRjtSGwNBhNBlvBKMN6s9nm0NXGy5.jafK5Udq4qF0A_3u2Scqfa2f
 aDHMTvE9dW.I26QzmNi0lde7smyiYcN7JSY.dwD7LGKH1Nikg9U.OixYsDcX6NwEZNRP24PRmgqq
 23_pBQE8hPsOQQ0LunKkSb570RFwOZIvg_9ZcZ7IQgNIrOwt2rd0lmBvBUkW8E6wp5kDK_O0Yih.
 v7LJ8q0CHN00PdweVj5O7LTVriBn5jk86MtEZBAzxHCDFPTuD7ydfcCfJY8SbM1w.GHogEaWkw8E
 qJMuxGCScGcJjIqJHH0aYd7fdvtLfIllXyVWtZsNs.sHPUzAjzbes9E3uQGFiJNwfKNDvpwr4L3h
 KZj.GCFv6LNpUW6MjMy2j8bY7c4qc4hDgd8569jJhqwxgN25yPXM2B0sFRqUnyQdKuLCnym3dd1s
 WSofD78Rx8P_N905WbGKoOorfVTr5kMdTOREqO1rxRQ8EsYOAIlFIXLAsYPzALjkYg4lM44ciAx_
 33NAktqYPueRjA75ZkOGlk8fP_J1v0bLIhTyYy9RXa2GvgGyrS4.BW7lK6ErDUUKvmFr7KQrnp0F
 NV4gf2sp75Emi93vjcau1yPxl0e9_TF8358Ps3spz00FKMRKS9fG4S2gi_8tfu1cSWJrcfwF3RxV
 AlaKjdPqXVID8CuPVwwdkSie0E5FOWLk3h99S3kxQ_kXuOtKUjAXbtZ7or.tTHK4RsU4Ma6uAVuO
 8wM0fwxC3T0LNntkhC2T77iFvUEIAa9vbgvL_OaTis_iQgNcvlTMbGllyovcvlBlpU5Kk26nqwdS
 lKMuI.ZM2JLg6kpk0dkv9OlRMnhYxo5W.25KNLaD9BQbmmn3OpIod2Ovwq7bWaTI_8XYNgtjFAXJ
 oAi1w0R4T261j6Isd4vAz197GmTX5lJpuj8sy3jMt_ezWiRSmpkuvPGZ_n1miC8PlfEzPN2ZjZOa
 J6eBzvIQnU7kPbRzE6FoFOnfw83ICwjd2vCe8Otfv7lEIIpypjjVoB9_w5gxp_Rmw8ef7u_9yJYT
 9Fb6q1mhOwUvn3eTTXdwamqs4gKhmNohr4L317IGp.7G1QNyDgUeChJu1c0aecDyGD00BGpbq5zq
 eN1mx_kWomIL7q3_VFqNR0fl9uzF.9QcZfdk9bz5WjWjE1MAkwEnmt9zYSEQVwJ053v7.qxhjkcS
 7mlNRMPwwW7K49XO_Gi5UtlhB5HZtvFmbQTcq5CcI.nS7_wVIDaOmFuZ1I3p5OrJ_mcuGucsWLUp
 qrsqwPu5F.hYvDce2DpolVUFpG9iEL4kNaD5V4T7TB6JUXUvu33bxrZDCQwSTPJ3PWhA0Sb_Q7D9
 td7EnZeW.h7YYxLMy00ZcKywqsjgcTENmNjLYr0JU9_9Nzwqqaffp33G9r.fkQ4rG7qGFZ30w.W7
 YLFMUkj0KLr9VMBQ783.kmLGyAnvv1icwhw1Ne8qfWCrWV_9P9igDDbOXJ33FQgBll.j_jV0tFNi
 bnORn8HaPFWUIblkdQi8SGRkECk2XlXd_c0w25kmyv1.DPg0.AqYnq4Z5qIRgoczH34bVS5SV33B
 WNqY0d9rTLIyFR6yUro_4ZchZmb2mrEG2J0Lygpa0O_.7xWmM2qpv9OgNtSb3kd4V0kuSRMzQbou
 Gk17v1zd3C3WJ
X-Sonic-MF: <sathishmls@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.sg3.yahoo.com with HTTP; Thu, 15 Apr 2021 21:08:07 +0000
Date: Thu, 15 Apr 2021 21:08:06 +0000 (UTC)
From: sathishmls@yahoo.com
To: 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Message-ID: <1391551119.1241421.1618520886462@mail.yahoo.com>
Subject: [poky][master][PATCH] core-image-*-initramfs.bb: Fix for circular dependency issue in initramfs when using EXTRA_IMAGEDEPENDS
MIME-Version: 1.0
References: <1391551119.1241421.1618520886462.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.18121 YMailNorrin Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:87.0) Gecko/20100101 Firefox/87.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 When we are building an initramfs based image, if we use EXTRA_IMAGEDEPEND=
S to add dependency for the main image recipe, then the dependency gets aut=
omatically added as dependency for the initramfs image also. This creates a=
 circular dependency issue. Hence clearing the EXTRA_IMAGEDEPENDS in the in=
itramfs image recipe files fixes the circular dependency issue.

Signed-off-by: Sathish Kumar Balasubramaniam <b-sathishkumar@hcl.com>
---
=C2=A0meta/recipes-core/images/core-image-minimal-initramfs.bb | 3 +++
=C2=A0meta/recipes-core/images/core-image-tiny-initramfs.bb=C2=A0=C2=A0=C2=
=A0 | 3 +++
=C2=A02 files changed, 6 insertions(+)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/met=
a/recipes-core/images/core-image-minimal-initramfs.bb
index 664fe7310e..fd342a0ec4 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -28,5 +28,8 @@ inherit core-image
=C2=A0IMAGE_ROOTFS_SIZE =3D "8192"
=C2=A0IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
=C2=A0
+# Dependencies added for build image using EXTRA_IMAGEDEPENDS gets automat=
ically added to initramfs image as well and creates a circular dependency i=
ssue. Hence remove them for initramfs image.
+EXTRA_IMAGEDEPENDS =3D ""
+
=C2=A0# Use the same restriction as initramfs-module-install
=C2=A0COMPATIBLE_HOST =3D '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freeb=
sd.*)'
diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/r=
ecipes-core/images/core-image-tiny-initramfs.bb
index 47470849ed..3b3a123f37 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -26,6 +26,9 @@ inherit core-image
=C2=A0IMAGE_ROOTFS_SIZE =3D "8192"
=C2=A0IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
=C2=A0
+# Dependencies added for build image using EXTRA_IMAGEDEPENDS gets automat=
ically added to initramfs image as well and creates a circular dependency i=
ssue. Hence remove them for initramfs image.
+EXTRA_IMAGEDEPENDS =3D ""
+
=C2=A0# Use the same restriction as initramfs-live-install
=C2=A0COMPATIBLE_HOST =3D "(i.86|x86_64|aarch64).*-linux"
=C2=A0
--
2.17.1
