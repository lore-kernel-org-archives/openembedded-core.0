Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlTdM-0007VJ-Cj
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 00:00:37 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2012 23:19:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="55739123"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jan 2012 23:19:12 -0800
Message-ID: <4F0E896F.8020107@linux.intel.com>
Date: Wed, 11 Jan 2012 23:19:11 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326285902-31525-1-git-send-email-andrei@gherzan.ro>
	<1356479.bsRlACIzx0@helios> <4F0D989D.4080907@gherzan.ro>
In-Reply-To: <4F0D989D.4080907@gherzan.ro>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] license.py: remove duplicate '&' or '|' from LICENSE
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
X-List-Received-Date: Thu, 12 Jan 2012 23:00:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2012 06:11 AM, Andrei Gherzan wrote:
> On 01/11/2012 03:56 PM, Paul Eggleton wrote:
>> On Wednesday 11 January 2012 14:45:02 Andrei Gherzan wrote:
>>> Some upstream layers (ex: meta-oe) use '&&' or '||' syntax in LICENSE
>>> variable. Because of my last commit, these bbfiles are failing as
>>> LICENSE
>>> is tested with oe.license where '&&' and '||' are the bug source.
>>> The fix is to replace multiple characters of '&' or '|' with a single
>>> one.
>> Sorry to be a pain but could we not just fix those layers to use the
>> accepted
>> syntax? Doing so should be just a one-line find/sed command.
>>
>> Cheers,
>> Paul
>>
> That'd be a solution as well but because those files were accepted this
> way until now i thought that this is an accepted syntax. More, this
> would scale and give a little freedom to the developers especially for
> those that are coming from "C" part or the world. (smile)
>
I think I agree with Paul here, Beth has sent out a proposal for that 
and by making a change here may allow the bad behavior to continue.

Sau!

> ag
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


