Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.319.1794201594085507998
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 21:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=WAOmQm0/;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so4341715e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 21:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794201592; x=1794806392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F2CP6X2YkXTeHdxAXsD0EzbWWjGrw6r9PNh7xmx3IaI=;
        b=WAOmQm0/S8pUuvGjkXtOH4n8JkN1ybw6swv00BeqPYkw0SZhpGBEDl/eVsdVuWnomQ
         bRkVYNq0nHAuMyGwoZr11+7HhEeyn7GmPgnPcvMTjKKZaf2M9MmLgRVG7BDwK6D0ML0S
         qT0hPu7Ig6bNOEBRhL2nux/z6nU6ChT1zogPv66Z5iDu1LepKWyQSCzHIMy8SfIDTPH2
         7Ny3WCBGxtAunP9rCbbJcofiGCVZzmFeACOFKagTagvzvg1Ucx0tE4XScImoMw7v1j+q
         TZ71CAj1cTimpA/hMnIkrA+PfdZ1cJYmfAogonUnyakLy3EksupNBUYoq3GZWztjVqcm
         1+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201592; x=1794806392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F2CP6X2YkXTeHdxAXsD0EzbWWjGrw6r9PNh7xmx3IaI=;
        b=W6oqO2RZED8OW9xvH5ACJAd+ybRO3akhGu7hnsE6iZvEfHMmqUXN5THpCCCrA/PCAd
         P3DZ01NLwnQF19ttpIjSLzRBdCPcF24HwXZoy4+yCxFrfm3FDIXlW502x0ey69qkqR0n
         zfVsNp5q596p1/S7KezBD7/x/4rvCwL+ZuI1RGvAY8dmqWZ7mP1TvRV6ahetRt5E4Epc
         e5FrOgXSJTjtDg6jvHQh70B3J9+DvE99bsTVIX8bAoFcNC9w2KBA103bB6yDGtf9iakM
         PLDIiL4IR6T7Y+S+64HIj9G9h78bRp668QTRaHlOT4HVVgJ9SG4cceEB+DT4dOTKpmDS
         /Wvg==
X-Gm-Message-State: APuU4Z/WBa5o4Rlf+h/rginmtozG7wAc+KBF6XQ+HzkX/xJteq1kLq2v
	RIrZd0xA8cgaYZGpG8z/9HjuHxCi5PtD2xe5hPfqBwATLyTuEaWDQvhmBYrP2aOqnMS/KG2wh7M
	yP/GhT9k=
X-Gm-Gg: AYBFou3f3Vi6WtKhaua6E0vjK0eifqehowM1/zgXRROMi/J93rY/lxFx9cHI+P/hB08
	e+r3Sm9qav++vh3OMLzA2tUMuECMVEsT0yrM5Ug7hWgs7YnAG1Fkort5TbD2D1CfJZ51hV/IZIl
	wVPO40l593+V/5ismuS6m7mhPgy5Lcp6CJ/dd3eyuB86gJWn5lGneonLH74HFdu8YzTwCZPS/eF
	K5E8FRm4Tr6ugrpsLrETPQ4nv7cBFg8uWX2pwFnuiubxYtdblufD8lJ+EhR/iUkXomF+4wpnc9x
	oR/OYlCIcChusKf60KnlsI0TR3L6fTlID/tadDHpalkGGrdc0hqZ8GUfUiGcGxwNCYbUS5wAgcd
	1XwU/wAJt4J5jyNxGMQ6nVqBJB8yXczhOFwuxMsaWPwatvxMZBQ4i8MPiUUW/GFjo2TOwcz4KWv
	VtPpmuIKeBxWK0bbYzTp7u6alaHWcjbWvahngl9OgzwPKfgaWcMcgle2flvaLRT4C0O4uY5wpeu
	3K2yOW+y+9tPoQ+UidxAd3k9D2/rzCcgk+oTPWqDnShI6/MAVNsoHc5ejTIjx0WJS7RNWeTbBN2
	qEKk0yKJ/YR96Rt3gaXnJm/GxOHbCcewnBnJsQAPb/dU02GVFquUVU/X1yU+Mbn8/865+4C+M7C
	wYjpqUwZifcjAxTd0XLkBR1NdFUMzWRooH3FtG6bEFXLGtFng4myUkYWslsPOcL7abjVW7nI1zW
	w=
X-Received: by 2002:a05:6000:220e:b0:492:20e0:f666 with SMTP id ffacd0b85a97d-49584d472e0mr5372731f8f.0.1794201591935;
        Sun, 08 Nov 2026 21:19:51 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from runner-sindu79iq-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959011c995sm7604212f8f.0.2026.11.08.21.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:19:51 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Mon Nov 09 04:04:40 2026
Date: Mon,  9 Nov 2026 05:19:48 +0000
Message-ID: <20261109051950.24-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109051950.24-1-yoann.congal@smile.fr>
References: <20261109051950.24-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 05:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249790
Content-Type: text/plain; charset="utf-8"

