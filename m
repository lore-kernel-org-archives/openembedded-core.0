Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T4p7S-0002wd-JF
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 10:19:55 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 24 Aug 2012 01:07:46 -0700
Received: by pbcxa7 with SMTP id xa7so2939603pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 01:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=+oB9D1gPoF9BFNkFmrPYpbMP3XDC7Y8FnPQq9v22cqw=;
	b=j0qdCrfStAzk6RGUgCqXED3bGOjG6Wf6neIeB268QgxYn3Df4ptmz3BnERgxmRxap9
	rI+oNUK6talCk4iUleFDeaqFjfU4gX/LGgkwNdh8oRZDtGy5497jALwr+XwSa0BcnV4+
	wxc9ELoHlHC4hceiWwJD1ImIaEHUCFupwmNo95Gt9DWAuogDaZv4QnOm1TzIbxaUFJJ/
	KjmW25xMO+JSbcab94eiphQp84amw8cGureGXEkOuDTpq8RY9Su2iVnIY+gRWKS1s9n7
	NsXw7ai/+fG/LFr3JfeI0lHfgWa8LVl3ja+HGufGan8j0ldyh9kuLYhhxMVMU8EAjdDB
	ErAQ==
Received: by 10.66.84.130 with SMTP id z2mr8901155pay.77.1345795665924;
	Fri, 24 Aug 2012 01:07:45 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id jz4sm7833350pbc.17.2012.08.24.01.07.44
	(version=SSLv3 cipher=OTHER); Fri, 24 Aug 2012 01:07:44 -0700 (PDT)
Message-ID: <50373661.6080600@intel.com>
Date: Fri, 24 Aug 2012 01:08:01 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@intel.com>
References: <cover.1344876697.git.bruce.ashfield@windriver.com>
	<1345613248.17535.1.camel@trz-ThinkPad-T420>
In-Reply-To: <1345613248.17535.1.camel@trz-ThinkPad-T420>
X-Gm-Message-State: ALoCoQkoj9stS2w2B+0j2Td3qeFRRoH0C8y0wZi6Vw9rG/GKba3srugdeXiS6NgyBdB00rmpw8n9
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] [denzil] linux-yocto: make validate_branches handle non BSP branches
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
X-List-Received-Date: Fri, 24 Aug 2012 08:19:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2012 10:27 PM, Tom Zanussi wrote:
> On Mon, 2012-08-13 at 13:10 -0400, Bruce Ashfield wrote:
>> Scott,
>>
>> Here's a fix for validate_branches that comes from a pending master
>> change that I've been running for 3 weeks, and one that TomZ has tested
>> in his yocto BSP work on denzil.
>>
>> It fixes some BSP use cases that involve setting a specific SRCREV
>> on a base branch, so that a BSP branch that doesn't yet exist can
>> be created off of that known base. Previously only an existing BSP
>> branch could have it's SRCREV restricted.
>>
>
> Hi Scott,
>
> I don't see this in denzil - do you have it queued for the next pull
> request, or did it get missed?
>
> Tom

Sorry about this - it did get missed. I now have it in my denzil-next 
branches and I'm planning to submit a pull request sometime next week.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


