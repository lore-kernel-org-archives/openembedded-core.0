Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RR86K-0004FK-OY
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 20:58:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAHJpwDs019955
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 11:51:58 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 17 Nov 2011 11:51:58 -0800
Message-ID: <4EC565DD.4070402@windriver.com>
Date: Thu, 17 Nov 2011 13:51:57 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1321496999.1264.24.camel@localhost.localdomain>
	<CAEsOVNdL3bTKA9rv6p9SEpvoY+a3b5y6Ftn=ySMVdgkW3nMm3w@mail.gmail.com>
	<20111117085730.GA4551@mail.familie-heinold.de>
	<1321521168.1264.43.camel@localhost.localdomain>
	<4EC562C6.8000905@windriver.com>
	<CABcZANmaGwMmKUkNoAg2C_nECa2AvXjfPYk_z-MA1Hj2YhW0Rg@mail.gmail.com>
In-Reply-To: <CABcZANmaGwMmKUkNoAg2C_nECa2AvXjfPYk_z-MA1Hj2YhW0Rg@mail.gmail.com>
Subject: Re: how to exclude files when packaging?
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
X-List-Received-Date: Thu, 17 Nov 2011 19:58:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/11 1:43 PM, Chris Larson wrote:
> On Thu, Nov 17, 2011 at 12:38 PM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>> On 11/17/11 3:12 AM, Ni Qingliang wrote:
>>>
>>> I still think that the 'exclude" feature would be better.:)
>>
>> IMHO an exclude function would simply be an automated rm -f<list>  at the
>> end of the install process.
>>
>> It should be fairly easy to implement this if someone thinks it's a better
>> idea then making individual recipes run a rm -f of their own.
>
> I wonder if, in general, it'd be useful to implement glob exclusions.
> In other words, our list of patterns could become more like a
> .gitignore file:
> /foo/*
> !/foo/bar

I considered that early on in the Yocto Project work -- but decided against it 
due to simply the complications required to ensure that the patterns worked as 
the end user expected them.

I know the bitbake back end and OE classes have matured since then, it may be 
easier to implement now -- if so I'm certainly interested in this.

--Mark


