Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RVVB7-0005oq-Fy
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 22:25:25 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 3E05DD3A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 22:18:37 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtUcAD5L1U5T4zgTPGdsb2JhbAAMLwiJSqFNAQEBATeCJAEBAQECAThAEQshFg8JAwIBAgExFAYNCAEBiAG3RoNphASDMQSUVJIS
X-IronPort-AV: E=Sophos;i="4.69,593,1315173600"; d="scan'208";a="225866297"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.19])
	by ipb1.telenor.se with ESMTP; 29 Nov 2011 22:18:37 +0100
Message-ID: <4ED54C2B.2060505@emagii.com>
Date: Tue, 29 Nov 2011 22:18:35 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED0CC76.4040606@emagii.com> <1322579029.7964.0.camel@ted>
In-Reply-To: <1322579029.7964.0.camel@ted>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 29 Nov 2011 21:25:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


>> Seen a couple of errors as well.
>>
>> 1.    ERROR: Function 'useradd_sysroot' failed
>>           Tried to access "/etc/group" but this was locked.
>>           Problem disappeared the next time I rebuilt.
> Can you file a bug about this problem please. I think we need to go
> through the code paths in shadow and ensure its locking is sane. I took
> a quick look at the code and was left wondering what lckpwdf() does for
> example. Scott, could you take a look at this?

Bugzilla is out of service, so bugs cannot be filed.

Haven't seen the issue since then so it is hard to give any details.
I used very high BB_NUMBER_THREADS = 24.

This machine (Ubuntu 11.10 /x64) gets stuck in building C++
programs at the moment, so I am considering resinstalling with
Ubuntu 11.04 to get something done.


-- 
Best Regards
Ulf Samuelsson
eMagii



