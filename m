Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qghj5-0000k4-7T
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 20:30:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 11:26:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,522,1304319600"; d="scan'208";a="25018419"
Received: from unknown (HELO [10.255.14.40]) ([10.255.14.40])
	by orsmga002.jf.intel.com with ESMTP; 12 Jul 2011 11:26:32 -0700
Message-ID: <4E1C91D8.4050403@linux.intel.com>
Date: Tue, 12 Jul 2011 11:26:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310425837.git.sgw@linux.intel.com>	<1122cff5b635c23b36bc76ad58a088f522ac21a5.1310425837.git.sgw@linux.intel.com>	<1310461868.6337.179.camel@phil-desktop>
	<1310462034.6337.181.camel@phil-desktop>
In-Reply-To: <1310462034.6337.181.camel@phil-desktop>
Subject: Re: [PATCH 03/26] shared_lib.bbclass: create common class
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
X-List-Received-Date: Tue, 12 Jul 2011 18:30:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2011 02:13 AM, Phil Blundell wrote:
> On Tue, 2011-07-12 at 10:11 +0100, Phil Blundell wrote:
>> On Mon, 2011-07-11 at 16:13 -0700, Saul Wold wrote:
>>> This class is for packages that do not work with debian library naming
>>
>> I tend to feel that most of those packages should be fixed so that they
>> do.  If they aren't currently getting renamed then it usually means that
>> they include too much (i.e. both binaries and libraries, or multiple
>> libraries) and should be split up so that this doesn't happen.
>
> Actually, looking at the patch more carefully I guess this does
> basically address the first case above (binaries and libraries).  But it
> looks like it will result in the slightly confusing situation where the
> libraries go into lib${PN} but the corresponding headers are in
> ${PN}-dev.
>
Correct, this is trying to address the existing cases that have both 
binaries and libraries, I guess the other way to do this would be for 
those 5 or so packages to use "lib_packaging" and which renames the 
binary packages ${PN}-bin and the libraries then get auto renamed via 
debian renaming rules.

This is kind of the inverse of lib_packaging.bbclass, binaries go in 
${PN} and libraries need to be placed into the named lib${PN}.

As for headers and debug, they go in the ${PN}-[dev,dbg] packagse

I can go with Koen's name of shlibpackaging.bbclass
Sau!

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


