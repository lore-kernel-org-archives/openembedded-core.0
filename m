Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TNuRk-00054j-EG
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 01:51:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Oct 2012 16:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,590,1344236400"; d="scan'208";a="234264705"
Received: from unknown (HELO [10.255.13.226]) ([10.255.13.226])
	by fmsmga001.fm.intel.com with ESMTP; 15 Oct 2012 16:38:24 -0700
Message-ID: <507C9E70.1080900@linux.intel.com>
Date: Mon, 15 Oct 2012 16:38:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1350339349-6387-1-git-send-email-sgw@linux.intel.com>
	<1350339558.4470.112.camel@x121e.pbcl.net>
In-Reply-To: <1350339558.4470.112.camel@x121e.pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nfs-utils: Ensure that the Kernel modules are include
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
X-List-Received-Date: Mon, 15 Oct 2012 23:51:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/2012 03:19 PM, Phil Blundell wrote:
> On Mon, 2012-10-15 at 15:15 -0700, Saul Wold wrote:
>> This fixes the issue when booting a kernel with out the kernel modules
>> included.
> [...]
>>   # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
>>   # pull in the remainder of the dependencies.
>> +KERNEL_FEATURES_append " nfsd"
>
> Er, really?  I'm a bit surprised that this even parses successfully, let
> alone fixes anything.  Is this definitely the patch you meant to send?
>
Nope, a little hasty on the send button!

Fixed in my testing branch.

Sau!

> p.
>
>
>
>


