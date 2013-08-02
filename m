Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A04A66066A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 05:30:39 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Aug 2013 22:30:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,799,1367996400"; d="scan'208";a="340509986"
Received: from sorvi.fi.intel.com (HELO [10.237.72.152]) ([10.237.72.152])
	by azsmga001.ch.intel.com with ESMTP; 01 Aug 2013 22:30:38 -0700
Message-ID: <51FB43FD.9010600@linux.intel.com>
Date: Fri, 02 Aug 2013 08:30:37 +0300
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1375369300-13471-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1375369300-13471-5-git-send-email-jukka.rissanen@linux.intel.com>
	<CAJTo0LZBTjMMt8SuSXc5j3KueTBsmVXASeRJbHKtZp76f90S-Q@mail.gmail.com>
In-Reply-To: <CAJTo0LZBTjMMt8SuSXc5j3KueTBsmVXASeRJbHKtZp76f90S-Q@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 4/4] ofono: Move do_install() to ofono recipe file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2013 05:30:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

On 01.08.2013 20:04, Burton, Ross wrote:
> On 1 August 2013 16:01, Jukka Rissanen <jukka.rissanen@linux.intel.com> wrote:
>> This allows the ofono.inc file to be used by a recipe that does
>> not have or use ofono init script.
>
> I'm not keen on this.  I presume the situation here is that your
> distro has an updated ofono that doesn't have an init script, because
> your distro is systemd-only.  Can't your overlaid recipe ship a stub
> init script (touch files/ofono) to be installed that will get deleted
> by systemd.bbclass?
>
> Ross
>

Sure, that is what I am doing atm. It would have been nice if I could 
delete the useless init script but that is very minor issue. So just 
ignore this patch 4.


Cheers,
Jukka


