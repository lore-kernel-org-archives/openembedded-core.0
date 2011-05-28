Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QQT1O-0000dW-QW
	for openembedded-core@lists.openembedded.org;
	Sun, 29 May 2011 01:34:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 May 2011 16:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,287,1304319600"; 
   d="scan'208";a="9001407"
Received: from unknown (HELO [10.255.13.47]) ([10.255.13.47])
	by fmsmga002.fm.intel.com with ESMTP; 28 May 2011 16:31:11 -0700
Message-ID: <4DE185BE.7000905@intel.com>
Date: Sat, 28 May 2011 16:31:10 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4DE02216.1010003@intel.com>	<B424D198-12A5-4C45-93D7-C5CFA6C97BA5@dominion.thruhere.net>	<4DE128F5.1070603@gmail.com>	<4DE136F2.8030407@intel.com>
	<4DE161C7.7040908@gmail.com>
In-Reply-To: <4DE161C7.7040908@gmail.com>
Subject: Re: [PATCH 0/1][v3] license.bbclass parsing changes rebased sans debug
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
X-List-Received-Date: Sat, 28 May 2011 23:34:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 05/28/2011 01:57 PM, Khem Raj wrote:
> On 5/28/2011 10:54 AM, Elizabeth Flanagan wrote:
>> In this case, elfutils should probably be changes as well as
>> license.bbclass. As do_populate_lic is looking for valid python to make
>> a syntax tree from, this will fail. Solution:
>>
>> 1. Fix license.bbclass to check LICENSE and massage it a bit more.
>> 2. Fix elfutils to be GPLv2* (unless it's the GCC exception. I haven't
>> read the license yet).
>
> It does not like () around license values so simple solution is to replace
>
> -LICENSE = "(GPLv2&  Exception)"
> +LICENSE = "GPLv2&  Exception"
>
> Generally its preferable to fix eflutils first before license class in
> this case to keep the tree bisect'able.
>

Actually, the issue is my .replace("(", " ( "). It makes the string " ( 'GPLv2' & 'Exception' ) " which tosses an error 
because of the indented string. I have a fix I'm putting a pull request in (in about 10 minutes) for both this and the 
issue Koen found.

-b

---------------
Elizabeth Flanagan
Yocto Project
Release Engineer


