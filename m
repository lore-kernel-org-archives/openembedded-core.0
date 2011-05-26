Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QPi8L-00005V-8M
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 23:30:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2011 14:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,276,1304319600"; 
   d="scan'208";a="5550244"
Received: from vorpal.jf.intel.com (HELO [10.7.199.161]) ([10.7.199.161])
	by orsmga001.jf.intel.com with ESMTP; 26 May 2011 14:27:12 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 14:30:42 -0700
In-Reply-To: <4DDD90F9.5030901@intel.com>
References: <4DDD90F9.5030901@intel.com>
X-Mailer: Evolution 3.0.1 (3.0.1-1.fc15) 
Message-ID: <1306445442.5911.9.camel@vorpal.jf.intel.com>
Mime-Version: 1.0
Subject: Re: [PATCH 0/5] license.bbclass parsing changes and common-license additions
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
X-List-Received-Date: Thu, 26 May 2011 21:30:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-25 at 16:30 -0700, Elizabeth Flanagan wrote:
> This pull request is a consolidated pull of some changes to the license.bbclass
> license parsing, some cleanup of existing licenses, and some additions to/
> modifications of various licenses kept in meta/files/common-licenses.
> 
> I've modified the common-licenses by adding licenses from the Software Package
> and Data Exchange group/OSI and using their naming convention for internal
> parsing within license.bbclass.
> 
> Licenses were retrieved from http://spdx.org/licenses/ or
> in cases where text of the license was missing:
> http://opensource.linux-mirror.org/licenses/
> 
> I've also modified some recipe's LICENSE field, either because the field was
> unparsable or the LICENSE was factually incorrect. This was not an entire audit
> of every LICENSE field but there were some errors that were obvious.
> 
> And lastly, using python abstract syntax trees as a parser and an ast visitor
> class, I've begun the first steps to being able to put some sanity to license
> selection.
> 
> One note. License modifiers have traditionally been limited to the "or greater"
> modifier "+". I've added another modifier "with exceptions" for licenses that
> have no generic ie common-licenses/GPL-2,0-with-GCC-exception
> 
> The modifiers are ignored for now, but I'll be looking at the logic for them
> next.

I like the direction you are going with this. Good job. I have one minor
niggle in patch 2 of the series.

Also you could probably merge all of the license.bbclass changes into
one patch with a liberal application of git rebase -i and the fixup
flag.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Project Build Monkey
        Intel Open Source Technology Centre



