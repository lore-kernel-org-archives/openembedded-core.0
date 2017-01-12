Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 70E2971C84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 22:04:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0CM4B2F030874
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 14:04:11 -0800
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 12 Jan 2017 14:04:10 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1484249086-36492-1-git-send-email-juro.bystricky@intel.com>
	<1484257321.4367.238.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <704d3ba6-03aa-e4b6-7a94-76b247c0efce@windriver.com>
Date: Thu, 12 Jan 2017 16:04:09 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484257321.4367.238.camel@linuxfoundation.org>
Subject: Re: [PATCH] sanity.bbclass: Improved error message
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
X-List-Received-Date: Thu, 12 Jan 2017 22:04:12 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 1/12/17 3:42 PM, Richard Purdie wrote:
> On Thu, 2017-01-12 at 11:24 -0800, Juro Bystricky wrote:
>> When a non-existing MACHINE is specified, sanity check issues
>> the following message:
>>
>>     Please set a valid MACHINE in your local.conf or environment
>>
>> However, MACHINE can also be set in multiconfig .conf file(s).
>> Hence we may have several different MACHINE settings within one
>> (multiconfig) build, so the present error message is fairly
>> ambiguous.
>>
>> This patch remedies this by explicitly naming the offending MACHINE
>> and
>> adding conf/multiconfig/*.conf to the list of places where this
>> erroneous
>> MACHINE definition could have originated.
>>
>>     Invalid MACHINE=xyz. Please set a valid MACHINE in your
>> local.conf, conf/multiconfig/*.conf or environment
> 
> Can we change this to:
> 
> "MACHINE=xyz is invalid. Please set a valid MACHINE in your local.conf,
> environment or other configuration file."

I commented elsewhere as well -- but is there any way to see where MACHINE was
actually set and display that -- or is it limited to 'bitbake -e' usage?

--Mark

> I don't want to have to list all the possible places you could set
> MACHINE.
> 
> Cheers,
> 
> Richard
> 


