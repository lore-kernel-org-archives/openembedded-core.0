Return-Path: <geoffrey.giry@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F95EC64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 08:24:08 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.14578.1678436645875988341
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 00:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=67W2g0y/;
 spf=pass (domain: smile.fr, ip: 209.85.208.45, mailfrom: geoffrey.giry@smile.fr)
Received: by mail-ed1-f45.google.com with SMTP id ec29so17253043edb.6
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 00:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678436644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEHyJ9RliWmLrcrOpit9Tuy7SZmFPHEfQbDuCLB3teM=;
        b=67W2g0y/f6VG48S5PC/EQjE4Qr1cUQ3qsk1U51t5JXp7capw3ew+yWk/moWkdKxOeg
         YZz4dWUWuJt9jpCthlpkNlW4BVKImQthLTKNpqO4IrblfGbd/ioGMjNSreCqfjag3dFo
         NhBFI/N++HCXAkSBSt0GVpwBgykQfwm/oiW8s2Lq58H/nnpRr/ls+Ih3ODoRODGA+trL
         +rmfISKPj9U07rMtu6H80oKys0D2HL+4CS2U+LiqYNeZlz28KCDDC6CS7bra25J6PTsj
         xzMXw35JmzBfkwdzoh9Iwja55Bk5aFvO1fEOdw/DdpoK7xe5zxh3QDRJcWfuP35OQiaZ
         u7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678436644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEHyJ9RliWmLrcrOpit9Tuy7SZmFPHEfQbDuCLB3teM=;
        b=ZqbzHWWqGK7x027qMHTLqOzO0qJkdqZkjxOlVNEeqNu+RqywXBnIm8bVsZ7HZ5tSV8
         awBE8EeHi6cUJykzPLuTb6jfFY4o89LnOGmY4scsqJd6/pKw0JnCygplh3RmC/VHJLal
         5He086eGevw8479cYjBACHpKhr/ysSHN10oQbFOQM8/83lXXHm0/zjsEA88soBTvZ3JY
         YIKyn0QZ1F/BPWcNbq1WxbcVqAaemt8Z/IsG+AgFCkN7U7IrUy2JO/E+L5Xdk5lTyJiW
         xF/YLSj+4U2L/ii6O4jB8SI5NlT0dDvab9YeKUCSstnlEG7iKNU1YNsGS4S3hk+sf7X6
         05Ng==
X-Gm-Message-State: AO0yUKXuty/3zDmjyc7S+vdkfgsLWWx/wxqz6lrrJwALOp9c2yKcUkTy
	18K1epe3Uf4LE4iZPb0aBCOZJAhvKPFXU/cAOzbI7Q==
X-Google-Smtp-Source: AK7set8PbACV5FQlBKQufssxY2Ip7ezTYqjUE0tx7WCeW8YGaIGoFi1930J4FsbEENvCyThGnOnzz4mghK6N1HQ/Tu8=
X-Received: by 2002:a17:906:398a:b0:877:747e:f076 with SMTP id
 h10-20020a170906398a00b00877747ef076mr11775720eje.0.1678436643997; Fri, 10
 Mar 2023 00:24:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1678401759.git.steve@sakoman.com> <e710fe6b9c866e6870598c27d4540bc218c8a7a4.1678401759.git.steve@sakoman.com>
In-Reply-To: <e710fe6b9c866e6870598c27d4540bc218c8a7a4.1678401759.git.steve@sakoman.com>
From: Geoffrey GIRY <geoffrey.giry@smile.fr>
Date: Fri, 10 Mar 2023 09:23:53 +0100
Message-ID: <CAGwXbzbQ--mJDEcCseF8evdi+gR_687V=PuV0fVr2pYPr8b0Kg@mail.gmail.com>
Subject: Re: [OE-core][langdale 06/27] cve-extra-exclusions: ignore
 inapplicable linux-yocto CVEs
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 08:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178310

