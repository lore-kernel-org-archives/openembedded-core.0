Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qjig7-0000RZ-JV
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 04:07:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jul 2011 19:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,238,1309762800"; d="scan'208";a="30509254"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2011 19:03:47 -0700
Message-ID: <4E278903.3020602@linux.intel.com>
Date: Wed, 20 Jul 2011 19:03:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
	<4E275071.9080600@mentor.com>
In-Reply-To: <4E275071.9080600@mentor.com>
Subject: Re: [PATCH 00/10] Small fixes
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
X-List-Received-Date: Thu, 21 Jul 2011 02:07:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2011 03:02 PM, Tom Rini wrote:
> On 07/20/2011 02:06 PM, Martin Jansa wrote:
>> Fixes for recipes using intltool, distributions not having locales support in libc and distutils fix
>>
>> The following changes since commit 0d03800caffc2341b74190d38f7a372223c89f4c:
>>
>>    lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib (2011-07-20 15:43:43 +0100)
>>
>> are available in the git repository at:
>>    git://git.openembedded.org/openembedded-core-contrib jansa/pull
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
>>
>> Martin Jansa (10):
>>    tcmode-default: set preferred version also for (e)glibc-locale
>>    eglibc-package: don't fail without localedef/gconv
>>    intltool: inherit perlnative
>>    polkit: inherit perlnative
>>    shared-mime-info: inherit perlnative
>>    xkeyboard-config: inherit perlnative
>>    avahi: inherit perlnative
>>    vte: inherit perlnative
>>    python: save Makefile.sysroot in do_compile
>>    python: add patch to fix cross compilation on host with linux-3.0
>
> So, with the long path series I posted most of the perlnative's should
> be handled automatically with cpan having fixed up the tool in question.
>   I suspect however that we have a few things like intltool that need
> perlnative but don't today.
>
Are they really still required after Tom's perlnative cpan fix goes in? 
I guess I need a test case to try and duplicate the failure better since 
I don't see it on any of my 3 build machines!

Sau!



