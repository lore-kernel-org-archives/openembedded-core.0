Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1TwQg4-0007kw-Ks
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 06:09:41 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0J4rk8P005945
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Jan 2013 20:53:46 -0800 (PST)
Received: from [128.224.162.143] (128.224.162.143) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 18 Jan 2013 20:53:44 -0800
Message-ID: <50FA26D9.5020601@windriver.com>
Date: Sat, 19 Jan 2013 12:53:45 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1358477598.git.rongqing.li@windriver.com>
	<101e3bb96160957183aaa5770f989757916edaa9.1358477598.git.rongqing.li@windriver.com>
	<20130118082611.GC3091@jama> <50FA2323.5060305@windriver.com>
	<50FA24EA.5060200@linux.intel.com>
In-Reply-To: <50FA24EA.5060200@linux.intel.com>
Cc: joe.macdonald@windriver.com, Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] xinetd: enable tcp-wrappers support by DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Jan 2013 05:09:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/19/2013 12:45 PM, Saul Wold wrote:
>>>> +EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'tcp-wrappers',
>>>> '--with-libwrap', '', d)}"
>>>> +
>>>
>>> Why not use PACKAGECONFIG here?
>>>
>>
>> Enabling tcp-wrapper is not a random thing for some customer,
>> it is a must. So I think feature is more suitable
>>
> Martin's point is you can use the PACKAGECONFIG syntax here instead of 2
> base_contains.
>
> for example:
> PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'tcp_wrappers',
> 'tcp_wrappers', '', d)}"
> PACKAGECONFIG[tcp_wrappers] = "--with-libwrap,--without-libwrap,
> tcp_wrappers"
>
> See docs for more information.
>
> Sau!

I see, thanks

-Roy

-- 
Best Reagrds,
Roy | RongQing Li


