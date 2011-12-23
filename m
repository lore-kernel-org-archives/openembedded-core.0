Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Re9GB-0007K5-6k
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 18:50:23 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 23 Dec 2011 09:43:14 -0800
Received: by iazz13 with SMTP id z13so13446484iaz.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 09:43:14 -0800 (PST)
Received: by 10.50.182.130 with SMTP id ee2mr14717731igc.30.1324662193927;
	Fri, 23 Dec 2011 09:43:13 -0800 (PST)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id f32sm39910202ibf.9.2011.12.23.09.43.12
	(version=SSLv3 cipher=OTHER); Fri, 23 Dec 2011 09:43:13 -0800 (PST)
Message-ID: <4EF4BDA1.2060906@intel.com>
Date: Fri, 23 Dec 2011 09:42:57 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1324661415.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1324661415.git.scott.a.garman@intel.com>
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
X-List-Received-Date: Fri, 23 Dec 2011 17:50:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/2011 09:31 AM, Scott Garman wrote:
> Hello,
>
> This pull request upgrades the chrpath and libevent recipes. It has
> been build-tested on all 5 of our qemu architectures.

Please hold off on accepting this pull request. I forgot to include the 
distro tracking field updates, and when I just went to do so, I noticed 
that libevent had a NO_UPDATE_REASON field suggesting that libevent2 was 
not compatible. Which means I have to do a lot more testing on this 
before I can feel comfortable submitting it.

I will likely not get to this until I return on January 2.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


