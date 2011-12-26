Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RfLlW-0006jN-Pk
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Dec 2011 02:23:43 +0100
Received: from mail-qy0-f180.google.com ([209.85.216.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 26 Dec 2011 17:16:28 -0800
Received: by qcse1 with SMTP id e1so6932774qcs.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2011 17:16:27 -0800 (PST)
Received: by 10.229.75.147 with SMTP id y19mr9938982qcj.33.1324948587783;
	Mon, 26 Dec 2011 17:16:27 -0800 (PST)
Received: from [192.168.1.107] (c-75-67-44-171.hsd1.nh.comcast.net.
	[75.67.44.171])
	by mx.google.com with ESMTPS id z1sm47806838qao.1.2011.12.26.17.16.26
	(version=SSLv3 cipher=OTHER); Mon, 26 Dec 2011 17:16:26 -0800 (PST)
Message-ID: <4EF8E344.2020800@intel.com>
Date: Mon, 26 Dec 2011 16:12:36 -0500
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1324661415.git.scott.a.garman@intel.com>
	<4EF4BDA1.2060906@intel.com>
In-Reply-To: <4EF4BDA1.2060906@intel.com>
Subject: Re: [PATCH 0/2] Upgrade chrpath and libevent
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
X-List-Received-Date: Tue, 27 Dec 2011 01:23:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/2011 12:42 PM, Scott Garman wrote:
> On 12/23/2011 09:31 AM, Scott Garman wrote:
>> Hello,
>>
>> This pull request upgrades the chrpath and libevent recipes. It has
>> been build-tested on all 5 of our qemu architectures.
>
> Please hold off on accepting this pull request. I forgot to include the
> distro tracking field updates, and when I just went to do so, I noticed
> that libevent had a NO_UPDATE_REASON field suggesting that libevent2 was
> not compatible. Which means I have to do a lot more testing on this
> before I can feel comfortable submitting it.
>
> I will likely not get to this until I return on January 2.

Just a note:

I did a grep for DEPENDS references to libevent in our tree and 
nfs-utils is the only recipe that lists it. I have tested building 
nfs-utils with the new libevent and there were no build errors.

Can anyone tell me if there are other applications known to use libevent 
that we include which I could do some runtime testing? If there are 
none, then I think in fact it should be safe to take this pull request.

If nothing else, the chrpath recipe upgrade commit is safe.

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


