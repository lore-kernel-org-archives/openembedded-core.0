Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoOWb-0003I7-Jy
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 01:37:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Aug 2011 16:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,307,1309762800"; d="scan'208";a="34806557"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 02 Aug 2011 16:33:02 -0700
Message-ID: <4E38892E.5090509@linux.intel.com>
Date: Tue, 02 Aug 2011 16:33:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Kumar Gala <galak@kernel.crashing.org>
References: <1312208782-14078-1-git-send-email-galak@kernel.crashing.org>
	<115F44DD-4174-4BC3-B268-AE9EC4CB8BCD@kernel.crashing.org>
In-Reply-To: <115F44DD-4174-4BC3-B268-AE9EC4CB8BCD@kernel.crashing.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc_2.13: Add support for handling sqrt & sqrtf on powerpc
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
X-List-Received-Date: Tue, 02 Aug 2011 23:37:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2011 04:15 PM, Kumar Gala wrote:
>
> On Aug 1, 2011, at 9:26 AM, Kumar Gala wrote:
>
>> Some of powerpc's dont support the fsqrt[s] instructions so we need an
>> implementation of the library functions for those processors.
>>
>> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
>> ---
>> .../recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch |  538 ++++++++++++++++++++
>> meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 +-
>> 2 files changed, 540 insertions(+), 1 deletions(-)
>> create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch
>
> What about this patch?
>
> - k

Kumar,

I have this one staged in a testing area.

Sau!