Branch: master

New this week: 65 CVEs
CVE-2021-47645 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-47645 *
CVE-2023-38469 (CVSSv3: 6.2): avahi https://nvd.nist.gov/vuln/detail/CVE-2023-38469 *
CVE-2023-38470 (CVSSv3: 6.2): avahi https://nvd.nist.gov/vuln/detail/CVE-2023-38470 *
CVE-2023-38471 (CVSSv3: 6.2): avahi https://nvd.nist.gov/vuln/detail/CVE-2023-38471 *
CVE-2023-38472 (CVSSv3: 6.2): avahi https://nvd.nist.gov/vuln/detail/CVE-2023-38472 *
CVE-2023-38473 (CVSSv3: 6.2): avahi https://nvd.nist.gov/vuln/detail/CVE-2023-38473 *
CVE-2025-59529 (CVSSv3: 5.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2025-59529 *
CVE-2025-68276 (CVSSv3: 5.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2025-68276 *
CVE-2025-68468 (CVSSv3: 6.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2025-68468 *
CVE-2025-68471 (CVSSv3: 6.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2025-68471 *
CVE-2026-24401 (CVSSv3: 6.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2026-24401 *
CVE-2026-34933 (CVSSv3: 5.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2026-34933 *
CVE-2026-97229 (CVSSv3: 10.0): ruby:ruby-native https://nvd.nist.gov/vuln/detail/CVE-2026-97229 *
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
CVE-2026-99277 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99277 *
CVE-2026-99278 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99278 *
CVE-2026-99279 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99279 *
CVE-2026-99280 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99280 *
CVE-2026-99281 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99281 *
CVE-2026-99282 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99282 *
CVE-2026-99283 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99283 *
CVE-2026-99284 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99284 *
CVE-2026-100080 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100080 *
CVE-2026-100081 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100081 *
CVE-2026-100082 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100082 *
CVE-2026-109518 (CVSSv4: 7.7): apt https://nvd.nist.gov/vuln/detail/CVE-2026-109518 *
CVE-2026-119170 (CVSSv4: 8.2): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119170 *
CVE-2026-119741 (CVSSv3: 7.5, CVSSv4: 8.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-119741 *
CVE-2026-124317 (CVSSv3: 4.8, CVSSv4: 6.3): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-124317 *

Removed this week: 23 CVEs
CVE-2026-75818 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75818 *
CVE-2026-75819 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75819 *
CVE-2026-75820 (CVSSv4: 1.8): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-75820 *
CVE-2026-88806 (CVSSv3: 7.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-88806 *
CVE-2026-88807 (CVSSv4: 8.9): libxrender:libxrender-native https://nvd.nist.gov/vuln/detail/CVE-2026-88807 *
CVE-2026-94283 (CVSSv3: 6.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94283 *
CVE-2026-94284 (CVSSv3: 5.5): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94284 *
CVE-2026-94285 (CVSSv3: 5.1): libx11:libx11-native https://nvd.nist.gov/vuln/detail/CVE-2026-94285 *
CVE-2026-94286 (CVSSv3: 7.1): libxtst:libxtst-native https://nvd.nist.gov/vuln/detail/CVE-2026-94286 *
CVE-2026-96674 (CVSSv3: 4.4, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-96674 *
CVE-2026-96675 (CVSSv3: 3.3, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-96675 *
CVE-2026-103658 (CVSSv3: 5.9): aspell https://nvd.nist.gov/vuln/detail/CVE-2026-103658 *
CVE-2026-109088 (CVSSv3: 6.5): libxtst:libxtst-native https://nvd.nist.gov/vuln/detail/CVE-2026-109088 *
CVE-2026-113351 (CVSSv3: 5.9, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-113351 *
CVE-2026-115506 (CVSSv3: 7.5, CVSSv4: 8.7): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-115506 *
CVE-2026-115683 (CVSSv3: 6.8): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-115683 *
CVE-2026-117610 (CVSSv3: 5.9, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-117610 *
CVE-2026-118370 (CVSSv3: 5.9, CVSSv4: 8.2): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-118370 *
CVE-2026-118384 (CVSSv3: 6.1): mtools https://nvd.nist.gov/vuln/detail/CVE-2026-118384 *
CVE-2026-119194 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-119194 *
CVE-2026-119195 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-119195 *
CVE-2026-119196 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-119196 *
CVE-2026-119197 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-119197 *

Full list: Found 163 unpatched CVEs
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
CVE-2026-15534 (CVSSv3: 5.7): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-15534 *
CVE-2026-17025 (CVSSv3: 6.4): graphene https://nvd.nist.gov/vuln/detail/CVE-2026-17025 *
CVE-2026-18477 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18477 *
CVE-2026-18487 (CVSSv3: 5.4): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-18487 *
CVE-2026-18508 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18508 *
CVE-2026-18839 (CVSSv3: 2.2): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18839 *
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
CVE-2026-76844 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-76844 *
CVE-2026-78376 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-78376 *
CVE-2026-82474 (CVSSv3: 7.8, CVSSv4: 8.5): sudo https://nvd.nist.gov/vuln/detail/CVE-2026-82474 *
CVE-2026-82560 (CVSSv3: 7.5): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-82560 *
CVE-2026-83596 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-83596 *
CVE-2026-84243 (CVSSv3: 7.0): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-84243 *
CVE-2026-85091 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-85091 *
CVE-2026-88812 (CVSSv3: 7.8): xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-88812 *
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
CVE-2026-99277 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99277 *
CVE-2026-99278 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99278 *
CVE-2026-99279 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99279 *
CVE-2026-99280 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99280 *
CVE-2026-99281 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99281 *
CVE-2026-99282 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99282 *
CVE-2026-99283 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99283 *
CVE-2026-99284 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-99284 *
CVE-2026-100080 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100080 *
CVE-2026-100081 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100081 *
CVE-2026-100082 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100082 *
CVE-2026-103995 (CVSSv4: 2.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-103995 *
CVE-2026-107675 (CVSSv3: 5.9, CVSSv4: 6.0): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107675 *
CVE-2026-107676 (CVSSv3: 3.3, CVSSv4: 4.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107676 *
CVE-2026-107677 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107677 *
CVE-2026-107678 (CVSSv3: 4.7, CVSSv4: 5.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107678 *
CVE-2026-107696 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-107696 *
CVE-2026-107885 (CVSSv3: 5.5): cups https://nvd.nist.gov/vuln/detail/CVE-2026-107885 *
CVE-2026-109518 (CVSSv4: 7.7): apt https://nvd.nist.gov/vuln/detail/CVE-2026-109518 *
CVE-2026-109828 (CVSSv2: 5.0, CVSSv3: 4.3, CVSSv4: 5.3): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2026-109828 *
CVE-2026-111183 (CVSSv3: 9.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-111183 *
CVE-2026-111497 (CVSSv3: 9.8, CVSSv4: 9.2): ovmf:ovmf-native https://nvd.nist.gov/vuln/detail/CVE-2026-111497 *
CVE-2026-112271 (CVSSv3: 5.5, CVSSv4: 6.8): libdisplay-info https://nvd.nist.gov/vuln/detail/CVE-2026-112271 *
CVE-2026-112272 (CVSSv3: 5.5, CVSSv4: 6.8): libdisplay-info https://nvd.nist.gov/vuln/detail/CVE-2026-112272 *
CVE-2026-115863 (CVSSv3: 7.6): connman https://nvd.nist.gov/vuln/detail/CVE-2026-115863 *
CVE-2026-116566 (CVSSv4: 5.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-116566 *
CVE-2026-116741 (CVSSv3: 6.5, CVSSv4: 8.3): speex https://nvd.nist.gov/vuln/detail/CVE-2026-116741 *
CVE-2026-118598 (CVSSv3: 6.5): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-118598 *
CVE-2026-118599 (CVSSv3: 5.5): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-118599 *
CVE-2026-119170 (CVSSv4: 8.2): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119170 *
CVE-2026-119586 (CVSSv3: 7.8, CVSSv4: 8.5): sqlite3:sqlite3-native https://nvd.nist.gov/vuln/detail/CVE-2026-119586 *
CVE-2026-119741 (CVSSv3: 7.5, CVSSv4: 8.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-119741 *
CVE-2026-120210 (CVSSv3: 4.3, CVSSv4: 5.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120210 *
CVE-2026-120243 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120243 *
CVE-2026-120244 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120244 *
CVE-2026-120245 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120245 *
CVE-2026-120246 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120246 *
CVE-2026-120247 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-120247 *
CVE-2026-124317 (CVSSv3: 4.8, CVSSv4: 6.3): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-124317 *

Summary of CVE counts by recipe:
  linux-yocto: 60
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 14
  xwayland: 12
  avahi: 11
  ffmpeg: 11
  libsoup: 9
  python3:python3-native: 5
  libsndfile1: 3
  epiphany: 3
  busybox: 3
  cups: 2
  perl:perl-native: 2
  tar: 2
  zlib:zlib-native: 2
  webkitgtk: 2
  ovmf:ovmf-native: 2
  libdisplay-info: 2
  xdg-utils: 1
  libgcrypt:libgcrypt-native: 1
  libtheora: 1
  graphene: 1
  popt:popt-native: 1
  cryptodev-linux: 1
  util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native: 1
  sudo: 1
  glibc: 1
  ruby:ruby-native: 1
  grub:grub-efi:grub-native: 1
  apt: 1
  gstreamer1.0: 1
  connman: 1
  speex: 1
  sqlite3:sqlite3-native: 1
  rsync:rsync-native: 1
  expat:expat-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/
