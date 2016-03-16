Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id D522B65C5C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 14:01:47 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l68so191750306wml.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 07:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=bebjqJmss4ghWizvjNkuWu5kpsJ18F7pKE5TCkTJcV0=;
	b=c4fzHmanvM82tubO6AeaWaXBfruF7k6AsB3/0Iw8REM7RmIUSdp+FJa+wEEkd0dmSh
	uc1bEpSEFRQ5TYngZT9XzckRpkj7xGoW0j/n+fbmsH35sCAI/CEZbnfCcxKhCRGrvUGn
	PJ7yMpgy5FMHTPEyhzxJRdinVY98a7PdWhoejqZrn+hLaYhFhyBMdAW+x1WH3vk0MP4l
	Jmh6st8Bw5fQGOg4q0goCND/l/Qz0GsKuo+Z9GyGYgQ8BxO/ew6P22c3Ghqg5iyKln/w
	8AQVY0v+DE2+Jh+uhSJw3gsFXMDUuBOLaeYEm/63yVkhRtMStW3bCFknmPVX/MfWZWgq
	I/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bebjqJmss4ghWizvjNkuWu5kpsJ18F7pKE5TCkTJcV0=;
	b=MNBl70R5J7ZCYq4QwRXkVoDzt1kQAMvwcsLuYKymq0PvnWaNWdSJMn25kQ/XzNEmPe
	2vWvWixIVEFJhzFX1OiWwYa2yjbtH7yN8s1/TXAlAkF7txnI7Tl/QM+rTEifBWgh7uAi
	OQLN1m2i61nB4kTfN6VPE45HSWJO4z/BIK9HBqLh9FNrF23Ydf0M4ciMBKvxvOivOuwp
	1CqnxvQPXKVL+GjHKM4EDEogAvHUgQUGGAdeUJ+3NB1D55QG6wkENH/dnHHUorkMsFIx
	hvdGrUGvFeNZjHKxZHQ/4OaJWelEkBNbeTRQW54YtyVv2Eu+E5+C3yC2IDoa1pdKqtP9
	K1Ww==
X-Gm-Message-State: AD7BkJJtXxE1JDTZv40mV5nHdbOFM7HE5G0TylcA9klMERjKqG39AP5rR68IEcR0Nf4IAiwC
X-Received: by 10.28.30.215 with SMTP id e206mr28152270wme.25.1458136907607;
	Wed, 16 Mar 2016 07:01:47 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id u4sm3229045wjz.4.2016.03.16.07.01.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Mar 2016 07:01:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Mar 2016 14:01:44 +0000
Message-Id: <1458136904-24869-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] no-static-libs: just like target and native, nativesk-libcap doesn't like unrecognised options
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
X-List-Received-Date: Wed, 16 Mar 2016 14:01:48 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/no-static-libs.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 6c0f859..1265908 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -9,6 +9,7 @@ DISABLE_STATIC_pn-pciutils = ""
 # libcap aborts on unrecognised option
 DISABLE_STATIC_pn-libcap = ""
 DISABLE_STATIC_pn-libcap-native = ""
+DISABLE_STATIC_pn-nativesdk-libcap = ""
 # libpcap aborts on unrecognised option
 DISABLE_STATIC_pn-libpcap = ""
 # needed by gdb
-- 
2.7.0


