Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1THXIq-0004Tu-4N
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 11:56:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Sep 2012 02:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,501,1344236400"; d="scan'208";a="228059273"
Received: from costin-desktop (HELO [10.237.105.66]) ([10.237.105.66])
	by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2012 02:43:17 -0700
Message-ID: <50656473.2040409@intel.com>
Date: Fri, 28 Sep 2012 11:48:51 +0300
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1348820316-20012-1-git-send-email-constantinx.musca@intel.com>
	<CAJTo0LaDts7hbUCELdCvJ-Gbt1bcO-rQuYGPk744r-wUP1EFwA@mail.gmail.com>
In-Reply-To: <CAJTo0LaDts7hbUCELdCvJ-Gbt1bcO-rQuYGPk744r-wUP1EFwA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libnss-mdns: fix mDNS resolving speed
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
X-List-Received-Date: Fri, 28 Sep 2012 09:56:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/28/2012 12:40 PM, Burton, Ross wrote:
> On 28 September 2012 09:18, Constantin Musca
> <constantinx.musca@intel.com> wrote:
>> We need to fix the "hosts: files dns mdns4" nsswitch.conf line
>> because for a .local lookup it does a DNS lookup first which will fail.
>> The recommended solution is:
>> hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4
> Have you tested this works?  Last time I saw this worked on
> (Christian, iirc) the "solution" wasn't actually working.
>
> Ross
I tested it pinging a host.local and it works. What else should I test ?

Constantin