Le jeu. 9 mars 2023 =C3=A0 23:58, Steve Sakoman <steve@sakoman.com> a =C3=
=A9crit :
>
> From: Geoffrey GIRY <geoffrey.giry@smile.fr>
>
> Multiple CVE are patched in kernel but appears as active because the NVD
> database is not up to date.
>
> CVE are ignored if and only if all versions of kernel used by master are =
patched.
>
> Also ignore CVEs with wrong CPE (applied to kernel but actually are for
>  another package)
>
> Signed-off-by: Geoffrey GIRY <geoffrey.giry@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 92770a08c04a6c1eb351231d937b16e76558f013)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../distro/include/cve-extra-exclusions.inc   | 296 ++++++++++++++++++
>  1 file changed, 296 insertions(+)
>
> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/con=
f/distro/include/cve-extra-exclusions.inc
> index 8b5f8d49b8..a281a8ac65 100644
> --- a/meta/conf/distro/include/cve-extra-exclusions.inc
> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> @@ -78,9 +78,34 @@ CVE_CHECK_IGNORE +=3D "CVE-2018-1000026 CVE-2018-10840=
 CVE-2018-10876 CVE-2018-108
>  CVE_CHECK_IGNORE +=3D "CVE-2019-10126 CVE-2019-14899 CVE-2019-18910 CVE-=
2019-3016 CVE-2019-3819 CVE-2019-3846 CVE-2019-3887"
>  # 2020
>  CVE_CHECK_IGNORE +=3D "CVE-2020-10732 CVE-2020-10742 CVE-2020-16119 CVE-=
2020-1749 CVE-2020-25672 CVE-2020-27820 CVE-2020-35501 CVE-2020-8834"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2020-27784
> +# Introduced in version v4.1 b26394bd567e5ebe57ec4dee7fe6cd14023c96e9
> +# Patched in kernel since v5.10        e8d5f92b8d30bb4ade76494490c3c065e=
12411b1
> +# Backported in version v5.4.73        e9e791f5c39ab30e374a3b1a9c25ca7ff=
24988f3
> +CVE_CHECK_IGNORE +=3D "CVE-2020-27784"
> +
>  # 2021
>  CVE_CHECK_IGNORE +=3D "CVE-2021-20194 CVE-2021-20226 CVE-2021-20265 CVE-=
2021-3564 CVE-2021-3743 CVE-2021-3847 CVE-2021-4002 \
>                       CVE-2021-4090 CVE-2021-4095 CVE-2021-4197 CVE-2021-=
4202 CVE-2021-44879 CVE-2021-45402"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2021-3669
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v5.15 20401d1058f3f841f35a594ac2fc1293710e55b9
> +CVE_CHECK_IGNORE +=3D "CVE-2021-3669"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2021-3759
> +# Introduced in version v4.5 a9bb7e620efdfd29b6d1c238041173e411670996
> +# Patched in kernel since v5.15 18319498fdd4cdf8c1c2c48cd432863b1f915d6f
> +# Backported in version v5.4.224 bad83d55134e647a739ebef2082541963f2cbc9=
2
> +# Backported in version v5.10.154 836686e1a01d7e2fda6a5a18252243ff30a6e1=
96
> +CVE_CHECK_IGNORE +=3D "CVE-2021-3759"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2021-4218
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v5.8 32927393dc1ccd60fb2bdc05b9e8e88753761469
> +CVE_CHECK_IGNORE +=3D "CVE-2021-4218"
> +
>  # 2022
>  CVE_CHECK_IGNORE +=3D "CVE-2022-0185 CVE-2022-0264 CVE-2022-0286 CVE-202=
2-0330 CVE-2022-0382 CVE-2022-0433 CVE-2022-0435 \
>                       CVE-2022-0492 CVE-2022-0494 CVE-2022-0500 CVE-2022-=
0516 CVE-2022-0617 CVE-2022-0742 CVE-2022-0854 \
> @@ -90,6 +115,277 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-0185 CVE-2022-0264 C=
VE-2022-0286 CVE-2022-0330 CVE
>                       CVE-2022-28356 CVE-2022-28388 CVE-2022-28389 CVE-20=
22-28390 CVE-2022-28796 CVE-2022-28893 CVE-2022-29156 \
>                       CVE-2022-29582 CVE-2022-29968"
>
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-0480
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v5.15 0f12156dff2862ac54235fc72703f18770769042
> +CVE_CHECK_IGNORE +=3D "CVE-2022-0480"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-1184
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v5.19 46c116b920ebec58031f0a78c5ea9599b0d2a371
> +# Backported in version v5.4.198 17034d45ec443fb0e3c0e7297f9cd10f7044606=
4
> +# Backported in version v5.10.121 da2f05919238c7bdc6e28c79539f55c8355408=
bb
> +# Backported in version v5.15.46 ca17db384762be0ec38373a12460081d22a8b42=
d
> +CVE_CHECK_IGNORE +=3D "CVE-2022-1184"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-1462
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v5.19 a501ab75e7624d133a5a3c7ec010687c8b961d23
> +# Backported in version v5.4.208 f7785092cb7f022f59ebdaa181651f7c877df13=
2
> +# Backported in version v5.10.134 08afa87f58d83dfe040572ed591b47e8cb9e22=
5c
> +# Backported in version v5.15.58 b2d1e4cd558cffec6bfe318f5d74e6cffc374d2=
9
> +CVE_CHECK_IGNORE +=3D "CVE-2022-1462"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-2308
> +# Introduced in version v5.15 c8a6153b6c59d95c0e091f053f6f180952ade91e
> +# Patched in kernel since v6.0 46f8a29272e51b6df7393d58fc5cb8967397ef2b
> +# Backported in version v5.15.72 dc248ddf41eab4566e95b1ee2433c8a5134ad94=
a
> +# Backported in version v5.19.14 38d854c4a11c3bbf6a96ea46f14b282670c784a=
c
> +CVE_CHECK_IGNORE +=3D "CVE-2022-2308"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-2327
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v5.10.125 df3f3bb5059d20ef094d6b2f0256c4bf4127=
a859
> +CVE_CHECK_IGNORE +=3D "CVE-2022-2327"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-2663
> +# Introduced in version v2.6.20 869f37d8e48f3911eb70f38a994feaa8f8380008
> +# Patched in kernel since v6.0 0efe125cfb99e6773a7434f3463f7c2fa28f3a43
> +# Backported in version v5.4.213 36f7b71f8ad8e4d224b45f7d6ecfeff63b09154=
7
> +# Backported in version v5.10.143 e12ce30fe593dd438c5b392290ad7316befc11=
ca
> +# Backported in version v5.15.68 451c9ce1e2fc9b9e40303bef8e5a0dca1a923cc=
4
> +# Backported in version v5.19.9 6cf0609154b2ce8d3ae160e7506ab316400a8d3d
> +CVE_CHECK_IGNORE +=3D "CVE-2022-2663"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-2785
> +# Introduced in version v5.18 b1d18a7574d0df5eb4117c14742baf8bc2b9bb74
> +# Patched in kernel since v6.0 86f44fcec22ce2979507742bc53db8400e454f46
> +# Backported in version v5.19.4 b429d0b9a7a0f3dddb1f782b72629e6353f292fd
> +CVE_CHECK_IGNORE +=3D "CVE-2022-2785"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3176
> +# Introduced in version v5.1 221c5eb2338232f7340386de1c43decc32682e58
> +# Patched in kernel since v5.17 791f3465c4afde02d7f16cf7424ca87070b69396
> +# Backported in version v5.15.65 e9d7ca0c4640cbebe6840ee3bac66a25a9bacaf=
5
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3176"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3435
> +# Introduced in version v5.18 6bf92d70e690b7ff12b24f4bfff5e5434d019b82
> +# Breaking commit backported in v5.4.189 f5064531c23ad646da7be8b938292b0=
0a7e61438
> +# Breaking commit backported in v5.10.111 63ea57478aaa3e06a597081a0f5373=
18fc04e49f
> +# Breaking commit backported in v5.15.34 907c97986d6fa77318d17659dd76c94=
b65dd27c5
> +# Patched in kernel since v6.1 61b91eb33a69c3be11b259c5ea484505cd79f883
> +# Backported in version v5.4.226 cc3cd130ecfb8b0ae52e235e487bae3f16a24a3=
2
> +# Backported in version v5.10.158 0b5394229ebae09afc07aabccb5ffd705ffd25=
0e
> +# Backported in version v5.15.82 25174d91e4a32a24204060d283bd5fa6d0ddf13=
3
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3435"

