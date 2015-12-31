Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 370C86FF97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Dec 2015 17:00:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 31 Dec 2015 09:00:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,504,1444719600"; d="scan'208";a="626281553"
Received: from lsandov1-mob1-linux.zpn.intel.com (HELO [10.219.5.143])
	([10.219.5.143])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Dec 2015 09:00:55 -0800
To: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core@lists.openembedded.org
References: <568533E5.4000105@topic.nl> <5685347E.5080003@topic.nl>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <56856023.5060407@linux.intel.com>
Date: Thu, 31 Dec 2015 11:04:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <5685347E.5080003@topic.nl>
Subject: Re: Getting "menuconfig" to work again?
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
X-List-Received-Date: Thu, 31 Dec 2015 17:01:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/31/2015 07:58 AM, Mike Looijmans wrote:
> On 31-12-15 14:55, Mike Looijmans wrote:
>> When running a "menuconfig" (or any other task that needs a terminal),
>> bitbake just "stops" and doesn't show any terminal.
>>
>> I'm using the current master branch of everything, on Ubuntu 15.
>>
>> When running with "-D" I can see the following log:
>>
>> DEBUG: Executing task do_menuconfig
>> DEBUG: Attempting to spawn terminal "custom"
>> DEBUG: No custom terminal (OE_TERMINAL_CUSTOMCMD) set
>> DEBUG: Attempting to spawn terminal "tmux-running"
>> DEBUG: Attempting to spawn terminal "tmux-new-window"
>> DEBUG: Attempting to spawn terminal "gnome"
>>
>> But nothing happens from that point.
>
> Extra info: apparently it spawns a process:
>
> /usr/bin/python3 /usr/bin/gnome-terminal --version
>
gnome-terminal is a pain... there are some checks base on the version 
and based on that certain parameters are set. which g-t version are you 
using?


> If I kill that process, the menuconfig magically appears.
>


