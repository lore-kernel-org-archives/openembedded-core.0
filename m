Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QUgnd-0001zp-Lg
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 17:05:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2011 08:00:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,342,1304319600"; d="scan'208";a="11352479"
Received: from unknown (HELO [10.7.199.151]) ([10.7.199.151])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2011 08:00:44 -0700
Message-ID: <4DF0E01C.7090403@intel.com>
Date: Thu, 09 Jun 2011 08:00:44 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4DE56B0D.4020209@intel.com>
In-Reply-To: <4DE56B0D.4020209@intel.com>
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
X-List-Received-Date: Thu, 09 Jun 2011 15:05:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2011 03:26 PM, Scott Garman wrote:
> Hey folks,
>
> I'd like to collect some feedback on error messages while building that
> you find confusing/annoying/unhelpful. I'm going to be working on trying
> to improve the situation and would like to hear from you about what
> could be more helpful.

Thanks everyone for your feedback. I have filed a number of bugs in 
Bugzilla and currently have a small list of them I'm working on 
currently. Here is the current list I created based on the replies to 
this thread:

Bug 542 - bitbake "NoProvider" message doesn't aid in resolving the problem
http://bugzilla.pokylinux.org/show_bug.cgi?id=542

Bug 1127 - Improve the error reporting when SkipPackage error is raised
http://bugzilla.pokylinux.org/show_bug.cgi?id=1127

Bug 1128 - Meaningless error message when quilt is not installed
http://bugzilla.pokylinux.org/show_bug.cgi?id=1128

Bug 1141 - bitbake -b prints meaningless error when given an invalid
recipe name
http://bugzilla.pokylinux.org/show_bug.cgi?id=1141

Bug 1142 - git fetcher error when wrong protocol is specified is not helpful
http://bugzilla.pokylinux.org/show_bug.cgi?id=1142

Bug 1143 - Remove python stack trace when do_patch fails
http://bugzilla.pokylinux.org/show_bug.cgi?id=1143

Bug 1144 - bb.debug messages are not logged or displayed on the console
with -DDD during recipe parsing
http://bugzilla.pokylinux.org/show_bug.cgi?id=1144

Bug 1145 - Make bitbake output less noisy for non-error cases
http://bugzilla.pokylinux.org/show_bug.cgi?id=1145

Again, not all of those are on my plate for M2/M3, but my goal is to 
make a dent in them soon.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


