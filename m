Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UNg71-0000hN-5W
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 11:05:41 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Apr 2013 01:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,407,1363158000"; d="scan'208";a="222718848"
Received: from dell-desktop.rb.intel.com (HELO [10.237.105.59])
	([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Apr 2013 01:48:11 -0700
Message-ID: <515D3E4F.3050900@intel.com>
Date: Thu, 04 Apr 2013 11:48:15 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1365006329-20964-1-git-send-email-radu.moisan@intel.com>
	<1365006329-20964-3-git-send-email-radu.moisan@intel.com>
	<825B3AFA-0F5B-45F2-B4DE-D359A1E4414B@dominion.thruhere.net>
	<CAJTo0LbiXC_qKszpNNy5crnpXeGx99Ff9vGzpcXNk4otXgp8GQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbiXC_qKszpNNy5crnpXeGx99Ff9vGzpcXNk4otXgp8GQ@mail.gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] udev: enable multilib support
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
X-List-Received-Date: Thu, 04 Apr 2013 09:05:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2013 09:02 PM, Burton, Ross wrote:
> On 3 April 2013 18:58, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> NACK! The udev maintainers have been clear that it is always /lib/udev, even on 64 bit systems, so you're not fixing a problem, you're creating an extra one.
> Radu, can you do a multilib udev build and see what continues to fall
> into /lib64, so we can fix it?  (and the same with systemd)

I'll take a look into this, of course.

Radu


