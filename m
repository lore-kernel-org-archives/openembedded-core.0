Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qhjbm-00086U-L5
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 16:43:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jul 2011 07:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,535,1304319600"; d="scan'208";a="28400605"
Received: from unknown (HELO [10.255.14.21]) ([10.255.14.21])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2011 07:39:13 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 07:39:07 -0700
In-Reply-To: <4E1FAC5A.2090308@windriver.com>
References: <4E1F9F59.5050305@mentor.com> <4E1FAC5A.2090308@windriver.com>
X-Mailer: Evolution 3.0.2 (3.0.2-3.fc15) 
Message-ID: <1310740753.2350.0.camel@scimitar>
Mime-Version: 1.0
Subject: Re: Building hg/help2man not relying on them?
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
X-List-Received-Date: Fri, 15 Jul 2011 14:43:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-14 at 21:56 -0500, Mark Hatle wrote:
> On 7/14/11 9:00 PM, Tom Rini wrote:
> > Hey all,
> > 
> > As I work on bringing jenkins up on my stripped down builder machines
> > I've once again run into the "wait, I'm supposed to have installed...?"
> > problem.  Can we switch to building help2man and mercurial rather than
> > making the end user install them?  Perhaps some sort of test for if we
> > find it, ASSUME_PROVIDED it, otherwise build it?
> > 
> 
> The full sanity list is:
> 
> patch help2man diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk hg
> chrpath wget cpio
> 
> Of the above, help2man, texi2html, hg, and chrpath seem to be the ones I usually
> have to find or build myself.

Originally I built chrpath when I added relocatable.bbclass but then we
wanted to relocate native packages and it got extremely tricky...

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



