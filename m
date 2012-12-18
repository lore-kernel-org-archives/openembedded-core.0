Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tl36S-00023z-Gn
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 20:45:24 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Dec 2012 11:30:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,310,1355126400"; d="scan'208";a="264002160"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.212])
	by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2012 11:30:41 -0800
Message-ID: <50D0C461.7010901@linux.intel.com>
Date: Tue, 18 Dec 2012 11:30:41 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1355811791-4681-1-git-send-email-ming.liu@windriver.com>
	<CAJTo0LYDMxZ+2u_mpTevCD6cCX3OZgxs2ABxGauhuNDc+hzSSg@mail.gmail.com>
In-Reply-To: <CAJTo0LYDMxZ+2u_mpTevCD6cCX3OZgxs2ABxGauhuNDc+hzSSg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] initscripts: add urandom directory into volatiles
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
X-List-Received-Date: Tue, 18 Dec 2012 19:45:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/2012 03:23 AM, Burton, Ross wrote:
> On 18 December 2012 06:23, Ming Liu <ming.liu@windriver.com> wrote:
>> /etc/init.d/urandom fails to start/stop because it tries to save
>> random-seed into /var/lib/urandom folder which does not exist in the
>> file system.
>>
>> Fixed by adding /var/lib/urandom into volatiles.
>
> Doesn't this mean that the persistent state of urandom will be saved
> to a ramdisk?
>
> Mixing up persistent and transient state in /var is exactly why /run
> exists, and why we should switch to support /run as soon as
> possible...
>
Sorry, this was my suggestion, It actually is creating /var/lib/urandom 
which should be a persistent sub-dir of /var

I was bouncing back and for about it being in the the recipe's 
do_install vs  populate volaties file, I did not see any other 
/var/lib/<dir> being created so I leaned toward this solution.  This was 
on the list a week or so ago, we could go back to itbeing created in the 
do_install()

Sau!


> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


