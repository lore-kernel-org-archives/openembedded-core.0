Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21897.1794805666097250403
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 21:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=B6dnX8vW;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so18839275e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794805664; x=1795410464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8oSG+RFKWx00If3Ywevfxl2n6tUhYprdwTOzwi88VaI=;
        b=B6dnX8vWWgn8emgoUIIVMQVC7Khxgq6K8PhatfbRUA+Xgw28/yjlQpY1TpWd16IH11
         nbzCMUIcwFC7+4ICA0Y5HTSIH0Ay3nTjSGqogVjzGIripdACg2uzf7S0t3ofPO0T9bYe
         CbexXOzmytDrRjpyA75/+Pq4pgqJaKdCfHvIRed43MYIDGp0J5ej4Jir1yQdubFQV3X7
         iA8XMF7E2qUniwJQDvmIKGxtpNfhBqyf5rXvaAM5AyXz2a87aEL3DBgcarApKefaAPxD
         Jr/ioLyktu7DBDIfxZFO2lObHnCucurC2ugEq2jeEDQY8W1vvZHpPOS75+4mPm62uD+k
         eZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794805664; x=1795410464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8oSG+RFKWx00If3Ywevfxl2n6tUhYprdwTOzwi88VaI=;
        b=BeOsrGGExnX1VqNlqvPDholz015KDkBWT3w9bFAu2jmFaE8RXU6/eSoRuveCcBTumy
         tz2nCFUDrc/j+qyO2r6kcer4OIhk13A0sseMO1/+ABCD2c8IAZMcw01kXJOzFXtM76BQ
         +3mPL/YKzi/Fn86VpSmDPRa0CeYI4wvT+AkZygUeTEsp/UoZetNLZGCRSpD806wvZoJ9
         tmRSSL0Fx9+KpYp3EOjwErbBnTxn8yfjdSrMdfd2Wf7lfqtUMzV7sUsfgV2up5Q1OgIc
         u2e8Z52cLhFzIWkDSp0UZ8B8yjCha/2NC2zltzuiNKcSCOBqLkGxdyguzY4EX/Asmez5
         3OJg==
X-Gm-Message-State: APuU4Z+O6/ln6h+abVSn7NaTg73c8RU55Rjm7BhEQ5JRf8SqRoZxTK2o
	CWknMluABCl4cFGJAQV3QyUMTZ7t4E8ewhU6U91lf4QuD7sUmBxRhvbilUGC1YdFmhH0MQ0HgZa
	WLR+D0Ok=
X-Gm-Gg: AYBFou1kNn3VfWL5CA3/k/fQw0T4AWj07weTBqm81mRNqTd9nDqY1rVb830sq7aQVDY
	gZ3NBA5Dln//MthFD3DdUch3Ie5PyYI1S5SGQwn6o/oFOhBYb7ZMn2uA0m8CZ3hkUDwjZI93RLY
	4W2f4oN6Xf0XiNfjyQpRvjshL7qDHVdnvKQoKBnPXWUl4SuCCZafQ1bfG71h9L1A9K5D1pAn3Rf
	ikupjRNwfPlJh97A75TFgMEMU5PX91Qg+riBLKYhbST4E9fmmIavqfJDJKUDEYiVhP+dJBB2evr
	RMli19Be80gDB1gbP5WApboduxdnuOJwt0vw/OPiG3ipMZqNI8Z1ipw587fo5jmuQKqev1KIS76
	zjetlnHfBefX9nwb98sAEUKY4Ffh+lLCZT9iRo+glzB8aTTW6tShd2BWFx6h3b07jk9ViNkOs8K
	dn/6heBfuzsjp8iw2NQX3nzBYL73KXmiaQPSCaol7HZKHVPJGLTLdHhXP9FwY/FlUcdo8wXQ5xI
	jqFtHc8qarGXeaRORZdojTQt8ZhgQUx8m04RfB4AQbQftGn9Ac74rnKPlm9aXHbTRl8mtEH5eWd
	UcOlMNJrLY0kK+Rigg5KnjOGmhNZDcMktvw0nRmq1qJkwjoqw0KKfBY/0682wl9fqyGbqu3g6VI
	rH1MXmLJfG1JLYNHkmdLdFs6P8UX3P/ijhEkXnEtaLKHGYqDS2CuP/LC0Y62jpZZTmoTTNyBQml
	K+1zuV3I2j1/bPTM3zVA9W
