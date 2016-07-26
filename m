Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2187F606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 15:18:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6QFI87Y027221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Jul 2016 08:18:08 -0700 (PDT)
Received: from msp-dhcp16.wrs.com (172.25.34.16) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Jul 2016 08:18:07 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Sergei Miroshnichenko
	<sergeimir@emcraft.com>, <openembedded-core@lists.openembedded.org>
References: <1469539192-18406-1-git-send-email-sergeimir@emcraft.com>
	<1469542336.23580.101.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55cb9817-d62f-88bf-e886-b1f18549fbff@windriver.com>
Date: Tue, 26 Jul 2016 10:18:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1469542336.23580.101.camel@linuxfoundation.org>
Cc: Alexander Dyachenko <sasha_d@emcraft.com>,
	Roger Meier <r.meier@siemens.com>
Subject: Re: [PATCH v3 0/4] license: Sync with SPDX 2.0, pull request
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
X-List-Received-Date: Tue, 26 Jul 2016 15:18:23 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 7/26/16 9:12 AM, Richard Purdie wrote:
> On Tue, 2016-07-26 at 16:19 +0300, Sergei Miroshnichenko wrote:
>> Here are the request for a community review for a synchronization
>> with the SPDX License List (git.spdx.org/license-list.git) and adding
>> license operators to meet SPDX 2.0 specification compliance
>> (https://spdx.org/sites/spdx/files/SPDX-2.0.pdf Appendix IV: SPDX
>> License Expression).
>>
>> The whole patch series is way too big to send them to the mailing 
>> list (the biggest one is ~3MiB), so please find the diffs via gitweb 
>> of the -contrib repo.
> 
> Whilst we certainly want to collaborate with SPDX, we've never said our
> LICENSE field should match what SPDX is doing. Your patch appears to
> unequivocally join them as a 1:1 mapping and I'm not sure this is
> something we've ever planned or agreed to. These fields do get written
> into the packages and used in a variety of places.
> 
> Certainly if we are going to map them 1:1, this is something which
> would need discussion on the OE architecture list first. I'd be nervous
> about committing to do that, not knowing or having any influence over
> what SPDX may do next. 
> 
> Is the intent here to map us 1:1 with SPDX and are you advocating that?

I agree.  This needs to be set as part of the OE Architecture first.  I don't
object to the format or contents of the change -- just that it's a pretty big
change for how things work.

Also looking over the patches, the changes to the license text (common-licenses)
need some more explanation.  The comment says it syncs to the spdx license list.
 But mostly what I see are simply format changes that actually make it harder
for developers to read the license text.

Is there any reference/explanation as to why the formatting changes are
required/suggested/etc?

--Mark


> Cheers,
> 
> Richard
> 


