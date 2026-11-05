Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29829.1793868244166582639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=FfWrvDY3;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1372426f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868242; x=1794473042; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDe0U9tiqKK6MOPEUXhCGn/g9Rvo63YPQBnztoTSJ84=;
        b=FfWrvDY3woC+PNHwaJ+FFqQOjjWNlcORakSpiquCX2BlNXF9l9ldcHBu5vibE5/vl0
         O8FiqIdz8XPH530a0i/i9TseQrT+ke/aozR8Ge3AYUpXQTG2vPzE2HVcyFpuf6HRI5lh
         Iuy3aryKVqwf4/vHbFmqpuSzcJpHpa7/l77AahamrEzTkDiLDGCd9L8xpOxaev8dVd3J
         EPyVEHaVOQafbbF8SJind+UK+o0Gh/0JcJ9/X20rGIGjt/vWFW2A0ZGm+HXvWA3CBv2c
         SLJjOSQLqiDMaWbkPnXi33fjKUTKq+HY1rYRqL+LDKnGt8G4QwTvJqw0luKN1ok9VyQf
         ww/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868242; x=1794473042;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDe0U9tiqKK6MOPEUXhCGn/g9Rvo63YPQBnztoTSJ84=;
        b=vWTBAdGwLoOg2toAjKWR3jTh8NXpEMs4teIF0wRhdx2hko8QoNroK15GnPZ7RO9b2W
         311lLOw+T3y2cMDr2bf/JlQMkh8XIn2beIrI4Zn60bRDU/GR+RqXIt0gm3wNj678fYcg
         WdExn1/YUDjd8Nb6qi2fObboaDyDIRpnDviDiuRGAGZ4RcERhzeSEChEu+rFnfBe2Njx
         NgR9Z0Kn9+Q4vYpS0YpEO+DeRwYBISKLVsWvExLUtTGHNOcOzy+/xsmpmp+g2Uw2ZfGA
         6Vs5B7uOgz/Itfpp5icoT69xXDI+sYATKaV1IVqlxn4B5fMmu1DWX02qIjsw/Fz2Ds7O
         MSBQ==
X-Gm-Message-State: APuU4Z8Oquvci1QrbRj/MDUVcenYNW6Z5YWYDNLDETLwwbciCcrdFLzU
	XwBLKoF85nONaN7p0UTvNgz/l9f5vUf3ga5D8bQTxa1r0qGbuWTQl/eDY1ejeeMSB8qDSFrskPt
	SnW1oqag=
X-Gm-Gg: AYBFou1yucVc9JgmD4KW55xjJ5VKMMMJXOIYolhugYyHRqH+eGcvpe1jPtMckWno0Ah
	QKCpjP0zFQ2C2BWhnlIfqB+xz67+7Qoh5H40XPC1Mqln0SmOUKrO2FjjCaaNzabvg53XJy6GGPk
	NHgozCH9QkoVm4cklIAiAHBh89sX4DpXJ1w0u9JodgakUBOihK36E4526BZ5iPBlBFnCPkyqtuF
	YxPAKYDJCndj8PA5y5QAHfcbZzxFESFsLyMd3k9ZpGDRLUaBgJPwZquuWH5Az/pP7LzCR9rX5wf
	ORXPBdrfnMJIc6iXCzHcpA3fZDckMJFNuwFtD4CrJJiMSVTCPv6yZlzl8muBaf6pDuzNxsbu6YA
	YAn3tnd6oUvPsP+ZQq6ZnlybKUXX3w3UWdFA6iswLrNa8DQyUL4G8elwlghSqPpWN3eFEKcfyk3
	z+WTJmvl0rtyAcxVJpLjmT6VuIu0X9rpijsmc+ElJJKF1JSNtOoSY7K0Wi0V1vs68f8hXuDMHF3
	6L/kgGYJ6l63vc5wksuzcC3JvlD7xSCMKj4MnPYbWQd0YS9MoCBF2ApG6wWmUVWqxJqPS8d23aD
	QoisAXnc+OTDnwAjmZ/+j2ioGgpqrOLt8riYBczKI5l5rFoq0xVJ1M7ndxOFdipR9MF7WPWKubp
	Erxnfj2a96nceOsl0t1X85Y8CTRvI
X-Received: by 2002:a05:6000:4b0b:b0:48d:db77:d124 with SMTP id ffacd0b85a97d-48e6e2db9e1mr40048585f8f.6.1793868242383;
        Thu, 05 Nov 2026 00:44:02 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:02 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 45/60] systemd: merge group members from /etc/group and nss-systemd
Date: Thu,  5 Nov 2026 09:43:04 +0100
Message-ID: <cc97d91005f4ea2c4c78da088109809296dd8ebe.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249504
Content-Type: text/plain; charset="utf-8"

From: Martin Hundebøll <martin@geanix.com>

When systemd is configured with userdb and nss integration, it provides
group memberships in **addition** to those recorded in /etc/group. For
those additional memberships to be considered by nss, the group database
must be configured to merge the result from both /etc/group and the
systemd nss plugin.

[RB] Reference for the recommended configuration can be found at:
https://www.freedesktop.org/software/systemd/man/latest/nss-systemd.html

Signed-off-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4041c0e84b3e98841bca9ab1d35b763acc2c0db4)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/systemd/systemd_261.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_261.3.bb b/meta/recipes-core/systemd/systemd_261.3.bb
index 1f482d988e8..f7e588a1968 100644
--- a/meta/recipes-core/systemd/systemd_261.3.bb
+++ b/meta/recipes-core/systemd/systemd_261.3.bb
@@ -898,7 +898,7 @@ pkg_postinst:${PN}:libc-glibc () {
 	fi
 	if ${@bb.utils.contains('PACKAGECONFIG', 'nss', 'true', 'false', d)}; then
 		sed -e 's#\(^passwd:.*\)#\1 systemd#' \
-			-e 's#\(^group:.*\)#\1 systemd#' \
+			-e 's#\(^group:.*\)#\1 [SUCCESS=merge] systemd#' \
 			-e 's#\(^shadow:.*\)#\1 systemd#' \
 			-i $D${sysconfdir}/nsswitch.conf
 	fi
