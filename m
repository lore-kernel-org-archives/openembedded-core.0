Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 60A2E789FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:05:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s18-v6so3349159wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=om8xGTrMX+rtNKDUmWQ2nVus8ZcRx79MoQX/WIl4c30=;
	b=M7qgVlK+Bt1KzC3Shwc7QvW1Uomu65KdGpPriMjdfMY9XNWqi+6gSPmewrHL8fszH0
	83ZyJ5iYuQNqzD+JcR0s6o3C2K0t5tRB8Xh/AMpmUkhC1hx6B7m40kXHJfYSczre9Z0m
	oZmPs0AxKK8NbCNlS8HAfCdajOXLstV0J+d45ugjufbsTDuZqSPV8YgKyOxiidOMLRVP
	TL3jQHEfyhNzKR9q9J4omCViPKNpoP6rAusBVQLQQJWZqJ84k3IObiUHhVaEygfLZydY
	nA6vY0a+N2GWxvzA/DezTi1teETDQyE1UZXKc0CuxyVUlzKvGIcCz5DkW4dX/K2zOOUa
	FwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=om8xGTrMX+rtNKDUmWQ2nVus8ZcRx79MoQX/WIl4c30=;
	b=TwLh0p4Yh+lRcSzRUFWGSX+uuTPCYkeiD6S/lkH7PEofHXrwYoZK6kPbI0XR7SUjwh
	rdgjDV9lkuLO3U9ltxErALzd0joT0FPoAzuWvlcmpHH7U69z5Tk/baVwB0aZH3mkxTg5
	J0shMk2WQhJRIwLss3KtpmhDa1apdAOq79GOypwdqNJWdHFpoIe2P+Wsh9RAMHuOYeWM
	EfMokiuDfgZqVetlkDiRQijV3DLWpsxc3Z6uB4J2/T1NzWRlG1fmud9oVKcOcajeX5lp
	1UU3f9V2+F/iH/cQ5SXkeCzO2FqjiGTQtGR62RmlvW7Whl1IHQXKAbP+GL0fkNctF/1b
	8KSw==
X-Gm-Message-State: ABuFfoiGNOZG12y/xDFfk3F5PL4uZBWvwmIOomrrpfFsbvMDqiw/qe1S
	4NWr8KcOmYVz/MwZ1GjsKcMpA9yttuA=
X-Google-Smtp-Source: ACcGV62Fsr022l/+i8BvSFMbHwSlxtvcF/sBfjC0XOL9tPfw/40u/4+4tx3qUAcvCVppC00j+Re19g==
X-Received: by 2002:a05:6000:111:: with SMTP id
	o17mr47646096wrx.279.1540217118584; 
	Mon, 22 Oct 2018 07:05:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o130-v6sm9209989wmd.11.2018.10.22.07.05.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 07:05:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:04:59 +0100
Message-Id: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/13] Master package updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2018 14:05:18 -0000

series passed AB.

Armin Kuster (13):
  nss: update to 3.39 includes CVE-2018-12384
  nspr: Update to 4.20
  gnutls: update to 2.6.4
  libpcre2: update to 10.32
  curl: update to 7.61.1
  openssh: Update to 7.9 primarily bug fixes
  libsm: update to 1.2.3
  libx11: update to 1.6.7 and sytle cleanup
  libxcb: update to 1.13.1
  xkeyboard-config: update to 2.25
  xf86-input-libinput: update to 0.28.1
  tzcode: update to 2018f
  tzdata: update to 2018f

 .../{openssh_7.8p1+git.bb => openssh_7.9p1+git.bb} |   2 +-
 ...code-native_2018e.bb => tzcode-native_2018f.bb} |   8 +-
 .../tzdata/{tzdata_2018e.bb => tzdata_2018f.bb}    |   4 +-
 ...put_0.28.0.bb => xf86-input-libinput_0.28.1.bb} |   4 +-
 .../xorg-lib/{libsm_1.2.2.bb => libsm_1.2.3.bb}    |   8 +-
 .../libx11/Fix-hanging-issue-in-_XReply.patch      |  28 ++--
 .../xorg-lib/{libx11_1.6.6.bb => libx11_1.6.7.bb}  |  10 +-
 .../xorg-lib/{libxcb_1.13.bb => libxcb_1.13.1.bb}  |   4 +-
 ...ard-config_2.24.bb => xkeyboard-config_2.25.bb} |   4 +-
 .../recipes-support/curl/curl/CVE-2018-14618.patch |  37 -----
 .../curl/{curl_7.61.0.bb => curl_7.61.1.bb}        |   5 +-
 .../gnutls/{gnutls_3.6.3.bb => gnutls_3.6.4.bb}    |   4 +-
 .../{libpcre2_10.31.bb => libpcre2_10.32.bb}       |   6 +-
 .../nspr/nspr/0002-Add-nios2-support.patch         |  25 ++--
 ...e-definitions-for-the-RISC-V-architecture.patch | 150 ---------------------
 .../nspr/nspr/remove-rpath-from-tests.patch        |   2 +-
 .../nspr/{nspr_4.19.bb => nspr_4.20.bb}            |   5 +-
 .../nss/{nss_3.38.bb => nss_3.39.bb}               |   4 +-
 18 files changed, 59 insertions(+), 251 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_7.8p1+git.bb => openssh_7.9p1+git.bb} (99%)
 rename meta/recipes-extended/tzcode/{tzcode-native_2018e.bb => tzcode-native_2018f.bb} (70%)
 rename meta/recipes-extended/tzdata/{tzdata_2018e.bb => tzdata_2018f.bb} (98%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.28.0.bb => xf86-input-libinput_0.28.1.bb} (63%)
 rename meta/recipes-graphics/xorg-lib/{libsm_1.2.2.bb => libsm_1.2.3.bb} (87%)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.6.6.bb => libx11_1.6.7.bb} (64%)
 rename meta/recipes-graphics/xorg-lib/{libxcb_1.13.bb => libxcb_1.13.1.bb} (89%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.24.bb => xkeyboard-config_2.25.bb} (87%)
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2018-14618.patch
 rename meta/recipes-support/curl/{curl_7.61.0.bb => curl_7.61.1.bb} (94%)
 rename meta/recipes-support/gnutls/{gnutls_3.6.3.bb => gnutls_3.6.4.bb} (93%)
 rename meta/recipes-support/libpcre/{libpcre2_10.31.bb => libpcre2_10.32.bb} (90%)
 delete mode 100644 meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-architecture.patch
 rename meta/recipes-support/nspr/{nspr_4.19.bb => nspr_4.20.bb} (95%)
 rename meta/recipes-support/nss/{nss_3.38.bb => nss_3.39.bb} (98%)

-- 
2.7.4