X-Received: by 2002:a05:600c:8716:b0:4bb:6847:791f with SMTP id 5b1f17b1804b1-4bb68477becmr104696905e9.7.1794805663687;
        Sun, 15 Nov 2026 21:07:43 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from runner-sindu79iq-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21288569f8f.45.2026.11.15.21.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:07:43 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Mon Nov 16 04:04:49 2026
Date: Mon, 16 Nov 2026 05:07:40 +0000
Message-ID: <20261116050742.24-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116050742.24-1-yoann.congal@smile.fr>
References: <20261116050742.24-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 05:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250305
Content-Type: text/plain; charset="utf-8"

Branch: master

New this week: 151 CVEs
CVE-2026-14968 (CVSSv4: 7.0): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2026-14968 *
CVE-2026-16052 (CVSSv4: 2.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-16052 *
CVE-2026-18448 (CVSSv4: 5.6): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2026-18448 *
CVE-2026-19552 (CVSS: N/A): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19552 *
CVE-2026-71972 (CVSSv3: 5.9, CVSSv4: 6.0): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71972 *
CVE-2026-88822 (CVSS: N/A): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-88822 *
CVE-2026-88823 (CVSS: N/A): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-88823 *
CVE-2026-95691 (CVSS: N/A): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-95691 *
CVE-2026-95692 (CVSS: N/A): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-95692 *
CVE-2026-97033 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97033 *
CVE-2026-97034 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97034 *
CVE-2026-97035 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97035 *
CVE-2026-97036 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97036 *
CVE-2026-97037 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97037 *
CVE-2026-97038 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97038 *
CVE-2026-97039 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97039 *
CVE-2026-97040 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97040 *
CVE-2026-97042 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97042 *
CVE-2026-97043 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97043 *
CVE-2026-97054 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97054 *
CVE-2026-99287 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99287 *
CVE-2026-99288 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99288 *
CVE-2026-100290 (CVSSv3: 3.7): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-100290 *
CVE-2026-107496 (CVSS: N/A): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-107496 *
CVE-2026-109091 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109091 *
CVE-2026-109092 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109092 *
CVE-2026-109093 (CVSSv4: 8.5): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109093 *
CVE-2026-109094 (CVSSv4: 8.5): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109094 *
CVE-2026-109095 (CVSSv4: 6.9): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109095 *
CVE-2026-109096 (CVSSv3: 5.5): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109096 *
CVE-2026-109903 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109903 *
CVE-2026-109904 (CVSSv4: 6.9): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109904 *
CVE-2026-115559 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-115559 *
CVE-2026-115791 (CVSSv4: 5.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-115791 *
CVE-2026-115819 (CVSSv3: 4.8): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-115819 *
CVE-2026-124249 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-124249 *
CVE-2026-125064 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125064 *
CVE-2026-125065 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125065 *
CVE-2026-125066 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125066 *
CVE-2026-125067 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125067 *
CVE-2026-125068 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125068 *
CVE-2026-125069 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125069 *
CVE-2026-125070 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125070 *
CVE-2026-125071 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125071 *
CVE-2026-125072 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125072 *
CVE-2026-125073 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125073 *
CVE-2026-125095 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125095 *
CVE-2026-125096 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125096 *
CVE-2026-125097 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125097 *
CVE-2026-125098 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125098 *
CVE-2026-125099 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125099 *
CVE-2026-125100 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125100 *
CVE-2026-125101 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125101 *
CVE-2026-125102 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125102 *
CVE-2026-125103 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125103 *
CVE-2026-125104 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125104 *
CVE-2026-125170 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125170 *
CVE-2026-125171 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125171 *
CVE-2026-125172 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125172 *
CVE-2026-125173 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125173 *
CVE-2026-125175 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125175 *
CVE-2026-125176 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125176 *
CVE-2026-125177 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125177 *
CVE-2026-125178 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125178 *
CVE-2026-125179 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125179 *
CVE-2026-125180 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125180 *
CVE-2026-125181 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125181 *
CVE-2026-125182 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125182 *
CVE-2026-125183 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125183 *
CVE-2026-125184 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125184 *
CVE-2026-125185 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125185 *
CVE-2026-125186 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125186 *
CVE-2026-125187 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125187 *
CVE-2026-125188 (CVSSv3: 2.5, CVSSv4: 2.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125188 *
CVE-2026-125189 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125189 *
CVE-2026-125190 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125190 *
CVE-2026-125191 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125191 *
CVE-2026-125192 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125192 *
CVE-2026-125193 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125193 *
CVE-2026-125194 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125194 *
CVE-2026-125195 (CVSSv3: 2.5, CVSSv4: 2.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125195 *
CVE-2026-125196 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125196 *
CVE-2026-125197 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125197 *
CVE-2026-125198 (CVSSv3: 2.5, CVSSv4: 2.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125198 *
CVE-2026-125199 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125199 *
CVE-2026-125200 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125200 *
CVE-2026-125202 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125202 *
CVE-2026-125204 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125204 *
CVE-2026-125205 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125205 *
CVE-2026-125206 (CVSSv3: 2.5, CVSSv4: 2.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125206 *
CVE-2026-125207 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125207 *
CVE-2026-125208 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125208 *
CVE-2026-125210 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125210 *
CVE-2026-125211 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125211 *
CVE-2026-125212 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125212 *
CVE-2026-125213 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125213 *
CVE-2026-125214 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125214 *
CVE-2026-125215 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125215 *
CVE-2026-125216 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125216 *
CVE-2026-125217 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125217 *
CVE-2026-125218 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125218 *
CVE-2026-125219 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125219 *
CVE-2026-125220 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125220 *
CVE-2026-125221 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125221 *
CVE-2026-125222 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125222 *
CVE-2026-125223 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125223 *
CVE-2026-125224 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125224 *
CVE-2026-125225 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125225 *
CVE-2026-125226 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125226 *
CVE-2026-125227 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125227 *
CVE-2026-125229 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125229 *
CVE-2026-125230 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125230 *
CVE-2026-125231 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125231 *
CVE-2026-125232 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125232 *
CVE-2026-125233 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125233 *
CVE-2026-125234 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125234 *
CVE-2026-125235 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125235 *
CVE-2026-125236 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125236 *
CVE-2026-125237 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125237 *
CVE-2026-125238 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125238 *
CVE-2026-125239 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125239 *
CVE-2026-125240 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125240 *
CVE-2026-125241 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125241 *
CVE-2026-125242 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125242 *
CVE-2026-125243 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125243 *
CVE-2026-125245 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125245 *
CVE-2026-125246 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125246 *
CVE-2026-125247 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125247 *
CVE-2026-125248 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125248 *
CVE-2026-125249 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125249 *
CVE-2026-125250 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125250 *
CVE-2026-125251 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125251 *
CVE-2026-125252 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125252 *
CVE-2026-125253 (CVSSv3: 5.3, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125253 *
CVE-2026-125254 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125254 *
CVE-2026-125255 (CVSSv3: 5.3, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125255 *
CVE-2026-125256 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125256 *
CVE-2026-125257 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125257 *
CVE-2026-125258 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125258 *
CVE-2026-125259 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125259 *
CVE-2026-125260 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125260 *
CVE-2026-125261 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125261 *
CVE-2026-125262 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125262 *
CVE-2026-125263 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125263 *
CVE-2026-125264 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125264 *
CVE-2026-125265 (CVSSv3: 5.3, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125265 *
CVE-2026-125266 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125266 *
CVE-2026-125268 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125268 *
CVE-2026-125269 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125269 *
CVE-2026-125270 (CVSSv3: 5.3, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125270 *
CVE-2026-128241 (CVSSv3: 4.4, CVSSv4: 4.1): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-128241 *

Removed this week: 19 CVEs
CVE-2026-18839 (CVSSv3: 2.2): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18839 *
CVE-2026-76844 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-76844 *
CVE-2026-82474 (CVSSv3: 7.8, CVSSv4: 8.5): sudo https://nvd.nist.gov/vuln/detail/CVE-2026-82474 *
CVE-2026-85091 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-85091 *
CVE-2026-88812 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-88812 *
CVE-2026-93515 (CVSSv4: 6.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93515 *
CVE-2026-93516 (CVSSv3: 5.5): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93516 *
CVE-2026-93517 (CVSSv4: 8.5): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93517 *
CVE-2026-93518 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93518 *
CVE-2026-93519 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93519 *
CVE-2026-93520 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93520 *
CVE-2026-93521 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93521 *
CVE-2026-93522 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93522 *
CVE-2026-93523 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93523 *
CVE-2026-93524 (CVSSv4: 6.9): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93524 *
CVE-2026-93536 (CVSSv3: 5.3): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-93536 *
CVE-2026-97229 (CVSSv3: 10.0): ruby:ruby-native https://nvd.nist.gov/vuln/detail/CVE-2026-97229 *
CVE-2026-109518 (CVSSv4: 7.7): apt https://nvd.nist.gov/vuln/detail/CVE-2026-109518 *
CVE-2026-119741 (CVSSv3: 7.5, CVSSv4: 8.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-119741 *

Full list: Found 295 unpatched CVEs
CVE-2019-14899 (CVSSv2: 4.9, CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-14899 *
CVE-2020-10774 (CVSSv2: 2.1, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-10774 *
CVE-2020-27748 (CVSSv2: 4.3, CVSSv3: 6.5): xdg-utils https://nvd.nist.gov/vuln/detail/CVE-2020-27748 *
CVE-2021-3714 (CVSSv3: 5.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3714 *
CVE-2021-3864 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3864 *
CVE-2021-47645 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-47645 *
CVE-2022-4543 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4543 *
CVE-2023-3397 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3397 *
CVE-2023-3640 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3640 *
CVE-2023-6238 (CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6238 *
CVE-2023-6240 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6240 *
CVE-2023-38469 (CVSSv3: 6.2): avahi https://nvd.nist.gov/vuln/detail/CVE-2023-38469 *
CVE-2023-38470 (CVSSv3: 6.2): avahi https://nvd.nist.gov/vuln/detail/CVE-2023-38470 *
CVE-2023-38471 (CVSSv3: 6.2): avahi https://nvd.nist.gov/vuln/detail/CVE-2023-38471 *
CVE-2023-38472 (CVSSv3: 6.2): avahi https://nvd.nist.gov/vuln/detail/CVE-2023-38472 *
CVE-2023-38473 (CVSSv3: 6.2): avahi https://nvd.nist.gov/vuln/detail/CVE-2023-38473 *
CVE-2024-2236 (CVSSv3: 5.9): libgcrypt:libgcrypt-native https://nvd.nist.gov/vuln/detail/CVE-2024-2236 *
CVE-2024-47850 (CVSSv3: 7.5): cups https://nvd.nist.gov/vuln/detail/CVE-2024-47850 *
CVE-2024-50613 (CVSSv3: 6.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2024-50613 *
CVE-2025-15367 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15367 *
CVE-2025-52194 (CVSSv3: 7.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2025-52194 *
CVE-2025-59529 (CVSSv3: 5.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2025-59529 *
CVE-2025-68276 (CVSSv3: 5.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2025-68276 *
CVE-2025-68468 (CVSSv3: 6.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2025-68468 *
CVE-2025-68471 (CVSSv3: 6.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2025-68471 *
CVE-2026-3099 (CVSSv3: 7.3): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3099 *
CVE-2026-3632 (CVSSv3: 5.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3632 *
CVE-2026-3633 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3633 *
CVE-2026-3634 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3634 *
CVE-2026-5673 (CVSSv3: 7.1): libtheora https://nvd.nist.gov/vuln/detail/CVE-2026-5673 *
CVE-2026-6844 (CVSSv3: 5.5): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6844 *
CVE-2026-6845 (CVSSv3: 5.0): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6845 *
CVE-2026-12548 (CVSSv3: 4.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12548 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-14968 (CVSSv4: 7.0): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2026-14968 *
CVE-2026-15534 (CVSSv3: 5.7): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-15534 *
CVE-2026-16052 (CVSSv4: 2.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-16052 *
CVE-2026-17025 (CVSSv3: 6.4): graphene https://nvd.nist.gov/vuln/detail/CVE-2026-17025 *
CVE-2026-18448 (CVSSv4: 5.6): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2026-18448 *
CVE-2026-18477 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18477 *
CVE-2026-18487 (CVSSv3: 5.4): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-18487 *
CVE-2026-18508 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18508 *
CVE-2026-19552 (CVSS: N/A): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19552 *
CVE-2026-19672 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19672 *
CVE-2026-24401 (CVSSv3: 6.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2026-24401 *
CVE-2026-28529 (CVSSv3: 7.8, CVSSv4: 8.5): cryptodev-linux https://nvd.nist.gov/vuln/detail/CVE-2026-28529 *
CVE-2026-34933 (CVSSv3: 5.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2026-34933 *
CVE-2026-38752 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38752 *
CVE-2026-38753 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38753 *
CVE-2026-38755 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38755 *
CVE-2026-53613 (CVSSv3: 7.0): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://nvd.nist.gov/vuln/detail/CVE-2026-53613 *
CVE-2026-66337 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66337 *
CVE-2026-66338 (CVSSv3: 7.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66338 *
CVE-2026-66339 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66339 *
CVE-2026-68086 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68086 *
CVE-2026-71972 (CVSSv3: 5.9, CVSSv4: 6.0): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71972 *
CVE-2026-78376 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-78376 *
CVE-2026-82560 (CVSSv3: 7.5): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-82560 *
CVE-2026-83596 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-83596 *
CVE-2026-84243 (CVSSv3: 7.0): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-84243 *
CVE-2026-88822 (CVSS: N/A): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-88822 *
CVE-2026-88823 (CVSS: N/A): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-88823 *
CVE-2026-90801 (CVSSv2: 4.3, CVSSv3: 6.6, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90801 *
CVE-2026-90802 (CVSSv2: 3.2, CVSSv3: 4.4, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90802 *
CVE-2026-90803 (CVSSv2: 4.3, CVSSv3: 6.8, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90803 *
CVE-2026-90804 (CVSSv2: 4.3, CVSSv3: 6.1, CVSSv4: 2.4): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90804 *
CVE-2026-90828 (CVSSv2: 4.3, CVSSv3: 6.6, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90828 *
CVE-2026-90829 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90829 *
CVE-2026-90830 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90830 *
CVE-2026-90831 (CVSSv2: 4.3, CVSSv3: 5.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-90831 *
CVE-2026-91779 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91779 *
CVE-2026-91780 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91780 *
CVE-2026-91781 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91781 *
CVE-2026-91782 (CVSSv2: 1.7, CVSSv3: 3.3, CVSSv4: 4.8): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-91782 *
CVE-2026-95691 (CVSS: N/A): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-95691 *
CVE-2026-95692 (CVSS: N/A): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-95692 *
CVE-2026-97033 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97033 *
CVE-2026-97034 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97034 *
CVE-2026-97035 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97035 *
CVE-2026-97036 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97036 *
CVE-2026-97037 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97037 *
CVE-2026-97038 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97038 *
CVE-2026-97039 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97039 *
CVE-2026-97040 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97040 *
CVE-2026-97042 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97042 *
CVE-2026-97043 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97043 *
CVE-2026-97054 (CVSS: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-97054 *
CVE-2026-97631 (CVSSv4: 9.5): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2026-97631 *
CVE-2026-97876 (CVSSv3: 6.4): grub:grub-efi:grub-native https://nvd.nist.gov/vuln/detail/CVE-2026-97876 *
CVE-2026-98869 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98869 *
CVE-2026-99218 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99218 *
CVE-2026-99219 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99219 *
CVE-2026-99220 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99220 *
CVE-2026-99221 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99221 *
CVE-2026-99222 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99222 *
CVE-2026-99223 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99223 *
CVE-2026-99224 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99224 *
CVE-2026-99225 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99225 *
CVE-2026-99226 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99226 *
CVE-2026-99227 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99227 *
CVE-2026-99228 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99228 *
CVE-2026-99229 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99229 *
CVE-2026-99230 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99230 *
CVE-2026-99231 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99231 *
CVE-2026-99232 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99232 *
CVE-2026-99233 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99233 *
CVE-2026-99234 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99234 *
CVE-2026-99235 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99235 *
CVE-2026-99236 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99236 *
CVE-2026-99237 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99237 *
CVE-2026-99238 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99238 *
CVE-2026-99239 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99239 *
CVE-2026-99240 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99240 *
CVE-2026-99241 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99241 *
CVE-2026-99242 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99242 *
CVE-2026-99244 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99244 *
CVE-2026-99245 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99245 *
CVE-2026-99253 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99253 *
CVE-2026-99254 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99254 *
CVE-2026-99255 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99255 *
CVE-2026-99269 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99269 *
CVE-2026-99271 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99271 *
CVE-2026-99272 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99272 *
CVE-2026-99273 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99273 *
CVE-2026-99274 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99274 *
CVE-2026-99275 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99275 *
CVE-2026-99276 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99276 *
CVE-2026-99277 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99277 *
CVE-2026-99278 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99278 *
CVE-2026-99279 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99279 *
CVE-2026-99280 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99280 *
CVE-2026-99281 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99281 *
CVE-2026-99282 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99282 *
CVE-2026-99283 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99283 *
CVE-2026-99284 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99284 *
CVE-2026-99287 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99287 *
CVE-2026-99288 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99288 *
CVE-2026-100080 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100080 *
CVE-2026-100081 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100081 *
CVE-2026-100082 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100082 *
CVE-2026-100290 (CVSSv3: 3.7): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-100290 *
CVE-2026-103995 (CVSSv4: 2.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-103995 *
CVE-2026-107496 (CVSS: N/A): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-107496 *
CVE-2026-107675 (CVSSv3: 5.9, CVSSv4: 6.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107675 *
CVE-2026-107676 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107676 *
CVE-2026-107677 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107677 *
CVE-2026-107678 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107678 *
CVE-2026-107696 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107696 *
CVE-2026-107885 (CVSSv3: 5.5): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107885 *
CVE-2026-109091 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109091 *
CVE-2026-109092 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109092 *
CVE-2026-109093 (CVSSv4: 8.5): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109093 *
CVE-2026-109094 (CVSSv4: 8.5): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109094 *
CVE-2026-109095 (CVSSv4: 6.9): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109095 *
CVE-2026-109096 (CVSSv3: 5.5): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109096 *
CVE-2026-109828 (CVSSv2: 5.0, CVSSv3: 4.3, CVSSv4: 5.3): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2026-109828 *
CVE-2026-109903 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109903 *
CVE-2026-109904 (CVSSv4: 6.9): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-109904 *
CVE-2026-111183 (CVSSv3: 9.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-111183 *
CVE-2026-111497 (CVSSv3: 9.8, CVSSv4: 9.2): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2026-111497 *
CVE-2026-112271 (CVSSv3: 5.5, CVSSv4: 6.8): libdisplay-info https://nvd.nist.gov/vuln/detail/CVE-2026-112271 *
CVE-2026-112272 (CVSSv3: 5.5, CVSSv4: 6.8): libdisplay-info https://nvd.nist.gov/vuln/detail/CVE-2026-112272 *
CVE-2026-115559 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-115559 *
CVE-2026-115791 (CVSSv4: 5.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-115791 *
CVE-2026-115819 (CVSSv3: 4.8): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-115819 *
CVE-2026-115863 (CVSSv3: 7.6): connman https://nvd.nist.gov/vuln/detail/CVE-2026-115863 *
CVE-2026-116566 (CVSSv4: 5.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-116566 *
CVE-2026-116741 (CVSSv3: 6.5, CVSSv4: 8.3): speex https://nvd.nist.gov/vuln/detail/CVE-2026-116741 *
CVE-2026-118598 (CVSSv3: 6.5): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-118598 *
CVE-2026-118599 (CVSSv3: 5.5): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-118599 *
CVE-2026-119170 (CVSSv4: 8.2): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119170 *
CVE-2026-119586 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119586 *
CVE-2026-120210 (CVSSv3: 4.3, CVSSv4: 5.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120210 *
CVE-2026-120243 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120243 *
CVE-2026-120244 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120244 *
CVE-2026-120245 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120245 *
CVE-2026-120246 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120246 *
CVE-2026-120247 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120247 *
CVE-2026-124249 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-124249 *
CVE-2026-124317 (CVSSv3: 4.8, CVSSv4: 6.3): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-124317 *
CVE-2026-125064 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125064 *
CVE-2026-125065 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125065 *
CVE-2026-125066 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125066 *
CVE-2026-125067 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125067 *
CVE-2026-125068 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125068 *
CVE-2026-125069 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125069 *
CVE-2026-125070 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125070 *
CVE-2026-125071 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125071 *
CVE-2026-125072 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125072 *
CVE-2026-125073 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125073 *
CVE-2026-125095 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125095 *
CVE-2026-125096 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125096 *
CVE-2026-125097 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125097 *
CVE-2026-125098 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125098 *
CVE-2026-125099 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125099 *
CVE-2026-125100 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125100 *
CVE-2026-125101 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125101 *
CVE-2026-125102 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125102 *
CVE-2026-125103 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125103 *
CVE-2026-125104 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125104 *
CVE-2026-125170 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125170 *
CVE-2026-125171 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125171 *
CVE-2026-125172 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125172 *
CVE-2026-125173 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125173 *
CVE-2026-125175 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125175 *
CVE-2026-125176 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125176 *
CVE-2026-125177 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125177 *
CVE-2026-125178 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125178 *
CVE-2026-125179 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125179 *
CVE-2026-125180 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125180 *
CVE-2026-125181 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125181 *
CVE-2026-125182 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125182 *
CVE-2026-125183 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125183 *
CVE-2026-125184 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125184 *
CVE-2026-125185 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125185 *
CVE-2026-125186 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125186 *
CVE-2026-125187 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125187 *
CVE-2026-125188 (CVSSv3: 2.5, CVSSv4: 2.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125188 *
CVE-2026-125189 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125189 *
CVE-2026-125190 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125190 *
CVE-2026-125191 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125191 *
CVE-2026-125192 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125192 *
CVE-2026-125193 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125193 *
CVE-2026-125194 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125194 *
CVE-2026-125195 (CVSSv3: 2.5, CVSSv4: 2.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125195 *
CVE-2026-125196 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125196 *
CVE-2026-125197 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125197 *
CVE-2026-125198 (CVSSv3: 2.5, CVSSv4: 2.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125198 *
CVE-2026-125199 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125199 *
CVE-2026-125200 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125200 *
CVE-2026-125202 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125202 *
CVE-2026-125204 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125204 *
CVE-2026-125205 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125205 *
CVE-2026-125206 (CVSSv3: 2.5, CVSSv4: 2.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125206 *
CVE-2026-125207 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125207 *
CVE-2026-125208 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125208 *
CVE-2026-125210 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125210 *
CVE-2026-125211 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125211 *
CVE-2026-125212 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125212 *
CVE-2026-125213 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125213 *
CVE-2026-125214 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125214 *
CVE-2026-125215 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125215 *
CVE-2026-125216 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125216 *
CVE-2026-125217 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125217 *
CVE-2026-125218 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125218 *
CVE-2026-125219 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125219 *
CVE-2026-125220 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125220 *
CVE-2026-125221 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125221 *
CVE-2026-125222 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125222 *
CVE-2026-125223 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125223 *
CVE-2026-125224 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125224 *
CVE-2026-125225 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125225 *
CVE-2026-125226 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125226 *
CVE-2026-125227 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125227 *
CVE-2026-125229 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125229 *
CVE-2026-125230 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125230 *
CVE-2026-125231 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125231 *
CVE-2026-125232 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125232 *
CVE-2026-125233 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125233 *
CVE-2026-125234 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125234 *
CVE-2026-125235 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125235 *
CVE-2026-125236 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125236 *
CVE-2026-125237 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125237 *
CVE-2026-125238 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125238 *
CVE-2026-125239 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125239 *
CVE-2026-125240 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125240 *
CVE-2026-125241 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125241 *
CVE-2026-125242 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125242 *
CVE-2026-125243 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125243 *
CVE-2026-125245 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125245 *
CVE-2026-125246 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125246 *
CVE-2026-125247 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125247 *
CVE-2026-125248 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125248 *
CVE-2026-125249 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125249 *
CVE-2026-125250 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125250 *
CVE-2026-125251 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125251 *
CVE-2026-125252 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125252 *
CVE-2026-125253 (CVSSv3: 5.3, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125253 *
CVE-2026-125254 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125254 *
CVE-2026-125255 (CVSSv3: 5.3, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125255 *
CVE-2026-125256 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125256 *
CVE-2026-125257 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125257 *
CVE-2026-125258 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125258 *
CVE-2026-125259 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125259 *
CVE-2026-125260 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125260 *
CVE-2026-125261 (CVSSv3: 6.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125261 *
CVE-2026-125262 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125262 *
CVE-2026-125263 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125263 *
CVE-2026-125264 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125264 *
CVE-2026-125265 (CVSSv3: 5.3, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125265 *
CVE-2026-125266 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125266 *
CVE-2026-125268 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125268 *
CVE-2026-125269 (CVSSv3: 7.0, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125269 *
CVE-2026-125270 (CVSSv3: 5.3, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-125270 *
CVE-2026-128241 (CVSSv3: 4.4, CVSSv4: 4.1): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-128241 *

Summary of CVE counts by recipe:
  ffmpeg: 125
  linux-yocto: 62
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 14
  avahi: 11
  go:go-binary-native:go-cross-x86-64-v3:go-runtime: 11
  python3:python3-native: 10
  libsoup: 9
  xwayland: 8
  openssl:openssl-native: 5
  ovmf:ovmf-native: 4
  libsndfile1: 3
  epiphany: 3
  busybox: 3
  glibc: 3
  cups: 2
  perl:perl-native: 2
  tar: 2
  webkitgtk: 2
  libdisplay-info: 2
  expat:expat-native: 2
  xdg-utils: 1
  libgcrypt:libgcrypt-native: 1
  libtheora: 1
  graphene: 1
  cryptodev-linux: 1
  util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native: 1
  u-boot-tools: 1
  grub:grub-efi:grub-native: 1
  gstreamer1.0: 1
  connman: 1
  speex: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/
