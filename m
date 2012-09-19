Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEMf9-0000eY-U3
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 17:58:08 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 19 Sep 2012 08:45:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="146772678"
Received: from unknown (HELO [10.252.121.202]) ([10.252.121.202])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Sep 2012 08:45:24 -0700
Message-ID: <5059E893.1060300@intel.com>
Date: Wed, 19 Sep 2012 18:45:23 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<949436f21dca1d0f73ff55f2692d8c1459657fa2.1348052899.git.laurentiu.palcu@intel.com>
	<CAJTo0LafLwJxBi4eG_CF+iviJbPT4HwtDdkssCAGeOgzv1t2XQ@mail.gmail.com>
In-Reply-To: <CAJTo0LafLwJxBi4eG_CF+iviJbPT4HwtDdkssCAGeOgzv1t2XQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 2/7] image.bbclass: run postinst scripts once, at rootfs time
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
X-List-Received-Date: Wed, 19 Sep 2012 15:58:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/19/2012 06:14 PM, Burton, Ross wrote:
> On 19 September 2012 12:49, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>> +ROOTFS_POSTPROCESS_COMMAND ?= "run_intercept_scriptlets"
> 
> From other examples, it looks like this should be "run_intercept_scriptlets;"
Will do. My bad.

> 
> Also whilst this is a great proof of concept, maybe it should be
> integrated into image.bblcass directly instead of being a postprocess
> hook?  A postprocess hook might expect the postinstall scripts to have
> been ran already, which they would have been if they were not
> intercepted.
I'm a little confused here... Technically, when the postprocess hooks
are executed all the postinstall scripts were already executed. Ideally,
the run-once scripts are created from inside the postinst scriptlets
themselves. So, I don't really understand why using the postprocess hook
isn't safe. Can you please elaborate?

Thanks,
Laurentiu
> 
> Ross
> 


