Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.303.1794201595926419395
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 21:19:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=gl5JV07z;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4922523d1afso189695f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 21:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794201594; x=1794806394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rMWpUAB6rrY3dtBahVq9k/DOuqPLdSmLoEuw+XPwvUk=;
        b=gl5JV07zrQMP5Z0Ul+aXwO/wVum3P6z3cXMWPgBcqEEL33iaiikhwcg5BRo53qoX5O
         Tt8/i2hphL3ukaDewK1bW3YRnpN2nVn0WtjE4/uM5qB1GdQddTFFnvM9RC6JoM7jSt+y
         23HnAMWWziFrI0BJ+Fq0PtqZl6sYr8LNg9sSgpSNqYXxfCIuxGex48jXnbnpRs8P1vOE
         9VUAzOeFqBE20nzhTgLif0LzR45FNNVdZL94uKmPLGXNqOGCIonvN65+GZcLXIQz3yp2
         9YsgHENVXUlw0Is3Jl0elg37h5DOscjy61oiQFDwuEz8vLO3+13+ucZ0eDQB8IT1UGeF
         gOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201594; x=1794806394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rMWpUAB6rrY3dtBahVq9k/DOuqPLdSmLoEuw+XPwvUk=;
        b=ep/IjlaehNM87jlUyGGX7DllcLZ8HYD1UNmwZvo3jw/hRtxRVF1AsSytJaJqvAQz5i
         1hBgLF+M7ohi7QjLVXeCMnwJff+KWBH3ko1rqePIUW6NbUMm6zIOdP01s+GtKn0byIUa
         C8tO6VGJyG5Omwqv1P8+0lhNccChoVZSTN7BJVGf8ZJgHP/SJ5MuOY2un6gl7XGCwoFp
         SLoNKAFwgRfPuKgN0ZXFVSyLTR83uOqknFqFDCljMhh+8mzwdydWqiQFy3J/lSpSsTl7
         AhhmxUXM3wSIYPZv9p+I58obknUY4yDHeRZivjXmzCObfLMgdxw/94CcZ0d1Vr5SUfa0
         V5fQ==
X-Gm-Message-State: APuU4Z8VOvSinS7HwoBacjWJ4PvZq+9A0YYzK/t3t3gDO5gAFPe3S4Ky
	q9TtMsDa4GYGpYYZLHmC0vnZH0AKQ04W2IonvWDt4fX3Ivb1dQZJiSsyZ6gJ3qDQ4sD1G28ay9h
	ELz7+468=
X-Gm-Gg: AYBFou3KTWa64iG/zaZ5pPBlyLqFdL4V2OOENgV4OnUKHmYCBv/5JB5/aSOekDqldvq
	50KYEuac8fhDI/pjrNldreTOwhBWEiw1sjyeJvCoqqF2ZA01g9TzRJnsr7E9IdtBpQKjcDwoVSX
	gsD5ywmIdF5nsUwqCp3nAju7XPm9r71f9ulI5TlnhJ28tAABK9tu++EY3yCBIMgiF+WUHy1jHlu
	EevUtnfUXOOKdNs6rP6rEx6+QsoDIy86/nnsL60Kt13vCLQSIjgavqLureuWGQTZ27G9pd1Ckjc
	w+RRbMSpa9uetUn4QsnnlinD5Tkb7Eb2VbjUaggaY8qMeNm2E7merEUnrN9BZN6Lw1YdRSD0Fkf
	2vi7n/CXq9R6D0sXF11RyME6iRdgpHGuTrOIDNzNbeJYY2SBcBFgxSiwLzgOWHKbEOqCraAOdCY
	uimT9kYpckE3pBogmr06Tv3xUn38zbs2JzTSfKY22bPb0cXcLg+TP22XDvSBJJCtLLFzGsUVUDs
	vpd+nl8//jw1cciuEzhnOu8bTv4dkGMpCibATFwyFhtMRSlakEwnXoMeQdGqFACHSfGsGyBqq0j
	hX6WQ3Pm8RDLqCbI3D4Rs6qXaRXb4vp+ccDFEzAYlyrMxv5oASnxfgabitu9/9YI4oEzAjAVPsI
	sF8bgE4xeUEmrqe2zZnTSygLX49f6QjnN6UWYsx6wmxSsnko3MG0W0jdM0WMVY3T9DZ5ASACE7W
	g=
X-Received: by 2002:a05:6000:2681:b0:492:bcc3:9e86 with SMTP id ffacd0b85a97d-49583730f2dmr5975615f8f.32.1794201593193;
        Sun, 08 Nov 2026 21:19:53 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from runner-sindu79iq-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959011c995sm7604212f8f.0.2026.11.08.21.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:19:52 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for wrynose on Mon Nov 09 04:05:30 2026
Date: Mon,  9 Nov 2026 05:19:50 +0000
Message-ID: <20261109051950.24-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109051950.24-1-yoann.congal@smile.fr>
References: <20261109051950.24-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 05:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249793
Content-Type: text/plain; charset="utf-8"

Branch: wrynose

