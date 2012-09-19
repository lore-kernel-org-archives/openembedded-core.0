Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEMMc-0000G2-GV
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 17:38:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Sep 2012 08:26:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="194884442"
Received: from unknown (HELO [10.252.121.202]) ([10.252.121.202])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2012 08:26:15 -0700
Message-ID: <5059E416.6090108@intel.com>
Date: Wed, 19 Sep 2012 18:26:14 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<e12955c6d49bceb6c271574551b5feb76c51fa3b.1348052899.git.laurentiu.palcu@intel.com>
	<CAMKF1soiz=RjQEGd+bGidaMJKCVcja6wvUJeyyFfaUuPsXUUqg@mail.gmail.com>
	<CAJTo0Lb6QFTJkc0RKmvi5SKxpaGJo3db01ssScsiSsfMTjwGgg@mail.gmail.com>
In-Reply-To: <CAJTo0Lb6QFTJkc0RKmvi5SKxpaGJo3db01ssScsiSsfMTjwGgg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 4/7] gtk-icon-cache: run the icon generation at rootfs time
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
X-List-Received-Date: Wed, 19 Sep 2012 15:38:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/19/2012 04:38 PM, Burton, Ross wrote:
> On 19 September 2012 14:28, Khem Raj <raj.khem@gmail.com> wrote:
>> Do you really need bash for this script to run ? if so then can it be
>> written so that it works on posixly shells.
> 
> #! /bin/bash and no dependency on bash...  probably should make that
> sh-compliant.
Will do.

Thanks,
Laurentiu
> 
> Ross
> 


