Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B21EF782CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 14:42:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 07:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="123811017"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Aug 2017 07:42:07 -0700
To: Dvorkin Dmitry <dvorkin@tibbo.com>,
	openembedded-core@lists.openembedded.org
References: <1503655141-1302-1-git-send-email-stefan@agner.ch>
	<3ce69269-11b4-34b8-68fe-0ce8ac9bd103@tibbo.com>
	<5574f618-9b75-43a2-8bdd-e6b45340ee0b@linux.intel.com>
	<a8241b56-7927-fba3-70eb-296125f7b8c3@tibbo.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3eba804b-52e7-4f1d-7b9d-705731d36ccd@linux.intel.com>
Date: Tue, 15 Aug 2017 17:38:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a8241b56-7927-fba3-70eb-296125f7b8c3@tibbo.com>
Subject: Re: two recipes, one replaces files of another
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
X-List-Received-Date: Tue, 15 Aug 2017 14:42:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/15/2017 05:21 PM, Dvorkin Dmitry wrote:
> Thank you, Alexander!
> 
> But according to this
> 
> https://lists.yoctoproject.org/pipermail/yocto/2013-January/011855.html
> 
> PREFERRED_PROVIDER_... can't be used in image recipes, only at top-level 
> configuration files.
> 
> I can't make it work...


I think you can solve this by defining two machines: brdRevA and 
brdRevB. Then set PREFERRED_PROVIDER in the machine definitions.
And have just one recipe for the image.

You should not make image recipes hardware-specific anyway; any image 
recipe should work on any hardware, and details specific to the hardware 
are abstracted to the machine definition.

Alex

