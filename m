Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6BE94601F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 22:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2SMSiSO022602; Mon, 28 Mar 2016 23:28:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HqJrqdvMMael; Mon, 28 Mar 2016 23:28:44 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2SMSfQH022595
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Mar 2016 23:28:43 +0100
Message-ID: <1459204121.21672.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Cliff Brake <cliff.brake@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2016 23:28:41 +0100
In-Reply-To: <56F98CDF.7080205@gmail.com>
References: <56F59D2B.2010108@gmail.com>
	<1458978069.3073.62.camel@linuxfoundation.org>
	<56F98CDF.7080205@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: How to use externalsrc with git workspace
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
X-List-Received-Date: Mon, 28 Mar 2016 22:28:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-03-28 at 15:58 -0400, Cliff Brake wrote:
> On 03/26/2016 03:41 AM, Richard Purdie wrote:
> > HEAD is a revision, not a branch and the fetcher became a bit more
> > picky about that difference. Your local tree must have HEAD on some
> > branch which would usually be master so setting branch=master is
> > likely
> > correct, or don't set that parameter at all? master isn't just a
> > remote
> > thing.
> > 
> > The piece which says "use the HEAD revision" is the SRCREV =
> > "${AUTOREV}" line.
> > 
> > Cheers,
> > 
> > Richard
> > 
> We typically set up our projects to use git submodules, such that the
> top level
> calls out a set of submodules which are the actively developed
> applications and
> other bits in the system.  These submodules are externalsrc trees for
> bitbake,
> and include a bitbake recipe (bitbake recipe is embedded directly in
> source
> code).  Sometimes these submodules/externalsrc trees track branches
> (typically
> release-xyz, or develop-xyz), but almost never master.  Sometimes
> they may be at
> a tagged version that is not at the HEAD of a branch.  In the end, I
> want to be
> able to build exactly what is in the externalsrc directory, and
> accurately
> include the git version in the PV.  Branches/tags may change at any
> time and I
> don't want to have to edit the recipe every time this happens.
> 
> Repo might be used in a similar fashion to manage a tree of
> components that get
> built.  What we are trying to avoid is having to edit the git version
> in the
> recipes to lock down versions for a set of components for a build --
> git
> submodules or repo work much better for doing this.
> 
> I tried nobranch=1;rev=HEAD, but then that conflicts with ${AUTOREV}.

Did you just try nobranch=1 and leave rev to get set from SRCREV?

Cheers,

Richard


