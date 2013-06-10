Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6F77A61FEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 16:36:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Jun 2013 09:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,838,1363158000"; d="scan'208";a="327162474"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.154])
	by orsmga001.jf.intel.com with ESMTP; 10 Jun 2013 09:36:16 -0700
Message-ID: <51B6007F.7020003@linux.intel.com>
Date: Mon, 10 Jun 2013 09:36:15 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1368069844-13706-1-git-send-email-net147@gmail.com>
	<1368069844-13706-2-git-send-email-net147@gmail.com>
	<51B26D43.4050909@linux.intel.com>
	<CANwerB0bjquna2deETcig+e_=HTjT0TbEHC-YaA6dDH+3q1z2g@mail.gmail.com>
In-Reply-To: <CANwerB0bjquna2deETcig+e_=HTjT0TbEHC-YaA6dDH+3q1z2g@mail.gmail.com>
X-Enigmail-Version: 1.5.1
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] boot-directdisk: Scope HDDDIR and HDDIMG variables to avoid conflicts
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
X-List-Received-Date: Mon, 10 Jun 2013 16:36:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/09/2013 05:11 AM, Jonathan Liu wrote:
> On 8 June 2013 09:31, Darren Hart <dvhart@linux.intel.com> wrote:
>> On 05/08/2013 08:24 PM, Jonathan Liu wrote:
>>> These variables should not be shared with other image classes.
>>> The bootimg class also has an HDDDIR variable that could be overwritten
>>> if executing concurrently in the same image recipe.
>>
>> Nice catch. Would you considering sending a patch against the bootimg
>> class as well?
> 
> I did originally submit a patch against the bootimg class as well but
> it turns out those variables are used by grub-efi.bbclass and
> syslinux.bbclass. See
> http://lists.openembedded.org/pipermail/openembedded-core/2013-May/078011.html.

Ah yes. And boot-directdisk.bbclass also makes use of those. Sounds like
some investigation into how to better modularize this is in order.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel

