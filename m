Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RbH0a-0000so-TC
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 20:30:25 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Dec 2011 11:23:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="87799008"
Received: from unknown (HELO [10.255.12.229]) ([10.255.12.229])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2011 11:23:25 -0800
Message-ID: <4EEA492D.9060707@linux.intel.com>
Date: Thu, 15 Dec 2011 11:23:25 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323911699.git.sgw@linux.intel.com>
	<7645ba6589957af6afa3fbe8766fb1ca6f1b004f.1323911699.git.sgw@linux.intel.com>
	<CAMKF1sqUViQRC4G6rZi_szkCbbC5-juiTAJsF=U8iBusrm3LJA@mail.gmail.com>
	<4EE9B1B6.8050007@linux.intel.com>
In-Reply-To: <4EE9B1B6.8050007@linux.intel.com>
Subject: Re: [PATCH 2/7] ed: Fix EXTRA_OECONF to ensure right compiler is found
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
X-List-Received-Date: Thu, 15 Dec 2011 19:30:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/2011 12:37 AM, Saul Wold wrote:
> On 12/14/2011 10:56 PM, Khem Raj wrote:
>> On Wed, Dec 14, 2011 at 5:50 PM, Saul Wold<sgw@linux.intel.com> wrote:
>>>
>>> +EXTRA_OECONF = "'CC=${CC}' 'CXX=${CXX}' 'CFLAGS=${CFLAGS}'
>>> 'CXXFLAGS=${CXXFLAGS}' 'CPPFLAGS=${CPPFLAGS}' 'LDFLAGS=${LDFLAGS}'"
>>> +
>>
>> hmm why doesnt it pick it from environment in configure ?
>>
> That's a really good question! But it does not seem to, when I do the
> build with non-gplv3, it gets CC=/usr/bin/gcc! So clearly it's not
> getting the environment, otherwise I would not have made this patch.
>
> This is an old-school configure script.
>
Just a further explanation of this comment, the configure script in ed 
is a very old script, not autotools based at all.  It hard codes the 
CC="" in the script so the environment is not picked up correct, but it 
does read those properly from the command line.

Sau!

> Sau!
>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


