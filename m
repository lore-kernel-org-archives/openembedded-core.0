Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QKfg2-0000Vq-9R
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 01:52:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2011 16:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,361,1301900400"; d="scan'208";a="746521042"
Received: from doubt.jf.intel.com (HELO [10.7.199.57]) ([10.7.199.57])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2011 16:49:29 -0700
Message-ID: <4DCC721D.8000705@linux.intel.com>
Date: Thu, 12 May 2011 16:49:49 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: William Mills <wmills@ti.com>
References: <4DCC3BA6.3010406@windriver.com> <4DCC4A51.9010309@linux.intel.com>
	<4DCC4D17.7000600@linux.intel.com> <4DCC59B7.1070309@ti.com>
In-Reply-To: <4DCC59B7.1070309@ti.com>
Cc: poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Commit and Patch message guidelines - fifth draft
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
X-List-Received-Date: Thu, 12 May 2011 23:52:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/12/2011 03:05 PM, William Mills wrote:
> On 05/12/2011 05:11 PM, Darren Hart wrote:
>> One more thing. There is a great deal of cross-posting to the various
>> lists. We should discourage this. At least mentioning somewhere in here
>> that patches should be sent to the appropriate list with maintainers and
>> involved developers on CC and not cross posted would be a help.
> 
> Ok, so I am going to go ahead and ask the dumb question.  Where is the 
> write up that say what list is for what?

Not a dumb question at all! Unfortunately, I think a lot of people are
confused about this, which is natural as much of this separation is
still new to people.

There is: http://www.yoctoproject.org/community/mailing-lists

Which needs to be updated to better reflect the oe-core aspect I think.

And: http://openembedded.org/index.php/Mailing_lists

This accurately describes oe-core (and other oe specific lists).

> 
> It seems to me there is a whole bunch of discussion happening on the 
> poky list about making changes that that would effect everyone using 
> openembedded-core.  Do we have two lists for discussion of stuff that 
> effect the oe-core?

No. As I understand it, things that go into poky.git/meta and things
that go into oe-core should be sent to the openembedded-core list. Patch
series for poky.git should be isolated in such a way so that they do not
include changes to meta (oe-core) and other areas at the same time.

Does anyone have a different view?

> 
> -- Bill

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


