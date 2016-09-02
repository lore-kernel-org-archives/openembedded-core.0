Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9C1E577123
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 15:07:36 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 02 Sep 2016 08:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,271,1470726000"; 
   d="scan'208";a="4444145"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 02 Sep 2016 08:07:36 -0700
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
	<075b7a5f-14d8-5999-2fda-da8bae3d893e@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e83ab03a-ae9f-cf9a-2838-1b16b15a4e16@linux.intel.com>
Date: Fri, 2 Sep 2016 18:06:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <075b7a5f-14d8-5999-2fda-da8bae3d893e@windriver.com>
Subject: Re: [PATCH 00/28] Enable gtk-doc
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
X-List-Received-Date: Fri, 02 Sep 2016 15:07:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2016 12:59 AM, Randy MacLeod wrote:
>> Gtk-doc generation happens if 'api-documentation' distro feature is
>> enabled
>> (it is by default), and 'qemu-usermode' is in machine features.
>
> Should this really be enabled by default?
> What does it do to a typical build wrt time and space?

The default distro feature list also includes all of the available 
communication stacks, full x11 stack, pulseaudio etc. It seems to me 
that the aim is to enable as many various features as possible by 
default. Distros can and should trim the list to their specific needs.

Space isn't affected much on build host, and if you don't install -doc 
packages it's not affected on the target at all. Build time is somewhat 
longer for specific packages (those which have gtk-doc support), but 
whether the overall, parallelized build is affected I don't know - I 
think RP asked someone to do a test for master-next vs. master now (with 
all the other stuff that went in recently).


Alex

