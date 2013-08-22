Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 714F96B2E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:46:22 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBwDrC003519 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 12:58:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UMXHLM5WcKEt
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 12:58:13 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBw83a003511
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 12:58:10 +0100
Message-ID: <1377171968.6762.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:46:08 +0100
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH 00/28] Toolchain tweaks
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
X-List-Received-Date: Thu, 22 Aug 2013 11:46:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Playing with meta-mingw, it was clear that there were some simple
changes we could make to the core that would improve things for
non-linux SDKs. This series includes those changes. Since I like pain, I
also attempted a darwin build and have included some tweaks for that
too.

When looking at the gcc recipes, it also became clear that we have way
too many include files and the whole thing was a bit of a maze. The
series has some changes in to combine various files together and
simplify things.

I appreciate this may complicate moving things into meta-oe such as gcc
4.7. I would propose when we do that, we put them into
recipes-gcc-<version> and include a snapshot of the .inc files at that
time. The alternative is the continual copy and paste growth of the .bb
files (libgcc being a more extreme example) which I don't think lends
itself to future maintenance of the recipes.

There are some layers which for example use gcc-cross4.inc, they should
just be able to switch directly to gcc-cross.inc. I think this applies
to meta-arago-extras.

This also leads the way to possibly further unify and clean up some of
the configuration (e.g. the do_configure_prepends) but I will leave that
for another series when someone has some further time to spend on it.

Cheers,

Richard





