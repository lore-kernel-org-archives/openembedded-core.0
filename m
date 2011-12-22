Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RdX1n-0003Wz-HQ
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 02:01:01 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Dec 2011 16:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104850599"
Received: from edwin-gen.sh.intel.com (HELO [10.239.36.111]) ([10.239.36.111])
	by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2011 16:53:52 -0800
Message-ID: <4EF27F54.3030603@intel.com>
Date: Thu, 22 Dec 2011 08:52:36 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1324454963.git.edwin.zhai@intel.com>
	<bb425c648fb30fa14fe5981b5c8bba8e8cf6ba5d.1324454963.git.edwin.zhai@intel.com>
	<4EF2359E.3030904@linux.intel.com>
In-Reply-To: <4EF2359E.3030904@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] minix-session: Add this recipe as the session file for mini X
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
X-List-Received-Date: Thu, 22 Dec 2011 01:01:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2011 03:38 AM, Saul Wold wrote:
>> diff --git a/meta/recipes-graphics/minix-session/minix-session_0.1.bb b/meta/recipes-graphics/minix-session/minix-session_0.1.bb
>> >  new file mode 100644
>> >  index 0000000..2e912c6
>> >  --- /dev/null
>> >  +++ b/meta/recipes-graphics/minix-session/minix-session_0.1.bb
>> >  @@ -0,0 +1,24 @@
>> >  +DESCRIPTION = "Mini X session files for poky"
>> >  +HOMEPAGE ="http://www.yoctoproject.org"
>> >  +BUGTRACKER ="http://bugzilla.pokylinux.org"
>> >  +
>> >  +LICENSE = "GPL"
>> >  +LIC_FILES_CHKSUM ="file://minix-session;endline=5;md5=b6430bffbcf05f9760e72938826b7487"
>> >  +
> Is this really GPL?  MIT maybe?
>
> And if it is GPL then what version?

I derived it from matchbox-session and inherited "GPL". Maybe GPLv2 is 
more reasonable?

Thanks,
Edwin

>
> Sau!
>



