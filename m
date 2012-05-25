Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SXsik-0003gl-Et
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 13:30:14 +0200
Received: by eaal1 with SMTP id l1so250426eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 04:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=J4PTFuwVZ72cg5hVCn8JG9jJviZD8GvrKNUqOXrIacs=;
	b=AQBwcfdh9II+WLvAFF57XB2PiPCGKD1hVmkio+mHokIIinm/gaHjUzcCRwZK80lcX+
	siGI1OeaEW3ADkwZlQ9W9M0SqblBhh747jYPYvNAAti4mMI1RhrlarOU1RZnOub2Z6un
	jbbQ3jtgxyEJDrQBVaPF3bQgchEP4boxd0bpj+3X1zBDz2ByKT8VsCT+Oa7KaGC+zFTl
	1jz3LaO6CzZot5mKcpahh1lj1XZTowxnbkPIZ9Y1QZTjsU0+oggm5QWBZXXQlFFCxtPQ
	FYwgY3lRxqk9EU0codqnkyvLoduf3f3sIPQHclmI9XCDHbM0LENMGeGdxguqGkPK+akO
	GvuA==
Received: by 10.14.101.2 with SMTP id a2mr613400eeg.9.1337944802099;
	Fri, 25 May 2012 04:20:02 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z5sm6136584eem.3.2012.05.25.04.20.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 May 2012 04:20:01 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <fad645aa59e8cc5634500b35bc607e0b61dc997f.1337933617.git.liezhi.yang@windriver.com>
Date: Fri, 25 May 2012 13:19:55 +0200
Message-Id: <6CC0CB11-A526-457C-AC54-2D7C67E38DE2@dominion.thruhere.net>
References: <cover.1337933617.git.liezhi.yang@windriver.com>
	<fad645aa59e8cc5634500b35bc607e0b61dc997f.1337933617.git.liezhi.yang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQk4GsUMFEv6OPi+t6W+Co4CQrqIuwYG7Lo4J+zgDeqlPYA7RDSkMeH7TLj0e8nuwOPwSCYe
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] opkg 0.1.8: respect to the arch when choose the alternatives
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
X-List-Received-Date: Fri, 25 May 2012 11:30:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 mei 2012, om 12:02 heeft Robert Yang het volgende geschreven:

> There is a bug if we:
> 1) bitbake core-image-sato-sdk MACHINE=3Dqemux86
> 2) bitbake core-image-sato with MACHINE=3Dcrownbay
>=20
> Then several pkgs in deploy/ipk/i586 would be installed to crownbay's
> image even if there is one in deploy/ipk/core2 and we have set the
> core2's priority higher than i586, when the version in deploy/ipk/i586 =
is
> higher. This doesn't work for us, for example, what the crownbay need =
is
> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
>=20
> This is caused by opkg's selecting mechanism, if there are more than =
one
> candidates which have the same pkg name in the candidate list, for
> example, the same pkg with different versions, then it will use the =
last
> one which is the highest version in the list, this doesn't work for =
us,
> it should respect to the arch priorities in such a case.

This is a serious break with the current opkg behaviour and I don't =
think it's an improvement. Needing different versions for non machine =
specific packages indicates a more serious bug elsewhere.=


