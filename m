Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qbi7s-0004rV-4n
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 01:55:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jun 2011 16:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,440,1304319600"; d="scan'208";a="21685964"
Received: from swold-mobl.jf.intel.com (HELO [10.24.0.56]) ([10.24.0.56])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2011 16:51:45 -0700
Message-ID: <4E0A6910.4040107@linux.intel.com>
Date: Tue, 28 Jun 2011 16:51:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1309059243.git.sgw@linux.intel.com>	<dc56d07c4a034568b8860d7bcd41b31acbdb3e89.1309059243.git.sgw@linux.intel.com>
	<B39BDB9E-CF2E-47CD-A195-BCEFD4B8B8C4@dominion.thruhere.net>
In-Reply-To: <B39BDB9E-CF2E-47CD-A195-BCEFD4B8B8C4@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC - Staticdev 1/2] multiple recipes converted to -staticdev packages
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
X-List-Received-Date: Tue, 28 Jun 2011 23:55:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/26/2011 12:34 AM, Koen Kooi wrote:
>
> Op 26 jun 2011, om 06:36 heeft Saul Wold het volgende geschreven:
>
>> This commit adds a new base package ${PN}-staticdev to
>> bitbake.conf which pulls in the static *.a libraries as
>> a seperate package, it filters out the nonshared.a
>> libraries where appropriate.
>>
>> Additional this commit adds a new libdev.bbclass which provides
>> a set of macros and variables to convert ${PN} to lib${PN},
>> which a number of recipes where then converted to use.
>
> Can't that be merged into lib_package.bbclass?
>
I looked into this further, and I think that lib_package serves a 
different purpose than libdev and it would be wrong to inherit from 
lib_package.

lib_package seems to split out binaries from the core ${PN} package and 
places them in ${PN}-bin.  I did update it to move static libraries to 
the -staticdev package.

Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


