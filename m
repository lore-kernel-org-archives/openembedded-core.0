Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 14167736B6;
	Wed,  2 Sep 2015 16:37:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Sep 2015 09:37:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,454,1437462000"; d="scan'208";a="760959460"
Received: from afshjern.zpn.intel.com (HELO [10.219.128.48]) ([10.219.128.48])
	by orsmga001.jf.intel.com with ESMTP; 02 Sep 2015 09:37:12 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Christopher Larson <clarson@kergoth.com>
References: <20150901104522.9FC59505A9@opal.openembedded.org>
	<20150901190902.GD2458@jama> <55E63099.8090003@linux.intel.com>
	<CABcZANnjLEcMbLLnCb3C-QeFb9+_ZEu-CDHk46UjBfbHm+7STg@mail.gmail.com>
	<1441192499.24871.51.camel@linuxfoundation.org>
From: Alex Franco <alejandro.franco@linux.intel.com>
Message-ID: <55E725D7.3@linux.intel.com>
Date: Wed, 2 Sep 2015 11:37:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1441192499.24871.51.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Alex Franco : Fix mode +st on TMPDIR when creating it
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
X-List-Received-Date: Wed, 02 Sep 2015 16:37:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks, I have sent a patch after removing the -R and testing a bit

Alex Franco

On 09/02/2015 06:14 AM, Richard Purdie wrote:
> On Tue, 2015-09-01 at 16:47 -0700, Christopher Larson wrote:
>> On Tue, Sep 1, 2015 at 4:11 PM, Alex Franco
>> <alejandro.franco@linux.intel.com> wrote:
>>          I gather the original reason (for the sanity test, as well as
>>          these changes) is that it is better for everything under
>>          BUILDDIR - and certainly TMPDIR to be owned by the user
>>          running bitbake and have standard permissions, the sticky bit
>>          itself would prevent a user running bitbake, even with +rwx
>>          permissions, from making changes to items it might need to
>>          manipulate, if those are not owned by this user. Similarly
>>          setuid and setgid might propagate user/group ownerships
>>          different from the user bitbake is running as, into BUILDDIR
>>          and TMPDIR (and items therein).
>>          
>>          For more info take a look at:
>>          https://bugzilla.yoctoproject.org/show_bug.cgi?id=7669
>>          
>>          Perhaps there are more pressing reasons, perhaps Christopher
>>          Larson can comment a bit on this.
>>
>> Indeed, the g+s can flow down into the files put into the packages,
>> and then into the rootfs. I ran into a this problem quite a bit, since
>> my project areas are in a g+s area to keep the files accessible to the
>> group.
>
> There is actually another problem here. The -R means if you do this to
> an existing build directory, it takes around 10 mins on the machine I
> just rebooted with a cold cache. We need to lose the -R there.
>
> Cheers,
>
> Richard
>
>


