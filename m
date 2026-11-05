Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29800.1793868221121382009
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=eKYw66v1;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490c1d337d8so676839f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868219; x=1794473019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RLuavaIe5gsi0YNs3IsCVenHEzYUUHTZ4thktTrcGn4=;
        b=eKYw66v16X+5elMwcDuVs/+jZDW2VnWhMZ40h1km1DyrHP3wyYyWdgWOzPro4sJrH2
         Ns2WylwFU4bZmTZMUaRcaXUOlVBLbIhj5Kz9FXUh0b3WqbwhOSpzlWLy7sGBKnxoLBli
         olHX6rBGIE4nsrBqtlHXJA6xVmxiUUUz7q4Ex5I8NaUqhwAohWX75wqUTa9+0NdN4Ydj
         fU/zJJnwJ7Rn82Ectu8NJaW5HAgHPfNsY2btnaBdXEEhBaFf2OutZ+/SWjBdvPCIj2S/
         xdi2nMgz5z+v7zhIer6w/SDYBe0Ased/Rc1TsdSmVhfhkxD9oRZ+LuQ6EYtC2wQHwo3y
         rQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868219; x=1794473019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RLuavaIe5gsi0YNs3IsCVenHEzYUUHTZ4thktTrcGn4=;
        b=mbyJ9M2lET9P2IxxnuBLGkFi1ztDOKpgIhGBthOeOxR7YbnPpNN5pGzs9BDpjEEXtg
         sl66J3n4zrFtDrnkVFgWxa6A+rw6ZlPo0tHWWkCzyNE8i/sXXoSvgvS4g8qbRuqmRLU/
         kUmx4G0V7ptpj1yu6em135wUsr4YsYx+WzdiVQsjkKT/nCWoKdzeMVP3G35smJqohMmq
         jraMMyPqpT0cyjCxJ9S9UfAb5KUkQq/3lFLdulwnOxgLqfxhw1ACB/9zUDZoMnLYZ5oW
         1RAa6z7WtJwuzciFnjmc2H3VuHMKWeGb6DIrNROvBncTUoURVRX7BZYX4eOh51D+GbEI
         TZ5w==
X-Gm-Message-State: APuU4Z9T2kUp185DFRIedfhVapMBVxwY+M4ZAAJxBRK+SGAxUgf4KDpo
	vcWUUI3PtfdvL30GiYhxLWxSoBqItY5tzkuagyY44Tu/Urky4ZAznU9lGuJrhUPvMJPWU3EEOgq
	UXS/QADw=
X-Gm-Gg: AYBFou1tUyF3l2IqS3FBh+34ueAK3VzojCWFEmhLhYItN9G4KmX8b6koITW0GVzAW4f
	JSaDcZn0xIkPgyYow+8UqnAuS41mWCAndw30cbCSjauI6EzsTAZ80uxFFwn1gnJyYD0C3SPjFEN
	AT1fk8hFCR3gkkHC/qsZIu+zGphZrRkKr6dpukTFmRyYupxd0/FHF71ks72c/yxchKVMpBI8IxA
	zgavTRuZIMy6B2Af8xQ00zJVm5XkPtkuCLm7J4ZMeMzd7bGMtnfvFt9ONV6qscGFrRjWa3V7VzO
	Y2XwJZfZ8OqhMhvoPTifaf9vL1ELAKCtSnkJ6yOyPXBg1+xvc83vlmYrgwVLRxlpRdEhbX7w6Yb
	J1RYTS1T8J+yxm6ceLYrvo60Qi+L7wEaPc7ycd46kgPnkz76MsgRHZjUlDk6KX9sp7pDVtFIDuz
	DWhZwnIeV//3h3uGzGCOI+3PAQyAV86mcC399d40akqAgf1oAjk/5f17YrnD2veboHKll99ZIs4
	yLmnBrtdHGeOqtmUtVyxhQCcIuGggcwfLFnf/IGy2oMXmh/4S7KIVfP6LAqE710Xu746eZhSrj8
	xlnucaDb+X1qIaP7rH5IelIjnNIXwtkS/unvwEK5B7iLOMaqaAl5dZq+Ts1udMERptxM6PfQtSK
	v5qjXiinGFetVK/0DGsnLrcieXHzk
X-Received: by 2002:a05:6000:4a07:b0:48e:68d5:81a6 with SMTP id ffacd0b85a97d-48e6e4f53fbmr44786394f8f.34.1793868219328;
        Thu, 05 Nov 2026 00:43:39 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:39 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 05/60] b4-config: add send-prefixes for blacksail
Date: Thu,  5 Nov 2026 09:42:24 +0100
Message-ID: <370108b2607105885c26b30a3c55c43eb825d478.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249464
Content-Type: text/plain; charset="utf-8"

From: Paul Barker <paul@pbarker.dev>

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .b4-config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.b4-config b/.b4-config
index 41094218531..faabf5333a5 100644
--- a/.b4-config
+++ b/.b4-config
@@ -1,3 +1,4 @@
 [b4]
   send-series-to = openembedded-core@lists.openembedded.org
   prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking
+  send-prefixes = blacksail
