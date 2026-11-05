Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30081.1793868246107514885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=k6gWD9Fj;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4919a880834so147167f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868244; x=1794473044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JDQpJ43WaO2iHkFhxPQi2uJ0C8S05IWTN9zwv68ncAo=;
        b=k6gWD9FjhNVDOBht4J6IMsotk/xcT0W/ACQ6VVQ6WQ9PY0oyln+oKLku2KmS8WUYfF
         XRX6UY2Nlt+7hhzI2VA8vbcNKW7rLJCYCmjYq1aZuxbkB13gwyqinQbq74wrzVTNRWD9
         LdR3tw9uuhh8zKyCZjQ3gATytVfmjsDiNoyhgl/Vd+v2isQTZ2ji49it+Nzf69rFhjKo
         lfLpT/9ui51Vlh+IeWMr6Oec8BYiW8v8CxwVR0izmdE2GyQhpW5ka925JLIDwUMivd8E
         1hzndS4fVFkhKklHzIswTfc25mjo7mG5FddY3hvBt1XFB/Etkcrn+zU3zDOSGjx12xZd
         nf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868244; x=1794473044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JDQpJ43WaO2iHkFhxPQi2uJ0C8S05IWTN9zwv68ncAo=;
        b=BedTHeniUrErhBoihVFwQvUqw+gO/m9Aymyy3lq0NcKcGTHjZItuhcafqR3hel6pMG
         wHA3+EU6M0AwEX+1F/c4nZ3kbzeRqux63b1dobeqZemKSF64DpreGYhkqCGovRHY+D1I
         7y3a57P26FpLlcT3J5pD/FQSz63hP677p1oW6NLUdFy5AP+ojiOa3PpoqH6tRrR+1NDV
         JOUho8SH5o0EKAaVtngFo2hi73rztyV7Asw8fHysQCTyLbd2HLFl6q0Xp0rPoaZ1NnVb
         trtbptAJH7PATFnn8j2qbTQUt6ya45r10VNRRKV79aCHmWle3Fs62j+xGo8aeU3RQFii
         4zVA==
X-Gm-Message-State: APuU4Z9xWR4PQTZ5mInING+391vQcgM2ni+6Ilw1GYLpDXz6UmVmpN3H
	nN0ilG3ci7TWdZBRlnzXyh70E9i/WgXvoyI4L5XGpZfY879hECXCGH2lo9DhlChbZWIKOb5zjWO
	qpnaLtLs=
X-Gm-Gg: AYBFou3iuzoF/+csR+m7dP4aLbguU0farpyOSRzAP0ECt6XGWQplS1an0Ru6VQCmCTu
	RAv/86sC1PxUzXyvi99t6ZHrsE4hTTkoxUxdXZ0t3KWrV1nKOit/MqfqQbxcKdiRkWusq/jF838
	UGhLXltkE6thrWFVIfv8Yb0Kpdex4ttzKqOscW1JFDG/MKgImzA4oZepOtBQsLtRBcyzUmDELLr
	YJSKuRM9WriET2gFShygFRZbdK1KWMoiUlhSXplnq/EJg5eKcMajJiQ2R+G076XfTY5xvhoOpbK
	EFGWnmTMoP6c1YiTBehSSVm/eSzJRd+RRhfnQsgClhKoHojPgkb0lyQ5H7Wb7j2BkNktvcyB7PO
	VvnOSKfzbXzioPlvOIeRu5U+dtbUHtyNsnGTcXKS14jS5O7gI2TzmjOkJxAzfQo4qB/o9NHpJfG
	ZShFqAsGaegXZ27rRauXEs2lrLiGJzseaoWrzWVOnnuNmeuRU9GNv0p3/QwXiqCO23ucGmSNyH4
	eBClEDCcoey0zJz7NofUvmsdYLb2pWN7jQFKObnnYhIqalDsJaIBYtjnWy1gnBZ115qtKAoRaDa
	mDEQacpac3glbi33DVacAMG262upqWjc7n6s5lOWH4xu/2eJvcKU0KUfR+CQuf9vk4GRVIYqMLG
	ilpGFNeWzIfotl3Avz33RSfh210k1
X-Received: by 2002:a5d:5f09:0:b0:490:71a7:6f3c with SMTP id ffacd0b85a97d-49071a77019mr5573184f8f.55.1793868244227;
        Thu, 05 Nov 2026 00:44:04 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:03 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 49/60] populate_sdk_ext: Fix locale error handling in SDK
Date: Thu,  5 Nov 2026 09:43:08 +0100
Message-ID: <028ff91bf4bb2e96ddf8d1aa7c1ed1f603c994d5.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249508
Content-Type: text/plain; charset="utf-8"

From: Richard Purdie <richard.purdie@linuxfoundation.org>

During automated testing we occasionally we see the error:

"ERROR: the installer requires the en_US.UTF-8 locale to be installed (but not selected), please install it first"

This is puzzling as the locale *is* installed. The use of -q with grep in
a pipeline is potentially problematic as grep can exit early and cause a
pipefail/SIGPIPE.

Tweak the code to avoid it and a few other issues (add quoting, handle the
"." correctly, match a whole line).

[YOCTO #16198]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f290e76eef3bd175f71414b7f78aafd0af5e0ce2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index a1188da9697..00b41ec0cbf 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -678,7 +678,7 @@ sdk_ext_preinst() {
 	fi
         # Check setting of LC_ALL set above
 	canonicalised_locale=`echo $LC_ALL | sed 's/UTF-8/utf8/'`
-	if ! locale -a | grep -q $canonicalised_locale ; then
+	if ! locale -a | grep -Fx "$canonicalised_locale" > /dev/null ; then
 		echo "ERROR: the installer requires the $LC_ALL locale to be installed (but not selected), please install it first"
 		exit 1
 	fi
