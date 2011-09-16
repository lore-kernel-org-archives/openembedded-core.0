Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4buH-0001Qq-DW for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 19:08:53 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GH9m9M032566 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 18:09:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kD7bfGPIb9fI
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 18:09:48 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GH9iQj032558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 18:09:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 18:03:32 +0100
In-Reply-To: <1315992658.2519.137.camel@phil-desktop>
References: <1315961204.2252.32.camel@scimitar>
	<1315992658.2519.137.camel@phil-desktop>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316192620.20858.50.camel@ted>
Mime-Version: 1.0
Subject: Re: [RFC] Suggestion of minor change to patch submission policy re: long descriptions in commit headers
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
X-List-Received-Date: Fri, 16 Sep 2011 17:08:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-14 at 10:30 +0100, Phil Blundell wrote:
> On Tue, 2011-09-13 at 17:46 -0700, Joshua Lock wrote:
> > Whilst I intend to rectify the latter I'd like to propose we change the
> > former such that the defect information is at the end of the commit
> > message.
> > 
> > I believe this is more suitable for the project because the defect
> > information and its relevance should be summarised in the long
> > description, and therefore the defect id and link to the defect tracker
> > are supplemental information for interested readers.
> > 
> > IMHO this supplementary nature should lead us to request submitters
> > provide defect information after the long description.
> 
> Agreed, I think this would be something of an improvement (and indeed,
> from a look at the git log it appears that some submitters are already
> doing this).  Although it isn't a very big deal, I do find it slightly
> irritating to have the first line of the long checkin message be
> something that is essentially noise.

In case it wasn't clear, I'm also in favour of moving this to the bottom
of long description rather than the top. 

I think including this information is fine since it does give people
some idea where to look for more information although equally the commit
messages should give suitable information in their own right and this
isn't a replacement for that.

Cheers,

Richard



