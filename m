Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tf3km-0000fe-JY
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Dec 2012 08:14:16 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so1282660lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Dec 2012 22:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=zriSuTzHaAzmmv61QhvULzNZ8ka8CdWKm6cnh3SEsDk=;
	b=mxQZPevxnBDBSP7PrGmW38xW2lvRz37Ys5gvM+SpN9E2otNyX3ZZRO22Wc9JaujnJk
	9qr9uFvseJfv0FcXduqNEXVEmZbPys5ATUDvwAYCYC4OZH4pHFZ2aP4GXW9X7urnqkME
	vpApXMPA9Qlp/uyH/aZ0p2Dbwdx3xhSepJT8sidzZAQJbeR5s+aQ5lV1qLUr+6WPtBMH
	0HZMyRJv8wy0iS9J9zQ5z5gOST5af2RgSUeohJ/xd4YWXITvD8VcF1FPMmMiV1nJNmYv
	58PtE/Y6qk9nRNQEAnz9S8GMVrTE4sFtBWQmDODbY6ZaeHL7eQ6Fq0O7DxE9SMJ+oncp
	Tm+Q==
Received: by 10.152.144.10 with SMTP id si10mr5911792lab.55.1354431596902;
	Sat, 01 Dec 2012 22:59:56 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id l1sm3865273lbm.1.2012.12.01.22.59.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 01 Dec 2012 22:59:55 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1Tf3Wr-0004Ic-1D
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Dec 2012 08:59:53 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Dec 2012 08:59:50 +0200
Message-Id: <1354431591-16490-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: Fix libpng license segment md5sum boundary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Dec 2012 07:14:16 -0000


Applies on top of libpng update -> 1.2.50.


