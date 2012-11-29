Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Tds5N-0000oM-LL
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 01:34:37 +0100
Received: from mail-vb0-f69.google.com ([209.85.212.69])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 28 Nov 2012 16:20:20 -0800
Received: by mail-vb0-f69.google.com with SMTP id fn1so17184761vbb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 16:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=rR1YHFBsawTiPo1WGxHk70jrtojdnMzKZQyNOvXhnao=;
	b=MWW2YFj6nBzMmEtNSQ8ZIsvEWsROy95n9PRgBfpY0zeOlX2Bcfoi1u3v1ArforMwDZ
	VBJvoWKWKVRPwOgSwmYmJAUc6gJVEE8vKRO3eXnRDfF40WnVJYjpZYbe9hN/YtCwPiVs
	BFTGbsfITnWO06lqg1RdgrrsIFGTw1JmoK5IG99VX8veR02I18OLW71roe9rtGSedJfO
	XvHLbT+2Wot3PScV6AzN9esA2bnZD+IvkPPVzIZ8sdxXJZ1WVhSQQTfGPb9fFPqzYi0N
	DIeC06ccgjNVrpeZNcz4TUU1F36tuMq7Cmh0+wzd7EpWFS103xv33i+0Nq3td1pMAquK
	98Og==
Received: by 10.224.111.78 with SMTP id r14mr23119326qap.31.1354148419513;
	Wed, 28 Nov 2012 16:20:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.111.78 with SMTP id r14mr23119315qap.31.1354148419249;
	Wed, 28 Nov 2012 16:20:19 -0800 (PST)
Received: by 10.49.12.136 with HTTP; Wed, 28 Nov 2012 16:20:19 -0800 (PST)
In-Reply-To: <50B69C16.6090700@windriver.com>
References: <1351792979-6672-1-git-send-email-andy.ross@windriver.com>
	<50A68F5D.6050100@windriver.com> <1353343072.3709.183.camel@ted>
	<CAPhnLPBpv_LKEKjoqsv7TY2NhiJLB8kCtPU9im+r34hqKHtNVg@mail.gmail.com>
	<50B69C16.6090700@windriver.com>
Date: Wed, 28 Nov 2012 16:20:19 -0800
Message-ID: <CAPhnLPBzeQjQezgfamVX54EWsPAhS7d_=64s238P9Njj254+TQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Andy Ross <andy.ross@windriver.com>
X-Gm-Message-State: ALoCoQmN8QppuNLirIXYGGQdxDOGDP5458u9DrHWTEzJNaAVWMNB9+1TdDUp0TYepWypCnhG6Jf9B81/+wlbIS/sLGUEmNQQAR3YK/2Tpcgn5TdP6Crla74MY34JPnR116lYuftoFAZ6EAVKJhMtbCmMrMQ8YR3N/97gu3WUJyB1WrN3+O0XWOqViGXcEAGaFU8SVOc+5Bfr
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] base/license.bbclass: handle multiple INCOMPATIBLE_LICENSEs
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
X-List-Received-Date: Thu, 29 Nov 2012 00:34:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 28, 2012 at 3:19 PM, Andy Ross <andy.ross@windriver.com> wrote:
> On 11/28/2012 03:14 PM, Flanagan, Elizabeth wrote:
>>
>> This patch needs a rebase and a minor bit of whitespace work. I've
>> done some work to make it apply to the current master head and tested
>> it out and it does improve the utility of INCOMPATIBLE_LICENSE quite a
>> bit.
>
>
> Hm... AFAICT the content of the patch still seems to apply cleanly
> with git am on a just-pulled poky (don't have an oe-core tree on this
> machine) master HEAD.  Am I looking at a wrong branch?
>

Let me recheck. It wasn't applying clean for me but it may be on my end.

-b

>
>> If it's ok with you, Andy, I'll just submit my modifications to your
>> patch.
>
>
> Fine with me.
>
> Andy
>
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


