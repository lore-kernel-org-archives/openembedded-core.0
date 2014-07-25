Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 225966FF1A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 20:28:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jul 2014 13:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,733,1400050800"; d="scan'208";a="575547290"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO [10.255.13.3])
	([10.255.13.3])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2014 13:28:51 -0700
Message-ID: <53D2BE03.5060805@linux.intel.com>
Date: Fri, 25 Jul 2014 13:28:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Stefan sat <stefansat@telenet.be>, 
	openembedded-core@lists.openembedded.org
References: <53D2A234.60303@telenet.be>
In-Reply-To: <53D2A234.60303@telenet.be>
Subject: Re: Subversion does not support http protocol anymore
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
X-List-Received-Date: Fri, 25 Jul 2014 20:28:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2014 11:30 AM, Stefan sat wrote:
> Hello since a certain time native subversion build of
> openembedded-oe-core does not support http protocol anymore.
>
> I found out that it is just the missing neon-config script file.
>
> Whitout this the subversion_1.7.10.bb builds whitout neon support.
>
> It was just ok by removing binconfig-disabled by
> meta/recipes-support/neon/neon_0.30.0.bb
>
> Then rebuild neon and subversion.
>
> Included git patch file
>

Richard recently updated subversion to 1.8.9, which uses serf instead of 
neon.  If this patch is for Daisy, please update it as mentioned here.

Can you please add a Signed-off-by: and use git format-patch, also look 
at this wiki:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Please format the commit message correctly and then re-submit with a 
[daisy] tag if appropriate.

Thanks
	Sau!

> Thank's
>
>

