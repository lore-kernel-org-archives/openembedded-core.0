Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5599.1794387804856650632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ERYdRStY;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso19975005e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387803; x=1794992603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RazqaQh/y0olDR+ZNEFY2KYYYnlPtCLDYR/bAzGegeQ=;
        b=ERYdRStYMSbsQHVZ5Cb/ArDi4FeBwDzZDuBQxX325ATNyZb4UwgH5qoBsta4kRa9Gl
         +u6oL88C7dvzu+83OP7osEPBjT2CqxMp+13zeVUXY7cZ81IeAHwnUCbqSJCB/Hot7mZo
         FkTE9w20atXoOI6xOtyb17D4gny3S6zMvN3skKZwudG4kYKX1UJ++Ll7KUOaWbLy9Dek
         ci+bm2N2QwC/Hnf1by49UDJc+1Yl14OTeEi5gS3XIdimJRA4AZtBbQmag06L/mpPe4km
         Kux4z0OiFLA9a9y8LL1GF2eifhCrNrkiwdjG/n7WCAky8tkgvJg1IKs26QhYQPIg9oqB
         1+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387803; x=1794992603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RazqaQh/y0olDR+ZNEFY2KYYYnlPtCLDYR/bAzGegeQ=;
        b=KoYZjAxRx9SAflUPR1lEnkHWWgeYoL9QdDmuR2DjQFY7S3F5MLwfGPMePVpqDr/Nbc
         W8Kl6jDOQGIY0TYjs3FozBjrEYieBRPhhrYL5S7AgTzUtUOOwMLYojsV+zy6MUDtrvtJ
         ayh9oDpam+ZFKXg3jhqeTH0KcnqXND7w4E0HKdQO3HyRJYZleqdJxoWolODdX+e8W1St
         UsGlNQ4IgrUAjW26w+MXEHBC7WD3eL5A2Hxi+6/C6a6ckCaYcX81oKUNPNUbbfn5An3+
         n45LflBgtZm9aUPDUAgEzIyu0JcRF6VMzRVN4+4xHxvae3ZhPr7Y/BvSyDNSybydCkd4
         rI7g==
X-Gm-Message-State: APuU4Z8VN200GnztUVZGGpgRy4HgRQCdjpOGgpXijgyZ16tWQDmHzDQJ
	3aEdW+NAOFGml4vNk49JFSvgv9HOPKVdfZCv8DFxn43I9+Mlmka55xTbbGTji2QaNj5bm0s8rw8
	bveB/Nl4=
X-Gm-Gg: AYBFou0xpIE9jojtTF72ukNfL7uvNN4VFDBnntTvRmdt0flDn8RWIxl9witqk9SzTa4
	HksOH55qVuAe87ImT5wsQ8om3sCFZ+AcILopshorJKrw0/BfMwHOoYidog1pnTq6bCAR2Sums6Y
	UyYb/IzcajgUzMTkWCp3a9QdHiFsPx890tGYcJfViKsnLXFCHe/2AumoZpP5lilw2etb0rorj2x
	TIRnwE43QxOXEEHShmsfqU8eih+BQLkH/3ejAOukRRHTXM44yNNbT+NJLDF0pDbS2N1hf3UrQ9A
	KkzcJR8a9rFNmhIiO9qRvrLZ2ZA9Yex42d88FEYzE/m/mXvTPaFUYB7uI+rtDHEX97AF/Dtz6C/
	Ekne3cSmwdrbc8EwmqbL79kRa4zIn2qmbwVJ4we9hGRLn/IJgrOMdfoT51WWvwif37B/s6OUExK
	L0RrlxYKyNAEIiut4MS7/WR1hD3kkl/jGvrHt24y9H59SDeCJFu2+zedkkujUvgZ50xumWRWXGk
	Ut+XHRc+VbKq5XKW9KTIpk39MwH7eX6iCWeLgD1kuxlCBljr9hDC+YbUUbEpUP+onC55tH3joJl
	FvPOvCGNgF6O4Aw+oDMyYgW++HQ3QCj5Sab2XZGb9CMmBCVGM3IfWEK0o6u+SRUdsz5pSZ4CS0t
	UcQGzZ8Gmw5KCP/xl1Lp5anrI3I9pBRqamwLaYvLl63wuUb5q6bk=
X-Received: by 2002:a05:600c:8b2a:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4ba093921f6mr29285965e9.27.1794387802979;
        Wed, 11 Nov 2026 01:03:22 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:22 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/35] gstreamer1.0-plugins-bad: use gtk+3 dependency name
Date: Wed, 11 Nov 2026 10:02:32 +0100
Message-ID: <365f56330b989f412fd562d72e4f6aed7426ed1e.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249978
Content-Type: text/plain; charset="utf-8"

From: Shantanu Majumdar <shanmaju@qti.qualcomm.com>

Replace the PACKAGECONFIG gtk3 dependency from gtk3+ to
gtk+3 to match the recipe name used in OE-Core.

Signed-off-by: Shantanu Majumdar <shanmaju@qti.qualcomm.com>
Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 7993331246ac675eef1712ea7fba770518cef5b1)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
index 17e49ebbda2..1b6a8ac30ba 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
@@ -49,7 +49,7 @@ PACKAGECONFIG[faac]            = "-Dfaac=enabled,-Dfaac=disabled,faac"
 PACKAGECONFIG[faad]            = "-Dfaad=enabled,-Dfaad=disabled,faad2"
 PACKAGECONFIG[fdkaac]          = "-Dfdkaac=enabled,-Dfdkaac=disabled,fdk-aac"
 PACKAGECONFIG[fluidsynth]      = "-Dfluidsynth=enabled,-Dfluidsynth=disabled,fluidsynth"
-PACKAGECONFIG[gtk3]            = "-Dgtk3=enabled,-Dgtk3=disabled,gtk3+"
+PACKAGECONFIG[gtk3]            = "-Dgtk3=enabled,-Dgtk3=disabled,gtk+3"
 PACKAGECONFIG[hls]             = "-Dhls=enabled,-Dhls=disabled,"
 # Pick atleast one crypto backend below when enabling hls
 PACKAGECONFIG[nettle]          = "-Dhls-crypto=nettle,,nettle"
