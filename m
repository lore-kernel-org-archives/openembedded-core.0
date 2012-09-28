Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THcyY-0002SF-E7 for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 17:59:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SFkghW012626;
	Fri, 28 Sep 2012 16:46:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12593-01; Fri, 28 Sep 2012 16:46:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SFkYfq012620
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 28 Sep 2012 16:46:35 +0100
Message-ID: <1348847196.15753.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Fri, 28 Sep 2012 16:46:36 +0100
In-Reply-To: <5065489E.6060802@intel.com>
References: <1348590946-13319-1-git-send-email-laurentiu.palcu@intel.com>
	<50647584.2010200@linux.intel.com> <5065489E.6060802@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] SDK: trap any IO errors in the relocate script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 15:59:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-28 at 09:50 +0300, Laurentiu Palcu wrote:
> 
> On 09/27/2012 06:49 PM, Saul Wold wrote:
> > On 09/25/2012 09:35 AM, Laurentiu Palcu wrote:
> > 
> > BTW: in the future it's good to say the "filename: <commit subject>"
> This is what I usually use when I change single files. However,
> sometimes (and I know this particular patch is not the case), I change
> multiple files to fix a single problem or add a feature. In this case
> your BKM is not quite appropriate. I will end up with a commit subject
> like this:
> 
> filename1, filename2, filename3: <no space left for the subject itself>
> 
> If those files belong to a certain functional area, say SDK, I thought
> it was more appropriate to prepend the subject with SDK.
> 
> Also, the contribution guidelines on the wiki, state the same (see rpm
> example):
> 
> https://wiki.yoctoproject.org/wiki/Contribution_Guidelines
> 
> Am I wrong here?

No but I think "SDK" is just a little unspecific so for example a hint
that this was a change to "scripts:"  would have been more useful which
I think was Saul's point.

Cheers,

Richard



