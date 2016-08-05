Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 560B977116
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 16:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u75GMeij013193; Fri, 5 Aug 2016 17:22:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JsScIpNkfLOx; Fri,  5 Aug 2016 17:22:40 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u75GMaTl013190
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 5 Aug 2016 17:22:37 +0100
Message-ID: <1470414156.8166.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, =?ISO-8859-1?Q?An=EDbal_Lim=F3n?=
	<anibal.limon@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Fri, 05 Aug 2016 17:22:36 +0100
In-Reply-To: <04e8b0bc-8834-52db-8fe7-da7af806a1ba@gmail.com>
References: <1469821981-6456-1-git-send-email-anibal.limon@linux.intel.com>
	<04e8b0bc-8834-52db-8fe7-da7af806a1ba@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: alexander.kanavin@intel.com
Subject: Re: [PATCH] apt: Upgrade to 1.2.12
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
X-List-Received-Date: Fri, 05 Aug 2016 16:22:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-08-05 at 08:44 -0700, Khem Raj wrote:
> 
> On 7/29/16 12:53 PM, Aníbal Limón wrote:
> > Test was made building core-image-sato with package_deb on qemux86
> > and
> > qemuarm then run for two of them testimage and install packages
> > with
> > apt-get using PACKAGE_FEED_URI's configuration.
> > 
> > Now apt support drop priviligies for install packages using a
> > sandbox
> > with _apt user, the useradd class was inherit and configured to
> > install
> > _apt user and group.
> > 
> > Rebased patches:
> > 
> > 	- 0001-Revert-always-run-dpkg-configure-a-at-the-end-of
> > -our.patch
> >         - 0001-fix-the-gcc-version-check.patch
> > 	- 0001-remove-Wsuggest-attribute-from-CFLAGS.patch
> > 	- disable-test.patch
> > 	- no-curl.patch
> 
> This breaks on musl. Another plea to add a world build on AB for
> atleast
> 1 target for musl.

We have nightly-musl which builds "core-image-minimal core-image-full
-cmdline core-image-sato":

https://autobuilder.yoctoproject.org/main/builders/nightly-musl/builds/
207/steps/BuildImages/logs/stdio

Is world known to work for musl now?

Cheers,

Richard


