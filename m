Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3BFEE606CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 02:30:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2N2UnFL010770
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 19:30:49 -0700 (PDT)
Received: from soho-mhatle-m.corp.ad.wrs.com (128.224.176.122) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Wed, 22 Mar 2017 19:30:48 -0700
To: <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.20.1703220648410.15178@uk63952.mitel.com>
	<CAJTo0LbY4m=t5wzMnoOJxd0EuA+mVai6kovk7YRfZYPT_ymnLw@mail.gmail.com>
	<alpine.LFD.2.20.1703220701350.15389@uk63952.mitel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <9fff31b3-2d67-0bed-b5c3-7b6d60cb4d5f@windriver.com>
Date: Thu, 23 Mar 2017 10:30:47 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1703220701350.15389@uk63952.mitel.com>
Subject: Re: possible content for site.conf?
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
X-List-Received-Date: Thu, 23 Mar 2017 02:30:50 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/22/17 7:02 PM, Robert P. J. Day wrote:
> On Wed, 22 Mar 2017, Burton, Ross wrote:
> 
>>
>> On 22 March 2017 at 10:51, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>>         from site.conf.sample, the obvious content is things like:
>>
>>       * download dir
>>       * reference to local (in-house) source mirror
>>       * http proxies/fetching configuration
>>
>>       and so on. any other things people throw into site.conf i can just add
>>       to a list so readers can understand what that file is truly designed
>>       for?
>>
>>
>> That's pretty much the expected use.
> 
>   i thought so ... i wracked my brain trying to think what else
> belonged in there, and that's all i came up with. thanks.

I have seen people do some blacklist entries here (or preferred version) when
they have a company policy not to use certain software.  (Similarly a site wide
PACKAGECONFIG to disable a feature that isn't allowed.)

--Mark

> rday
> 
> 
> 


