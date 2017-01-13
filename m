Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BAA10608B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 01:03:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0D13RHb002408
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 12 Jan 2017 17:03:28 -0800
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 12 Jan 2017 17:03:27 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1484249086-36492-1-git-send-email-juro.bystricky@intel.com>
	<1484257321.4367.238.camel@linuxfoundation.org>
	<704d3ba6-03aa-e4b6-7a94-76b247c0efce@windriver.com>
	<1595933.P5cmfVrMqa@peggleto-mobl.ger.corp.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <b13edad7-6a3b-d99b-1378-b113836a3819@windriver.com>
Date: Thu, 12 Jan 2017 19:03:26 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1595933.P5cmfVrMqa@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 13 Jan 2017 01:03:29 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 1/12/17 6:36 PM, Paul Eggleton wrote:
> On Thu, 12 Jan 2017 16:04:09 Mark Hatle wrote:
>> On 1/12/17 3:42 PM, Richard Purdie wrote:
>>> On Thu, 2017-01-12 at 11:24 -0800, Juro Bystricky wrote:
>>>> When a non-existing MACHINE is specified, sanity check issues
>>>>
>>>> the following message:
>>>>     Please set a valid MACHINE in your local.conf or environment
>>>>
>>>> However, MACHINE can also be set in multiconfig .conf file(s).
>>>> Hence we may have several different MACHINE settings within one
>>>> (multiconfig) build, so the present error message is fairly
>>>> ambiguous.
>>>>
>>>> This patch remedies this by explicitly naming the offending MACHINE
>>>> and
>>>> adding conf/multiconfig/*.conf to the list of places where this
>>>> erroneous
>>>> MACHINE definition could have originated.
>>>>
>>>>     Invalid MACHINE=xyz. Please set a valid MACHINE in your
>>>>
>>>> local.conf, conf/multiconfig/*.conf or environment
>>>
>>> Can we change this to:
>>>
>>> "MACHINE=xyz is invalid. Please set a valid MACHINE in your local.conf,
>>> environment or other configuration file."
>>
>> I commented elsewhere as well -- but is there any way to see where MACHINE
>> was actually set and display that -- or is it limited to 'bitbake -e'
>> usage?
> 
> You need to have history enabled in the datastore to be able to retrieve that, 
> and we don't during normal mode for performance over the entire run. It's 
> possible we could enable it reparse the configuration when errors like this 
> occur to get it though - it probably wouldn't take too long, but I don't know 
> if there are other practical barriers.

Ok.. I couldn't remember if history was needed or not.  I know one of the
implementations included a history reference for the last one (instead of a full
history...)

It's not worth making this more difficult to implement then.

--Mark

> Cheers,
> Paul
> 


