Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 40AD071A75;
	Thu, 17 Nov 2016 21:47:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAHLlQnS008159
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Nov 2016 13:47:26 -0800 (PST)
Received: from soho-mhatle-m.wrs.com (128.224.60.190) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Thu, 17 Nov 2016 13:47:26 -0800
To: "Burton, Ross" <ross.burton@intel.com>, OE-core
	<openembedded-core@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
References: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <c0278d51-cd77-1fe4-bb50-d89855487078@windriver.com>
Date: Thu, 17 Nov 2016 16:47:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Enabling uninative by default in oe-core?
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
X-List-Received-Date: Thu, 17 Nov 2016 21:47:29 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/17/16 12:31 PM, Burton, Ross wrote:
> Hi,
> 
> Background: uninative is a class that downloads a precompiled host glibc for use
> in the sysroot, thus isolating the native sysroot from the host environment. 
> This means greater sstate reuse, as instead of native builds being dependent on
> the host system they're able to be shared between all hosts.  There is a
> reference tarball hosted on www.yoctoproject.org <http://www.yoctoproject.org>,
> and the URL can be overridden by distros if you would prefer to build your own.
> 
> We enable this in Poky so that we get greater reuse on the autobuilders, and due
> to some issues with the C++ ABI the eSDK generation in master now requires
> uninative to be enabled.  The question is: do we now enable uninative by default
> in oe-core's nodistro (pointing at the yoctoproject tarball), or do we keep it
> disabled by default and require the user to enable uninative if they wish to
> build an eSDK?
> 
> Personally I'm torn: I don't like eSDK not working out of the box, but I don't
> really like oe-core nodistro depending on uninative.  Though enabling uninative
> globally does mean everything works out of the box, so following the principle
> of Least Surprise that's what we should do.

I agree, I see both sides.

I'm tempted though to say, at a minimum it would be nice if oe-core had a
working (prebuilt) uninative -- or at least instructions for someone to build it
themselves.  Also corresponding instructions for the eSDK that says, BTW you
need this and this is how to do it.

That would let people use the uninative with oe-core... and maybe? let us vet
this so we can determine if it's the right thing to do by default in the future
or not.

(With that said, the stuff I'm working on is using the uninative -- and it's
solved a number of minor issues..)

--Mark

> Ross
> 
> 
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
> 