The patch has not been backported for v5.19.17 used by langdale.
We can not ignore this CVE.

It is also the case for some other CVE, I can propose a patch specific
for each LTS.


> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3526
> +# Introduced in version v5.13 427f0c8c194b22edcafef1b0a42995ddc5c2227d
> +# Patched in kernel since v5.18 e16b859872b87650bb55b12cca5a5fcdc49c1442
> +# Backported in version v5.15.35 8f79ce226ad2e9b2ec598de2b9560863b7549d1=
b
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3526"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3534
> +# Introduced in version v5.10 919d2b1dbb074d438027135ba644411931179a59
> +# Patched in kernel since v6.2 93c660ca40b5d2f7c1b1626e955a8e9fa30e0749
> +# Backported in version v5.10.163 c61650b869e0b6fb0c0a28ed42d928eea969af=
c8
> +# Backported in version v5.15.86 a733bf10198eb5bb927890940de8ab457491ed3=
b
> +# Backported in version v6.1.2 fbe08093fb2334549859829ef81d42570812597d
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3534"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3564
> +# Introduced in version v3.6 4b51dae96731c9d82f5634e75ac7ffd3b9c1b060
> +# Patched in kernel since v6.1 3aff8aaca4e36dc8b17eaa011684881a80238966
> +# Backported in version v5.10.154 cb1c012099ef5904cd468bdb8d6fcdfdd9bcb5=
69
> +# Backported in version v5.15.78 8278a87bb1eeea94350d675ef961ee5a03341fd=
e
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3564"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3619
> +# Introduced in version v5.12 4d7ea8ee90e42fc75995f6fb24032d3233314528
> +# Patched in kernel since v6.1 7c9524d929648935bac2bbb4c20437df8f9c3f42
> +# Backported in version v5.15.78 aa16cac06b752e5f609c106735bd7838f444784=
c
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3619"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3621
> +# Introduced in version v2.60.30 05fe58fdc10df9ebea04c0eaed57adc47af5c18=
4
> +# Patched in kernel since v6.1 21a87d88c2253350e115029f14fe2a10a7e6c856
> +# Backported in version v5.4.218 792211333ad77fcea50a44bb7f695783159fc63=
c
> +# Backported in version v5.10.148 3f840480e31495ce674db4a69912882b5ac083=
f2
> +# Backported in version v5.15.74 1e512c65b4adcdbdf7aead052f2162b079cc7f5=
5
> +# Backported in version v5.19.16 caf2c6b580433b3d3e413a3d54b8414a94725dc=
d
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3621"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3623
> +# Introduced in version v5.1 5480280d3f2d11d47f9be59d49b20a8d7d1b33e8
> +# Patched in kernel since v6.1 fac35ba763ed07ba93154c95ffc0c4a55023707f
> +# Backported in version v5.4.228 176ba4c19d1bb153aa6baaa61d586e785b7d736=
c
> +# Backported in version v5.10.159 fccee93eb20d72f5390432ecea7f8c16af88c8=
50
> +# Backported in version v5.15.78 3a44ae4afaa5318baed3c6e2959f24454e0ae4f=
f
> +# Backported in version v5.19.17 86a913d55c89dd13ba070a87f61a493563e94b5=
4
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3623"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3624
> +# Introduced in version v6.0 d5410ac7b0baeca91cf73ff5241d35998ecc8c9e
> +# Patched in kernel since v6.0 4f5d33f4f798b1c6d92b613f0087f639d9836971
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3624"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3625
> +# Introduced in version v4.19 45f05def5c44c806f094709f1c9b03dcecdd54f0
> +# Patched in kernel since v6.0 6b4db2e528f650c7fb712961aac36455468d5902
> +# Backported in version v5.4.211 1ad4ba9341f15412cf86dc6addbb73871a10212=
f
> +# Backported in version v5.10.138 0e28678a770df7989108327cfe86f835d8760c=
33
> +# Backported in version v5.15.63 c4d09fd1e18bac11c2f7cf73604811256868730=
1
> +# Backported in version v5.19.4 26bef5616255066268c0e40e1da10cc9b78b82e9
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3625"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3629
> +# Introduced in version v3.9 d021c344051af91f42c5ba9fdedc176740cbd238
> +# Patched in kernel since v6.0 7e97cfed9929eaabc41829c395eb0d1350fccb9d
> +# Backported in version v5.4.211 f82f1e2042b397277cd39f16349950f5abade58=
d
> +# Backported in version v5.10.138 38ddccbda5e8b762c8ee06670bb1f64f1be5ee=
50
> +# Backported in version v5.15.63 e4c0428f8a6fc8c218d7fd72bddd163f05b2979=
5
> +# Backported in version v5.19.4 8ff5db3c1b3d6797eda5cd326dcd31b9cd1c5f72
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3629"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3630
> +# Introduced in version v5.19 85e4ea1049c70fb99de5c6057e835d151fb647da
> +# Patched in kernel since v6.0 fb24771faf72a2fd62b3b6287af3c610c3ec9cf1
> +# Backported in version v5.19.4 7a369dc87b66acc85d0cffcf39984344a203e20b
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3630"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3633
> +# Introduced in version v5.4 9d71dd0c70099914fcd063135da3c580865e924c
> +# Patched in kernel since v6.0 8c21c54a53ab21842f5050fa090f26b03c0313d6
> +# Backported in version v5.4.211 04e41b6bacf474f5431491f92e981096e8cc8e9=
3
> +# Backported in version v5.10.138 a220ff343396bae8d3b6abee72ab51f1f34b30=
27
> +# Backported in version v5.15.63 98dc8fb08299ab49e0b9c08daedadd2f4de1a2f=
2
> +# Backported in version v5.19.4 a0278dbeaaf7ca60346c62a9add65ae7d62564de
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3633"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3635
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v6.0 3f4093e2bf4673f218c0bf17d8362337c400e77b
> +# Backported in version v5.4.211 9a6cbaa50f263b12df18a051b37f3f42f9fb525=
3
> +# Backported in version v5.10.138 a0ae122e9aeccbff75014c4d36d11a9d32e7fb=
5e
> +# Backported in version v5.15.63 a5d7ce086fe942c5ab422fd2c034968a152be4c=
4
> +# Backported in version v5.19.4 af412b252550f9ac36d9add7b013c2a2c3463835
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3635"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3636
> +# Introduced in version v5.19 33fc42de33278b2b3ec6f3390512987bc29a62b7
> +# Patched in kernel since v5.19 17a5f6a78dc7b8db385de346092d7d9f9dc24df6
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3636"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3640
> +# Introduced in version v5.19 d0be8347c623e0ac4202a1d4e0373882821f56b0
> +# Breaking commit backported in v5.4.209 098e07ef0059296e710a801cdbd74b5=
9016e6624
> +# Breaking commit backported in v5.10.135 de5d4654ac6c22b1be756fdf7db184=
71e7df01ea
> +# Breaking commit backported in v5.15.59 f32d5615a78a1256c4f557ccc654386=
6e75d03f4
> +# Patched in kernel since v6.1 0d0e2d032811280b927650ff3c15fe5020e82533
> +# Backported in version v5.4.224 c1f594dddd9ffd747c39f49cc5b67a9b7677d2a=
b
> +# Backported in version v5.10.154 d9ec6e2fbd4a565b2345d4852f586b7ae3ab41=
fd
> +# Backported in version v5.15.78 a3a7b2ac64de232edb67279e804932cb42f0b52=
a
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3640"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3646
> +# Introduced in version v2.6.30 9ff05123e3bfbb1d2b68ba1d9bf1f7d1dffc1453
> +# Patched in kernel since v6.1 d0d51a97063db4704a5ef6bc978dddab1636a306
> +# Backported in version v5.4.218 b7e409d11db9ce9f8bc05fcdfa24d143f60cd39=
3
> +# Backported in version v5.10.148 aad4c997857f1d4b6c1e296c07e4729d3f8058=
ee
> +# Backported in version v5.15.74 44b1ee304bac03f1b879be5afe920e3a844e40f=
c
> +# Backported in version v5.19.16 4755fcd844240857b525f6e8d8b65ee140fe957=
0
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3646"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3649
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v6.1 d325dc6eb763c10f591c239550b8c7e5466a5d09
> +# Backported in version v5.4.220 d1c2d820a2cd73867b7d352e89e92fb3ac29e92=
6
> +# Backported in version v5.10.148 21ee3cffed8fbabb669435facfd576ba18ac86=
52
> +# Backported in version v5.15.74 cb602c2b654e26763226d8bd27a702f79cff400=
6
> +# Backported in version v5.19.16 394b2571e9a74ddaed55aa9c4d0f5772f81c21e=
4
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3649"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-4382
> +# Introduced in version v5.3 e5d82a7360d124ae1a38c2a5eac92ba49b125191
> +# Patched in kernel since v6.2-rc5 d18dcfe9860e842f394e37ba01ca9440ab217=
8f4
> +# Backported in version v5.4.230 9a39f4626b361ee7aa10fd990401c37ec3b466a=
e
> +# Backported in version v5.10.165 856e4b5e53f21edbd15d275dde62228dd94fb2=
b4
> +# Backported in version v5.15.90 a2e075f40122d8daf587db126c562a67abd69cf=
9
> +# Backported in version v6.1.8 616fd34d017000ecf9097368b13d8a266f4920b3
> +CVE_CHECK_IGNORE +=3D "CVE-2022-4382"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-26365
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v5.19 2f446ffe9d737e9a844b97887919c4fda18246e7
> +# Backported in version v5.4.204 42112e8f94617d83943f8f3b8de2b6604190550=
6
> +# Backported in version v5.10.129 cfea428030be836d79a7690968232bb7fa4410=
f1
> +# Backported in version v5.15.53 7ed65a4ad8fa9f40bc3979b32c54243d6a684ec=
9
> +CVE_CHECK_IGNORE +=3D "CVE-2022-26365"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-33740
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v5.19 307c8de2b02344805ebead3440d8feed28f2f010
> +# Backported in version v5.4.204 04945b5beb73019145ac17a2565526afa7293c1=
4
> +# Backported in version v5.10.129 728d68bfe68d92eae1407b8a9edc7817d62274=
04
> +# Backported in version v5.15.53 5dd0993c36832d33820238fc8dc741ba801b796=
1
> +CVE_CHECK_IGNORE +=3D "CVE-2022-33740"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-33741
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v5.19 4491001c2e0fa69efbb748c96ec96b100a5cdb7e
> +# Backported in version v5.4.204 ede57be88a5fff42cd00e6bcd071503194d398d=
d
> +# Backported in version v5.10.129 4923217af5742a796821272ee03f8d6de15c0c=
ca
> +# Backported in version v5.15.53 ed3cfc690675d852c3416aedb271e0e7d179bf4=
9
> +CVE_CHECK_IGNORE +=3D "CVE-2022-33741"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-33742
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v5.19 2400617da7eebf9167d71a46122828bc479d64c9
> +# Backported in version v5.4.204 60ac50daad36ef3fe9d70d89cfe3b95d381db99=
7
> +# Backported in version v5.10.129 cbbd2d2531539212ff090aecbea9877c996e6c=
e6
> +# Backported in version v5.15.53 6d0a9127279a4533815202e30ad1b3a39f560ba=
3
> +CVE_CHECK_IGNORE +=3D "CVE-2022-33742"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-42895
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v6.1 b1a2cd50c0357f243b7435a732b4e62ba3157a2e
> +# Backported in version v5.15.78 3e4697ffdfbb38a2755012c4e571546c89ab642=
2
> +# Backported in version v5.10.154 26ca2ac091b49281d73df86111d16e5a76e43b=
d7
> +# Backported in version v5.4.224 6949400ec9feca7f88c0f6ca5cb5fdbcef419c8=
9
> +CVE_CHECK_IGNORE +=3D "CVE-2022-42895"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-42896
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v6.1 711f8c3fb3db61897080468586b970c87c61d9e4
> +# Backported in version v5.4.226 0d87bb6070361e5d1d9cb391ba7ee73413bc109=
b
> +# Backported in version v5.10.154 6b6f94fb9a74dd2891f11de4e638c6202bc894=
76
> +# Backported in version v5.15.78 81035e1201e26d57d9733ac59140a3e29befbc5=
a
> +CVE_CHECK_IGNORE +=3D "CVE-2022-42896"
> +
> +
> +# 2023
> +# https://nvd.nist.gov/vuln/detail/CVE-2023-0266
> +# Introduced in version v2.6.12 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
> +# Patched in kernel since v6.2 56b88b50565cd8b946a2d00b0c83927b7ebb055e
> +# Backported in version v5.15.88 26350c21bc5e97a805af878e092eb8125843fe2=
c
> +# Backported in version v6.1.6 d6ad4bd1d896ae1daffd7628cd50f124280fb8b1
> +CVE_CHECK_IGNORE +=3D "CVE-2023-0266"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2023-0394
> +# Introduced in version 2.6.12 357b40a18b04c699da1d45608436e9b76b50e251
> +# Patched in kernel since v6.2 cb3e9864cdbe35ff6378966660edbcbac955fe17
> +# Backported in version v5.4.229 3998dba0f78a59922b0ef333ccfeb58d9410cd3=
d
> +# Backported in version v5.10.164 6c9e2c11c33c35563d34d12b343d43b5c12200=
b5
> +# Backported in version v5.15.89 456e3794e08a0b59b259da666e31d0884b376bc=
f
> +# Backported in version v6.1.7 0afa5f0736584411771299074bbeca8c1f9706d4
> +CVE_CHECK_IGNORE +=3D "CVE-2023-0394"
> +
> +# Wrong CPE in NVD database
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3563
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-3637
> +# Those issue do not affect the kernel, patchs listed on CVE pages links=
 to https://git.kernel.org/pub/scm/bluetooth/bluez.git
> +CVE_CHECK_IGNORE +=3D "CVE-2022-3563 CVE-2022-3637"
>
>  # qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln=
/detail?vulnId=3DCVE-2021-20255
>  # There was a proposed patch https://lists.gnu.org/archive/html/qemu-dev=
el/2021-02/msg06098.html
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178279): https://lists.openembedded.org/g/openembedde=
d-core/message/178279
> Mute This Topic: https://lists.openembedded.org/mt/97508355/7494741
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ge=
offrey.giry@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

Regards
Geoffrey GIRY
SMILE ECS - R&D Engineer

