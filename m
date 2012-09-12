Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBhEt-0003FO-0h
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 09:19:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Sep 2012 00:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,408,1344236400"; d="scan'208";a="221066173"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2012 00:07:25 -0700
Message-ID: <505034AD.3010306@linux.intel.com>
Date: Wed, 12 Sep 2012 00:07:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1347387265.29443.38.camel@x121e.pbcl.net>
	<504F80B0.8050406@linux.intel.com>
	<1347431813.29443.94.camel@x121e.pbcl.net>
In-Reply-To: <1347431813.29443.94.camel@x121e.pbcl.net>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] eglibc: Restore ${PN} to before ${PN}-dev in PACKAGES
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
X-List-Received-Date: Wed, 12 Sep 2012 07:19:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 11:36 PM, Phil Blundell wrote:
> On Tue, 2012-09-11 at 11:19 -0700, Saul Wold wrote:
>> On 09/11/2012 11:14 AM, Phil Blundell wrote:
>>> Commit 13544fbc6217fee1731a6da1e2cf94901a500842 changed the ordering
>>> of PACKAGES so that ${PN}-dev came before ${PN}.  However, this caused
>>> the FILES matching to go wrong if ${libdir} == ${base_libdir}.  Fix this
>>> by moving ${PN} ahead of ${PN}-dev once again.
>>>
>>> Signed-off-by: Phil Blundell <pb@pbcl.net>
>>> ---
>>> V2: now with high-tech PR goodness
>>
>> Did you do a build with BUILD_HISTORY enabled and verified nothing
>> changes in the standard case?
>
> Yes, see attached.
>

Sorry, there is way too much in that diff, have you reviewed what 
actually changed?

In the FILES and FILESLIST?

Sau!

> p.
>


