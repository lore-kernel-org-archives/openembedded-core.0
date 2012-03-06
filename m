Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S4i3a-0001Xz-88
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 01:15:10 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Mar 2012 16:06:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="114844854"
Received: from edwin-gen.sh.intel.com (HELO [10.239.36.17]) ([10.239.36.17])
	by orsmga001.jf.intel.com with ESMTP; 05 Mar 2012 16:06:32 -0800
Message-ID: <4F55555C.3060708@intel.com>
Date: Tue, 06 Mar 2012 08:07:56 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20120302063339.GB1450@edwin-gen> <1330702308.309.10.camel@ted>
In-Reply-To: <1330702308.309.10.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: multilib build failure with shadow-sysroot:do_populate_sysroot_setscene
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
X-List-Received-Date: Tue, 06 Mar 2012 00:15:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2012 11:31 PM, Richard Purdie wrote:
> On Fri, 2012-03-02 at 14:33 +0800, Zhai, Edwin wrote:
>> RP,
>> I have image-sato multilib build failure with following error:
>>
>> "ERROR: Task do_package_setscene depends upon nonexistant task
>> /distro/edwin-working/poky/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb:do_populate_sysroot_setscene
>> Summary: There was 1 ERROR message shown, returning a non-zero exit code."
>>
>> After removing "shadow-sysroot:do_populate_sysroot_setscene" from
>> USERADDSETSCENEDEPS in meta/classes/useradd.bbclass, I can pass the build.
>>
>> Why does it become nonexistant task in multilib building? Any possible fix for
>> it?
>
> Totally guessing but does replacing:
>
> shadow-sysroot:do_populate_sysroot_setscene
>
> with:
>
> ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene
>
> work better?

RP,
It works. I'll send out this patch after test.
BTW, shouldn't it be extended automatically?

Thanks,
Edwin

>
> Cheers,
>
> Richard
>
>
>



