Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7269B6FA41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 21:38:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6BLX0gj023384; Fri, 11 Jul 2014 22:33:01 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id An3vWfhpYB6R; Fri, 11 Jul 2014 22:33:00 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6BLWtxm023373
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 11 Jul 2014 22:32:57 +0100
Message-ID: <1405114369.21289.95.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Seebach <peter.seebach@windriver.com>
Date: Fri, 11 Jul 2014 22:32:49 +0100
In-Reply-To: <20140711152449.08d84fdc@e6410-2>
References: <cover.1405110050.git.peter.seebach@windriver.com>
	<0cbfa0da548acdef1a4ab12cb708c699a495dd7f.1405110050.git.peter.seebach@windriver.com>
	<CAJTo0Lay1CB_BumWQDDLHrS2i2XkiE99TamO3bwMH86_=P8gFg@mail.gmail.com>
	<20140711152449.08d84fdc@e6410-2>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo_1.6.0.bb: uprev to pseudo 1.6
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
X-List-Received-Date: Fri, 11 Jul 2014 21:38:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-07-11 at 15:24 -0500, Peter Seebach wrote:
> On Fri, 11 Jul 2014 21:21:06 +0100
> "Burton, Ross" <ross.burton@intel.com> wrote:
> 
> > The extended attributes code means adding build-dependency on attr.
> > 
> > Which leads onto the discussion as to whether we add attr-native to
> > the build for pseudo-native, or use ASSUME_PROVIDED and document that
> > the host needs to provide it.
> 
> Well, since my builds worked without adding the dependency, I guess I would
> go with ASSUME_PROVIDED since that was what I did, apparently.
> 
> I admit to not having been aware that it was possible to lack xattr
> support in a modernish Linux.

The issue is the lack of the xattr headers from what I saw, not the
xattr support itself and we're missing what looks like a single define.
For the complexity, I did wonder if we should ship a default...

Adding in the xattr-native dependency may well be easier than updating
the docs on dependencies on all the different distros.

Cheers,

Richard



