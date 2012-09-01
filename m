Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T7sW2-0001VB-Dp
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Sep 2012 20:33:54 +0200
Received: by eekb57 with SMTP id b57so1293260eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Sep 2012 11:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=UjlUJI0+BLpVh9ab4C+TQgOuuFg+vXqpxkQ64GLJSVU=;
	b=gL9G2Jtt845tFOYoLo6/2en3nW1JhQYraoWre/0LC4hx5BU764/TDcwy0BRUXfCw13
	+mEoPXlLGMVg6E4Cn0b/ciw71EECscfs9OSi9m/abfFSej68UNZqNhHUI09BaYc16eBO
	xJg4KxU+fjZKHXKG9ueR1/Bcf/brpbiAsaGSh+CMp4ScNPiZj9L2A02ikuBXJIueS/hh
	lXn7I0sJMYgpFvkaQ0vD8zGoE8LxszpynfzmcmQhWpJOE+xAI0lllddKAfy5zCwCgvLF
	pC+ZWZktdTjdTMPrd7lV9uFWut/saRket1QxJXWjgP6QgnMXzxPw37uJV+iJ7mHDsh18
	5N7w==
Received: by 10.14.215.193 with SMTP id e41mr15351103eep.44.1346523696209;
	Sat, 01 Sep 2012 11:21:36 -0700 (PDT)
Received: from ?IPv6:2001:610:612::805d:630d:1d1b:1fc6?
	([2001:610:612:0:805d:630d:1d1b:1fc6])
	by mx.google.com with ESMTPS id h2sm22659399eeo.3.2012.09.01.11.21.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 01 Sep 2012 11:21:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346422229-61628-2-git-send-email-bjst@enea.com>
Date: Sat, 1 Sep 2012 20:21:32 +0200
Message-Id: <98F0F262-DDBA-44BB-9DC5-8E4CFF354D59@dominion.thruhere.net>
References: <1346422229-61628-1-git-send-email-bjst@enea.com>
	<1346422229-61628-2-git-send-email-bjst@enea.com>
To: =?iso-8859-1?Q?Bj=F6rn_Stenberg?= <bjst@enea.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQnn17LS01YkF5At6KMxoWFpCzTCGDGjmToXXL3Orj+LxLYuHJnKFRH3OBbX/nw833Uy0l8M
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] Add -ptest package group
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
X-List-Received-Date: Sat, 01 Sep 2012 18:33:54 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 31 aug. 2012, om 16:10 heeft Bj=F6rn Stenberg <bjst@enea.com> het =
volgende geschreven:

> This patch creates a new package group -ptest to contain the tests =
from
> each package.

These have always been called ${PN}-tests, why the change?




