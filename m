Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1S9fad-0004TA-DC
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 17:37:47 +0100
Received: from mail-bk0-f52.google.com ([209.85.214.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Mar 2012 09:28:54 -0700
Received: by bkcjm19 with SMTP id jm19so4596349bkc.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 09:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=33CdqDcM9VC/UXajT8T0u4elqBBy5h2rYY7e2z9fJaM=;
	b=aZKjsWWnjbRDy4tbqwsnAaYbvrPDwBhiImTpQ8+LUweIXVZvS0oV2TgV/9SIo9sTc0
	4oeyl1oPflF2QKlpYhWw1ngf+Aa+roDRMOO4SscPrNxAYZ+O6BPjXT8SJYqzPQRt0u87
	V9NQkySktTF6NObGlkSMUFlk1NhUiK3oBWCw2H6kIBvZT34mwc+CNDUl/M4z1X6BQYpC
	pTK8AIQKZtPThwyC3nI4YT9djG154t795gp5oCeG1Kb+rbPwTsepWUAERE/ScwunBaMr
	EIxL0GRvUdDFiD8WO9B/JHu3lRTcQtStt9sZmic3MLYbf/7fffBZyRkKQ/KaSSRJJ3sJ
	bRAQ==
Received: by 10.204.151.77 with SMTP id b13mr4893039bkw.57.1332174532290;
	Mon, 19 Mar 2012 09:28:52 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id f6sm26708453bkg.10.2012.03.19.09.28.50
	(version=SSLv3 cipher=OTHER); Mon, 19 Mar 2012 09:28:51 -0700 (PDT)
Message-ID: <4F675EC0.5030504@intel.com>
Date: Mon, 19 Mar 2012 09:28:48 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331915755.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1331915755.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQmRJvLeHfVu93pniqOIzHrtb2IkGsIvxcA/rETCjVULSEHYKZK9JyVJyDl6ImPriWRC9lze
Subject: Re: [PATCH 0/4] linux-yocto: consolidated pull
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
X-List-Received-Date: Mon, 19 Mar 2012 16:37:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2012 09:38 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here's the consolidated pull request that I mentioned
> earlier in the week. Two -stable updates and some changes
> for BSP configuration.
>
> Tested on all the qemu* targets. No issues found here.
>
> There are also some emenlow changes in the tree, but those will
> be picked up by other layers.
>
> cc: Tom Zanussi<tom.zanussi@intel.com>
>
> Cheers,
>
> Bruce
>
> The following changes since commit be0f9dd483af2a2f55b2ae8ef9ca172e7c90819c:
>
>    python-imaging: bring in fixes from meta-oe (2012-03-16 10:57:09 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (4):
>    linux-yocto/3.0: update meta SRCREV
>    linux-yocto/3.2: update fri2 configuration
>    linux-yocto/3.2: update to v3.2.11
>    linux-yocto/3.0: update to v3.0.24
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    8 ++++----
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    8 ++++----
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb |    6 +++---
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb      |   18 +++++++++---------
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   18 +++++++++---------
>   5 files changed, 29 insertions(+), 29 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



