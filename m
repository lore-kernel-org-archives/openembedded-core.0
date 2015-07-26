Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3503873D13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jul 2015 21:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6QL8pkF020790; Sun, 26 Jul 2015 22:08:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Q35S691Xz1ZS; Sun, 26 Jul 2015 22:08:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6QL8c3Q020786
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 26 Jul 2015 22:08:49 +0100
Message-ID: <1437944918.821.202.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>
Date: Sun, 26 Jul 2015 22:08:38 +0100
In-Reply-To: <55B53F00.8050902@gmail.com>
References: <1437927299.821.198.camel@linuxfoundation.org>
	<55B53F00.8050902@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: "Witt, Randy E" <randy.e.witt@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Weekend build status (master, fido, dizzy and -next)
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
X-List-Received-Date: Sun, 26 Jul 2015 21:08:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2015-07-26 at 13:11 -0700, akuster808 wrote:
> On 07/26/2015 09:14 AM, Richard Purdie wrote:
> > Dizzy - Last Build showed ? failures:
> > =====================================
> >
> > Managed to push most gcc5 fixes to the branch which has things building
> > much better than the first time.
> >
> > https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/97/steps/Running%20oe-selftest/logs/stdio
> > two different selftest sanity failures
> 
> Why does the log show 1.8+snapshot? I would have expected 1.7+.

That autobuilder appears to be running a buildtools-tarball which was
built using 1.8 and installed in /opt/xxx. The build does appear to be a
1.7 build and those paths are safe to ignore.

> > https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/407/steps/Running%20Sanity%20Tests/logs/stdio
> > Systemd login prompt failure issue (Ross also has open bug for this in
> > master)
> >
> > https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/413/steps/CheckForGPLv3/logs/stdio
> > GPLv3 check failing?
> 
> Was this run for 1.7.2 ? I don't see any license changes in the 1.7.3 
> patches.

Beth?

> I am  confused by the logs. It references 
> "TERMINFO_DIRS=/opt/poky/1.8+snapshot" and other places is references 
> 'master'. is this representative of Dizzy?

See above, same issue, its from buildtools-tarball the system is using.

> >
> > https://autobuilder.yoctoproject.org/main/builders/nightly-mips64/builds/60/steps/Running%20Sanity%20Tests/logs/stdio
> > mips64 sanity test failed - do we support this on dizzy?
> 
> Don't think so. It was not tested in the previews point releases either.
> 
> >
> > https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds/68
> > arm64 build failed - do we support this on dizzy? (machine doesn't exist
> > so no?)
> 
> Arm64 is not support in Dizzy.

Agreed, Beth will disable these to make things look a little cleaner.
Which just leaves the other issues :/.

Cheers,

Richard


