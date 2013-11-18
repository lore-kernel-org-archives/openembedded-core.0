Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A25306D98D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 17:28:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAIHRttC011131; Mon, 18 Nov 2013 17:27:55 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id M6wWFAA9x6NS; Mon, 18 Nov 2013 17:27:54 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAIHRo3K011128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 18 Nov 2013 17:27:51 GMT
Message-ID: <1384795666.6460.252.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Calhoun <rcalhoun@shotspotter.com>, "Eggleton, Paul"
	<paul.eggleton@intel.com>, "Rifenbark, Scott M"
	<scott.m.rifenbark@intel.com>
Date: Mon, 18 Nov 2013 17:27:46 +0000
In-Reply-To: <CEAF8F07.1E9235%rcalhoun@shotspotter.com>
References: <CEAF8F07.1E9235%rcalhoun@shotspotter.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg in svn?
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
X-List-Received-Date: Mon, 18 Nov 2013 17:28:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-18 at 16:21 +0000, Robert Calhoun wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> >opkg is in svn but its one of the few remaining
> >components we use from svn. It means we have to build subversion-native
> >which has a fairly long dependency chain. It would be nice if we didn't
> >need to so is there any chance we can move opkg to git?
> 
> I'm one of the great unwashed who still use subversion internally. For
> these users, removing subversion SRC_URIs from oe-core will not remove the
> need to build subversion-native. I'm not suggesting that oe-core should
> not move away from svn when appropriate, only that many users aren't going
> see much of a performance bump when every last reference is purged.

If you need it for internal usage, you probably don't mind the build
overhead and/or you can use ASSUME_PROVIDED.

I'm not suggesting we drop svn support or anything like that, I would
just prefer to optimise the build where we can and this is looking like
somewhere reasonable to do it now.

> >An alternative would be to have good tarball releases we could use
> >instead?
> 
> If opkg doesn't change much, a tarball download will be faster and use
> less disk space than svn checkout. This seems like a good approach.

Agreed, I don't think this hurts anything.

> From: Saul Wold <sgw@linux.intel.com>
> >Yup, that's the one, and they don't keep the older tarballs around
> >either, a real pain!
> 
> ...as long as the old tarballs hang around!

This is a case where we can ensure they do I hope! :)

> Documentation on the various SRC_URI fetchers is pretty thin in the yocto
> manuals. The bitbake documentation is also incomplete and it requires 1 GB
> (!) of dependencies to make. I'd be happy to work on better documenting
> SRC_URI syntax; where should this go? A new section under 5.3 of the dev
> manual seems most appropriate:
> 
> http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#usingpo
> ky-extend-addpkg
> 
> I assume bitbake's usermanual.xml should be updated as well? There are a
> half-dozen commits in the last two years, so it is neither very active nor
> very dead.
> 
> This sort of falls under
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4370 but as that is
> about the OE user manual, should I make a new ticket and assign it to
> myself?

I'd sync with Paul Eggleton on this since I think he and Scott
Rifenbbark are going to figure out how to deal with the bitbake manual
soon. It certainly needs some TLC.

Cheers,

Richard


