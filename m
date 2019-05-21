Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 35C7C7E18B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 22:21:09 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id y10so140895lfl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 15:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=JqV/2KeNrjDg0mGtCa41NIt0APK1nlar4nhevPfFt0A=;
	b=FW+G4SxwDQFKJFFyC6SqT3pNKi6LW4asj6c7tj40+nNMav7Bi4GG7MDXCknuOYYGqd
	CMZpz50/NuOPiKzIxUB4QbyjWSuxAtsU+gERhNaREt07q0wsJo9YI5ExQOxAH6vR86CZ
	/nErq8r3WQD6nJ0qesxgkNBkp7jMO59rjLkk4Xvjmh4sz3bj7Bk2y9WmJw1d4ImRp1Pa
	kKRFJ2kfWiHNqtES1tbJwfGjSqz/TUq6oAoTYMYP/QPMqgls8WXZPX00KzPShZT+JjNt
	Fon9K5JdkrSc0zTdjNXsnTtZKK15+/xkn+2EYLFF1kdbcrecqwp2iI5Nqz9YBGZNKYwq
	Ys1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JqV/2KeNrjDg0mGtCa41NIt0APK1nlar4nhevPfFt0A=;
	b=eLi8enQ8H66PdoGaD1EhuVEUf3g+aUy+1ZZd6FHoDxFl5vaeLiqgdOmHX7TEAngkp+
	NgJv57/hwpWGrN0eCmJaXqsM18SGe62pTfPAle3+M7tOtLtHuN+Bo+g9U3qWt/PXcfGw
	Y3iLbcceAzaEF3NXjQ28oaCCBPdyr5xkVZwxzXfcRQYkgzzk8K4E55gVbeqt2apsffDq
	6Hq97VuP6C3Lrj2akHFvMNmxTsBg71ow/0cV2Vza6Lw5o1NF3rrIGo1kZLgAbn2nweHJ
	97dDZOy3i4u2rDLs+pjqAbol2/k+cijVv4nWpP0fwaOLReFRnhQ5HrF+lFdFK0MPIqox
	5N5A==
X-Gm-Message-State: APjAAAU0gDUTg0gsyTABnxSx2aBCf6f3KjybXutK7J553q4GG3nJ/HOm
	UtgKXhoO0ZwnBUdsBCBbPvEqKY8UoiQ=
X-Google-Smtp-Source: APXvYqzQe7vZPY1jU28hNfO+c1jAikmTG/Pq+siyDgXIhM/9+shCMT0uYMdI1Oe1Z6M6DBzlACbN3Q==
X-Received: by 2002:ac2:4a8c:: with SMTP id l12mr42017428lfp.53.1558477270351; 
	Tue, 21 May 2019 15:21:10 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	k20sm4989077lfm.30.2019.05.21.15.21.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 15:21:09 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 00:21:07 +0200
Message-Id: <20190521222107.9809-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxcrypt: update to 4.4.6
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
X-List-Received-Date: Tue, 21 May 2019 22:21:10 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libxcrypt/{libxcrypt_4.4.4.bb => libxcrypt_4.4.6.bb}      | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.4.bb => libxcrypt_4.4.6.bb} (93%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
similarity index 93%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
index b44c07b4d0..043c1bdd40 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
@@ -9,10 +9,8 @@ LIC_FILES_CHKSUM ?= "file://LICENSING;md5=be275bc7f91642efe7709a8ae7a1433b \
 
 inherit autotools pkgconfig
 
-PV = "4.4.4"
-
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "3b251d4e1af66aa7697c4ac96c689f996fa90c32"
+SRCREV = "398943774c5ff38baf1bc5ee088855fd8983bb05"
 SRCBRANCH ?= "develop"
 
 PROVIDES = "virtual/crypt"
-- 
2.17.1


