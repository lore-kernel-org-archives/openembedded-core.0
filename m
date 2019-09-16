Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7017F296
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 17:49:51 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id q10so1145743iop.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 10:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Nl7ouxTlDa74TalLvKPBgiYemlfRFE3TXGpNTKPMMjE=;
	b=AjVSmkaCeTCPyrmJUnEtzZhYtEv71XTXh00fh5vN8unlQt98uAxpc0z4kVD5zThbHw
	meM2SQDL2wXlutNmgGX1ajwISVUkjJD5eYQp0Jcn6+Y4JRDPCnRJkVD1P8d7lGy4XkHt
	cNts01cotmoU+N2BD83+IHOf0sUzJWxyu/p/NCk+04t3282Ze0XVi6oKyolMx2wmg0jd
	jqAY1VN7FfYeL/1K/GSJ+jKQXj2G1/C1yPYRYjGqtLAxHrPg7MIGyy/FJfLdBeFK/eJ6
	oreemxjtwLRo/fxI4dpncJ9Ii1q+ZswejWhj1wO++tTS5YCye1MPQUcWPpYEUNAiDthu
	B6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Nl7ouxTlDa74TalLvKPBgiYemlfRFE3TXGpNTKPMMjE=;
	b=C45PgMKa/tPWwzX0q68smWlL2EU18g2csO0x0MlBlGWiDfzaYyXbeIx7GV65O0/Dk+
	+luD9cV2RwEbOGEc5QC8sztd4Ra47cDjIdiwr+IPVFcJ7JnkRO5mr0ocrmE3DKdBxYKA
	BpxIN0k5T9VO4d9JzCscFyzb7ZRxyApBixJQD991tHj2IGUAkaZ23Y0a7gJrnEmlnPQT
	YY37P05WfGVimKnf03jB4NI7VOyW1b5BVZ7VZKeqSldWwmslrMLrvHM/hetfEYxPsEfY
	JECX1ZvCSRiQL8NZzwiJ+4AJ4DIWwfBZkispwr2bTmvrOsJhW837thPXqLuSoZR0DHtR
	ZSWA==
X-Gm-Message-State: APjAAAXsXdRuwC+zrlHnxV/83zLN3OeDLEEUboAhtieMkUzrhlEUuv93
	l3nlsLzfVEpmBRhf9LjjUhByCIv/
X-Google-Smtp-Source: APXvYqz+JdD6CywuxbrhP/S3IEB8KTYG0Hn+h8zQPmUmU1lNK8NSE6lgYOW9asNfyDfqhma+5E9Wbw==
X-Received: by 2002:a02:a808:: with SMTP id f8mr1263725jaj.42.1568656192370;
	Mon, 16 Sep 2019 10:49:52 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	e139sm48739471iof.60.2019.09.16.10.49.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 10:49:51 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 12:49:44 -0500
Message-Id: <20190916174945.14562-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190916174945.14562-1-JPEWhacker@gmail.com>
References: <20190916174945.14562-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] sstatesig: Update server URI
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
X-List-Received-Date: Mon, 16 Sep 2019 17:49:51 -0000
Content-Transfer-Encoding: 8bit

The server no longer uses a "http://" URI, since it has been updated to
use a different protocol.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 0c7a6f5ed84..b1ef5c039b3 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -264,7 +264,7 @@ class SignatureGeneratorOEEquivHash(bb.siggen.SignatureGeneratorUniHashMixIn, Si
         super().init_rundepcheck(data)
         autostart = data.getVar('BB_HASHSERVE')
         if autostart:
-            self.server = "http://" + autostart
+            self.server = autostart
         else:
             self.server = data.getVar('SSTATE_HASHEQUIV_SERVER')
         if not self.server:
-- 
2.21.0


