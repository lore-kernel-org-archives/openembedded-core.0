Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11226.1793366086525690196
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 06:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=GyirvcXK;
 spf=pass (domain: snapchat.com, ip: 209.85.128.46, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so6052705e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 06:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1793366085; x=1793970885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3YthVZN02HErDzmL9u+GPIGrK0MsSeUvdU9mb8Y/b8Q=;
        b=GyirvcXK/vXGsU/dtt7gHmCwkJzasgAzY5f+WsRnPID3VP61GZtlFfZ+SvDLqrF9rg
         yUTMPl0aHgbLIFEfqflFAFgFd70LIpeiRpMLIv3DETudKPB7l/03B6+SJNHJhthrD75l
         yosHGWgXhZNeY9gcZlR+T2t8DusS2Jo8WITaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366085; x=1793970885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3YthVZN02HErDzmL9u+GPIGrK0MsSeUvdU9mb8Y/b8Q=;
        b=VKRxt9vr6AeJPJ8lI9wpSEFFPMLkn0+IliANPOYuLOhzpQuJNViO+JvNco8onWbawC
         Qfhq3aZHCLgdzjPeQ0Vm0EJF+KzqIrNJHHN11zaTVLwH+8h2hgCd6ES454q/FMCtUU3d
         JXvV24wyeHY4U+5UP3tWP8p5NSqXc3pCZU5bUBZCqBqZa2vVOaWh4Vmhjw7abgov2FB+
         rHd1mgidD8a9oq4nwIY4pl421cAMMRio+vXTif3sM4sTqwMlaylk3HJKOR1UJYSwuRil
         d7A37jnepKTm2ahFaHBTL4ixRWzmsb6kpLPZwHxFP9l3S5e53cdTQn2Fc/XE32JRfrVs
         RD5Q==
X-Gm-Message-State: AFq9FYJ+uiU0qAKtzhOd1T3G8ILfo18LI/5wzk11oCYbNekAmIjwlABW
	WDyNa0yUOZ90EuUdJRWZ0kKpZglFaRw86qCJ/dx3+N8Qn+kSnIQ+fwtkxCkU+A1XJQznIsg4po9
	Jq48mFzg=
X-Gm-Gg: AYBFou3RYekpgvX2ixfjBAHmB7tt7hhT6u8HTI9itCcUg0a+c49yWpE9XW1MHcuFagW
	sA7SkVactK7YRR2cEEAGdqmwQ6YPfbkSd31g74iVmP5YYmybeM3t/GxW+ElVfZ8sAx77FFgetk6
	N53h+yf7w7gNaSSxo8PL4FtR2OIlu7bBnDQlH0iNAzE8pSRTiBlmzk6arWyXuHun+Bpedm0miK4
	DsmhMIPw6GiZTHjronJf9CDwnUK/ej3Y06mH+kes8uDkcvekmdm1uisC6jj0orh5yN5iuXh0xap
	Ar8c4JNspGpieRKI3yaklj463pQLc2/BgnH1oQ2PSZehv9U7n+vD6yyxxmWGRaMF/fpnet+yy/e
	By9pbJ9vkzQGSK28nz/Qlju0h+yH+fpu+xOfp2vsMyBdN1eAdUj+MGKmOPfzMA+8S1gqKyXDXsR
	ZSbBiqpq5sfVA/NCE7g2PaY/k/8q1URWtpIZrQOu15D/wN2eNpi29rw66ehr26HCGj6Z1Jk0ObY
	yHPWT5Hd2QIcFPSC0GjY8Ip9LzQoOnINL237xETuhhsij8ogUuIVY6v4S3mLIG1ItNBixFOLHC0
	eq8Na29PB23vZPgcXww/vUCM9oCZgGd59iDUNtOq4iCIaV01eROcqB56hO6sL+/UPIuO3aFb
X-Received: by 2002:a05:600c:3554:b0:4a1:f7f4:7cf2 with SMTP id 5b1f17b1804b1-4ac1737c474mr48025395e9.17.1793366084540;
        Fri, 30 Oct 2026 06:14:44 -0700 (PDT)
Return-Path: <ecordonnier@snapchat.com>
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3f9sm3477642f8f.4.2026.10.30.06.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:14:43 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] archiver.bbclass: warn about sources which are not archived
Date: Fri, 30 Oct 2026 14:14:34 +0100
Message-ID: <20261030131434.2267687-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 13:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249037
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

In the original mode, do_ar_original archives a source if the fetcher's
localpath is a file, or a directory. Any other source is silently skipped,
and the source archive is incomplete without any notice. This happened for
example for shallow git fetches, whose localpath is the clone in
DL_DIR/git2, which is not created when the shallow tarball is used.

No fetcher has a valid case for a localpath which is neither a file nor a
directory after do_fetch, so warn about it.

AI-Generated: Claude Opus 5.5
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes/archiver.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 0400d6e373..3ba5a39d11 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -231,6 +231,8 @@ python do_ar_original() {
                         bb.fatal("Cannot determine archive names for original source because 'name=' URL parameter '%s' is used twice. Make it unique in: %s %s" % (name, tarball_suffix[name], url))
             tarball_suffix[name] = url
             create_tarball(d, tmpdir + '/.', name, ar_outdir)
+        else:
+            bb.warn("Not archiving %s: its local path %s is neither a file nor a directory" % (url, local))
 
     # Emit patch series files for 'original'
     bb.note('Writing patch series files...')
-- 
2.43.0

