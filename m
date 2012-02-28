Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1S2S85-000276-GK
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 19:50:29 +0100
Received: from mail-tul01m020-f180.google.com ([209.85.214.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 28 Feb 2012 10:41:59 -0800
Received: by obbwd18 with SMTP id wd18so2877543obb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 10:41:58 -0800 (PST)
Received-SPF: pass (google.com: domain of saul.wold@intel.com designates
	10.182.155.68 as permitted sender) client-ip=10.182.155.68; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of saul.wold@intel.com
	designates 10.182.155.68 as permitted sender)
	smtp.mail=saul.wold@intel.com
Received: from mr.google.com ([10.182.155.68])
	by 10.182.155.68 with SMTP id vu4mr7118611obb.61.1330454518626
	(num_hops = 1); Tue, 28 Feb 2012 10:41:58 -0800 (PST)
Received: by 10.182.155.68 with SMTP id vu4mr6308241obb.61.1330454518509;
	Tue, 28 Feb 2012 10:41:58 -0800 (PST)
Received: from [10.6.18.245] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id ei2sm2631265obb.5.2012.02.28.10.41.55
	(version=SSLv3 cipher=OTHER); Tue, 28 Feb 2012 10:41:56 -0800 (PST)
Message-ID: <4F4D1FF1.6020202@intel.com>
Date: Tue, 28 Feb 2012 10:41:53 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330371008.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1330371008.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQk/48Ru9ICPkX+B1kBUWwafJbf65AFHMT/2Sn4oA0ZBkjZL0flVU+prOWk10ZN5w+TyM6vt
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 0/3] linux-yocto: consolidated pull request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 18:50:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2012 11:34 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here's a consolidated pull reqeset for the some kernel items.
>
>    - a bump of 3.0 to 3.0.22
>    - a bump of 3.2 to 3.2.7
>    - A fix for yocto 2032
>
> You can cherry pick the bug fix by itself. As for the version
> updates, I've built and booted them on my development machine
> and on a clean machine, so they are safe for everything that
> I've been able to test.
>
> cc: Darren Hart<dvhart@linux.intel.com>
>
> Cheers,
>
> Bruce
>
> The following changes since commit f420fb3de1f588a51dd6009452c7836903fa9158:
>    Richard Purdie (1):
>          glib-2.0: Disable fam, we don't depend on it
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (3):
>    linux-yocto: update 3.0 kernel to v3.0.22
>    linux-yocto: update 3.2 kernel to v3.2.7
>    linux-yocto: allow non-branched repositories to check out
>
>   meta/classes/kernel-yocto.bbclass                 |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    8 ++++----
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    9 +++++----
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb |    6 +++---
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb      |   18 +++++++++---------
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   19 ++++++++++---------
>   6 files changed, 32 insertions(+), 30 deletions(-)
>
>
Merged into OE-core

Thanks
	Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



