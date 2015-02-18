Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3153865C85
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 14:54:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1IEsiMM015766
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Feb 2015 06:54:45 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Wed, 18 Feb 2015 06:54:44 -0800
Message-ID: <54E4A7B3.9020401@windriver.com>
Date: Wed, 18 Feb 2015 08:54:43 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Patrick Ohly <patrick.ohly@intel.com>, Dan McGregor
	<danismostlikely@gmail.com>
References: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>	
	<54E3723B.9050606@windriver.com>	
	<CABcZAN=4puvBHBwH72ioVdGHpfSO5kngJGCWrJgED8xO_4xQkw@mail.gmail.com>	
	<54E375B2.9080002@windriver.com>	
	<CACS+7ZTaJgfBkDOzSsnPqoi+MCwo9_46sC1hr8o9NpQMGwkzhw@mail.gmail.com>
	<1424249151.549.17.camel@intel.com>
In-Reply-To: <1424249151.549.17.camel@intel.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm.bbclass: support packaging of symlinks to directories
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
X-List-Received-Date: Wed, 18 Feb 2015 14:54:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/18/15 2:45 AM, Patrick Ohly wrote:
> On Tue, 2015-02-17 at 21:40 -0600, Dan McGregor wrote:
>>
>> On 17 Feb 2015 11:09, "Mark Hatle" <mark.hatle@windriver.com> wrote:
>>>
>>> On 2/17/15 10:57 AM, Christopher Larson wrote:
>>>>
>>>> On Tue, Feb 17, 2015 at 9:54 AM, Mark Hatle
>> <mark.hatle@windriver.com
>>>> <mailto:mark.hatle@windriver.com>> wrote:
>>>> This patch doesn't make it walk into the directory symlinks, it moves them into
>>>> the files list rather than the dirs list so they'll be captured themselves, as
>>>> far as I can tell from reading it.
>>>
>>> Ok.. I missed that bit.. I'm still curious what this fixes.
>>>
>>
>> I haven't tried myself, but I expect it helps with the /usr merge.
> 
> Correct. I was working on a distro with a modified basefiles recipe
> which only had /usr/[lib|bin|sbin] and symlinks to those in /. Without
> this patch it was not possible to get these symlinks packaged in the
> basefiles rpm.
> 

Thanks, I wasn't aware that the symlinks were not working in the basefiles.

--Mark

