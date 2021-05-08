Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web09.1224.1620435885941603487
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 18:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=skahNN1m;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620435884; i=@fujitsu.com;
	bh=xxVUxaA4iosQD8Fc0ryKo/xYnX7nlX+gtQqOFgcspIw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=skahNN1mJhlUQUutQSqWF0LJXYVK8PvsEjfbEk6V6Pg6aZ8PnuqL36rcUe23GZjqM
	 6nDAtpz+Le5ShxAjp8EeQmVZRw6wvKm1Yx0gsyyOFO60z+DQRo8BKgjf5ATdy+EZxt
	 XRuWdNwNrtltzaQjqRJZnHFITQ3qsSkiD0IzzmLzNexGQ3smUfF/GzJ62rIXTSMrnV
	 NOarYEmkdDGsVbt8gUBUluv9PQDOtYjJxbYp7gZhvg0jabpYNiwi3Scy0WxkIhsiI6
	 inH7iS+KPmNq8x+uGk/Mr0dTjGjqBogXVlFCwmMsGDxRYn6bQ1Lmk+BnyVmo36xuWu
	 QhT+Uv2088snQ==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id FC/92-55620-CA3E5906; Sat, 08 May 2021 01:04:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRqrv68dQ
  EgwX9+hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bF/19ZCo5wVhw628jawHieo4uRi0NIYCaT
  xKqT25ggnGOMEttXLGDvYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv3vASoQFrCU2b
  9vAAmKzAMU/vlnMDGLzCjhJbP3aABaXEFCQmPLwPVicU8BZ4s77tWwgthBQzcFZ19gg6gUlTs
  58wgIxX0Li4IsXzBC9ihKzLzdDzamQeH34EvMERv5ZSFpmIWlZwMi0itEiqSgzPaMkNzEzR9f
  QwEDX0NBI19DSTNfI0EQvsUo3SS+1VLc8tbhE11AvsbxYr7gyNzknRS8vtWQTIzAcUwqOXNvB
  eOD1B71DjJIcTEqivEU5UxOE+JLyUyozEosz4otKc1KLDzHKcHAoSfDuvA6UEyxKTU+tSMvMA
  cYGTFqCg0dJhNfrEVCat7ggMbc4Mx0idYpRUUqc9ylIQgAkkVGaB9cGi8dLjLJSwryMDAwMQj
  wFqUW5mSWo8q8YxTkYlYR55UCm8GTmlcBNfwW0mAlo8ce1k0AWlyQipKQamJbsvaI0R9/i+ee
  e2Evth0OXfDzfdcPp3kaGeX5qzFcDd7LI71Yqn8k4OUtxm/fFRtfwq8LCDvnHg63VfO7Vfd68
  IO81t69z3+9AC/vWTw+FvVTTMktYXwc/drxvJu5t7B6yP1Y5ZcXC+en306VSmwMi8x1UllbVn
  V226tjxvD5m419vJk770y9z7srTTzySM74nXwy785a5ve9Ebci25Qfk2e5LlmzVKNvzpMNNLf
  HuWnm2d/UKPffvSmbHXku/u+CDtWmsWaHG9Mh/8hZNWsZmJ9yktO/kbdczZYi+2Lvr+IZPaZ9
  NWG0fRrvrrJto9+ZRCbfHx+gefUWectFvk8qmFnYLn2Bx7PlezJitxFKckWioxVxUnAgA2LGk
  aUIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-287.messagelabs.com!1620435883!53665!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15818 invoked from network); 8 May 2021 01:04:43 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-15.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2021 01:04:43 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14814hg2010396
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 8 May 2021 02:04:43 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 8 May 2021 02:04:41 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libepoxy: upgrade 1.5.5 -> 1.5.7
Date: Sat, 8 May 2021 09:04:14 +0800
Message-ID: <1620435855-48558-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620435855-48558-1-git-send-email-wangmy@fujitsu.com>
References: <1620435855-48558-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libepoxy/{libepoxy_1.5.5.bb => libepoxy_1.5.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.5.5.bb => libepoxy_1.5.7.bb} (93%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.7.bb
similarity index 93%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.7.bb
index a404fe2852..acf2ab0b03 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
            "
-SRC_URI[sha256sum] = "261663db21bcc1cc232b07ea683252ee6992982276536924271535875f5b0556"
+SRC_URI[sha256sum] = "9479cc0146ffb395fdecf9bd2a5930834fd0bce490cbcc4681ffd716bb3a0763"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
 inherit meson pkgconfig features_check
-- 
2.25.1

