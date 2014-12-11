Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3303E65D34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 23:11:07 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id l13so572898iga.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 15:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Bt8nQ7hr83YxIetnPkhJpre6++ZKwRI6GeDOvByDQ4c=;
	b=kKCP52yrp9JLDFT9RYmEk1Lo6ouvJWCYE9akuc5oIA1ErvFZ7p8DoSrcUGWAPpUrWK
	/mNO+uHDZeNGvj2Pd+n1+fAxPdQwrzK7B3set+EzkO140wMf2gH5GjJughupHfzOyJJe
	cUpVq/Bji/n5GGxPHOeuhM2z6dmU5Lv6Ph70n7hgnvasAfismPP/3vEbGvWukVhoElWN
	9+Caf+OAP2o0MfOHLiaunKK5XZQ06sk2gdt6k0Stz5ANsVqdnoqmorS1slP/SWg5JLCV
	2aPljG6fL5liSOrDx1OgQcfSfrh6gB9LEX8wZ32mmF47nrSFcM7piDCVXkyGyxj0a5E+
	O5Pw==
X-Gm-Message-State: ALoCoQm2+uBqr7J8mWEC9b0FTTwCbz+YQf9FmHDNb1n6aJ+jRqmqvCUqXhu4q4Axyf0sSKqIP5HO
X-Received: by 10.107.155.196 with SMTP id d187mr12922862ioe.14.1418339468015; 
	Thu, 11 Dec 2014 15:11:08 -0800 (PST)
Received: from [208.114.172.198]
	(xplr-ts-w10-208-114-172-198.barrettxplore.com. [208.114.172.198])
	by mx.google.com with ESMTPSA id uw1sm458093igb.19.2014.12.11.15.11.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 15:11:07 -0800 (PST)
Message-ID: <548A2481.5080001@linaro.org>
Date: Thu, 11 Dec 2014 18:10:57 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<547D45EB.6060508@linaro.org>
	<4967625.9osgGDJBx1@peggleto-mobl5.ger.corp.intel.com>
	<54871983.1060106@linaro.org>
In-Reply-To: <54871983.1060106@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Thu, 11 Dec 2014 23:11:16 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I think *this* thread (and question) got lost in the shuffle...

On 12/09/14 10:47, Trevor Woerner wrote:
> On 12/02/14 09:01, Paul Eggleton wrote:
>> On Monday 01 December 2014 23:54:03 Trevor Woerner wrote:
>>> On 11/25/14 12:28, Paul Eggleton wrote:
>>>> I've then added a new recipe auto-creation script, recipetool, which can
>>>> take a source tree or URL and create a skeleton recipe to build it.
>>> ...
>>>
>>>>  * "recipetool create" ideally needs to become smarter and fill in
>>>>  
>>>>    more details of the recipe. At some point we'll probably have to
>>>>    make the process interactive and possibly have it automate parts of
>>>>    the build process and examine the output; some things just can't be
>>>>    practically detected from the source tree without building.
>>> There is a tool "autoscan" which might be of some use here. If nothing
>>> else, the resulting configure.scan file could be parsed for DEPENDS
>>> information and perhaps PACKAGECONFIG items too.
>> Interesting - I was not aware of this tool. I've added support for running it 
>> as well as picking converting AC_CHECK_LIB lines over to DEPENDS (with a note 
>> about some of them possibly being optional). Thanks!
>>
> Finding "AC_PATH_X" in "configure.scan" is probably a good indication
> there's an RDEPENDS on "libx11". Maybe "recipetool" could check for that?

*ping*!!

Oddly enough, the default recipe even says:

    # NOTE: the following library dependencies are unknown, ignoring: X11


Why is it ignoring x11? Coincidentally the code I'm testing this with
has a dependency on X11 and when I try building, bitbake throws out an
RDEPENDS warning.

