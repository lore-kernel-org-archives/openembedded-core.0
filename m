Received: from mail-la0-f50.google.com ([209.85.215.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqTQI-0005eq-BG
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2013 19:52:18 +0100
Received: by mail-la0-f50.google.com with SMTP id fs13so6596558lab.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2013 10:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=7nEECYxPXFBwFZDZ2twYymO8xo/IUMdgXGW9WaLE+to=;
	b=XQI/Wky2vadl+/KCT5Yy88hStgho3xqVAevZipWWSgKcj3tzscj/kvTsff60Vz0jiZ
	PVwNut27bo1oUq6pQ4MMkBbVaIaGAR9IKJpZfxHCrfHZYpPO25oLDqC1p5+i+V6x0CLi
	fDOjJXFQPZW37kstw3HCGV8Nj4NtFVczJNoH+/h+DVdxzCsjs+LKVOpzJp/W3DytkGV1
	BphggmIZ9/DK8Lkuup10j7hM5IKGWK0iRCZmVwaYHORSz/TvMIABa4ZMhCGV0Q/ADqgg
	0LG13FHo7tfB7c3YE7VrQd+er9t1BZpYiacsnmltzPfDEedwKd1l/a97v0Fj7bSSACxo
	bvTw==
X-Received: by 10.112.86.232 with SMTP id s8mr19121160lbz.86.1357151835605;
	Wed, 02 Jan 2013 10:37:15 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id f8sm9368126lbg.2.2013.01.02.10.37.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 10:37:14 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TqTBg-0006CF-9p
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2013 20:37:12 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2013 20:37:07 +0200
Message-Id: <1357151830-23755-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: mpfr & gmp updates
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
X-List-Received-Date: Wed, 02 Jan 2013 18:52:18 -0000

Objective of this patch series is to update gmp to latest versions
before fixing automake-1.13 problems. Doing it the other way around
could mean more work (porting the patch from one gmp version to next)

[PATCH 1/3] mpfr: update to upstream version 3.1.1

gmp-5.1.0 compilation fails with mpfr-3.1.0. Mpfr update fixes
thath.

[PATCH 2/3] gmp: update SRC_URI and HOMEPAGE

Use gmplib SRC_URI instead of gnu mirror one. Latter doesn't
even have latest version available. Old HOMEPAGE URL gave
"page not found".

[PATCH 3/3] gmp: update to upstream version 5.1.0



 - ML


