Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C209605F1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 10:27:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t14AR4V8017262
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Feb 2015 02:27:04 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 4 Feb 2015 02:27:03 -0800
Message-ID: <54D1F3F5.3030407@windriver.com>
Date: Wed, 4 Feb 2015 18:27:01 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
	<18cd01e42aa7a74c010d6114b6625bdfe586103a.1422925725.git.liezhi.yang@windriver.com>
	<CAJTo0LbQbF4poEUwpWYRrcVn-yTPT6LmJ9oKUh2dE4FR5D5tVQ@mail.gmail.com>
	<54D16E5A.4010808@windriver.com>
In-Reply-To: <54D16E5A.4010808@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/21] libidn 0.6.14: fixed installed-vs-shipped
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
X-List-Received-Date: Wed, 04 Feb 2015 10:27:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ross,

I removed this patch from the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/low_version

// Robert

On 02/04/2015 08:56 AM, Robert Yang wrote:
>
>
> On 02/03/2015 10:59 PM, Burton, Ross wrote:
>>
>> On 3 February 2015 at 01:12, Robert Yang <liezhi.yang@windriver.com
>> <mailto:liezhi.yang@windriver.com>> wrote:
>>
>>              rm -rf ${D}${datadir}/emacs
>>       }
>>     +
>>     +FILES_${PN} += "${datadir}/emacs"
>>
>>
>> This was already fixed - see the rm a few lines above. :)
>
> Yes, it is fixed recently, please drop this patch.
>
> // Robert
>
>>
>> Ross

