Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 945EB6FFA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 14:20:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 21 Mar 2016 07:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,372,1455004800"; d="scan'208";a="915621618"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 21 Mar 2016 07:19:57 -0700
To: openembedded-core@lists.openembedded.org
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
	<1458235169-9267-2-git-send-email-armccurdy@gmail.com>
	<CAJTo0LZ_9NTAMLo9eYGKYa+W4L_QQWQXrROog2Bwn89pbxmRng@mail.gmail.com>
	<CAJ86T=X=amcjcvmsUidKYTsUYHMO+LHEE5znv-t0Qv8KGZLyjA@mail.gmail.com>
	<1458248553.7615.34.camel@linuxfoundation.org>
	<CAJ86T=WpO9wAphNS==h6zzcg2oUZLa4tepVbAORT865VtX0YxQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56F00213.8020408@linux.intel.com>
Date: Mon, 21 Mar 2016 16:15:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WpO9wAphNS==h6zzcg2oUZLa4tepVbAORT865VtX0YxQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] bitbake.conf: remove 'gobject-introspection-data' from DISTRO/MACHINE_FEATURES_BACKFILL
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
X-List-Received-Date: Mon, 21 Mar 2016 14:20:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/18/2016 01:08 PM, Andre McCurdy wrote:

> Deciding if/how qemu can run binaries for each tuning target is
> already partially addressed by the QEMU_EXTRAOPTIONS logic in
> qemu.bbclass. My suggestion would be to somehow generalise that
> existing logic, so (at least for machines using one of the standard
> oe-core tuning files) the question "can qemu run binaries created for
> ${MACHINE}?" could be answered automatically.

I agree: machine features should specify the capabilities of a machine, 
and 'generate of gobject introspection data' is only a specific 
application of 'machine has qemu usermode support' feature. We might 
have other uses for qemu userspace in the future, for example gtkdoc 
generation.

So I'm thinking of having a machine feature called 'qemu-usermode', 
which is turned on by default, and can be disabled in specific machine 
configurations. And then a distro feature called 'gobject introspection 
data', which is on or off depending on whether the machine supports it, 
but can also be turned off explicitly. And then the recipes and recipe 
classes do the right thing. How's that?


Alex


