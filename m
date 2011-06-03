Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QSVjO-0000nW-5a
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 16:52:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jun 2011 07:48:55 -0700
X-ExtLoop1: 1
Received: from unknown (HELO helios.localnet) ([10.255.12.215])
	by orsmga002.jf.intel.com with ESMTP; 03 Jun 2011 07:48:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
 markgross@thegnar.org
Date: Fri, 3 Jun 2011 15:48:52 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <4DE56B0D.4020209@intel.com> <1306945558.27470.435.camel@rex>
	<20110603143545.GB27754@gvim.org>
In-Reply-To: <20110603143545.GB27754@gvim.org>
MIME-Version: 1.0
Message-Id: <201106031548.52577.paul.eggleton@linux.intel.com>
Subject: Re: Tell me your build error message annoyances!
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
X-List-Received-Date: Fri, 03 Jun 2011 14:52:10 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 03 June 2011 15:35:45 mark gross wrote:
> Well perhaps it would be easier to build a list of packages that have
> been skipped?  I think the cache knows about them.  Perhaps they could
> be reported to a "skipped" file or something similar?

FYI there is a patch I submitted the other day to bitbake-devel which tracks 
these in their own internal list. The next step is that when a NoProvider 
event comes up we can look through this list to see if the requested target is 
in there, and if so report that it was skipped along with the reason why. I 
would think that this obviates the need to show the list of skipped packages 
at the start, although we could easily allow them to be reported via some 
other mechanism.

This is a separate exercise to sorting out the flow of exceptions within 
bitbake, but still very important for the overall task of improving error 
output.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


