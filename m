Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGwKc-0007BO-Bl
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 19:23:02 +0200
Received: from mail-gx0-f180.google.com ([209.85.161.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 20 Oct 2011 10:17:08 -0700
Received: by ggnv2 with SMTP id v2so6755731ggn.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 10:17:08 -0700 (PDT)
Received: by 10.68.29.70 with SMTP id i6mr15491897pbh.108.1319131027894;
	Thu, 20 Oct 2011 10:17:07 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id h5sm20794808pbq.11.2011.10.20.10.17.06
	(version=SSLv3 cipher=OTHER); Thu, 20 Oct 2011 10:17:07 -0700 (PDT)
Message-ID: <4EA05791.3030505@intel.com>
Date: Thu, 20 Oct 2011 10:17:05 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319022793.git.anders@chargestorm.se>
In-Reply-To: <cover.1319022793.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH 0/1] Fix race while building external modules
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
X-List-Received-Date: Thu, 20 Oct 2011 17:23:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/2011 04:15 AM, Anders Darander wrote:
>
> When building an image with several external modules, a race is likely to
> occur. This race is when building scripts in the staged kernel tree (sysroot).
>
> To prevent this, we promote the do_make_scripts() function to a task, which we
> protect by a lock. Tip on how to make this work was received by Richard in
> [1]. To avoid new problems, introduced by this promotion, we make this new
> task depend on do_populate_sysroot from the modules dependencies
> (i.e. virtual/kernel).
>
> This patch has been extensively tested on the 2011-1 release branch, on a
> custom ARM-machine and distro with several external modules.
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/011163.html
>
> The following changes since commit e31dd9b65f3b03f79cabab25eca157532de3bd9c:
>
>    fontconfig: fix fix-pkgconfig.patch (2011-10-18 18:13:47 +0100)
>
> are available in the git repository at:
>    git://github.com/darander/oe-core ext-mod-race
>    https://github.com/darander/oe-core/tree/ext-mod-race
>
> Anders Darander (1):
>    module.bbclass: add lock to prevent error bulding ext modules
>
>   meta/classes/module.bbclass |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



