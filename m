Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Slris-0002EM-3O
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 03:16:10 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2012 18:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118293785"
Received: from unknown (HELO envy.home) ([10.255.13.50])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Jul 2012 18:05:07 -0700
Message-ID: <4FF244EB.8040809@linux.intel.com>
Date: Mon, 02 Jul 2012 18:03:39 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <441e9c9457b3f888162fe83793df551a6ee97697.1341259773.git.dvhart@linux.intel.com>
	<1341261067.23146.269.camel@ted>
In-Reply-To: <1341261067.23146.269.camel@ted>
X-Enigmail-Version: 1.4.2
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] grub-efi: Do not use help2man
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
X-List-Received-Date: Tue, 03 Jul 2012 01:16:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/02/2012 01:31 PM, Richard Purdie wrote:
> On Mon, 2012-07-02 at 13:09 -0700, Darren Hart wrote:

>> +Index: grub-1.99/configure
>> +===================================================================
>> +--- grub-1.99.orig/configure
>> ++++ grub-1.99/configure
> 
> Isn't configure regenerated so we don't need this second bit patching
> configure, just configure.ac?

It wasn't in my tests. I tried again in master with:

$ bitbake grub-efi-i586 native -c cleanall
$ bitbake grub-efi-i586 native -d devshell
  performs fetch, unpack, patch
# edited configure.ac and left configure alone
$ bitbake grub-efi-i586 native

Fails in the same way and configure does not reflect the changes from
configure.ac. This is what I would expect as ./autogen.sh should
typically only be run when building from the RCS sources and not release
tarballs.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




