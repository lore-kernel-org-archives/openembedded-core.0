Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R4Fy9-0006PN-Ul
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 19:43:26 +0200
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 15 Sep 2011 10:38:12 -0700
Received: by fxe23 with SMTP id 23so795567fxe.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 10:38:10 -0700 (PDT)
Received: by 10.223.44.90 with SMTP id z26mr982556fae.28.1316108290607;
	Thu, 15 Sep 2011 10:38:10 -0700 (PDT)
Received: from [10.6.18.234] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id w14sm7673722fae.13.2011.09.15.10.37.57
	(version=SSLv3 cipher=OTHER); Thu, 15 Sep 2011 10:38:09 -0700 (PDT)
From: Saul Wold <saul.wold@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Thu, 15 Sep 2011 10:37:55 -0700
In-Reply-To: <cover.1316023378.git.bruce.ashfield@windriver.com>
References: <cover.1316023378.git.bruce.ashfield@windriver.com>
Organization: Yocto Project / Open Source Tech Center / Intel
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1316108288.1058.83.camel@swold-mobl.bigsur.com>
Mime-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 15 Sep 2011 17:43:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-14 at 14:11 -0400, Bruce Ashfield wrote:
> Richard/Saul,
> 
> Here's a series of changes I've had locally since last week. The
> two kernel only ones are simple enough.
> 
>   - a configuration split to clean our x86 BSPs
>   - a build fix for rt
> 
> The net result of the cleanup is zero, since the configs are the
> same, so there's no reason not to do it.
> 
> I've also had the refactored linux-yocto tasks around for a bit,
> they were brought up while reviewing some 1.1 documentation, and
> indeed, simplifying the amount of variables required in a linux-yocto
> based recipe was a 1.1 goal. The result here is also zero, since we
> are just not resetting things needlessly. I've been building with
> this for a while, but if you'd rather sit on this until the imminent
> spin is done, I won't object.
> 
> The following changes since commit ce66e2c6bd117d1a40b547b10b376524f9276d16:
> 
>   core-image-minimal: Add missing POKY_EXTRA_IMAGE variable (2011-09-14 01:29:30 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (3):
>   linux-yocto: move common tasks to a common location
>   linux-yocto: split e100 and e1000 support
>   linux-yocto-rt: correct 3.0.3->3.0.4 mismerge for, stop_machine.c
> 
>  meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb |    8 +-------
>  meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |   14 ++++----------
>  meta/recipes-kernel/linux/linux-yocto.inc          |    5 +++++
>  meta/recipes-kernel/linux/linux-yocto_2.6.37.bb    |   13 +------------
>  meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   10 ++--------
>  5 files changed, 13 insertions(+), 37 deletions(-)
> 

Merged into OE-Core

Thanks
	Sau!




