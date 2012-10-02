Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TJAo4-00047D-2s
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 00:19:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Oct 2012 15:06:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,524,1344236400"; d="scan'208";a="199798224"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by azsmga001.ch.intel.com with ESMTP; 02 Oct 2012 15:06:10 -0700
Message-ID: <506B6552.3040503@linux.intel.com>
Date: Tue, 02 Oct 2012 15:06:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1349215201-30117-1-git-send-email-sgw@linux.intel.com>
	<1349215253.4422.79.camel@x121e.pbcl.net>
In-Reply-To: <1349215253.4422.79.camel@x121e.pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate: Add detail to shared area warning
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
X-List-Received-Date: Tue, 02 Oct 2012 22:19:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/02/2012 03:00 PM, Phil Blundell wrote:
> On Tue, 2012-10-02 at 15:00 -0700, Saul Wold wrote:
>> -        bb.warn("The recipe is trying to install files into a shared area when those files already exist. Those files are:\n   %s" % "\n   ".join(match))
>> +        bb.warn("The %s recipe is trying to install files into a shared area when those files already exist (please fix %s). Those files are:\n   %s" % (d.getVar('PN', True), d.getVar('FILE', True), "\n   ".join(match)))
>
> That seems potentially misleading: the file that needs fixing isn't
> necessarily the one that triggers this warning.  What would be ideal
> would be to have it output the names of all recipes that have tried to
> stage the files in question so that the user can make an informed
> decision about which one ought to be putting them there.
>
True enough, but we don't have that information at that time, but it 
gives more information than we had before, as to which recipe was adding 
the files, I guess if I change the wording to something like
"verify" or "check"?

Sau!

> p.
>
>
>
>


