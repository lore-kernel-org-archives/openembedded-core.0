Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QV51j-0000JT-Mq
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 18:57:43 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jun 2011 09:54:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,348,1304319600"; d="scan'208";a="16853730"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2011 09:54:13 -0700
Message-ID: <4DF24C34.7060900@linux.intel.com>
Date: Fri, 10 Jun 2011 09:54:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307686598.git.sgw@linux.intel.com>
	<1307723606.15712.213.camel@rex>
In-Reply-To: <1307723606.15712.213.camel@rex>
Subject: Re: [CONSOLIDATED PULL 0/4] 10-June
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
X-List-Received-Date: Fri, 10 Jun 2011 16:57:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2011 09:33 AM, Richard Purdie wrote:
> On Thu, 2011-06-09 at 23:26 -0700, Saul Wold wrote:
>> Kang Kai (1):
>>    ghostscript: update SRC_URI
>>
>> Nitin A Kamble (1):
>>    gcc: rebase the patch to avoid patch rejection
>
> This was a disaster. It breaks the build and is huge, thereby clogging
> up the source control system web interface etc.
>
> I applied it, then had to revert it. Please test things like this more
> carefully in future.
>
> I also think we need to put these kind of patches on the website or in a
> repo, we shouldn't be carrying them around in the main repo.
>
>> Phil Blundell (1):
>>    busybox: backport distro-features handling from oe master
>>
>> Saul Wold (1):
>>    multiple recipes converted to -staticdev packages
>
> I'm with Phil on this one, needs more work.
>
Sorry about this one, I thought I had it further along, I guess I had a
cut and paste failure (dropping the R from RDEPENDS).
> I haven't got to the other two since the gcc issue distracted me :/.
>
I did run multiple builds without failure, so I am not sure what 
happened with the gcc failure.

Sau!

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


