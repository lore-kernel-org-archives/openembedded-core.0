Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UDN6Y-0005a7-1E
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 23:46:37 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Mar 2013 14:27:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,798,1355126400"; d="scan'208";a="272554164"
Received: from unknown (HELO [10.255.13.12]) ([10.255.13.12])
	by orsmga001.jf.intel.com with ESMTP; 06 Mar 2013 14:29:14 -0800
Message-ID: <5137C33A.4050205@linux.intel.com>
Date: Wed, 06 Mar 2013 14:29:14 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1362159742-20602-1-git-send-email-Martin.Jansa@gmail.com>
	<1552403.roegCEAHfx@helios>
In-Reply-To: <1552403.roegCEAHfx@helios>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sanity.bbclass: always use oe.lsb.distro_identifier method
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
X-List-Received-Date: Wed, 06 Mar 2013 22:46:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2013 02:54 AM, Paul Eggleton wrote:
> On Friday 01 March 2013 18:42:22 Martin Jansa wrote:
>> * even when /etc/redhat-release or /etc/SuSE-release exists
>> * don't read /etc/lsb-release manually, NATIVELSBSTRING is not
>>    reading it too
>
> Unfortunately this has been merged before I had a chance to reply. FYI I put
> the code in here to read the files directly on purpose, because most distros
> bundle up the lsb_release tool with all of the LSB dependencies, so if you
> want to set up a headless server without some of the LSB dependencies (which
> include X11) you won't have the lsb_release tool and NATIVELSBSTRING is
> "Unknown". Yes, I know we have this problem with NATIVELSBSTRING already.
>
+1, but not just headless server, my FC18 release does not have 
lsb_release installed at all.

Sau!

> Cheers,
> Paul
>


