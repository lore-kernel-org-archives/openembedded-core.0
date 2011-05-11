Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJxfm-0006eZ-BY
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 02:53:06 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 May 2011 17:50:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,349,1301900400"; 
   d="scan'208";a="658940"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2011 17:50:19 -0700
Message-ID: <4DC9DD4A.1040205@linux.intel.com>
Date: Tue, 10 May 2011 17:50:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1302936483.git.sgw@linux.intel.com>	<eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>	<1303102414.5518.30.camel@rex>	<1865303E0DED764181A9D882DEF65FB6900D7D5708@shsmsx502.ccr.corp.intel.com>	<1303109647.5518.54.camel@rex>	<1865303E0DED764181A9D882DEF65FB69334F4BD75@shsmsx502.ccr.corp.intel.com>	<1304634851.30391.54.camel@rex>	<1865303E0DED764181A9D882DEF65FB69334F4BD82@shsmsx502.ccr.corp.intel.com>	<1304681508.30391.84.camel@rex>	<1865303E0DED764181A9D882DEF65FB69334F4BD8A@shsmsx502.ccr.corp.intel.com>	<1305036626.30391.276.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD8C@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB69334F4BD8C@shsmsx502.ccr.corp.intel.com>
Subject: Re: [PATCH 37/58] gnu-config-native: add dependency on perl-native
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
X-List-Received-Date: Wed, 11 May 2011 00:53:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2011 07:20 AM, Cui, Dexuan wrote:
> Richard Purdie wrote:
>> On Tue, 2011-05-10 at 22:02 +0800, Cui, Dexuan wrote:
>>>> or we hardcode to /usr/bin/perl. Since the perl-native binary won't
>>>> be in the path for any of these, autodetecting and letting it
>>>> hardcode is probably fine. It has the advantage that if there are
>>>> any binary modules ever involved, they'll match the version of perl
>>>> they were built for regardless of whether perl-native is a
>>>> dependency or not. If someone adds a perl-native dependency to
>>>> autoconf-native, it will also still select the "correct" perl.
>>>>
>>>> Whilst doing this we need to keep bug #968 in mind and ensure that
>>>> if perl-native is used, all of perl-native is in the sysroot. That
>>>> bug is where the perl binary was installed, the library was not and
>>>> an error occurred. If it is in its own directory which is only
>>>> added to the PATH for users with the correct dependency, we avoid
>>>> this.
>>>>
>>>> As for bug #941, the bottom line is that however autoconf-native
>>>> selects its perl version, the strings encoded in gnu-config should
>>>> really match those in the other autoconf-native scripts.
>>> I saw a commit that was once suspended was pushed into poky
>>> master yesterday:
>>> http://git.pokylinux.org/cgit/cgit.cgi/poky/commit/?id=605141a93443df042634b2219a8628a9004be023
>>> Actually it does fix(or at least workaround) bug #941 and bug #968.
>>>
>>> Looks there are much work to do if we install perl-native to its own
>>> sysroot. At present we can use the above commit as a workaround.
>>
>> Its merged as a workaround but I still think we need to clean this up
>> properly and we need to continue working on it.
> I actually meant the priority could be lowered since we have a workaround. :-)
> Surely, I'll continue to investigate it.
>
Just to be clear, just because we have a work around does not mean we 
can lower the priority, this is still a valid bug that needs a proper 
patch in a timely manner.

941 is still a major bug and requires a fix before the milestone 1 
release stabilization period (May 20), which is 10 days from now.

Sau!


> Thanks,
> -- Dexuan
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