New this week: 54 CVEs
CVE-2026-97229 (CVSSv3: 10.0): ruby:ruby-native https://nvd.nist.gov/vuln/detail/CVE-2026-97229 *
CVE-2026-98449 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98449 *
CVE-2026-98682 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98682 *
CVE-2026-98685 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98685 *
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
CVE-2026-99233 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99233 *
CVE-2026-99234 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99234 *
CVE-2026-99235 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99235 *
CVE-2026-99236 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99236 *
CVE-2026-99237 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99237 *
CVE-2026-99238 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99238 *
CVE-2026-99239 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99239 *
CVE-2026-99240 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99240 *
CVE-2026-99244 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99244 *
CVE-2026-99245 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99245 *
CVE-2026-99246 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99246 *
CVE-2026-99247 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99247 *
CVE-2026-99249 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99249 *
CVE-2026-99250 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99250 *
CVE-2026-99251 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99251 *
CVE-2026-99254 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99254 *
CVE-2026-99255 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99255 *
CVE-2026-99256 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99256 *
CVE-2026-99258 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99258 *
CVE-2026-99270 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99270 *
CVE-2026-99271 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99271 *
CVE-2026-99272 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99272 *
CVE-2026-99273 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99273 *
CVE-2026-99274 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99274 *
CVE-2026-99275 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99275 *
CVE-2026-99281 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99281 *
CVE-2026-99282 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99282 *
CVE-2026-99283 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99283 *
CVE-2026-99284 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99284 *
CVE-2026-100080 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100080 *
CVE-2026-100081 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100081 *
CVE-2026-100082 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100082 *
CVE-2026-109518 (CVSSv4: 7.7): apt https://nvd.nist.gov/vuln/detail/CVE-2026-109518 *
CVE-2026-119741 (CVSSv3: 7.5, CVSSv4: 8.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-119741 *
CVE-2026-123158 (CVSSv3: 8.1): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-123158 *
CVE-2026-124317 (CVSSv3: 4.8, CVSSv4: 6.3): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-124317 *

Removed this week: 0 CVEs


Full list: Found 1396 unpatched CVEs
CVE-2019-14899 (CVSSv2: 4.9, CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-14899 *
CVE-2020-10774 (CVSSv2: 2.1, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-10774 *
CVE-2021-3714 (CVSSv3: 5.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3714 *
CVE-2021-3864 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3864 *
CVE-2022-0400 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-0400 *
CVE-2022-1247 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-1247 *
CVE-2022-4543 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4543 *
CVE-2023-3397 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3397 *
CVE-2023-3640 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3640 *
CVE-2023-6238 (CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6238 *
CVE-2023-6240 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6240 *
CVE-2024-2236 (CVSSv3: 5.9): libgcrypt:libgcrypt-native https://nvd.nist.gov/vuln/detail/CVE-2024-2236 *
CVE-2024-3220 (CVSSv4: 2.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2024-3220 *
CVE-2024-47850 (CVSSv3: 7.5): cups https://nvd.nist.gov/vuln/detail/CVE-2024-47850 *
CVE-2024-50613 (CVSSv3: 6.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2024-50613 *
CVE-2025-15367 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15367 *
CVE-2025-50422 (CVSSv3: 2.9): cairo:cairo-native https://nvd.nist.gov/vuln/detail/CVE-2025-50422 *
CVE-2025-52194 (CVSSv3: 7.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2025-52194 *
CVE-2025-59529 (CVSSv3: 5.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2025-59529 *
CVE-2025-71074 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71074 *
CVE-2025-71306 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71306 *
CVE-2025-71308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71308 *
CVE-2025-71313 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71313 *
CVE-2026-2625 (CVSSv3: 5.5): rpm-sequoia https://nvd.nist.gov/vuln/detail/CVE-2026-2625 *
CVE-2026-3099 (CVSSv3: 7.3): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3099 *
CVE-2026-3195 (CVSSv3: 7.4): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2026-3195 *
CVE-2026-3196 (CVSSv3: 5.5): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2026-3196 *
CVE-2026-3632 (CVSSv3: 5.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3632 *
CVE-2026-3633 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3633 *
CVE-2026-3634 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3634 *
CVE-2026-3842 (CVSSv3: 7.8): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2026-3842 *
CVE-2026-5201 (CVSSv3: 7.5): gdk-pixbuf:gdk-pixbuf-native https://nvd.nist.gov/vuln/detail/CVE-2026-5201 *
CVE-2026-5673 (CVSSv3: 7.1): libtheora https://nvd.nist.gov/vuln/detail/CVE-2026-5673 *
CVE-2026-5917 (CVSSv3: 8.8, CVSSv4: 8.6): libgit2 https://nvd.nist.gov/vuln/detail/CVE-2026-5917 *
CVE-2026-6844 (CVSSv3: 5.5): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6844 *
CVE-2026-6845 (CVSSv3: 5.0): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6845 *
CVE-2026-8926 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8926 *
CVE-2026-11564 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-11564 *
CVE-2026-11856 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-11856 *
CVE-2026-12345 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-12345 *
CVE-2026-12548 (CVSSv3: 4.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12548 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-15310 (CVSSv4: 2.1): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15310 *
CVE-2026-15534 (CVSSv3: 5.7): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-15534 *
CVE-2026-15806 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15806 *
CVE-2026-17025 (CVSSv3: 6.4): graphene https://nvd.nist.gov/vuln/detail/CVE-2026-17025 *
CVE-2026-17084 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-17084 *
CVE-2026-18477 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18477 *
CVE-2026-18487 (CVSSv3: 5.4): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-18487 *
CVE-2026-18508 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18508 *
CVE-2026-18839 (CVSSv3: 2.2): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18839 *
CVE-2026-18924 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-18924 *
CVE-2026-19445 (CVSSv4: 9.2): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19445 *
CVE-2026-19547 (CVSSv4: 7.0): ghostscript https://nvd.nist.gov/vuln/detail/CVE-2026-19547 *
CVE-2026-19553 (CVSSv4: 7.6): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19553 *
CVE-2026-19630 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-19630 *
CVE-2026-19672 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19672 *
CVE-2026-19774 (CVSSv3: 7.1): bluez5 https://nvd.nist.gov/vuln/detail/CVE-2026-19774 *
CVE-2026-19931 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-19931 *
CVE-2026-23328 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23328 *
CVE-2026-23374 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23374 *
CVE-2026-23377 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23377 *
CVE-2026-28529 (CVSSv3: 7.8, CVSSv4: 8.5): cryptodev-linux https://nvd.nist.gov/vuln/detail/CVE-2026-28529 *
CVE-2026-29518 (CVSSv3: 7.8, CVSSv4: 7.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-29518 *
CVE-2026-30754 (CVSSv3: 8.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30754 *
CVE-2026-31501 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31501 *
CVE-2026-31710 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31710 *
CVE-2026-31771 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31771 *
CVE-2026-31777 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31777 *
CVE-2026-38752 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38752 *
CVE-2026-38753 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38753 *
CVE-2026-38755 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38755 *
CVE-2026-39919 (CVSSv3: 9.8, CVSSv4: 9.3): ghostscript https://nvd.nist.gov/vuln/detail/CVE-2026-39919 *
CVE-2026-41035 (CVSSv3: 7.8): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-41035 *
CVE-2026-43022 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43022 *
CVE-2026-43042 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43042 *
CVE-2026-43045 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43045 *
CVE-2026-43053 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43053 *
CVE-2026-43095 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43095 *
CVE-2026-43115 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43115 *
CVE-2026-43131 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43131 *
CVE-2026-43174 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43174 *
CVE-2026-43191 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43191 *
CVE-2026-43204 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43204 *
CVE-2026-43228 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43228 *
CVE-2026-43299 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43299 *
CVE-2026-43308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43308 *
CVE-2026-43310 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43310 *
CVE-2026-43311 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43311 *
CVE-2026-43326 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43326 *
CVE-2026-43414 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43414 *
CVE-2026-43443 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43443 *
CVE-2026-43617 (CVSSv3: 4.8, CVSSv4: 6.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43617 *
CVE-2026-43618 (CVSSv3: 8.1, CVSSv4: 6.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43618 *
CVE-2026-43619 (CVSSv3: 6.3, CVSSv4: 7.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43619 *
CVE-2026-43620 (CVSSv3: 6.5, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43620 *
CVE-2026-44432 (CVSSv3: 7.5, CVSSv4: 8.9): python3-urllib3 https://nvd.nist.gov/vuln/detail/CVE-2026-44432 *
CVE-2026-44950 (CVSSv3: 9.0, CVSSv4: 9.5): libxfont https://nvd.nist.gov/vuln/detail/CVE-2026-44950 *
CVE-2026-45232 (CVSSv3: 3.7, CVSSv4: 2.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-45232 *
CVE-2026-45961 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45961 *
CVE-2026-45991 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45991 *
CVE-2026-46008 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46008 *
CVE-2026-46017 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46017 *
CVE-2026-46032 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46032 *
CVE-2026-46153 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46153 *
CVE-2026-46210 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46210 *
CVE-2026-46245 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46245 *
CVE-2026-46298 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46298 *
CVE-2026-46302 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46302 *
CVE-2026-46311 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46311 *
CVE-2026-46330 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46330 *
CVE-2026-48864 (CVSSv3: 7.8): libsolv https://nvd.nist.gov/vuln/detail/CVE-2026-48864 *
CVE-2026-49825 (CVSSv3: 8.2): python3-lxml:python3-lxml-native https://nvd.nist.gov/vuln/detail/CVE-2026-49825 *
CVE-2026-52949 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52949 *
CVE-2026-52956 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52956 *
CVE-2026-52960 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52960 *
CVE-2026-52965 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52965 *
CVE-2026-52988 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52988 *
CVE-2026-53007 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53007 *
CVE-2026-53008 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53008 *
CVE-2026-53009 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53009 *
CVE-2026-53017 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53017 *
CVE-2026-53024 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53024 *
CVE-2026-53025 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53025 *
CVE-2026-53091 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53091 *
CVE-2026-53106 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53106 *
CVE-2026-53108 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53108 *
CVE-2026-53124 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53124 *
CVE-2026-53222 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53222 *
CVE-2026-53257 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53257 *
CVE-2026-53285 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53285 *
CVE-2026-53292 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53292 *
CVE-2026-53308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53308 *
CVE-2026-53401 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53401 *
CVE-2026-53583 (CVSSv3: 6.5): libgit2 https://nvd.nist.gov/vuln/detail/CVE-2026-53583 *
CVE-2026-53584 (CVSSv3: 4.3): libgit2 https://nvd.nist.gov/vuln/detail/CVE-2026-53584 *
CVE-2026-53585 (CVSSv3: 5.3): libgit2 https://nvd.nist.gov/vuln/detail/CVE-2026-53585 *
CVE-2026-53586 (CVSSv3: 6.5): libgit2 https://nvd.nist.gov/vuln/detail/CVE-2026-53586 *
CVE-2026-53587 (CVSSv3: 7.5): libgit2 https://nvd.nist.gov/vuln/detail/CVE-2026-53587 *
CVE-2026-53613 (CVSSv3: 7.0): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://nvd.nist.gov/vuln/detail/CVE-2026-53613 *
CVE-2026-53783 (CVSSv3: 8.1, CVSSv4: 8.6): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53783 *
CVE-2026-53784 (CVSSv3: 7.1, CVSSv4: 8.4): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53784 *
CVE-2026-53785 (CVSSv3: 7.1, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53785 *
CVE-2026-53786 (CVSSv3: 6.5, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53786 *
CVE-2026-53788 (CVSSv3: 6.5, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53788 *
CVE-2026-53789 (CVSSv3: 8.1, CVSSv4: 7.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53789 *
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
CVE-2026-54369 (CVSSv3: 7.1, CVSSv4: 8.4): acl:acl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54369 *
CVE-2026-54370 (CVSSv3: 6.3, CVSSv4: 7.2): acl:acl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54370 *
CVE-2026-54371 (CVSSv3: 7.1, CVSSv4: 8.4): attr:attr-native https://nvd.nist.gov/vuln/detail/CVE-2026-54371 *
CVE-2026-55453 (CVSSv3: 3.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-55453 *
CVE-2026-55467 (CVSSv3: 2.5): cups https://nvd.nist.gov/vuln/detail/CVE-2026-55467 *
CVE-2026-55480 (CVSSv3: 5.7): cups https://nvd.nist.gov/vuln/detail/CVE-2026-55480 *
CVE-2026-56390 (CVSSv3: 6.3, CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-56392 (CVSSv3: 6.1, CVSSv4: 1.8): coreutils:coreutils-native https://nvd.nist.gov/vuln/detail/CVE-2026-56392 *
CVE-2026-58049 (CVSSv3: 8.6, CVSSv4: 8.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-58049 *
CVE-2026-61702 (CVSSv3: 5.3): cups https://nvd.nist.gov/vuln/detail/CVE-2026-61702 *
CVE-2026-63811 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63811 *
CVE-2026-63858 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63858 *
CVE-2026-63879 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63879 *
CVE-2026-63941 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63941 *
CVE-2026-63977 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63977 *
CVE-2026-63983 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63983 *
CVE-2026-64013 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64013 *
CVE-2026-64019 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64019 *
CVE-2026-64020 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64020 *
CVE-2026-64040 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64040 *
CVE-2026-64057 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64057 *
CVE-2026-64067 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64067 *
CVE-2026-64079 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64079 *
CVE-2026-64117 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64117 *
CVE-2026-64123 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64123 *
CVE-2026-64146 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64146 *
CVE-2026-64154 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64154 *
CVE-2026-64159 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64159 *
CVE-2026-64160 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64160 *
CVE-2026-64283 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64283 *
CVE-2026-64325 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64325 *
CVE-2026-64341 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64341 *
CVE-2026-64388 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64388 *
CVE-2026-64400 (CVSSv3: 8.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64400 *
CVE-2026-66040 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66040 *
CVE-2026-66337 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66337 *
CVE-2026-66338 (CVSSv3: 7.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66338 *
CVE-2026-66339 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66339 *
CVE-2026-67322 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67322 *
CVE-2026-67323 (CVSSv3: 8.4, CVSSv4: 8.6): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67323 *
CVE-2026-67324 (CVSSv3: 9.8, CVSSv4: 9.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67324 *
CVE-2026-67325 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67325 *
CVE-2026-67326 (CVSSv3: 7.8, CVSSv4: 7.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67326 *
CVE-2026-68086 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68086 *
CVE-2026-68103 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68103 *
CVE-2026-68105 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68105 *
CVE-2026-68242 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68242 *
CVE-2026-68291 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68291 *
CVE-2026-68295 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68295 *
CVE-2026-68305 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68305 *
CVE-2026-68312 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68312 *
CVE-2026-68323 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68323 *
CVE-2026-68375 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68375 *
CVE-2026-68382 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68382 *
CVE-2026-68383 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68383 *
CVE-2026-68399 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68399 *
CVE-2026-68404 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68404 *
CVE-2026-68436 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68436 *
CVE-2026-68441 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68441 *
CVE-2026-68447 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68447 *
CVE-2026-68470 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68470 *
CVE-2026-69097 (CVSSv3: 7.3, CVSSv4: 7.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-69097 *
CVE-2026-70452 (CVSSv3: 7.4, CVSSv4: 9.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70452 *
CVE-2026-70453 (CVSSv3: 7.5, CVSSv4: 8.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70453 *
CVE-2026-70454 (CVSSv3: 8.0, CVSSv4: 7.6): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70454 *
CVE-2026-70456 (CVSSv3: 8.2, CVSSv4: 8.8): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70456 *
CVE-2026-70457 (CVSSv3: 8.2, CVSSv4: 8.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70457 *
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
CVE-2026-71971 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71971 *
CVE-2026-71972 (CVSSv3: 5.9, CVSSv4: 6.0): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71972 *
CVE-2026-71973 (CVSSv3: 5.2, CVSSv4: 5.2): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71973 *
CVE-2026-71974 (CVSSv3: 4.8, CVSSv4: 4.3): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-71974 *
CVE-2026-72031 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72031 *
CVE-2026-72064 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72064 *
CVE-2026-72091 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72091 *
CVE-2026-72329 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72329 *
CVE-2026-72331 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72331 *
CVE-2026-72337 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72337 *
CVE-2026-72345 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72345 *
CVE-2026-72370 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72370 *
CVE-2026-72377 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72377 *
CVE-2026-72380 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72380 *
CVE-2026-72388 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72388 *
CVE-2026-72397 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72397 *
CVE-2026-72404 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72404 *
CVE-2026-72423 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72423 *
CVE-2026-72439 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72439 *
CVE-2026-72440 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72440 *
CVE-2026-72454 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72454 *
CVE-2026-72477 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72477 *
CVE-2026-72493 (CVSSv3: 9.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72493 *
CVE-2026-72497 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72497 *
CVE-2026-72499 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-72499 *
CVE-2026-73070 (CVSSv3: 5.5, CVSSv4: 6.8): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73070 *
CVE-2026-73433 (CVSSv3: 6.6): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73433 *
CVE-2026-73434 (CVSSv3: 6.1): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73434 *
CVE-2026-73619 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73619 *
CVE-2026-73620 (CVSSv3: 8.1, CVSSv4: 7.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73620 *
CVE-2026-73621 (CVSSv3: 5.4, CVSSv4: 5.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73621 *
CVE-2026-73622 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73622 *
CVE-2026-73623 (CVSSv3: 8.8, CVSSv4: 7.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73623 *
CVE-2026-73624 (CVSSv3: 8.1, CVSSv4: 7.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73624 *
CVE-2026-73625 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73625 *
CVE-2026-74220 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74220 *
CVE-2026-74221 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74221 *
CVE-2026-74222 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74222 *
CVE-2026-74225 (CVSSv3: 7.1, CVSSv4: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-74225 *
CVE-2026-74260 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74260 *
CVE-2026-74272 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74272 *
CVE-2026-74273 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74273 *
CVE-2026-74277 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74277 *
CVE-2026-74307 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74307 *
CVE-2026-74317 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74317 *
CVE-2026-74336 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74336 *
CVE-2026-74338 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74338 *
CVE-2026-74342 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74342 *
CVE-2026-74350 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74350 *
CVE-2026-74354 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74354 *
CVE-2026-74367 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74367 *
CVE-2026-74368 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74368 *
CVE-2026-74373 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74373 *
CVE-2026-74374 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74374 *
CVE-2026-74375 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74375 *
CVE-2026-74419 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74419 *
CVE-2026-74449 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74449 *
CVE-2026-74466 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74466 *
CVE-2026-74527 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74527 *
CVE-2026-74529 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74529 *
CVE-2026-74530 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74530 *
CVE-2026-74542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74542 *
CVE-2026-74544 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74544 *
CVE-2026-74558 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74558 *
CVE-2026-74561 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74561 *
CVE-2026-74562 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74562 *
CVE-2026-74568 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74568 *
CVE-2026-74571 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74571 *
CVE-2026-74605 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74605 *
CVE-2026-74713 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74713 *
CVE-2026-74715 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74715 *
CVE-2026-74716 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74716 *
CVE-2026-74721 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74721 *
CVE-2026-74723 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74723 *
CVE-2026-74729 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74729 *
CVE-2026-74733 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74733 *
CVE-2026-74745 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74745 *
CVE-2026-74747 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74747 *
CVE-2026-74750 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74750 *
CVE-2026-74752 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74752 *
CVE-2026-74754 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-74754 *
CVE-2026-75141 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75141 *
CVE-2026-75142 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75142 *
CVE-2026-75143 (CVSSv3: 9.8, CVSSv4: 9.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75143 *
CVE-2026-75144 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75144 *
CVE-2026-75145 (CVSSv3: 5.8, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75145 *
CVE-2026-75146 (CVSSv3: 8.1, CVSSv4: 7.2): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75146 *
CVE-2026-75147 (CVSSv3: 7.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75147 *
CVE-2026-75818 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75818 *
CVE-2026-75819 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75819 *
CVE-2026-75820 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75820 *
CVE-2026-76217 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76217 *
CVE-2026-76218 (CVSSv3: 8.8, CVSSv4: 7.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76218 *
CVE-2026-76219 (CVSSv3: 8.1, CVSSv4: 7.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76219 *
CVE-2026-76220 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76220 *
CVE-2026-76221 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76221 *
CVE-2026-76222 (CVSSv3: 8.2, CVSSv4: 8.4): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76222 *
CVE-2026-76844 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-76844 *
CVE-2026-78376 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-78376 *
CVE-2026-78675 (CVSSv3: 8.4, CVSSv4: 8.6): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78675 *
CVE-2026-78676 (CVSSv3: 9.8, CVSSv4: 9.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78676 *
CVE-2026-78677 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78677 *
CVE-2026-78678 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78678 *
CVE-2026-78679 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78679 *
CVE-2026-80231 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-80231 *
CVE-2026-80255 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-80255 *
CVE-2026-80524 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80524 *
CVE-2026-80579 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80579 *
CVE-2026-80580 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80580 *
CVE-2026-80631 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80631 *
CVE-2026-80634 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80634 *
CVE-2026-80655 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80655 *
CVE-2026-80657 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80657 *
CVE-2026-80668 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80668 *
CVE-2026-80692 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80692 *
CVE-2026-80693 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80693 *
CVE-2026-80698 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80698 *
CVE-2026-80705 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80705 *
CVE-2026-80729 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80729 *
CVE-2026-80734 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80734 *
CVE-2026-80738 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80738 *
CVE-2026-80747 (CVSSv3: 8.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80747 *
CVE-2026-80785 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80785 *
CVE-2026-80786 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80786 *
CVE-2026-80866 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80866 *
CVE-2026-80884 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80884 *
CVE-2026-80899 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80899 *
CVE-2026-82208 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-82208 *
CVE-2026-82474 (CVSSv3: 7.8, CVSSv4: 8.5): sudo https://nvd.nist.gov/vuln/detail/CVE-2026-82474 *
CVE-2026-82560 (CVSSv3: 7.5): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-82560 *
CVE-2026-83596 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-83596 *
CVE-2026-84243 (CVSSv3: 7.0): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-84243 *
CVE-2026-85091 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-85091 *
CVE-2026-86409 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-86409 *
CVE-2026-86410 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-86410 *
CVE-2026-86412 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-86412 *
CVE-2026-86414 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-86414 *
CVE-2026-87817 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-87817 *
CVE-2026-87818 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-87818 *
CVE-2026-87819 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-87819 *
CVE-2026-87862 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-87862 *
CVE-2026-87863 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-87863 *
CVE-2026-87864 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-87864 *
CVE-2026-87865 (CVSSv3: 7.4): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-87865 *
CVE-2026-87866 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-87866 *
CVE-2026-87910 (CVSSv4: 5.7): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-87910 *
CVE-2026-88806 (CVSSv3: 7.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-88806 *
CVE-2026-88807 (CVSSv4: 8.9): libxrender:libxrender-native https://nvd.nist.gov/vuln/detail/CVE-2026-88807 *
CVE-2026-88812 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-88812 *
CVE-2026-89513 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89513 *
CVE-2026-89527 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89527 *
CVE-2026-89534 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89534 *
CVE-2026-89537 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89537 *
CVE-2026-89568 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89568 *
CVE-2026-89584 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89584 *
CVE-2026-89601 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89601 *
CVE-2026-89610 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89610 *
CVE-2026-89611 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89611 *
CVE-2026-89632 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89632 *
CVE-2026-89642 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89642 *
CVE-2026-89654 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89654 *
CVE-2026-89705 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89705 *
CVE-2026-89709 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89709 *
CVE-2026-89718 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89718 *
CVE-2026-89755 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89755 *
CVE-2026-89764 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89764 *
CVE-2026-89772 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89772 *
CVE-2026-89805 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89805 *
CVE-2026-89812 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89812 *
CVE-2026-89813 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89813 *
CVE-2026-89862 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89862 *
CVE-2026-89866 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89866 *
CVE-2026-89907 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-89907 *
CVE-2026-90040 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90040 *
CVE-2026-90061 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90061 *
CVE-2026-90079 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90079 *
CVE-2026-90082 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90082 *
CVE-2026-90087 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90087 *
CVE-2026-90093 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90093 *
CVE-2026-90095 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90095 *
CVE-2026-90098 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90098 *
CVE-2026-90099 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90099 *
CVE-2026-90104 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90104 *
CVE-2026-90105 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90105 *
CVE-2026-90106 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90106 *
CVE-2026-90111 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90111 *
CVE-2026-90121 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90121 *
CVE-2026-90142 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90142 *
CVE-2026-90144 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90144 *
CVE-2026-90154 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90154 *
CVE-2026-90155 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90155 *
CVE-2026-90156 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90156 *
CVE-2026-90162 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90162 *
CVE-2026-90167 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90167 *
CVE-2026-90174 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90174 *
CVE-2026-90177 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90177 *
CVE-2026-90182 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90182 *
CVE-2026-90183 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90183 *
CVE-2026-90206 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90206 *
CVE-2026-90208 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90208 *
CVE-2026-90211 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90211 *
CVE-2026-90217 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90217 *
CVE-2026-90234 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90234 *
CVE-2026-90237 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90237 *
CVE-2026-90242 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90242 *
CVE-2026-90261 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90261 *
CVE-2026-90263 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90263 *
CVE-2026-90267 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90267 *
CVE-2026-90273 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90273 *
CVE-2026-90289 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90289 *
CVE-2026-90300 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90300 *
CVE-2026-90301 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90301 *
CVE-2026-90311 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90311 *
CVE-2026-90315 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90315 *
CVE-2026-90317 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90317 *
CVE-2026-90320 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90320 *
CVE-2026-90321 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90321 *
CVE-2026-90323 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90323 *
CVE-2026-90330 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90330 *
CVE-2026-90335 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90335 *
CVE-2026-90336 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90336 *
CVE-2026-90337 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90337 *
CVE-2026-90345 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90345 *
CVE-2026-90346 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90346 *
CVE-2026-90347 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90347 *
CVE-2026-90355 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90355 *
CVE-2026-90359 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90359 *
CVE-2026-90365 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90365 *
CVE-2026-90380 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90380 *
CVE-2026-90381 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90381 *
CVE-2026-90401 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90401 *
CVE-2026-90408 (CVSSv3: 7.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90408 *
CVE-2026-90409 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90409 *
CVE-2026-90412 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90412 *
CVE-2026-90417 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90417 *
CVE-2026-90421 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90421 *
CVE-2026-90427 (CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-90427 *
CVE-2026-92205 (CVSSv3: 6.1): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-92205 *
CVE-2026-92386 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92386 *
CVE-2026-92387 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92387 *
CVE-2026-92388 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92388 *
CVE-2026-92389 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92389 *
CVE-2026-92390 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92390 *
CVE-2026-92391 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92391 *
CVE-2026-92392 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-92392 *
CVE-2026-92480 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-92480 *
CVE-2026-92482 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-92482 *
CVE-2026-92485 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-92485 *
CVE-2026-92503 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-92503 *
CVE-2026-93044 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93044 *
CVE-2026-93047 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93047 *
CVE-2026-93081 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93081 *
CVE-2026-93096 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93096 *
CVE-2026-93099 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93099 *
CVE-2026-93104 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93104 *
CVE-2026-93105 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93105 *
CVE-2026-93116 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93116 *
CVE-2026-93122 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93122 *
CVE-2026-93125 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93125 *
CVE-2026-93129 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93129 *
CVE-2026-93135 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93135 *
CVE-2026-93144 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93144 *
CVE-2026-93148 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93148 *
CVE-2026-93164 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93164 *
CVE-2026-93168 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93168 *
CVE-2026-93175 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93175 *
CVE-2026-93176 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93176 *
CVE-2026-93179 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93179 *
CVE-2026-93181 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93181 *
CVE-2026-93201 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93201 *
CVE-2026-93216 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93216 *
CVE-2026-93221 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93221 *
CVE-2026-93248 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93248 *
CVE-2026-93251 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93251 *
CVE-2026-93260 (CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93260 *
CVE-2026-93270 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93270 *
CVE-2026-93272 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93272 *
CVE-2026-93282 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-93282 *
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
CVE-2026-93541 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93541 *
CVE-2026-93542 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93542 *
CVE-2026-93543 (CVSSv3: 7.4): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93543 *
CVE-2026-93544 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93544 *
CVE-2026-93545 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-93545 *
CVE-2026-94266 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-94266 *
CVE-2026-94281 (CVSSv3: 6.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-94281 *
CVE-2026-94282 (CVSSv3: 5.6): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-94282 *
CVE-2026-94283 (CVSSv3: 6.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94283 *
CVE-2026-94284 (CVSSv3: 5.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94284 *
CVE-2026-94285 (CVSSv3: 5.1): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94285 *
CVE-2026-94286 (CVSSv3: 7.1): libxtst:libxtst-native https://nvd.nist.gov/vuln/detail/CVE-2026-94286 *
CVE-2026-94300 (CVSSv3: 8.1): bind https://nvd.nist.gov/vuln/detail/CVE-2026-94300 *
CVE-2026-96611 (CVSSv3: 7.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-96611 *
CVE-2026-96674 (CVSSv3: 4.4, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-96674 *
CVE-2026-96675 (CVSSv3: 3.3, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-96675 *
CVE-2026-96888 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-96888 *
CVE-2026-97229 (CVSSv3: 10.0): ruby:ruby-native https://nvd.nist.gov/vuln/detail/CVE-2026-97229 *
CVE-2026-97313 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-97313 *
CVE-2026-97526 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97526 *
CVE-2026-97538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97538 *
CVE-2026-97554 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97554 *
CVE-2026-97561 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97561 *
CVE-2026-97563 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97563 *
CVE-2026-97631 (CVSSv4: 9.5): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2026-97631 *
CVE-2026-97687 (CVSSv3: 8.1, CVSSv4: 7.6): python3-urllib3 https://nvd.nist.gov/vuln/detail/CVE-2026-97687 *
CVE-2026-97688 (CVSSv3: 5.3, CVSSv4: 6.9): python3-urllib3 https://nvd.nist.gov/vuln/detail/CVE-2026-97688 *
CVE-2026-97876 (CVSSv3: 6.4): grub:grub-efi:grub-native https://nvd.nist.gov/vuln/detail/CVE-2026-97876 *
CVE-2026-97928 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97928 *
CVE-2026-97933 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97933 *
CVE-2026-97988 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97988 *
CVE-2026-97989 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97989 *
CVE-2026-97997 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-97997 *
CVE-2026-98004 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98004 *
CVE-2026-98019 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98019 *
CVE-2026-98032 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98032 *
CVE-2026-98033 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98033 *
CVE-2026-98034 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98034 *
CVE-2026-98038 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98038 *
CVE-2026-98043 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98043 *
CVE-2026-98048 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98048 *
CVE-2026-98049 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98049 *
CVE-2026-98057 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98057 *
CVE-2026-98058 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98058 *
CVE-2026-98084 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98084 *
CVE-2026-98085 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98085 *
CVE-2026-98099 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98099 *
CVE-2026-98106 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98106 *
CVE-2026-98115 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98115 *
CVE-2026-98118 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98118 *
CVE-2026-98124 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98124 *
CVE-2026-98125 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98125 *
CVE-2026-98131 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98131 *
CVE-2026-98134 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98134 *
CVE-2026-98147 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98147 *
CVE-2026-98153 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98153 *
CVE-2026-98162 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98162 *
CVE-2026-98176 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98176 *
CVE-2026-98177 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98177 *
CVE-2026-98228 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98228 *
CVE-2026-98284 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98284 *
CVE-2026-98285 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98285 *
CVE-2026-98288 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98288 *
CVE-2026-98292 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98292 *
CVE-2026-98332 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98332 *
CVE-2026-98333 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98333 *
CVE-2026-98338 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98338 *
CVE-2026-98353 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98353 *
CVE-2026-98355 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98355 *
CVE-2026-98364 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98364 *
CVE-2026-98373 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98373 *
CVE-2026-98374 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98374 *
CVE-2026-98375 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98375 *
CVE-2026-98376 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98376 *
CVE-2026-98377 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98377 *
CVE-2026-98378 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98378 *
CVE-2026-98379 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98379 *
CVE-2026-98380 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98380 *
CVE-2026-98381 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98381 *
CVE-2026-98382 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98382 *
CVE-2026-98383 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98383 *
CVE-2026-98384 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98384 *
CVE-2026-98427 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98427 *
CVE-2026-98432 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98432 *
CVE-2026-98436 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98436 *
CVE-2026-98439 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98439 *
CVE-2026-98440 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98440 *
CVE-2026-98441 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98441 *
CVE-2026-98442 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98442 *
CVE-2026-98443 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98443 *
CVE-2026-98445 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98445 *
CVE-2026-98446 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98446 *
CVE-2026-98447 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98447 *
CVE-2026-98448 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98448 *
CVE-2026-98449 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98449 *
CVE-2026-98450 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98450 *
CVE-2026-98451 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98451 *
CVE-2026-98452 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98452 *
CVE-2026-98453 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98453 *
CVE-2026-98454 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98454 *
CVE-2026-98455 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98455 *
CVE-2026-98456 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98456 *
CVE-2026-98457 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98457 *
CVE-2026-98458 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98458 *
CVE-2026-98459 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98459 *
CVE-2026-98460 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98460 *
CVE-2026-98461 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98461 *
CVE-2026-98462 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98462 *
CVE-2026-98463 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98463 *
CVE-2026-98464 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98464 *
CVE-2026-98465 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98465 *
CVE-2026-98466 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98466 *
CVE-2026-98467 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98467 *
CVE-2026-98468 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98468 *
CVE-2026-98469 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98469 *
CVE-2026-98471 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98471 *
CVE-2026-98472 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98472 *
CVE-2026-98473 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98473 *
CVE-2026-98474 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98474 *
CVE-2026-98475 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98475 *
CVE-2026-98476 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98476 *
CVE-2026-98477 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98477 *
CVE-2026-98479 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98479 *
CVE-2026-98480 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98480 *
CVE-2026-98481 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98481 *
CVE-2026-98482 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98482 *
CVE-2026-98483 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98483 *
CVE-2026-98484 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98484 *
CVE-2026-98485 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98485 *
CVE-2026-98486 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98486 *
CVE-2026-98487 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98487 *
CVE-2026-98488 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98488 *
CVE-2026-98489 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98489 *
CVE-2026-98490 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98490 *
CVE-2026-98491 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98491 *
CVE-2026-98492 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98492 *
CVE-2026-98493 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98493 *
CVE-2026-98494 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98494 *
CVE-2026-98495 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98495 *
CVE-2026-98496 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98496 *
CVE-2026-98497 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98497 *
CVE-2026-98498 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98498 *
CVE-2026-98499 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98499 *
CVE-2026-98501 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98501 *
CVE-2026-98502 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98502 *
CVE-2026-98503 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98503 *
CVE-2026-98504 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98504 *
CVE-2026-98505 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98505 *
CVE-2026-98506 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98506 *
CVE-2026-98507 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98507 *
CVE-2026-98508 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98508 *
CVE-2026-98509 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98509 *
CVE-2026-98510 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98510 *
CVE-2026-98511 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98511 *
CVE-2026-98512 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98512 *
CVE-2026-98513 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98513 *
CVE-2026-98514 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98514 *
CVE-2026-98515 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98515 *
CVE-2026-98516 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98516 *
CVE-2026-98517 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98517 *
CVE-2026-98519 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98519 *
CVE-2026-98521 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98521 *
CVE-2026-98522 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98522 *
CVE-2026-98523 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98523 *
CVE-2026-98524 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98524 *
CVE-2026-98525 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98525 *
CVE-2026-98526 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98526 *
CVE-2026-98527 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98527 *
CVE-2026-98528 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98528 *
CVE-2026-98529 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98529 *
CVE-2026-98531 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98531 *
CVE-2026-98532 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98532 *
CVE-2026-98533 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98533 *
CVE-2026-98534 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98534 *
CVE-2026-98535 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98535 *
CVE-2026-98536 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98536 *
CVE-2026-98537 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98537 *
CVE-2026-98538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98538 *
CVE-2026-98539 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98539 *
CVE-2026-98541 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98541 *
CVE-2026-98542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98542 *
CVE-2026-98543 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98543 *
CVE-2026-98544 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98544 *
CVE-2026-98545 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98545 *
CVE-2026-98546 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98546 *
CVE-2026-98547 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98547 *
CVE-2026-98548 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98548 *
CVE-2026-98549 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98549 *
CVE-2026-98550 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98550 *
CVE-2026-98551 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98551 *
CVE-2026-98552 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98552 *
CVE-2026-98553 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98553 *
CVE-2026-98554 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98554 *
CVE-2026-98555 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98555 *
CVE-2026-98556 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98556 *
CVE-2026-98558 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98558 *
CVE-2026-98559 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98559 *
CVE-2026-98561 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98561 *
CVE-2026-98562 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98562 *
CVE-2026-98563 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98563 *
CVE-2026-98564 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98564 *
CVE-2026-98565 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98565 *
CVE-2026-98566 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98566 *
CVE-2026-98567 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98567 *
CVE-2026-98568 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98568 *
CVE-2026-98569 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98569 *
CVE-2026-98571 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98571 *
CVE-2026-98572 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98572 *
CVE-2026-98573 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98573 *
CVE-2026-98574 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98574 *
CVE-2026-98575 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98575 *
CVE-2026-98576 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98576 *
CVE-2026-98577 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98577 *
CVE-2026-98578 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98578 *
CVE-2026-98579 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98579 *
CVE-2026-98580 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98580 *
CVE-2026-98581 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98581 *
CVE-2026-98582 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98582 *
CVE-2026-98583 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98583 *
CVE-2026-98584 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98584 *
CVE-2026-98585 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98585 *
CVE-2026-98586 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98586 *
CVE-2026-98588 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98588 *
CVE-2026-98589 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98589 *
CVE-2026-98590 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98590 *
CVE-2026-98591 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98591 *
CVE-2026-98592 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98592 *
CVE-2026-98593 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98593 *
CVE-2026-98594 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98594 *
CVE-2026-98595 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98595 *
CVE-2026-98596 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98596 *
CVE-2026-98597 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98597 *
CVE-2026-98598 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98598 *
CVE-2026-98599 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98599 *
CVE-2026-98600 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98600 *
CVE-2026-98601 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98601 *
CVE-2026-98602 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98602 *
CVE-2026-98603 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98603 *
CVE-2026-98604 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98604 *
CVE-2026-98605 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98605 *
CVE-2026-98606 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98606 *
CVE-2026-98607 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98607 *
CVE-2026-98608 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98608 *
CVE-2026-98609 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98609 *
CVE-2026-98610 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98610 *
CVE-2026-98611 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98611 *
CVE-2026-98612 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98612 *
CVE-2026-98613 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98613 *
CVE-2026-98614 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98614 *
CVE-2026-98615 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98615 *
CVE-2026-98616 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98616 *
CVE-2026-98617 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98617 *
CVE-2026-98618 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98618 *
CVE-2026-98620 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98620 *
CVE-2026-98621 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98621 *
CVE-2026-98622 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98622 *
CVE-2026-98623 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98623 *
CVE-2026-98624 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98624 *
CVE-2026-98625 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98625 *
CVE-2026-98626 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98626 *
CVE-2026-98628 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98628 *
CVE-2026-98629 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98629 *
CVE-2026-98630 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98630 *
CVE-2026-98631 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98631 *
CVE-2026-98632 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98632 *
CVE-2026-98633 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98633 *
CVE-2026-98634 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98634 *
CVE-2026-98636 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98636 *
CVE-2026-98637 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98637 *
CVE-2026-98638 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98638 *
CVE-2026-98639 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98639 *
CVE-2026-98640 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98640 *
CVE-2026-98641 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98641 *
CVE-2026-98642 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98642 *
CVE-2026-98643 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98643 *
CVE-2026-98644 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98644 *
CVE-2026-98646 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98646 *
CVE-2026-98647 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98647 *
CVE-2026-98648 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98648 *
CVE-2026-98652 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98652 *
CVE-2026-98655 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98655 *
CVE-2026-98656 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98656 *
CVE-2026-98657 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98657 *
CVE-2026-98658 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98658 *
CVE-2026-98659 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98659 *
CVE-2026-98660 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98660 *
CVE-2026-98661 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98661 *
CVE-2026-98662 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98662 *
CVE-2026-98663 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98663 *
CVE-2026-98664 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98664 *
CVE-2026-98665 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98665 *
CVE-2026-98666 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98666 *
CVE-2026-98668 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98668 *
CVE-2026-98669 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98669 *
CVE-2026-98670 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98670 *
CVE-2026-98671 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98671 *
CVE-2026-98672 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98672 *
CVE-2026-98673 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98673 *
CVE-2026-98674 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98674 *
CVE-2026-98675 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98675 *
CVE-2026-98676 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98676 *
CVE-2026-98677 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98677 *
CVE-2026-98678 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98678 *
CVE-2026-98679 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98679 *
CVE-2026-98680 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98680 *
CVE-2026-98681 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98681 *
CVE-2026-98682 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98682 *
CVE-2026-98683 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98683 *
CVE-2026-98684 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98684 *
CVE-2026-98685 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98685 *
CVE-2026-98686 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98686 *
CVE-2026-98687 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98687 *
CVE-2026-98689 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98689 *
CVE-2026-98690 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98690 *
CVE-2026-98691 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98691 *
CVE-2026-98692 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98692 *
CVE-2026-98693 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98693 *
CVE-2026-98694 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98694 *
CVE-2026-98695 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98695 *
CVE-2026-98696 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98696 *
CVE-2026-98697 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98697 *
CVE-2026-98698 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98698 *
CVE-2026-98699 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98699 *
CVE-2026-98700 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98700 *
CVE-2026-98701 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98701 *
CVE-2026-98702 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98702 *
CVE-2026-98703 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98703 *
CVE-2026-98704 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98704 *
CVE-2026-98705 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98705 *
CVE-2026-98706 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98706 *
CVE-2026-98707 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98707 *
CVE-2026-98708 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98708 *
CVE-2026-98709 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98709 *
CVE-2026-98710 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98710 *
CVE-2026-98711 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98711 *
CVE-2026-98713 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98713 *
CVE-2026-98714 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98714 *
CVE-2026-98715 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98715 *
CVE-2026-98716 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98716 *
CVE-2026-98717 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98717 *
CVE-2026-98720 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98720 *
CVE-2026-98721 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98721 *
CVE-2026-98722 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98722 *
CVE-2026-98723 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98723 *
CVE-2026-98724 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98724 *
CVE-2026-98725 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98725 *
CVE-2026-98726 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98726 *
CVE-2026-98727 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98727 *
CVE-2026-98728 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98728 *
CVE-2026-98729 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98729 *
CVE-2026-98730 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98730 *
CVE-2026-98731 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98731 *
CVE-2026-98732 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98732 *
CVE-2026-98733 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98733 *
CVE-2026-98734 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98734 *
CVE-2026-98735 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98735 *
CVE-2026-98736 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98736 *
CVE-2026-98737 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98737 *
CVE-2026-98738 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98738 *
CVE-2026-98739 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98739 *
CVE-2026-98740 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98740 *
CVE-2026-98741 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98741 *
CVE-2026-98742 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98742 *
CVE-2026-98743 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98743 *
CVE-2026-98744 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98744 *
CVE-2026-98745 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98745 *
CVE-2026-98746 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98746 *
CVE-2026-98747 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98747 *
CVE-2026-98748 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98748 *
CVE-2026-98749 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98749 *
CVE-2026-98750 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98750 *
CVE-2026-98751 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98751 *
CVE-2026-98752 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98752 *
CVE-2026-98753 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98753 *
CVE-2026-98754 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98754 *
CVE-2026-98755 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98755 *
CVE-2026-98756 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98756 *
CVE-2026-98757 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98757 *
CVE-2026-98758 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98758 *
CVE-2026-98759 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98759 *
CVE-2026-98760 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98760 *
CVE-2026-98761 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98761 *
CVE-2026-98762 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98762 *
CVE-2026-98763 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98763 *
CVE-2026-98764 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98764 *
CVE-2026-98765 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98765 *
CVE-2026-98766 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98766 *
CVE-2026-98767 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98767 *
CVE-2026-98768 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98768 *
CVE-2026-98769 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98769 *
CVE-2026-98770 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98770 *
CVE-2026-98771 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98771 *
CVE-2026-98772 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98772 *
CVE-2026-98773 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98773 *
CVE-2026-98774 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98774 *
CVE-2026-98775 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98775 *
CVE-2026-98777 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98777 *
CVE-2026-98778 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98778 *
CVE-2026-98779 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98779 *
CVE-2026-98780 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98780 *
CVE-2026-98781 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98781 *
CVE-2026-98782 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98782 *
CVE-2026-98783 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98783 *
CVE-2026-98784 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98784 *
CVE-2026-98785 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98785 *
CVE-2026-98786 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98786 *
CVE-2026-98788 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98788 *
CVE-2026-98789 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98789 *
CVE-2026-98790 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98790 *
CVE-2026-98791 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98791 *
CVE-2026-98792 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98792 *
CVE-2026-98793 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98793 *
CVE-2026-98794 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98794 *
CVE-2026-98795 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98795 *
CVE-2026-98796 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98796 *
CVE-2026-98797 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98797 *
CVE-2026-98798 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98798 *
CVE-2026-98801 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98801 *
CVE-2026-98802 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98802 *
CVE-2026-98803 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98803 *
CVE-2026-98804 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98804 *
CVE-2026-98805 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98805 *
CVE-2026-98807 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98807 *
CVE-2026-98808 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98808 *
CVE-2026-98809 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98809 *
CVE-2026-98810 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98810 *
CVE-2026-98811 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98811 *
CVE-2026-98812 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98812 *
CVE-2026-98814 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98814 *
CVE-2026-98815 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98815 *
CVE-2026-98816 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98816 *
CVE-2026-98818 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98818 *
CVE-2026-98819 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98819 *
CVE-2026-98820 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98820 *
CVE-2026-98821 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98821 *
CVE-2026-98822 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98822 *
CVE-2026-98823 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98823 *
CVE-2026-98824 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98824 *
CVE-2026-98825 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98825 *
CVE-2026-98826 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98826 *
CVE-2026-98827 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98827 *
CVE-2026-98828 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98828 *
CVE-2026-98829 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98829 *
CVE-2026-98830 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98830 *
CVE-2026-98831 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98831 *
CVE-2026-98833 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98833 *
CVE-2026-98835 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98835 *
CVE-2026-98836 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98836 *
CVE-2026-98837 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98837 *
CVE-2026-98838 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98838 *
CVE-2026-98839 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98839 *
CVE-2026-98840 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98840 *
CVE-2026-98841 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98841 *
CVE-2026-98842 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98842 *
CVE-2026-98843 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98843 *
CVE-2026-98844 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98844 *
CVE-2026-98845 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98845 *
CVE-2026-98846 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98846 *
CVE-2026-98847 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98847 *
CVE-2026-98848 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98848 *
CVE-2026-98849 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98849 *
CVE-2026-98850 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98850 *
CVE-2026-98851 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98851 *
CVE-2026-98852 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98852 *
CVE-2026-98853 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98853 *
CVE-2026-98854 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98854 *
CVE-2026-98855 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98855 *
CVE-2026-98856 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98856 *
CVE-2026-98857 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98857 *
CVE-2026-98858 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98858 *
CVE-2026-98859 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98859 *
CVE-2026-98860 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98860 *
CVE-2026-98861 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98861 *
CVE-2026-98862 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98862 *
CVE-2026-98863 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98863 *
CVE-2026-98869 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98869 *
CVE-2026-98917 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98917 *
CVE-2026-98919 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98919 *
CVE-2026-98923 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98923 *
CVE-2026-98924 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98924 *
CVE-2026-98925 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98925 *
CVE-2026-98926 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98926 *
CVE-2026-98927 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98927 *
CVE-2026-98928 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98928 *
CVE-2026-98929 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98929 *
CVE-2026-98930 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98930 *
CVE-2026-98931 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98931 *
CVE-2026-98932 (CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98932 *
CVE-2026-98933 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98933 *
CVE-2026-98934 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98934 *
CVE-2026-98935 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98935 *
CVE-2026-98936 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98936 *
CVE-2026-98937 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98937 *
CVE-2026-98938 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98938 *
CVE-2026-98939 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98939 *
CVE-2026-98940 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98940 *
CVE-2026-98944 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98944 *
CVE-2026-98945 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98945 *
CVE-2026-98946 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98946 *
CVE-2026-98947 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98947 *
CVE-2026-98948 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98948 *
CVE-2026-98949 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98949 *
CVE-2026-98950 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98950 *
CVE-2026-98952 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98952 *
CVE-2026-98953 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98953 *
CVE-2026-98955 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98955 *
CVE-2026-98956 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98956 *
CVE-2026-98957 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98957 *
CVE-2026-98958 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98958 *
CVE-2026-98959 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98959 *
CVE-2026-98960 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98960 *
CVE-2026-98961 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98961 *
CVE-2026-98962 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98962 *
CVE-2026-98963 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98963 *
CVE-2026-98964 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98964 *
CVE-2026-98965 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98965 *
CVE-2026-98966 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98966 *
CVE-2026-98967 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98967 *
CVE-2026-98968 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98968 *
CVE-2026-98969 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98969 *
CVE-2026-98970 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98970 *
CVE-2026-98971 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98971 *
CVE-2026-98972 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98972 *
CVE-2026-98974 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98974 *
CVE-2026-98975 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98975 *
CVE-2026-98977 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98977 *
CVE-2026-98978 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98978 *
CVE-2026-98979 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98979 *
CVE-2026-98980 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98980 *
CVE-2026-98981 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98981 *
CVE-2026-98982 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98982 *
CVE-2026-98983 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98983 *
CVE-2026-98984 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98984 *
CVE-2026-98985 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98985 *
CVE-2026-98986 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98986 *
CVE-2026-98987 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98987 *
CVE-2026-98989 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98989 *
CVE-2026-98990 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98990 *
CVE-2026-98991 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98991 *
CVE-2026-98992 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98992 *
CVE-2026-98993 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98993 *
CVE-2026-98995 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98995 *
CVE-2026-98996 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98996 *
CVE-2026-98997 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98997 *
CVE-2026-98999 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98999 *
CVE-2026-99000 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99000 *
CVE-2026-99001 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99001 *
CVE-2026-99002 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99002 *
CVE-2026-99003 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99003 *
CVE-2026-99004 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99004 *
CVE-2026-99005 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99005 *
CVE-2026-99006 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99006 *
CVE-2026-99007 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99007 *
CVE-2026-99008 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99008 *
CVE-2026-99009 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99009 *
CVE-2026-99010 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99010 *
CVE-2026-99011 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99011 *
CVE-2026-99012 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99012 *
CVE-2026-99013 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99013 *
CVE-2026-99014 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99014 *
CVE-2026-99015 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99015 *
CVE-2026-99016 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99016 *
CVE-2026-99017 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99017 *
CVE-2026-99018 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99018 *
CVE-2026-99019 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99019 *
CVE-2026-99020 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99020 *
CVE-2026-99021 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99021 *
CVE-2026-99022 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99022 *
CVE-2026-99024 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99024 *
CVE-2026-99025 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99025 *
CVE-2026-99026 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99026 *
CVE-2026-99027 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99027 *
CVE-2026-99028 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99028 *
CVE-2026-99029 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99029 *
CVE-2026-99030 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99030 *
CVE-2026-99031 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99031 *
CVE-2026-99032 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99032 *
CVE-2026-99033 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99033 *
CVE-2026-99034 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99034 *
CVE-2026-99035 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99035 *
CVE-2026-99036 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99036 *
CVE-2026-99037 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99037 *
CVE-2026-99038 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99038 *
CVE-2026-99039 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99039 *
CVE-2026-99040 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99040 *
CVE-2026-99041 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99041 *
CVE-2026-99043 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99043 *
CVE-2026-99044 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99044 *
CVE-2026-99045 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99045 *
CVE-2026-99046 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99046 *
CVE-2026-99047 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99047 *
CVE-2026-99048 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99048 *
CVE-2026-99049 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99049 *
CVE-2026-99050 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99050 *
CVE-2026-99052 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99052 *
CVE-2026-99053 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99053 *
CVE-2026-99054 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99054 *
CVE-2026-99055 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99055 *
CVE-2026-99056 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99056 *
CVE-2026-99057 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99057 *
CVE-2026-99058 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99058 *
CVE-2026-99059 (CVSSv3: 7.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99059 *
CVE-2026-99060 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99060 *
CVE-2026-99061 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99061 *
CVE-2026-99062 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99062 *
CVE-2026-99063 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99063 *
CVE-2026-99064 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99064 *
CVE-2026-99065 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99065 *
CVE-2026-99067 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99067 *
CVE-2026-99068 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99068 *
CVE-2026-99069 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99069 *
CVE-2026-99070 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99070 *
CVE-2026-99071 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99071 *
CVE-2026-99072 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99072 *
CVE-2026-99073 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99073 *
CVE-2026-99074 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99074 *
CVE-2026-99075 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99075 *
CVE-2026-99076 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99076 *
CVE-2026-99077 (CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99077 *
CVE-2026-99078 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99078 *
CVE-2026-99079 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99079 *
CVE-2026-99080 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99080 *
CVE-2026-99081 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99081 *
CVE-2026-99082 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99082 *
CVE-2026-99083 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99083 *
CVE-2026-99085 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99085 *
CVE-2026-99086 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99086 *
CVE-2026-99087 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99087 *
CVE-2026-99088 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99088 *
CVE-2026-99089 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99089 *
CVE-2026-99090 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99090 *
CVE-2026-99091 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99091 *
CVE-2026-99092 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99092 *
CVE-2026-99093 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99093 *
CVE-2026-99094 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99094 *
CVE-2026-99095 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99095 *
CVE-2026-99097 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99097 *
CVE-2026-99098 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99098 *
CVE-2026-99099 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99099 *
CVE-2026-99100 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99100 *
CVE-2026-99103 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99103 *
CVE-2026-99105 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99105 *
CVE-2026-99106 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99106 *
CVE-2026-99109 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99109 *
CVE-2026-99110 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99110 *
CVE-2026-99111 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99111 *
CVE-2026-99112 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99112 *
CVE-2026-99113 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99113 *
CVE-2026-99114 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99114 *
CVE-2026-99115 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99115 *
CVE-2026-99116 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99116 *
CVE-2026-99117 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99117 *
CVE-2026-99118 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99118 *
CVE-2026-99120 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99120 *
CVE-2026-99121 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99121 *
CVE-2026-99122 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99122 *
CVE-2026-99123 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99123 *
CVE-2026-99124 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99124 *
CVE-2026-99125 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99125 *
CVE-2026-99126 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99126 *
CVE-2026-99127 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99127 *
CVE-2026-99128 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99128 *
CVE-2026-99130 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99130 *
CVE-2026-99131 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99131 *
CVE-2026-99132 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99132 *
CVE-2026-99133 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99133 *
CVE-2026-99134 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99134 *
CVE-2026-99135 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99135 *
CVE-2026-99136 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99136 *
CVE-2026-99137 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99137 *
CVE-2026-99138 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99138 *
CVE-2026-99139 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99139 *
CVE-2026-99140 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99140 *
CVE-2026-99142 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99142 *
CVE-2026-99143 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99143 *
CVE-2026-99146 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99146 *
CVE-2026-99147 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99147 *
CVE-2026-99148 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99148 *
CVE-2026-99150 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99150 *
CVE-2026-99152 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99152 *
CVE-2026-99153 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99153 *
CVE-2026-99154 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99154 *
CVE-2026-99155 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99155 *
CVE-2026-99156 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99156 *
CVE-2026-99157 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99157 *
CVE-2026-99158 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99158 *
CVE-2026-99159 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99159 *
CVE-2026-99160 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99160 *
CVE-2026-99161 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99161 *
CVE-2026-99163 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99163 *
CVE-2026-99165 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99165 *
CVE-2026-99166 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99166 *
CVE-2026-99167 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99167 *
CVE-2026-99169 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99169 *
CVE-2026-99171 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99171 *
CVE-2026-99172 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99172 *
CVE-2026-99173 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99173 *
CVE-2026-99174 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99174 *
CVE-2026-99175 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99175 *
CVE-2026-99176 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99176 *
CVE-2026-99178 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99178 *
CVE-2026-99179 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99179 *
CVE-2026-99180 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99180 *
CVE-2026-99181 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99181 *
CVE-2026-99182 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99182 *
CVE-2026-99183 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99183 *
CVE-2026-99184 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99184 *
CVE-2026-99187 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99187 *
CVE-2026-99189 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99189 *
CVE-2026-99190 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99190 *
CVE-2026-99191 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99191 *
CVE-2026-99192 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99192 *
CVE-2026-99201 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99201 *
CVE-2026-99202 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99202 *
CVE-2026-99203 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99203 *
CVE-2026-99204 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99204 *
CVE-2026-99206 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99206 *
CVE-2026-99208 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99208 *
CVE-2026-99209 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99209 *
CVE-2026-99210 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99210 *
CVE-2026-99211 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99211 *
CVE-2026-99212 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99212 *
CVE-2026-99213 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99213 *
CVE-2026-99214 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99214 *
CVE-2026-99215 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99215 *
CVE-2026-99216 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99216 *
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
CVE-2026-99233 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99233 *
CVE-2026-99234 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99234 *
CVE-2026-99235 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99235 *
CVE-2026-99236 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99236 *
CVE-2026-99237 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99237 *
CVE-2026-99238 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99238 *
CVE-2026-99239 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99239 *
CVE-2026-99240 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99240 *
CVE-2026-99244 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99244 *
CVE-2026-99245 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99245 *
CVE-2026-99246 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99246 *
CVE-2026-99247 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99247 *
CVE-2026-99249 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99249 *
CVE-2026-99250 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99250 *
CVE-2026-99251 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99251 *
CVE-2026-99254 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99254 *
CVE-2026-99255 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99255 *
CVE-2026-99256 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99256 *
CVE-2026-99258 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99258 *
CVE-2026-99270 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99270 *
CVE-2026-99271 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99271 *
CVE-2026-99272 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99272 *
CVE-2026-99273 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99273 *
CVE-2026-99274 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99274 *
CVE-2026-99275 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99275 *
CVE-2026-99281 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99281 *
CVE-2026-99282 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99282 *
CVE-2026-99283 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99283 *
CVE-2026-99284 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99284 *
CVE-2026-99999 (CVSSv3: 9.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99999 *
CVE-2026-100072 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100072 *
CVE-2026-100073 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100073 *
CVE-2026-100080 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100080 *
CVE-2026-100081 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100081 *
CVE-2026-100082 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100082 *
CVE-2026-100689 (CVSSv3: 5.9, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-100689 *
CVE-2026-102555 (CVSSv3: 8.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102555 *
CVE-2026-102556 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102556 *
CVE-2026-102557 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102557 *
CVE-2026-102558 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102558 *
CVE-2026-102559 (CVSSv3: 8.6): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102559 *
CVE-2026-102560 (CVSSv3: 9.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-102560 *
CVE-2026-102991 (CVSSv3: 6.5): python3-mako:python3-mako-native https://nvd.nist.gov/vuln/detail/CVE-2026-102991 *
CVE-2026-103658 (CVSSv3: 5.9): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-103658 *
CVE-2026-103995 (CVSSv4: 2.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-103995 *
CVE-2026-105712 (CVSSv3: 3.6): gnupg:gnupg-native https://nvd.nist.gov/vuln/detail/CVE-2026-105712 *
CVE-2026-105840 (CVSSv3: 7.5, CVSSv4: 7.7): lrzsz https://nvd.nist.gov/vuln/detail/CVE-2026-105840 *
CVE-2026-105841 (CVSSv3: 7.5, CVSSv4: 7.7): lrzsz https://nvd.nist.gov/vuln/detail/CVE-2026-105841 *
CVE-2026-105842 (CVSSv3: 6.4, CVSSv4: 6.1): lrzsz https://nvd.nist.gov/vuln/detail/CVE-2026-105842 *
CVE-2026-106552 (CVSSv3: 6.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106552 *
CVE-2026-106553 (CVSSv3: 7.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106553 *
CVE-2026-106555 (CVSSv3: 7.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106555 *
CVE-2026-106582 (CVSSv3: 3.7): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106582 *
CVE-2026-106583 (CVSSv3: 7.8): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106583 *
CVE-2026-106584 (CVSSv3: 3.3): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106584 *
CVE-2026-106585 (CVSSv3: 6.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106585 *
CVE-2026-106586 (CVSSv3: 4.3): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106586 *
CVE-2026-106587 (CVSSv3: 3.6): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106587 *
CVE-2026-106588 (CVSSv3: 3.1): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106588 *
CVE-2026-106589 (CVSSv3: 2.9): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106589 *
CVE-2026-107660 (CVSSv3: 4.8, CVSSv4: 6.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107660 *
CVE-2026-107675 (CVSSv3: 5.9, CVSSv4: 6.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107675 *
CVE-2026-107676 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107676 *
CVE-2026-107677 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107677 *
CVE-2026-107678 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107678 *
CVE-2026-107695 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107695 *
CVE-2026-107696 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107696 *
CVE-2026-107697 (CVSSv3: 4.3, CVSSv4: 5.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107697 *
CVE-2026-107885 (CVSSv3: 5.5): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107885 *
CVE-2026-107886 (CVSSv3: 6.5): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107886 *
CVE-2026-107888 (CVSSv3: 5.5): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107888 *
CVE-2026-107890 (CVSSv3: 5.5): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107890 *
CVE-2026-107928 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-107928 *
CVE-2026-107929 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-107929 *
CVE-2026-109088 (CVSSv3: 6.5): libxtst:libxtst-native https://nvd.nist.gov/vuln/detail/CVE-2026-109088 *
CVE-2026-109089 (CVSSv3: 7.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-109089 *
CVE-2026-109090 (CVSSv3: 7.5): libxi:libxi-native https://nvd.nist.gov/vuln/detail/CVE-2026-109090 *
CVE-2026-109518 (CVSSv4: 7.7): apt https://nvd.nist.gov/vuln/detail/CVE-2026-109518 *
CVE-2026-109828 (CVSSv2: 5.0, CVSSv3: 4.3, CVSSv4: 5.3): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2026-109828 *
CVE-2026-110855 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110855 *
CVE-2026-110856 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110856 *
CVE-2026-110857 (CVSSv3: 7.5, CVSSv4: 7.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110857 *
CVE-2026-110858 (CVSSv3: 8.1, CVSSv4: 9.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110858 *
CVE-2026-110859 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-110859 *
CVE-2026-111183 (CVSSv3: 9.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-111183 *
CVE-2026-111269 (CVSSv3: 6.1, CVSSv4: 6.9): libical:libical-native https://nvd.nist.gov/vuln/detail/CVE-2026-111269 *
CVE-2026-111497 (CVSSv3: 9.8, CVSSv4: 9.2): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2026-111497 *
CVE-2026-111943 (CVSSv3: 6.8): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-111943 *
CVE-2026-112271 (CVSSv3: 5.5, CVSSv4: 6.8): libdisplay-info https://nvd.nist.gov/vuln/detail/CVE-2026-112271 *
CVE-2026-113351 (CVSSv3: 7.5, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-113351 *
CVE-2026-113679 (CVSSv3: 7.0, CVSSv4: 7.3): harfbuzz:harfbuzz-native https://nvd.nist.gov/vuln/detail/CVE-2026-113679 *
CVE-2026-113680 (CVSSv3: 5.5, CVSSv4: 6.8): harfbuzz:harfbuzz-native https://nvd.nist.gov/vuln/detail/CVE-2026-113680 *
CVE-2026-114583 (CVSSv4: 6.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-114583 *
CVE-2026-115506 (CVSSv3: 7.5, CVSSv4: 8.7): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-115506 *
CVE-2026-115557 (CVSSv4: 9.4): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-115557 *
CVE-2026-115683 (CVSSv3: 6.8): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-115683 *
CVE-2026-115863 (CVSSv3: 7.6): connman https://nvd.nist.gov/vuln/detail/CVE-2026-115863 *
CVE-2026-116566 (CVSSv4: 5.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-116566 *
CVE-2026-116741 (CVSSv3: 6.5, CVSSv4: 8.3): speex https://nvd.nist.gov/vuln/detail/CVE-2026-116741 *
CVE-2026-117610 (CVSSv3: 7.5, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-117610 *
CVE-2026-118370 (CVSSv3: 8.2, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-118370 *
CVE-2026-118384 (CVSSv3: 6.1): mtools:mtools-native https://nvd.nist.gov/vuln/detail/CVE-2026-118384 *
CVE-2026-118598 (CVSSv3: 6.5): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-118598 *
CVE-2026-118599 (CVSSv3: 5.5): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-118599 *
CVE-2026-119194 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-119194 *
CVE-2026-119195 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-119195 *
CVE-2026-119196 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-119196 *
CVE-2026-119197 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-119197 *
CVE-2026-119371 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119371 *
CVE-2026-119372 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119372 *
CVE-2026-119373 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119373 *
CVE-2026-119374 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119374 *
CVE-2026-119375 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119375 *
CVE-2026-119376 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119376 *
CVE-2026-119377 (CVSSv3: 3.3, CVSSv4: 2.0): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119377 *
CVE-2026-119378 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119378 *
CVE-2026-119379 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119379 *
CVE-2026-119586 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119586 *
CVE-2026-119591 (CVSSv3: 5.5, CVSSv4: 6.8): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119591 *
CVE-2026-119741 (CVSSv3: 7.5, CVSSv4: 8.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-119741 *
CVE-2026-120210 (CVSSv3: 4.3, CVSSv4: 5.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120210 *
CVE-2026-120243 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120243 *
CVE-2026-120244 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120244 *
CVE-2026-120245 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120245 *
CVE-2026-120246 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120246 *
CVE-2026-120247 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120247 *
CVE-2026-123158 (CVSSv3: 8.1): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-123158 *
CVE-2026-124317 (CVSSv3: 4.8, CVSSv4: 6.3): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-124317 *

Summary of CVE counts by recipe:
  linux-yocto: 1072
  rsync:rsync-native: 40
  python3-git: 33
  ffmpeg: 30
  curl:curl-native: 27
  libsoup: 15
  python3:python3-native: 14
  xwayland: 12
  openssh: 12
  sqlite3:sqlite3-native: 11
  cups: 9
  libxi:libxi-native: 9
  u-boot-tools: 8
  libgit2: 6
  expat:expat-native: 5
  epiphany: 4
  bind: 4
  busybox: 4
  aspell: 4
  libx11:libx11-native: 4
  python3-pyasn1: 4
  libsndfile1: 3
  qemu:qemu-native:qemu-system-native: 3
  python3-urllib3: 3
  gstreamer1.0: 3
  lrzsz: 3
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 2
  perl:perl-native: 2
  tar: 2
  ghostscript: 2
  acl:acl-native: 2
  zlib:zlib-native: 2
  webkitgtk: 2
  libxtst:libxtst-native: 2
  alsa-lib:alsa-lib-native: 2
  ovmf:ovmf-native: 2
  harfbuzz:harfbuzz-native: 2
  libgcrypt:libgcrypt-native: 1
  cairo:cairo-native: 1
  avahi: 1
  rpm-sequoia: 1
  gdk-pixbuf:gdk-pixbuf-native: 1
  libtheora: 1
  graphene: 1
  popt:popt-native: 1
  bluez5: 1
  cryptodev-linux: 1
  libxfont: 1
  libsolv: 1
  python3-lxml:python3-lxml-native: 1
  util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native: 1
  attr:attr-native: 1
  bison:bison-native: 1
  coreutils:coreutils-native: 1
  vim: 1
  sudo: 1
  glibc: 1
  libxrender:libxrender-native: 1
  ruby:ruby-native: 1
  grub:grub-efi:grub-native: 1
  python3-mako:python3-mako-native: 1
  gnupg:gnupg-native: 1
  apt: 1
  libical:libical-native: 1
  go:go-binary-native:go-cross-x86-64-v3:go-runtime: 1
  libdisplay-info: 1
  connman: 1
  speex: 1
  mtools:mtools-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/
