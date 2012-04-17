Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SK2aW-0003to-Ht
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 09:12:32 +0200
Received: by wgbdr12 with SMTP id dr12so5011688wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 00:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=mb09Pr+z22QDo1aObL+g8/0MQ5cCrybO3f303h2u6Ec=;
	b=Iy4YzAIVqKG3UtAWbnP/sM832T58ytg9BZxv8s7ucCKb1FDGJ/HiLwhN2bzhOjt88L
	k5IuytcOsaopQyQoNDUhqX/0nzs5xZP+WHllgr0zwuooC/NZoRsy90FAdFgFMrpS1Cz1
	hDZa+UU/ktKbplXgUqPTTZRFTEu7SHBsQQ1L1lUqog24s0xZjNetGpaaMqH4Tnj8Ov/e
	J8GgyJ/FILkG3SbSVCDBOxQ6JBJukNanKmHrUK2Iw4WHnzEXW4yni/V0/e1XSYavtTtb
	BmBV/73Jqr0jNo4eLvQb95/32h+SsRpHrdJS3w7xC+GWFFE3bVKdWoz0gqKVB22YnZGK
	+eKw==
Received: by 10.180.95.129 with SMTP id dk1mr29311941wib.3.1334646186728;
	Tue, 17 Apr 2012 00:03:06 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 6sm24927203wiz.1.2012.04.17.00.03.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 00:03:05 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1334616144.git.mark.hatle@windriver.com>
Date: Tue, 17 Apr 2012 09:03:05 +0200
Message-Id: <62DAF410-1C09-4FE9-B049-35761619728C@dominion.thruhere.net>
References: <cover.1334616144.git.mark.hatle@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkwVPHL//1ZAbJcG6ItfRSpSiNkPVq7rJvt8jujaN3PjdmqVrYpnTieWbbZ89Tft/vORpK+
Subject: Re: [PATCH 00/17] Fix update-alternatives and RPM package dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2012 07:12:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 apr. 2012, om 00:45 heeft Mark Hatle het volgende geschreven:

> It was recently noticed that many packages that use =
update-alternatives were
> not setting package level provides.  So a package that required =
/usr/bin/env
> would not be satisfied by coreutils, even though it had a /usr/bin/env
> alternative.

Related to your patch: the upgrade paths for /usr/bin/watch are still =
broken because busybox still installs it into /bin/watch. I forget who =
was supposed to fix that, but it would be nice to get that done before =
the release.

regards,

Koen=


