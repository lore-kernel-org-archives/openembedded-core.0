Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QQJVL-0006A0-4b
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 15:24:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 May 2011 06:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,285,1304319600"; 
   d="scan'208";a="6202411"
Received: from unknown (HELO [10.255.13.47]) ([10.255.13.47])
	by orsmga001.jf.intel.com with ESMTP; 28 May 2011 06:21:27 -0700
Message-ID: <4DE0F6D6.1000105@intel.com>
Date: Sat, 28 May 2011 06:21:26 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	Koen Kooi <koen@dominion.thruhere.net>
References: <4DE02216.1010003@intel.com>
	<B424D198-12A5-4C45-93D7-C5CFA6C97BA5@dominion.thruhere.net>
In-Reply-To: <B424D198-12A5-4C45-93D7-C5CFA6C97BA5@dominion.thruhere.net>
Subject: Re: [PATCH 0/1][v3] license.bbclass parsing changes	rebased sans debug
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
X-List-Received-Date: Sat, 28 May 2011 13:24:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Could you send me the log. That's odd and shouldn't have happened (the license is only two licenses...)

-b

On 05/28/2011 02:16 AM, Koen Kooi wrote:
>
> Op 28 mei 2011, om 00:13 heeft Elizabeth Flanagan het volgende geschreven:
>
>>
>> Using python abstract syntax trees as a parser and an ast visitor class, I've
>> begun the first steps to being able to put some sanity to license selection.
>>
>> One note. License modifiers have traditionally been limited to the "or greater"
>> modifier "+". I've added another modifier "with exceptions" for licenses that
>> have no generic ie common-licenses/GPL-2,0-with-GCC-exception
>
> When building shadow I get:
>
> | WARNING: /home/koen/angstrom-core/sources/openembedded-core/meta/files/common-licenses
> | ERROR: Error executing a python function in /home/koen/angstrom-core/sources/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb:
> | RuntimeError: maximum recursion depth exceeded while calling a Python object
> |
> | ERROR: The stack trace of python calls that resulted in this exception/failure was:
> | ERROR:   File "do_populate_lic", line 121, in<module>
> | ERROR:
> | ERROR:   File "do_populate_lic", line 118, in do_populate_lic
> | ERROR:
> | ERROR:   File "/usr/lib64/python2.7/ast.py", line 243, in visit
> | ERROR:     return visitor(node)
> | ERROR:
> | ERROR:   File "do_populate_lic", line 13, in generic_visit
>
> and a few hundred more lines, I had to change the scrollback buffer from 512 lines to unlimited to catch this :) I can send the full log on request.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

-- 
---------------
Elizabeth Flanagan
Yocto Project
Release Engineer


