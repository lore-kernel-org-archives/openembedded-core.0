Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QvdCL-0000MY-1p
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 00:42:26 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 22 Aug 2011 15:37:30 -0700
Received: by ywo7 with SMTP id 7so8662479ywo.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2011 15:37:30 -0700 (PDT)
Received: by 10.101.9.37 with SMTP id m37mr2925900ani.93.1314052650258;
	Mon, 22 Aug 2011 15:37:30 -0700 (PDT)
Received: from [192.168.0.24] (184-76-59-119.war.clearwire-wmx.net
	[184.76.59.119])
	by mx.google.com with ESMTPS id 9sm5614703and.25.2011.08.22.15.37.27
	(version=SSLv3 cipher=OTHER); Mon, 22 Aug 2011 15:37:28 -0700 (PDT)
Message-ID: <4E52DA26.1090800@intel.com>
Date: Mon, 22 Aug 2011 15:37:26 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313439568.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1313439568.git.bruce.ashfield@windriver.com>
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
X-List-Received-Date: Mon, 22 Aug 2011 22:42:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/15/2011 01:24 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> We've had some good mileage on the 3.0.x kernel. I've been building
> and booting these boards for weeks now and the meta-intel based BSPs
> have all been switching over and all of Darren's -rt work was done
> on top of 3.0.
>
> So the big part of this pull request is the removal of the explicit
> version preference to 2.6.37. We still have the old versions(s) as
> fallbacks, but it does seem to be time to acknowledge that 3.0.x
> should be the default kernel.
>
> As for the timing of the merge, I'll leave this up to you.
>
> The following changes since commit a21ff559e7c93e9da61104f4a33e42e6004189fd:
>
>    Fixup remaining bb.msg.domain users (2011-08-15 17:31:52 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (3):
>    linux-yocto: bump version string to 3.0.1
>    qemu: change default kernel to 3.0.x
>    linux-yocto: meta SRCREV bump
>
>   meta/conf/machine/include/qemu.inc           |    1 -
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb |    6 +++---
>   2 files changed, 3 insertions(+), 4 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


