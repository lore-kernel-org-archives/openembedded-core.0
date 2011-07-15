Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qhr8Z-0006ri-6A
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 00:45:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2011 15:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,210,1309762800"; d="scan'208";a="28252661"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 15 Jul 2011 15:41:27 -0700
Message-ID: <4E20C217.5070907@linux.intel.com>
Date: Fri, 15 Jul 2011 15:41:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Tom Rini <tom_rini@mentor.com>
References: <cover.1310758615.git.tom_rini@mentor.com>
	<c7276dd332ad9e38935443d679c0296a032a511c.1310758615.git.tom_rini@mentor.com>
	<4E20BE2C.3060103@linux.intel.com> <4E20BF61.3020901@mentor.com>
In-Reply-To: <4E20BF61.3020901@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] help2man-native: Add 1.36.4 (GPLv2) and 1.38.2 (GPLv3)
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
X-List-Received-Date: Fri, 15 Jul 2011 22:45:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2011 03:29 PM, Tom Rini wrote:
> On 07/15/2011 03:24 PM, Saul Wold wrote:
>> On 07/15/2011 03:03 PM, Tom Rini wrote:
>>> These are 'side ports' of current oe.dev versions.  PR is kept in sync
>>> but we drop out the target recipes in order to punt on potential perl
>>> problems.
>>>
>>> Signed-off-by: Tom Rini<tom_rini@mentor.com>
>>> ---
>>>    .../help2man/help2man-native_1.36.4.bb             |   26
>>> ++++++++++++++++++++
>>>    .../help2man/help2man-native_1.38.2.bb             |   24
>>> ++++++++++++++++++
>>>    2 files changed, 50 insertions(+), 0 deletions(-)
>>>    create mode 100644
>>> meta/recipes-devtools/help2man/help2man-native_1.36.4.bb
>>>    create mode 100644
>>> meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
>>>
>>
>> Why do we need both versions?  Can't we just use the most current?
>
> For the "I want no GPLv3" crowd.  This is a little more clear in oe.dev
> where we also build for the target but yes, different legal departments
> have different GPLv3 concerns so I think it makes sense in this case still.
>
Right, I scanned this too quickly and did not see the v2 vs v3 difference.

Thanks for clarifying.

Sau!


