Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 734CD6AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 02:46:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAT2jsxw001474
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 28 Nov 2016 18:45:54 -0800
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 28 Nov 2016 18:45:53 -0800
To: Khem Raj <raj.khem@gmail.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<27dbd493-5b76-657f-8a1d-57eabe9eebed@windriver.com>
	<1479973589.6873.15.camel@intel.com>
	<5251131.puhPuqrAHf@peggleto-mobl.ger.corp.intel.com>
	<43EF9731-230A-4FEE-8D1F-D81BEB193D24@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <a63e3bae-0fe1-1f52-88b6-d9c53c38f306@windriver.com>
Date: Tue, 29 Nov 2016 10:45:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <43EF9731-230A-4FEE-8D1F-D81BEB193D24@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Tue, 29 Nov 2016 02:46:17 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/29/2016 09:57 AM, Khem Raj wrote:
>
>> On Nov 24, 2016, at 10:59 AM, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>>
>> On Thu, 24 Nov 2016 08:46:29 Patrick Ohly wrote:
>>> On Thu, 2016-11-24 at 11:38 +0800, Robert Yang wrote:
>>>> Currently, debug-tweaks is in EXTRA_IMAGE_FEATURES by default for poky,
>>>> and
>>>> there is no passwd, so that user can login easily without a passwd, I
>>>> think
>>>> that current status is more unsafe ?
>>>
>>> Both well-known password and no password are unsafe. User "root" with
>>> password "root" is not even "more" safe already now, because tools that
>>> brute-force logins try that. Choosing something else would be a bit
>>> safer for a short while until the tools add it to their dictionary.
>>>
>>> Poky is also targeting a different audience than OE-core. Poky can
>>> assume to be used in a secure environment, OE-core can't (because it
>>> might be used for all kinds of devices).
>>
>> I don't think that's part of the design goals on either side, it's simply
>> about making development easier. The feature is clearly labelled "debug-
>> tweaks" because it's for debugging not for production. It could be that we
>> should make it do other things like append a notice to /etc/issue to avoid
>> people leaving it on for production, if that is a concern.
>>
>
> Sometimes such goals can lead to problems. Making development easier by
> all means if you can ensure a hard error on production e.g. debug-tweaks can
> then never be part of production images. Otherwise someone will forget it
> and it will be discovered on millions of devices in field along with the user
> project will be red-faced.

Will something like IMAGE_FEATURES += "production" help here ? We may also
need something like IMAGE_FEATURES += "test" to make it can work with
-ctestimage.

// Robert

>

