Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30085.1793868250310760270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=c0Vj/XGb;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso688977f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868248; x=1794473048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=olasf1TPgGxv438wfFfq8FNYByPjYHqvkiva7jmxLzc=;
        b=c0Vj/XGbnym5GHz/ILYIPCapqY1QXTr1Y0LtWfLKL2VFosEsLgO3qjQo0eIk5tuqjO
         hrjzN8Z71tcBPx1BHlRtN9xYI86GCZvyFA6ZOglfr/hLfTqclhcb4e6LFoHCXZIOHrfx
         5K2ZCKFybbe2425utS9gqKGvjkaOJX5MwSEUm2UAeX9zR21tNlRAT3Aq1B+L3pfa3rPH
         86tkj4hYsPbHxpRD0121GSb9+4bT99Wl3QizF6bBbn2ws8uXfgDPJKwCwAA+Cr6ZfpG7
         QGAk/BzhORTsgcNkePPhSVb38iYehGDcN+FIvtYQo7oPluSMnWizldoiUvy5A4Q8pwUv
         8uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868248; x=1794473048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=olasf1TPgGxv438wfFfq8FNYByPjYHqvkiva7jmxLzc=;
        b=t273SFOgbrGEV8ka73DUubN3SvDKDvnaZ6btSt0CcTnSWFQm360s3HEQyNDxs76Cjt
         Ih+l013VnWhPZSbOfuPMBo8Mgq403UJFKnnG17H+pUvJVSmyChVSoM+KTPEoZyv1b6ok
         WZsQGlFAlBlOKGUgu4eZVqcE5uawrRCVF3HmPdXmDZWB89cKcizBcKYocaksXZjH6zja
         MJJatsJlY/Os/XjuXtKoBr7K+deR73FneqMeYgSUZ88p43k5mA5tCB+pn0ThmmfSngKH
         z1B/2l4hCDmQDy4fvrtUdluscuRkDTb2uWep8vMIvxbg/0Mxb+rf4k3PHJgc8Ms8vNBl
         MjLg==
X-Gm-Message-State: APuU4Z8HHgFZXkg6o2SnwAa2WYALltaNLxyM8a0n8O/gP5myLa/74Gic
	kwDs+vuwTIeANwAVpowEqAYoTlwfuTMeKIB0+0hyj1ZvUqqbgMcjL3Bn0pbspUuomiMlyd9sBjE
	bjuum5B4=
X-Gm-Gg: AYBFou22voSbJ3OBfsgHEdp80MO9zjU40Ca842yeymLF5PkfuY7XqBXTfZ6Xfb5XEdJ
	Mk7O6ztdgigSJlNk2IoCEtCbuB6+B0EUAJAdml+xSIrpFXpdMM0iVW3RFJxMTl6/VUtbvwkycDD
	Q8bxGZfcFrOO5D04sdqBT+Tv19z7w+64mcvoI1vl92usFdH949R+kCvAAVvJpvTyxAgsdj8hU1y
	Ug5wTVjw+D5+shy49jU0Qo7p7qYWwjq3P5iQPDnKo8x6xCE8UnV4LA//PvXlFkfuLVWwmtFIEJ7
	H6RAgtY2/fgZeVy7If1RNEYK3u5w3rYV/EHtJj/NWH9KIn/X3elwBGDH8958HLmqLG8dGjLBAy9
	ZT5p+uXcXxzUI1GakLEYgYyNTEi78YiJ9pJbVXDWFCqYF9Yz+9NpBbnd4WwMpnpXkzwcUy5E72F
	okP8fScaww3NaZ7mM3MP9IYuvRBYqP9DMKNEtx8CYHkP+xzkAnJzcXiU1jorojOjmmbvkfTBFBG
	bdWNcvsDIesJRg9u2MUQs5i6cBSO24hdaenI6tP0K8adAn5fL+06JRSr61ATgdnNqKi8EdtvlXD
	OV2P0MFnxHvNHMw57ObS/fKF+U9IJOME9LfCkLdg6HWz4y4KeoiLkGUHrlrb7Hzm7Sc6S+Q6fd1
	4Drl+HlD4ZLSXrkZLD80Rl3b7qevSXA==
X-Received: by 2002:a05:6000:2088:b0:48d:f6d2:9c88 with SMTP id ffacd0b85a97d-48e6e4f8daamr40857330f8f.47.1793868248528;
        Thu, 05 Nov 2026 00:44:08 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:08 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 58/60] archiver.bbclass: fix format string argument mismatch in fatal message
Date: Thu,  5 Nov 2026 09:43:17 +0100
Message-ID: <04d0ab92c61196df2824facf9c92fd9ce230dc10.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249517
Content-Type: text/plain; charset="utf-8"

From: Maxin John <maxin.john@gehealthcare.com>

The fatal message for a duplicate 'name=' URL parameter has three '%s'
placeholders but only two arguments. This causes a TypeError instead of
the fatal message. Add the missing argument.

Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0570d885bd48a9cea5df6eacebee025e4c26812d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index b274c53e799..b2b618023be 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -228,7 +228,7 @@ python do_ar_original() {
                     if not name:
                         bb.fatal("Cannot determine archive names for original source because 'name' URL parameter is unset in more than one URL. Add it to at least one of these: %s %s" % (tarball_suffix[name], url))
                     else:
-                        bb.fatal("Cannot determine archive names for original source because 'name=' URL parameter '%s' is used twice. Make it unique in: %s %s" % (tarball_suffix[name], url))
+                        bb.fatal("Cannot determine archive names for original source because 'name=' URL parameter '%s' is used twice. Make it unique in: %s %s" % (name, tarball_suffix[name], url))
             tarball_suffix[name] = url
             create_tarball(d, tmpdir + '/.', name, ar_outdir)
 
