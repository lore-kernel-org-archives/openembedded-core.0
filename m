Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6gTW-0001ST-Lg for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 12:25:50 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MAQjns001644 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 11:26:45 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HqrvsyIMcb4G
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 11:26:44 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MAQbpi001634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 11:26:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 11:20:21 +0100
In-Reply-To: <CC6D993E-0C5B-4D42-BCB8-2C4C6E62EC77@dominion.thruhere.net>
References: <4E7A3D3A.1030007@balister.org> <4E7A3E4C.6080206@windriver.com>
	<30E0E33D-A811-4023-8977-4CA73C4656E6@dominion.thruhere.net>
	<1316651210.13622.0.camel@ted>
	<A769990C-E69F-4882-B3B5-66048C9B5268@dominion.thruhere.net>
	<1316675047.2029.10.camel@ted>
	<CC6D993E-0C5B-4D42-BCB8-2C4C6E62EC77@dominion.thruhere.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316686826.2029.30.camel@ted>
Mime-Version: 1.0
Subject: Re: Fetch failure for source at kernel.org
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
X-List-Received-Date: Thu, 22 Sep 2011 10:25:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 10:28 +0200, Koen Kooi wrote:
> Op 22 sep. 2011, om 09:03 heeft Richard Purdie het volgende geschreven:
> > On Thu, 2011-09-22 at 08:40 +0200, Koen Kooi wrote:
> >> Op 22 sep. 2011, om 02:26 heeft Richard Purdie het volgende geschreven:
> >>> On Wed, 2011-09-21 at 21:49 +0200, Koen Kooi wrote:
> >>>> Op 21 sep. 2011, om 21:43 heeft Mark Hatle het volgende geschreven:
> >>>> 
> >>>>> On 9/21/11 2:38 PM, Philip Balister wrote:
> >>>>>> I'm finally trying to get started with oe-core. I'm using a setup 
> >>>>>> created with the setup-script created by Koen. Everything looks ok until 
> >>>>>> it tried to build cpufrequtils. The recipe tries to fetch the source 
> >>>>>> from a git repo at kernel.org. Obviously, the fetch fails.
> >>>>>> 
> >>>>>> What is odd, in the "good old days" I would expect this config to fall 
> >>>>>> back and use the Angstrom source mirror, but apparently this is not the 
> >>>>>> case with oe-core.
> >>>>>> 
> >>>>>> Is this a bug or a feature? If this is a bug, is there a plan to fix it? 
> >>>>>> If it is a feature, how are we supposed to do builds if servers go away? 
> >>>>>> What do we do about GPL compliance?
> >>>>> 
> >>>>> This is a feature, as people did not want oe-core tied to a given mirror.
> >>>> 
> >>>> This is the "OE core doesn't generate versioned git tarballs" problem
> >>>> people keep talking about. I know I can edit each and every recipe to
> >>>> add ';rebasable=true', but I'd like a global solution before the GPL
> >>>> police starts looking at the angstrom source mirrors.
> >>> 
> >>> Is this a versioned tarball problem or just the tarballs not being
> >>> generated at all?
> >> 
> >> versioned tarball problem, since the source mirror won't overwrite
> >> files with the same name, so unversioned ones are both useless and
> >> bandwidth wasting.
> > 
> > They seem to be working perfectly well for Yocto...
> > 
> > They're also not bandwidth wasting
> 
> They are, since for the kernel you need to re-upload the 300MB tarball
> to the source mirror for mirroring to work, even if there were no real
> changes but bitbake repacked it. I know that versioned tarballs aren't
> terribly efficient either, but at least they are deterministic.

Well, it depends on your perspective, I was looking at this from a
user's point of view. The server's bandwidth is nothing compared to the
users pulling the data.

> The angstrom source mirror checks for duplicate filenames to avoid
> introducing checksum changes due to upstream stupidity or corrupted
> downloads. 

Fair enough but you could make an exception for the git scm tarballs
(which follow a fairly identifiable pattern).

> > since the fetcher is efficient and
> > will incrementally update something that is incomplete.
> 
> Which won't work currently since kernel.org is down.

This just means there aren't appropriate git:// -> git:// mappings in
people's mirrors files (including Yocto). If git:// -> git:// mappings
don't work, we should fix that but they should.

> > Anyhow, this is the first time someone has explained that the mirror
> > tarball improvements that were made to bitbake have not done everything
> > they desire. If you want someone on the Yocto team to look at this I'd
> > suggest a bug report or I'll take patches to bitbake (as always).
> 
> But you do acknowledge the problem? FWIW, I've been arguing for a
> global method of enabled versioned tarballs since I first started
> using oe-core (called differently back then). I know linux-yocto
> stretches the fetcher to its limits, but I'd like this change for all
> the recipes using a single git tree with a single srcrev.

Now someone has explained the issue, yes, I can see why it is causing
problems. I do think some of them are of people's own choosing but I'm
trying to be flexible and not make judgement on that.

So we can do something along the lines of what you after but there are
the following considerations:

a) The versioned tarballs do need to be different to what we had before 
in that the tarball will be of a .git directory containing the git
metadata, not just a checkout. Why? This is so we can incrementally
update a git repo if the user changes the source revision as one
example. We're dealing with the git fetcher and limiting ourselves to a
flat one dimension doesn't make sense.

b) We need to agree what order the tarballs on the server should be
searched for. The "obvious" order would be:

1. Specific Revision X tarball
2. generic mirror tarball
3. git clone

The problems come about when we have an existing git checkout which
doesn't contain the revision we want. Currently we can just update and
assume that will bring in the revision. If we now support people doing
rebases and other things, we now at least in theory have to:

1. See if the revision exists locally
2. Try pulling
3. If that doesn't work look for a versioned tarball
4. Blow away all fetcher git status from DL_DIR
5. Extract the tarball

My big concern with this is rather than having some general
archictecture and standard way of doing this, the fetcher once again
becomes a set of special case if A do B but if C do D first then do E
but don't forget to do A if Z happens type code.

So what I'm saying is I don't want the fetcher to become the
unmaintainable mess the that the code paths in fetch1 were. I don't
honestly know how to add a code path like the above and avoid this :(

The patch on the bitbake list doesn't consider any of this complexity or
the corner cases :(

Cheers,

Richard







