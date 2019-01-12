Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5653E7C076
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 09:23:00 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id n18-v6so14991522lji.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 01:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kjp9bI+t1liSDMsI/0qGdb7y2j77FHspKkrquCnwgHs=;
	b=MPV2+kq10Muwl3/qMGeEiZXuRNtoAj1gWGfjad9e2kKt7J719R7SApSmvjV7ftiZkn
	Ew7qTQxB4VcmD10NZVqoqbtB4Ud4XmxL+QV9wD1UC6E22mk1FjBZPYtDCr3GMBG8diJ4
	5HmP5d+sGl5ITqHL7IL+AMniENLU5x1qeT5/cPYWSuLqpmOcNcUinv34djwV2KzHlQGM
	iSHVo24aAhBD5K9hN5KjvJuuRf2ufhIkDZjCMKl55YoWECGObR47WFDpD4EBcFONIp7q
	PmD33ZWrlN13cvv7ZdLpj+8hpVAGvp7eRBYBF9VluDzYuZu6fMnY8gHK7G1sfo8+c4Im
	ISEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kjp9bI+t1liSDMsI/0qGdb7y2j77FHspKkrquCnwgHs=;
	b=pJozAhD63GkpnaZTRWW8GiVWGuMU/jnxhVPiRErgl0TESwQJrfGFJFQV9OKCXvU46I
	c7COcCJXkLa+Lj85UpKHd27bC3NGGf3LhVAR0bbTAV934AdHu86aZmXSyrDlTUnz8MlB
	YVECTg5GHPxvTj2BScDYP5KdIje0bsjHec1B8PH6mIkJOAkdV1xSiF87zfEHZLmwD9UF
	FHa3vDHcZ8GO2+4Ai1xoyeJU97bHTjEDoMkND8O3YDTm/hH8KHVoHRAfQf6tF+UZNCf/
	t2yvW82VfXfdGktAJzL0qlgDyVjJXB5ouBn3/RzpL1UdjU+IF7PtJDkRLELOu+V6gniW
	jzlw==
X-Gm-Message-State: AJcUukeXJtGeNUP7cBnXurb+5Urcike71C0yHuZ9lK6mdJWEBinlakXZ
	1MZoP5ECDNoLHSPs+BaylOUhq4P8
X-Google-Smtp-Source: ALg8bN4zJUWAdUZa90v7GnvW4rEmKUxE3lWZ4AVHTHH+ZEcXRFIkT3zSTEtsfVhvePHnsck8iih1Tw==
X-Received: by 2002:a2e:8ec8:: with SMTP id
	e8-v6mr8430295ljl.162.1547284980849; 
	Sat, 12 Jan 2019 01:23:00 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	q11sm14933726lfc.92.2019.01.12.01.23.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 12 Jan 2019 01:23:00 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Jan 2019 11:22:49 +0200
Message-Id: <1547284970-20783-4-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547284970-20783-1-git-send-email-serhe.popovych@gmail.com>
References: <1547284970-20783-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 3/4] mpfr: Disable float128 when building with musl as libc
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
X-List-Received-Date: Sat, 12 Jan 2019 09:23:00 -0000

Since it does not support float128 type.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/recipes-support/mpfr/mpfr_4.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/mpfr/mpfr_4.0.1.bb b/meta/recipes-support/mpfr/mpfr_4.0.1.bb
index 2eee76a..ccf7fdc 100644
--- a/meta/recipes-support/mpfr/mpfr_4.0.1.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.0.1.bb
@@ -16,4 +16,6 @@ SRC_URI[sha256sum] = "67874a60826303ee2fb6affc6dc0ddd3e749e9bfcb4c8655e3953d0458
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 
+EXTRA_OECONF_append_libc-musl = " --disable-float128"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


