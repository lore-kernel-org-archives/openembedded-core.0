Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48077.1795411939315881409
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=djUH8WEi;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso25951075e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 21:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795411937; x=1796016737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aBvqpycE2I74Si0z8acZH+O7zf1nAgjrL9rZBdzncys=;
        b=djUH8WEiCXIbycOwcwDxHV65zcTS9y5Q0WvDPAowsoqEJqiLZZ6f5+hpVSq1XNuOIq
         AuxOgwiMfSHJNmxxRsX1dLCakCql96izwyFAizXizF4654nbPYDLn2936akLrJKpIhBs
         FT02DeX9y976g4AKNF7wDDSJpgVtzyS0yUFbtm6unMx3WQF9Vy1QHIxqu2y4h/PeDRM0
         at2dJ4+OiL4u0/KmKX5GbcBEG+NxDVMtFAm/duN/lJf+xwdH4nnrUpVj0s8qVmrnYYkd
         b+ItbTCPzugDESQtVzZHh+vwHyx37ky0lnI5TMx8qSFxi4SdSizYEPqlIKa4Z6LLcJod
         rhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411937; x=1796016737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aBvqpycE2I74Si0z8acZH+O7zf1nAgjrL9rZBdzncys=;
        b=UTJ6IgXjAEZ5jgT0mD5MGWAYOXZXnR7gMIOEkB4QpplK8Ikbv9ZY9Mwkui/1iw23X/
         gF+MyYr9yVtWExMkaftvmEFRspt79oEkHifouCcqQ+FS4XYexSFrIHQEHtm/J44QHSR8
         Gj83/SZpce06RP2q6+r++u5vxFH08nAw7+Fn8fg1QpQO+xBf5hvmc1HkMUKpdBxu1QOB
         gzNx2T82DIBpqgTzwYKhgvMDRvJ8B5Mw+Jv2XFOGvHGExPZ3DQf0Hw4Y+7nLvQXSupEu
         0kiJawhGdjFzOn4/2paKd0oDqKDLU/+E/gkhjWNQ10YydE5i1o3MHEfDrjzWoGL+9IPR
         duwQ==
X-Gm-Message-State: APuU4Z++MvIUiVJ0zfDiUQZyCPvlSUzA+TJMIEi45oibWu/gm5msT5oL
	XQXq7OJ+7xDjzcOR+euHMvPs9sZ3+eWsn0jDeg/DnvbddUbU8gMUfCWc37kpksAsKl3oUpbf+33
	ddsZ+UI0=
X-Gm-Gg: AZFdTZfpXjQQfgw7iRSGbCF+XsWWlK/eoSFG5sSpuHTe2or1MHN7+j+siCjK4oROEMm
	+lKIUM+3T9690syr+EIbRrNvlI4/aubWwHUEgIKo6Beqi7sGrePrx/OGI2ow46q6DW3mWuzAWCl
	K16AHtSpeZlW0Jppv/DeBMh86Z3/gKxuIyGFsEErmnE9W50ryMLpl5/UsjPWLKmzY3Opr6jgruF
	kCwnzaBmovu1rhfvjU+h4AIexLuux7qZrfPAcMDTNIT3d7kwgy95auWVPt5sQVimMwmErQ0xd9B
	eDQ66hjhD8AmGgVQo7g0U/Ymtn95aI3/+up/ZmbNvdymK9Cv1+6HPffWJTq8rc1MzbLui4GJpVF
	U4JhCG+F5ZXOXiTRneZdqnX9HsbZ1kqHDu341su8be2OrLazAgAXOUWLsxXs8GRrgIm40iCVDfL
	QeHVxifGBkY1GBelDC3dTSbaiqnb5TJAie2JYNHAofXfB1LePAAifZ3O9u55XPigO0UEKAN+uVM
	ZpGNb0PAi9nqIRSwZb4y/WUkfbRiSVzt4QvmenrNGEEgp+TRsClCm8mo2sqdeEPg9lH/34uq5PP
	yicCbDPJQTSE5vGjTlBIVfpMTPbiIsu33C9muOXN8iGDkGUYymB3JcCYamFxZ/NnUapeuNRU6EH
	ovwCfUB/BweeX1q2X36KzDX8aITW0ElEzY0cvIXzqc/se1t0HeS/VHZOe03DB1I6jQ90FiwM+3j
	0=
X-Received: by 2002:a05:600c:3511:b0:4ba:73f:ef5 with SMTP id 5b1f17b1804b1-4bb88828304mr216121675e9.34.1795411937203;
        Sun, 22 Nov 2026 21:32:17 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from runner-ekioero5r-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm18933985f8f.22.2026.11.22.21.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:32:16 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for scarthgap on Mon Nov 23 04:29:50 2026
