Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RgMv6-0006xo-D2
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 21:49:48 +0100
Received: from mail-qy0-f180.google.com ([209.85.216.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 29 Dec 2011 12:42:32 -0800
Received: by qcse1 with SMTP id e1so8313815qcs.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2011 12:42:31 -0800 (PST)
Received: by 10.229.78.136 with SMTP id l8mr13834010qck.121.1325191351139;
	Thu, 29 Dec 2011 12:42:31 -0800 (PST)
Received: from [10.0.1.34] (c-24-147-73-69.hsd1.nh.comcast.net. [24.147.73.69])
	by mx.google.com with ESMTPS id h9sm67501759qac.13.2011.12.29.12.42.29
	(version=SSLv3 cipher=OTHER); Thu, 29 Dec 2011 12:42:30 -0800 (PST)
Message-ID: <4EFCD0B5.6080702@intel.com>
Date: Thu, 29 Dec 2011 15:42:29 -0500
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1324661415.git.scott.a.garman@intel.com>
	<4EFB6201.7010900@linux.intel.com> <4EFC81D0.1010402@intel.com>
	<2928272.ngRFCSvnHg@helios>
In-Reply-To: <2928272.ngRFCSvnHg@helios>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 29 Dec 2011 20:49:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/2011 10:28 AM, Paul Eggleton wrote:
> On Thursday 29 December 2011 10:05:52 Scott Garman wrote:
>> On 12/28/2011 01:37 PM, Saul Wold wrote:
>>> This will probably require a PR bump for nfs-utils then.
>>
>> Are you sure? I thought this was handled automatically as long as the
>> recipe in question includes the build dependency in DEPENDS, as
>> nfs-utils does for libevent.
>
> Yes, if you want nfs-utils to be rebuilt you'll need to bump its PR. When we
> eventually move over to the PR server that won't be necessary.

Wow, this is really surprising to me. In all of the recipe upgrades I've 
ever previously done, I've *never* bumped the PR for all other recipes 
that list it in DEPENDS. Is this a new procedure we'll have to adopt for 
the core metadata team?

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


