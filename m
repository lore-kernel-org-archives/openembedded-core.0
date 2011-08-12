Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1Qrw04-0001hS-3p
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 19:58:28 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 12 Aug 2011 10:53:53 -0700
Received: by ywo7 with SMTP id 7so5517754ywo.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 10:53:53 -0700 (PDT)
Received: by 10.90.17.6 with SMTP id 6mr1243522agq.66.1313171631743;
	Fri, 12 Aug 2011 10:53:51 -0700 (PDT)
Received: from [10.6.18.209] (c-71-193-189-117.hsd1.wa.comcast.net
	[71.193.189.117])
	by mx.google.com with ESMTPS id n14sm2606569ani.38.2011.08.12.10.53.49
	(version=SSLv3 cipher=OTHER); Fri, 12 Aug 2011 10:53:50 -0700 (PDT)
Message-ID: <4E4568AC.7090502@intel.com>
Date: Fri, 12 Aug 2011 10:53:48 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313080337.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1313080337.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 0/1] linux-yocto: consoliated pull request
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
X-List-Received-Date: Fri, 12 Aug 2011 17:58:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/11/2011 09:35 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here's the latest linux-yocto pull request. It includes updates
> for rt support (from Darren) as well as some build fixes for
> various issues we've met along the way.
>
> Once this is in place, we are in a position to change the defaults
> for the qemu machines. Speak now if there's a problem with this!
>
> cc: Darren Hart<dvhart@linux.intel.com>
>
> The following changes since commit 786033f53cad2a196ae6f3a05574148578ea3894:
>
>    bb/cooker: only emit ConfigFilePathFound for files which were parsed (2011-08-10 13:38:20 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    linux-yocto: update SRCREVs for preempt-rt support + build fixes
>
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb |   14 +++++++-------
>   1 files changed, 7 insertions(+), 7 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


