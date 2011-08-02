Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoK4M-0002CU-KS
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 20:52:00 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Aug 2011 11:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,307,1309762800"; d="scan'208";a="35066428"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2011 11:47:36 -0700
Message-ID: <4E384647.7020407@linux.intel.com>
Date: Tue, 02 Aug 2011 11:47:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1311942290-27217-1-git-send-email-noor_ahsan@mentor.com>	<4E3843B1.2060008@linux.intel.com>
	<1312310743.3223.17.camel@lenovo.internal.reciva.com>
In-Reply-To: <1312310743.3223.17.camel@lenovo.internal.reciva.com>
Subject: Re: [PATCH] kernel,cml1.bbclass: Move menuconfig to cml1
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
X-List-Received-Date: Tue, 02 Aug 2011 18:52:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2011 11:45 AM, Phil Blundell wrote:
> On Tue, 2011-08-02 at 11:36 -0700, Saul Wold wrote:
>> I think this patch will break the linux-* recipes if someone tries to
>> use the menuconfig task.
>>
>> I think you need to also modify the linux-* recipes that currently
>> inherit kernel to also include cmd1
>
> kernel.bbclass already does "inherit cml1" so I think it should be fine.
>
Thanks, missed that, searched other places, but did not notice it there!

Issue resolved, will pull it now.

Sau!

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


