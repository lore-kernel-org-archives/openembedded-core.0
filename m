Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R4eRB-0005cH-7Y
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 21:51:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8GJjkEx004842
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 12:45:47 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 16 Sep 2011 12:45:46 -0700
Message-ID: <4E73A769.9070903@windriver.com>
Date: Fri, 16 Sep 2011 14:45:45 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1316177653.20858.23.camel@ted>
	<201109161816.28057.paul.eggleton@linux.intel.com>
	<CAP9ODKoVOSsDOKtiv-LExuKbeGciGp4hfC=V5j-zCY8wDNwr3A@mail.gmail.com>
	<201109161849.52647.paul.eggleton@linux.intel.com>
	<CAP9ODKpqO4zN=gjOsod6UtTku6xZmRen63VBKs+_MOdjF1AAFA@mail.gmail.com>
In-Reply-To: <CAP9ODKpqO4zN=gjOsod6UtTku6xZmRen63VBKs+_MOdjF1AAFA@mail.gmail.com>
Subject: Re: OE-Core release process
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
X-List-Received-Date: Fri, 16 Sep 2011 19:51:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/16/11 2:06 PM, Otavio Salvador wrote:
> On Fri, Sep 16, 2011 at 14:49, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Friday 16 September 2011 18:18:43 you wrote:
>>> They all ended up in oe-core the problem is when they're not yet
>>> merged but I want to merge them into my tree for use, test or
>>> anything.
>>
>> Ah, so what you mean is not that the patches were in poky, but that there
>> sometimes were pull requests pointing to a branch that was on top of poky. The
>> thing is, the patches are exactly the same.
> 
> Yes but not pullable directly into oe-core tree.

I mix and match for all of my development.  What I do is use the git remote and
include multiple remotes.. poky, github, etc..

When I find patches I want I cherry-pick them into my tree.

Your mileage may vary, works for me at least..

>>> The combo-layer was one example. It was made available on poky contrib
>>> tree and I had to manually export the patches instead of pulling it
>>> into a branch for testing.
>>
>> Git makes this almost trivially easy though, and in the combo-layer example it
>> was only a few patches.
>>
>> Personally, I always post my OE-core pull requests on top of an OE-core
>> branch; doing that means *I* have to manually bring the patches across as files
>> and use git-am to apply them onto a branch of OE-core though. I think those of
>> us working on Poky know this is the accepted practice and try to do it all of
>> the time, occasionally someone might forget or feel that for an RFC patch it's
>> not worth the effort; but I think that's the exception rather than the rule.
> 
> Yes I know but wouldn't be better if you could base your work on
> oe-core and avoid doing this?

For submitting to oe-core for pull requests, basing work off of oe-core is "best
practice".  However, forcing people who are working on a specific distribution
to do this isn't reasonable.  It can be requested of them, but IMHO thats as far
as it will go.

I'm not going to stop anyone from developing in the way that suits them best,
all I can request is the interchange to me be at least reasonable.  (git and
cherry-pick is "reasonable" to me at least.)

Note, I do about 70% development in oe-core and 30% in Poky.  Depends where the
bugs are found and what it takes to reproduce them.  I always cherry-pick/rebase
as appropriate to send pull requests to the appropriate place, but my
work-in-progress tree is whatever works for me at the time.  I suspect others
are like that as well.

--Mark


