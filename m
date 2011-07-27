Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qm6Tl-0004Iq-04
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:57:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2011 08:52:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,276,1309762800"; d="scan'208";a="32912181"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2011 08:52:41 -0700
Message-ID: <4E303449.30105@linux.intel.com>
Date: Wed, 27 Jul 2011 08:52:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311752531.git.sgw@linux.intel.com>	<3a8dba4abda014b2368eceff10b455c48dd54f39.1311752531.git.sgw@linux.intel.com>
	<1311759396.30326.272.camel@phil-desktop>
In-Reply-To: <1311759396.30326.272.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [Consolidated & Tested 02/35] meta/conf/local.conf.sample: improve comments/layout
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
X-List-Received-Date: Wed, 27 Jul 2011 15:57:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2011 02:36 AM, Phil Blundell wrote:
> On Wed, 2011-07-27 at 00:46 -0700, Saul Wold wrote:
>>   # There are other application targets too, see meta/classes/core-image.bbclass
>> +<<<<<<<  HEAD:meta/conf/local.conf.sample
>>   # and meta/packages/tasks/task-core.bb for more details.
>>
>>   EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
>> +=======
>> +# and meta/recipes-core/tasks/task-core.bb for more details.
>> +<<<<<<<  HEAD:meta-yocto/conf/local.conf.sample
>> +# The -sdk image includes these features by default now.
>> +EXTRA_IMAGE_FEATURES = "debug-tweaks"
>> +=======
>> +EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
>> +>>>>>>>  d82e8ed... meta/conf/local.conf.sample: improve comments/layout:meta/conf/local.conf.sample
>> +>>>>>>>  8d50670... meta/conf/local.conf.sample: improve comments/layout:meta-yocto/conf/local.conf.sampl
>
> Er?  That doesn't look like it can be right.  I'm a bit surprised that
> you managed to test successfully with those conflict markers in there.
>
> p.
>
>
Your right, this was respun it did not trigger a conflict message
though.

Crazy.

Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


