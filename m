Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE7E6066A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 04:53:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Aug 2013 21:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,798,1367996400"; d="scan'208";a="355945561"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2013 21:53:04 -0700
Message-ID: <51FB3B2F.1060908@linux.intel.com>
Date: Thu, 01 Aug 2013 21:53:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
	<51F97628.9040801@linux.intel.com>
	<7705A938-20F6-4100-AB3A-99BDF5023118@gmail.com>
	<13A232F2-9B2C-427E-B5F0-26138984D099@gmail.com>
	<51F9948F.1000908@linux.intel.com>
	<08E217DF-FA59-4DAB-BB7F-0369A4BB3165@gmail.com>
	<51F99839.4020003@linux.intel.com>
	<FEC3604F-BE31-4146-AA6B-A16CB22C8D3F@gmail.com>
In-Reply-To: <FEC3604F-BE31-4146-AA6B-A16CB22C8D3F@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2013 04:53:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2013 01:19 PM, Khem Raj wrote:
>
> On Jul 31, 2013, at 4:05 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>> On 07/31/2013 03:51 PM, Khem Raj wrote:
>>>
>>> On Jul 31, 2013, at 3:49 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>>>
>>>> Still seems to failing in Jinja, I wonder if the dependencies are correctly sinec it's nooking for native bits and the python3-native had not been installed yet.
>>>>
>>>>
>>>
>>> in my build from scratch several times, I never had this issue. Did you do an incremental build to get to this issue ?
>>>
>>
>> Yes, most of my builds are incremental until I throw them against the Autobuilder!
>
> Saul,
>
> I was able to reproduce the incremental build issue. I have now fixed it and pushed a rebased branch to pull tree
> in contrib. Please try it out
>

Almost there!  It looks like you have a ${PN} in the tarball name 
instead of ${BPN} and it's causing a multilib failure for zeromq.

> ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
> http://download.zeromq.org/lib32-zeromq-3.2.2.tar.gz:
> 2013-08-02 00:24:06 ERROR 404: Not Found.
>
> ERROR: Function failed: Fetcher failure for URL: 'http://download.zeromq.org/lib32-zeromq-3.2.2.tar.gz'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-zeromq/3.2.2-r1/temp/log.do_fetch.9470

Notice the lib32-zeromq-3.2.2.tar.gz instead of zeromq-3.2.2.tar.gz

Thanks
	Sau!


> Thanks
> -Khem
>
>
>