Date: Mon, 23 Nov 2026 05:32:14 +0000
Message-ID: <20261123053215.22-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123053215.22-1-yoann.congal@smile.fr>
References: <20261123053215.22-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 05:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250879
Content-Type: text/plain; charset="utf-8"

Branch: scarthgap

New this week: 4 CVEs
CVE-2026-63819 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63819 *
CVE-2026-64513 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64513 *
CVE-2026-98087 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98087 *
CVE-2026-125064 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125064 *

Removed this week: 3 CVEs
CVE-2025-22873 (CVSSv3: 3.8): go:go-binary-native:go-cross-core2-64:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2025-22873 *
CVE-2025-50182 (CVSSv3: 5.3): python3-urllib3 https://nvd.nist.gov/vuln/detail/CVE-2025-50182 *
CVE-2026-57451 (CVSSv3: 5.3): vim https://nvd.nist.gov/vuln/detail/CVE-2026-57451 *

Full list: Found 482 unpatched CVEs
CVE-2014-8171 (CVSSv2: 4.9, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2014-8171 *
CVE-2017-1000255 (CVSSv2: 6.6, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2017-1000255 *
CVE-2018-10840 (CVSSv2: 7.2, CVSSv3: 5.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2018-10840 *
CVE-2018-10876 (CVSSv2: 4.9, CVSSv3: 5.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2018-10876 *
CVE-2018-10882 (CVSSv2: 4.9, CVSSv3: 4.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2018-10882 *
CVE-2018-10902 (CVSSv2: 4.6, CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2018-10902 *
CVE-2018-14625 (CVSSv2: 4.4, CVSSv3: 5.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2018-14625 *
CVE-2019-3016 (CVSSv2: 1.9, CVSSv3: 6.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-3016 *
CVE-2019-3819 (CVSSv2: 4.9, CVSSv3: 4.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-3819 *
CVE-2019-3887 (CVSSv2: 4.7, CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-3887 *
CVE-2019-14899 (CVSSv2: 4.9, CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-14899 *
CVE-2020-1749 (CVSSv2: 5.0, CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-1749 *
CVE-2020-8834 (CVSSv2: 4.9, CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-8834 *
CVE-2020-10742 (CVSSv2: 3.6, CVSSv3: 6.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-10742 *
CVE-2020-16119 (CVSSv2: 4.6, CVSSv3: 6.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-16119 *
CVE-2020-25672 (CVSSv2: 5.0, CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-25672 *
CVE-2020-27815 (CVSSv2: 6.1, CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-27815 *
CVE-2021-3564 (CVSSv2: 2.1, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3564 *
CVE-2021-3669 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3669 *
CVE-2021-3714 (CVSSv3: 5.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3714 *
CVE-2021-3759 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3759 *
CVE-2021-3864 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3864 *
CVE-2021-4218 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-4218 *
CVE-2021-20194 (CVSSv2: 4.6, CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-20194 *
CVE-2021-20265 (CVSSv2: 4.9, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-20265 *
CVE-2022-0286 (CVSSv2: 2.1, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-0286 *
CVE-2022-0400 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-0400 *
CVE-2022-1247 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-1247 *
CVE-2022-1462 (CVSSv2: 3.3, CVSSv3: 6.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-1462 *
CVE-2022-2308 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-2308 *
CVE-2022-2663 (CVSSv3: 5.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-2663 *
CVE-2022-3435 (CVSSv3: 4.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3435 *
CVE-2022-3523 (CVSSv3: 5.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3523 *
CVE-2022-3567 (CVSSv3: 4.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3567 *
CVE-2022-3619 (CVSSv3: 3.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3619 *
CVE-2022-3621 (CVSSv3: 4.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3621 *
CVE-2022-3624 (CVSSv3: 3.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3624 *
CVE-2022-3629 (CVSSv2: 1.4, CVSSv3: 2.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3629 *
CVE-2022-3630 (CVSSv3: 3.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3630 *
CVE-2022-3633 (CVSSv2: 2.7, CVSSv3: 3.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3633 *
CVE-2022-3636 (CVSSv2: 4.9, CVSSv3: 5.5, CVSSv4: 5.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3636 *
CVE-2022-3646 (CVSSv3: 3.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3646 *
CVE-2022-4382 (CVSSv3: 6.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4382 *
CVE-2022-4543 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4543 *
CVE-2022-36402 (CVSSv3: 6.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-36402 *
CVE-2022-38096 (CVSSv3: 6.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-38096 *
CVE-2022-42895 (CVSSv3: 5.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-42895 *
CVE-2023-1073 (CVSSv3: 6.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-1073 *
CVE-2023-1074 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-1074 *
CVE-2023-1075 (CVSSv3: 3.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-1075 *
CVE-2023-1076 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-1076 *
CVE-2023-2898 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-2898 *
CVE-2023-3397 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3397 *
CVE-2023-3640 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3640 *
CVE-2023-3772 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3772 *
CVE-2023-3773 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3773 *
CVE-2023-4155 (CVSSv3: 5.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-4155 *
CVE-2023-6176 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6176 *
CVE-2023-6200 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6200 *
CVE-2023-6238 (CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6238 *
CVE-2023-6240 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6240 *
CVE-2023-6270 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6270 *
CVE-2023-6531 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6531 *
CVE-2023-6535 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6535 *
CVE-2023-6606 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6606 *
CVE-2023-6610 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6610 *
CVE-2023-6679 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6679 *
CVE-2023-6931 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6931 *
CVE-2023-7042 (CVSSv3: 4.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-7042 *
CVE-2023-39179 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-39179 *
CVE-2023-39180 (CVSSv3: 4.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-39180 *
CVE-2023-52624 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-52624 *
CVE-2023-52625 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-52625 *
CVE-2024-0565 (CVSSv3: 6.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-0565 *
CVE-2024-1151 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-1151 *
CVE-2024-23848 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-23848 *
CVE-2024-23849 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-23849 *
CVE-2024-23850 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-23850 *
CVE-2024-23851 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-23851 *
CVE-2024-24859 (CVSSv3: 4.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-24859 *
CVE-2024-24860 (CVSSv3: 4.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-24860 *
CVE-2024-24861 (CVSSv3: 3.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-24861 *
CVE-2024-24864 (CVSSv3: 5.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-24864 *
CVE-2024-25739 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-25739 *
CVE-2024-25740 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-25740 *
CVE-2024-25741 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-25741 *
CVE-2024-26672 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-26672 *
CVE-2024-26756 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-26756 *
CVE-2024-26757 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-26757 *
CVE-2024-26758 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-26758 *
CVE-2024-26944 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-26944 *
CVE-2024-26962 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-26962 *
CVE-2024-27012 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-27012 *
CVE-2024-27079 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-27079 *
CVE-2024-35794 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-35794 *
CVE-2024-35808 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-35808 *
CVE-2024-35843 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-35843 *
CVE-2024-35931 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-35931 *
CVE-2024-36024 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-36024 *
CVE-2024-42040 (CVSSv3: 8.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2024-42040 *
CVE-2024-42118 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-42118 *
CVE-2024-42158 (CVSSv3: 4.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-42158 *
CVE-2024-43872 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-43872 *
CVE-2024-43901 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-43901 *
CVE-2024-46698 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46698 *
CVE-2024-46701 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46701 *
CVE-2024-46727 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46727 *
CVE-2024-46729 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46729 *
CVE-2024-47662 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-47662 *
CVE-2024-47703 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-47703 *
CVE-2024-49893 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49893 *
CVE-2024-49908 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49908 *
CVE-2024-49910 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49910 *
CVE-2024-49916 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49916 *
CVE-2024-50028 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-50028 *
CVE-2024-50102 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-50102 *
CVE-2024-50217 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-50217 *
CVE-2024-50225 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-50225 *
CVE-2024-50613 (CVSSv3: 6.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2024-50613 *
CVE-2024-53089 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-53089 *
CVE-2024-56591 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-56591 *
CVE-2024-56775 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-56775 *
CVE-2024-57254 (CVSSv3: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2024-57254 *
CVE-2024-57255 (CVSSv3: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2024-57255 *
CVE-2024-57256 (CVSSv3: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2024-57256 *
CVE-2024-57257 (CVSSv3: 2.0): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2024-57257 *
CVE-2024-57258 (CVSSv3: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2024-57258 *
CVE-2024-57259 (CVSSv3: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2024-57259 *
CVE-2024-57872 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-57872 *
CVE-2024-58015 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-58015 *
CVE-2024-58089 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-58089 *
CVE-2024-58241 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-58241 *
CVE-2025-4598 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-4598 *
CVE-2025-4674 (CVSSv3: 8.6): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-4674 *
CVE-2025-6558 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2025-6558 *
CVE-2025-12781 (CVSSv3: 5.3, CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-12781 *
CVE-2025-21634 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21634 *
CVE-2025-21693 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21693 *
CVE-2025-21732 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21732 *
CVE-2025-21907 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21907 *
CVE-2025-21949 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21949 *
CVE-2025-21985 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21985 *
CVE-2025-22108 (CVSSv3: 8.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-22108 *
CVE-2025-23130 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-23130 *
CVE-2025-23132 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-23132 *
CVE-2025-31277 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2025-31277 *
CVE-2025-37750 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37750 *
CVE-2025-37826 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37826 *
CVE-2025-37834 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37834 *
CVE-2025-37880 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37880 *
CVE-2025-37907 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37907 *
CVE-2025-38038 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38038 *
CVE-2025-38140 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38140 *
CVE-2025-38199 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38199 *
CVE-2025-38207 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38207 *
CVE-2025-38311 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38311 *
CVE-2025-38333 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38333 *
CVE-2025-38438 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38438 *
CVE-2025-38585 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38585 *
CVE-2025-38717 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38717 *
CVE-2025-39707 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39707 *
CVE-2025-39746 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39746 *
CVE-2025-39747 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39747 *
CVE-2025-39762 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39762 *
CVE-2025-39779 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39779 *
CVE-2025-39932 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39932 *
CVE-2025-43342 (CVSSv3: 9.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2025-43342 *
CVE-2025-43343 (CVSSv3: 9.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2025-43343 *
CVE-2025-47906 (CVSSv3: 6.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-47906 *
CVE-2025-47907 (CVSSv3: 7.0): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-47907 *
CVE-2025-47912 (CVSSv3: 5.3): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-47912 *
CVE-2025-52194 (CVSSv3: 7.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2025-52194 *
CVE-2025-58185 (CVSSv3: 5.3): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-58185 *
CVE-2025-58187 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-58187 *
CVE-2025-58188 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-58188 *
CVE-2025-58189 (CVSSv3: 5.3): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-58189 *
CVE-2025-59529 (CVSSv3: 5.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2025-59529 *
CVE-2025-61723 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61723 *
CVE-2025-61724 (CVSSv3: 5.3): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61724 *
CVE-2025-61726 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61726 *
CVE-2025-61727 (CVSSv3: 6.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61727 *
CVE-2025-61728 (CVSSv3: 6.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61728 *
CVE-2025-61729 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61729 *
CVE-2025-61730 (CVSSv3: 5.3): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61730 *
CVE-2025-61731 (CVSSv3: 7.8): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61731 *
CVE-2025-61732 (CVSSv3: 8.6): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61732 *
CVE-2025-68119 (CVSSv3: 7.0): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-68119 *
CVE-2025-68121 (CVSSv3: 10.0): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-68121 *
CVE-2025-71202 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71202 *
CVE-2025-71315 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71315 *
CVE-2026-1467 (CVSSv3: 5.8): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-1467 *
CVE-2026-1536 (CVSSv3: 5.8): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-1536 *
CVE-2026-1539 (CVSSv3: 5.8): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-1539 *
CVE-2026-1801 (CVSSv3: 5.3): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-1801 *
CVE-2026-1940 (CVSSv3: 5.1): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-1940 *
CVE-2026-2100 (CVSSv3: 5.3): p11-kit https://nvd.nist.gov/vuln/detail/CVE-2026-2100 *
CVE-2026-2369 (CVSSv3: 6.5): libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-2369 *
CVE-2026-2436 (CVSSv3: 6.5): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-2436 *
CVE-2026-2443 (CVSSv3: 5.3): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-2443 *
CVE-2026-2708 (CVSSv3: 3.7): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-2708 *
CVE-2026-2920 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-2920 *
CVE-2026-2921 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-2921 *
CVE-2026-2922 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-2922 *
CVE-2026-2923 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-2923 *
CVE-2026-3081 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-3081 *
CVE-2026-3082 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-3082 *
CVE-2026-3083 (CVSSv3: 8.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-3083 *
CVE-2026-3084 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-3084 *
CVE-2026-3085 (CVSSv3: 8.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-3085 *
CVE-2026-3086 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-3086 *
CVE-2026-3099 (CVSSv3: 5.8): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-3099 *
CVE-2026-3632 (CVSSv3: 3.9): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-3632 *
CVE-2026-3633 (CVSSv3: 3.9): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-3633 *
CVE-2026-3634 (CVSSv3: 3.9): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-3634 *
CVE-2026-4271 (CVSSv3: 5.3): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-4271 *
CVE-2026-5119 (CVSSv3: 5.9): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-5119 *
CVE-2026-5673 (CVSSv3: 5.6): libtheora https://nvd.nist.gov/vuln/detail/CVE-2026-5673 *
CVE-2026-6429 (CVSSv3: 5.3): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-6429 *
CVE-2026-6844 (CVSSv3: 5.5): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://nvd.nist.gov/vuln/detail/CVE-2026-6844 *
CVE-2026-6845 (CVSSv3: 5.0): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://nvd.nist.gov/vuln/detail/CVE-2026-6845 *
CVE-2026-7168 (CVSSv3: 5.3): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-7168 *
CVE-2026-8927 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8927 *
CVE-2026-8932 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8932 *
CVE-2026-10723 (CVSSv3: 6.8): bind https://nvd.nist.gov/vuln/detail/CVE-2026-10723 *
CVE-2026-10822 (CVSSv3: 6.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-10822 *
CVE-2026-11331 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11331 *
CVE-2026-11622 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11622 *
CVE-2026-11721 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11721 *
CVE-2026-11856 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-11856 *
CVE-2026-12548 (CVSSv3: 4.2): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-12548 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-12617 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-12617 *
CVE-2026-12891 (CVSSv3: 4.3): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-12891 *
CVE-2026-12892 (CVSSv3: 4.4): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-12892 *
CVE-2026-13204 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-13204 *
CVE-2026-13321 (CVSSv3: 8.6): bind https://nvd.nist.gov/vuln/detail/CVE-2026-13321 *
CVE-2026-18295 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18295 *
CVE-2026-18296 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18296 *
CVE-2026-18297 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18297 *
CVE-2026-18298 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18298 *
CVE-2026-18299 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18299 *
CVE-2026-18477 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18477 *
CVE-2026-18508 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18508 *
CVE-2026-18924 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-18924 *
CVE-2026-19931 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-19931 *
CVE-2026-23000 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23000 *
CVE-2026-23239 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23239 *
CVE-2026-23240 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23240 *
CVE-2026-23265 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23265 *
CVE-2026-23348 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23348 *
CVE-2026-23393 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23393 *
CVE-2026-25679 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-25679 *
CVE-2026-27139 (CVSSv3: 2.5): go:go-binary-native:go-cross-core2-64:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-27139 *
CVE-2026-27140 (CVSSv3: 8.8): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-27140 *
CVE-2026-27142 (CVSSv3: 6.1): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-27142 *
CVE-2026-27143 (CVSSv3: 9.8): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-27143 *
CVE-2026-27144 (CVSSv3: 7.1): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-27144 *
CVE-2026-28529 (CVSSv3: 7.8, CVSSv4: 8.5): cryptodev-linux https://nvd.nist.gov/vuln/detail/CVE-2026-28529 *
CVE-2026-29007 (CVSSv3: 5.3, CVSSv4: 6.9): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-29007 *
CVE-2026-29008 (CVSSv3: 7.5, CVSSv4: 8.7): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-29008 *
CVE-2026-29009 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-29009 *
CVE-2026-29518 (CVSSv3: 7.0, CVSSv4: 7.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-29518 *
CVE-2026-30754 (CVSSv3: 8.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30754 *
CVE-2026-30997 (CVSSv3: 7.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30997 *
CVE-2026-30998 (CVSSv3: 7.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30998 *
CVE-2026-30999 (CVSSv3: 7.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30999 *
CVE-2026-31516 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31516 *
CVE-2026-31536 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31536 *
CVE-2026-31537 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31537 *
CVE-2026-31579 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31579 *
CVE-2026-31692 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31692 *
CVE-2026-31729 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31729 *
CVE-2026-31777 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31777 *
CVE-2026-32280 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-32280 *
CVE-2026-32281 (CVSSv3: 7.5): go:go-binary-native:go-cross-core2-64:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-32281 *
CVE-2026-32282 (CVSSv3: 6.4): go:go-binary-native:go-cross-core2-64:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-32282 *
CVE-2026-32283 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-32283 *
CVE-2026-32288 (CVSSv3: 5.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-32288 *
CVE-2026-32289 (CVSSv3: 6.1): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-32289 *
CVE-2026-33811 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-33811 *
CVE-2026-33814 (CVSSv3: 7.5): go:go-binary-native:go-cross-core2-64:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-33814 *
CVE-2026-35093 (CVSSv3: 8.8): libinput https://nvd.nist.gov/vuln/detail/CVE-2026-35093 *
CVE-2026-35094 (CVSSv3: 3.3): libinput https://nvd.nist.gov/vuln/detail/CVE-2026-35094 *
CVE-2026-39817 (CVSSv3: 5.9): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-39817 *
CVE-2026-39819 (CVSSv3: 5.3): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-39819 *
CVE-2026-39820 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-39820 *
CVE-2026-39823 (CVSSv3: 6.1): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-39823 *
CVE-2026-39825 (CVSSv3: 5.3): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-39825 *
CVE-2026-39826 (CVSSv3: 6.1): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-39826 *
CVE-2026-40962 (CVSSv3: 4.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-40962 *
CVE-2026-42499 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-42499 *
CVE-2026-42501 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-42501 *
CVE-2026-43053 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43053 *
CVE-2026-43161 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43161 *
CVE-2026-43309 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43309 *
CVE-2026-43318 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43318 *
CVE-2026-43416 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43416 *
CVE-2026-43617 (CVSSv3: 4.8, CVSSv4: 6.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43617 *
CVE-2026-43618 (CVSSv3: 8.1, CVSSv4: 6.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43618 *
CVE-2026-43619 (CVSSv3: 6.3, CVSSv4: 7.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43619 *
CVE-2026-43620 (CVSSv3: 6.5, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43620 *
CVE-2026-45232 (CVSSv3: 3.1, CVSSv4: 2.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-45232 *
CVE-2026-45855 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45855 *
CVE-2026-46017 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46017 *
CVE-2026-46044 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46044 *
CVE-2026-46147 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46147 *
CVE-2026-46153 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46153 *
CVE-2026-46314 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46314 *
CVE-2026-50256 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50256 *
CVE-2026-50257 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50257 *
CVE-2026-50258 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50258 *
CVE-2026-50259 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50259 *
CVE-2026-50260 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50260 *
CVE-2026-50261 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50261 *
CVE-2026-50262 (CVSSv3: 5.5): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50262 *
CVE-2026-50263 (CVSSv3: 5.5): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50263 *
CVE-2026-50264 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50264 *
CVE-2026-52295 (CVSSv3: 2.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-52295 *
CVE-2026-52296 (CVSSv3: 2.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-52296 *
CVE-2026-52297 (CVSSv3: 2.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-52297 *
CVE-2026-52953 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52953 *
CVE-2026-53106 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53106 *
CVE-2026-53132 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53132 *
CVE-2026-53246 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53246 *
CVE-2026-53285 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53285 *
CVE-2026-53368 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53368 *
CVE-2026-53783 (CVSSv3: 8.1, CVSSv4: 8.6): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53783 *
CVE-2026-53784 (CVSSv3: 7.1, CVSSv4: 8.4): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53784 *
CVE-2026-53785 (CVSSv3: 7.1, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53785 *
CVE-2026-53786 (CVSSv3: 6.5, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53786 *
CVE-2026-53788 (CVSSv3: 6.5, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53788 *
CVE-2026-53789 (CVSSv3: 6.5, CVSSv4: 7.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53789 *
CVE-2026-53790 (CVSSv3: 8.1, CVSSv4: 9.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53790 *
CVE-2026-53791 (CVSSv3: 9.1, CVSSv4: 9.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53791 *
CVE-2026-53792 (CVSSv3: 6.5, CVSSv4: 7.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53792 *
CVE-2026-53793 (CVSSv3: 7.4, CVSSv4: 9.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53793 *
CVE-2026-53794 (CVSSv3: 5.3, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53794 *
CVE-2026-53795 (CVSSv3: 8.1, CVSSv4: 7.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53795 *
CVE-2026-53796 (CVSSv3: 6.3, CVSSv4: 5.8): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53796 *
CVE-2026-53797 (CVSSv3: 4.7, CVSSv4: 5.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53797 *
CVE-2026-53798 (CVSSv3: 5.3, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53798 *
CVE-2026-53799 (CVSSv3: 6.3, CVSSv4: 7.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53799 *
CVE-2026-53800 (CVSSv3: 4.7, CVSSv4: 5.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53800 *
CVE-2026-53801 (CVSSv3: 5.9, CVSSv4: 8.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53801 *
CVE-2026-53802 (CVSSv3: 7.1, CVSSv4: 8.4): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53802 *
CVE-2026-53803 (CVSSv3: 7.8, CVSSv4: 8.5): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53803 *
CVE-2026-55453 (CVSSv3: 3.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-55453 *
CVE-2026-55467 (CVSSv3: 2.5): cups https://nvd.nist.gov/vuln/detail/CVE-2026-55467 *
CVE-2026-55480 (CVSSv3: 5.7): cups https://nvd.nist.gov/vuln/detail/CVE-2026-55480 *
CVE-2026-55999 (CVSSv3: 8.5): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-55999 *
CVE-2026-56000 (CVSSv3: 7.8, CVSSv4: 9.0): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-56000 *
CVE-2026-56390 (CVSSv3: 6.3, CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-61702 (CVSSv3: 5.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-61702 *
CVE-2026-63805 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63805 *
CVE-2026-63819 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63819 *
CVE-2026-63858 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63858 *
CVE-2026-63871 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63871 *
CVE-2026-63983 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63983 *
CVE-2026-64017 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64017 *
CVE-2026-64060 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64060 *
CVE-2026-64078 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64078 *
CVE-2026-64112 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64112 *
CVE-2026-64160 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64160 *
CVE-2026-64212 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64212 *
CVE-2026-64255 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64255 *
CVE-2026-64424 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64424 *
CVE-2026-64513 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64513 *
CVE-2026-64830 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64830 *
CVE-2026-64832 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64832 *
CVE-2026-64833 (CVSSv3: 7.1, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64833 *
CVE-2026-64834 (CVSSv3: 7.5, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64834 *
CVE-2026-64835 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64835 *
CVE-2026-65703 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65703 *
CVE-2026-65704 (CVSSv3: 7.8, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65704 *
CVE-2026-65705 (CVSSv3: 7.8, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65705 *
CVE-2026-65706 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65706 *
CVE-2026-66036 (CVSSv3: 8.8, CVSSv4: 7.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66036 *
CVE-2026-66037 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66037 *
CVE-2026-66038 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66038 *
CVE-2026-66039 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66039 *
CVE-2026-66040 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66040 *
CVE-2026-66337 (CVSSv3: 6.5): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-66337 *
CVE-2026-66338 (CVSSv3: 5.4): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-66338 *
CVE-2026-66339 (CVSSv3: 6.5): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-66339 *
CVE-2026-67322 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67322 *
CVE-2026-67323 (CVSSv3: 8.4, CVSSv4: 8.6): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67323 *
CVE-2026-67324 (CVSSv3: 9.8, CVSSv4: 9.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67324 *
CVE-2026-67325 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67325 *
CVE-2026-67326 (CVSSv3: 7.0, CVSSv4: 7.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67326 *
CVE-2026-69097 (CVSSv3: 7.0, CVSSv4: 7.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-69097 *
CVE-2026-70452 (CVSSv3: 7.4, CVSSv4: 9.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70452 *
CVE-2026-70453 (CVSSv3: 7.5, CVSSv4: 8.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70453 *
CVE-2026-70456 (CVSSv3: 8.2, CVSSv4: 8.8): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70456 *
CVE-2026-70457 (CVSSv3: 6.5, CVSSv4: 8.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70457 *
CVE-2026-70458 (CVSSv3: 8.2, CVSSv4: 8.8): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70458 *
CVE-2026-70459 (CVSSv3: 5.3, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70459 *
CVE-2026-70460 (CVSSv3: 8.1, CVSSv4: 9.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70460 *
CVE-2026-70461 (CVSSv3: 8.2, CVSSv4: 8.8): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70461 *
CVE-2026-70462 (CVSSv3: 6.5, CVSSv4: 7.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70462 *
CVE-2026-70463 (CVSSv3: 8.1, CVSSv4: 8.6): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70463 *
CVE-2026-70464 (CVSSv3: 7.5, CVSSv4: 8.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70464 *
CVE-2026-70628 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70628 *
CVE-2026-70629 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70629 *
CVE-2026-70630 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70630 *
CVE-2026-70631 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70631 *
CVE-2026-70632 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70632 *
CVE-2026-73076 (CVSSv3: 7.8, CVSSv4: 8.4): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73076 *
CVE-2026-73433 (CVSSv3: 6.6): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73433 *
CVE-2026-73434 (CVSSv3: 6.1): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73434 *
CVE-2026-73619 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73619 *
CVE-2026-73620 (CVSSv3: 8.1, CVSSv4: 7.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73620 *
CVE-2026-73621 (CVSSv3: 5.4, CVSSv4: 5.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73621 *
CVE-2026-73622 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73622 *
CVE-2026-73623 (CVSSv3: 7.5, CVSSv4: 7.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73623 *
CVE-2026-73624 (CVSSv3: 8.1, CVSSv4: 7.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73624 *
CVE-2026-73625 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73625 *
CVE-2026-76217 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76217 *
CVE-2026-76218 (CVSSv3: 7.5, CVSSv4: 7.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76218 *
CVE-2026-76219 (CVSSv3: 8.1, CVSSv4: 7.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76219 *
CVE-2026-76220 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76220 *
CVE-2026-76221 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76221 *
CVE-2026-76222 (CVSSv3: 8.2, CVSSv4: 8.4): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76222 *
CVE-2026-78675 (CVSSv3: 8.4, CVSSv4: 8.6): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78675 *
CVE-2026-78676 (CVSSv3: 9.8, CVSSv4: 9.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78676 *
CVE-2026-78677 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78677 *
CVE-2026-78678 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78678 *
CVE-2026-80231 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-80231 *
CVE-2026-87817 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-87817 *
CVE-2026-87818 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-87818 *
CVE-2026-87819 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-87819 *
CVE-2026-96611 (CVSSv3: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-96611 *
CVE-2026-97229 (CVSSv3: 10.0): ruby:ruby-native https://nvd.nist.gov/vuln/detail/CVE-2026-97229 *
CVE-2026-97687 (CVSSv3: 8.1, CVSSv4: 7.6): python3-urllib3 https://nvd.nist.gov/vuln/detail/CVE-2026-97687 *
CVE-2026-98087 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98087 *
CVE-2026-98115 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98115 *
CVE-2026-98131 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98131 *
CVE-2026-102555 (CVSSv3: 8.2): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-102555 *
CVE-2026-102556 (CVSSv3: 8.6): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-102556 *
CVE-2026-102557 (CVSSv3: 8.6): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-102557 *
CVE-2026-102558 (CVSSv3: 8.6): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-102558 *
CVE-2026-102559 (CVSSv3: 8.6): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-102559 *
CVE-2026-102560 (CVSSv3: 8.6): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-102560 *
CVE-2026-106552 (CVSSv3: 4.2): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106552 *
CVE-2026-106553 (CVSSv3: 2.2): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106553 *
CVE-2026-106555 (CVSSv3: 2.2): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106555 *
CVE-2026-106582 (CVSSv3: 3.7): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106582 *
CVE-2026-106583 (CVSSv3: 2.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106583 *
CVE-2026-106584 (CVSSv3: 2.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106584 *
CVE-2026-106585 (CVSSv3: 6.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106585 *
CVE-2026-106586 (CVSSv3: 2.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106586 *
CVE-2026-106587 (CVSSv3: 3.6): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106587 *
CVE-2026-107660 (CVSSv3: 4.8, CVSSv4: 6.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107660 *
CVE-2026-107675 (CVSSv3: 5.9, CVSSv4: 6.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107675 *
CVE-2026-107676 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107676 *
CVE-2026-107677 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107677 *
CVE-2026-107678 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107678 *
CVE-2026-107695 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107695 *
CVE-2026-107696 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107696 *
CVE-2026-107697 (CVSSv3: 4.3, CVSSv4: 5.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107697 *
CVE-2026-107698 (CVSSv3: 5.4, CVSSv4: 5.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107698 *
CVE-2026-107885 (CVSSv3: 3.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107885 *
CVE-2026-107886 (CVSSv3: 2.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107886 *
CVE-2026-107888 (CVSSv3: 5.1): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107888 *
CVE-2026-107890 (CVSSv3: 3.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107890 *
CVE-2026-111497 (CVSSv3: 9.8, CVSSv4: 9.2): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2026-111497 *
CVE-2026-113351 (CVSSv3: 5.9, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-113351 *
CVE-2026-115506 (CVSSv3: 7.5, CVSSv4: 8.7): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-115506 *
CVE-2026-117610 (CVSSv3: 5.9, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-117610 *
CVE-2026-118370 (CVSSv3: 5.9, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-118370 *
CVE-2026-119371 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119371 *
CVE-2026-119372 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119372 *
CVE-2026-119373 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119373 *
CVE-2026-119374 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119374 *
CVE-2026-119375 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119375 *
CVE-2026-119376 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119376 *
CVE-2026-119377 (CVSSv3: 2.5, CVSSv4: 2.0): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119377 *
CVE-2026-119378 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119378 *
CVE-2026-119379 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119379 *
CVE-2026-119586 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119586 *
CVE-2026-119591 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119591 *
CVE-2026-119741 (CVSSv3: 7.5, CVSSv4: 8.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-119741 *
CVE-2026-125064 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125064 *

Summary of CVE counts by recipe:
  linux-yocto: 203
  rsync:rsync-native: 38
  ffmpeg: 38
  go-binary-native: 37
  python3-git: 26
  libsoup:libsoup-2.4: 24
  gstreamer1.0: 20
  xserver-xorg:xwayland: 11
  sqlite3:sqlite3-native: 11
  u-boot-tools: 10
  openssh: 9
  curl:curl-native: 8
  bind: 8
  cups: 8
  webkitgtk: 4
  go:go-binary-native:go-cross-core2-64:go-runtime: 4
  expat:expat-native: 4
  libsndfile1: 2
  binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native: 2
  tar: 2
  libinput: 2
  python3:python3-native: 1
  avahi: 1
  p11-kit: 1
  libsoup-2.4: 1
  libtheora: 1
  cryptodev-linux: 1
  bison:bison-native: 1
  vim: 1
  ruby:ruby-native: 1
  python3-urllib3: 1
  ovmf:ovmf-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/
