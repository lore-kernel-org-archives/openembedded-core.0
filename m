Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R0ete-0002Qz-8h for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 21:31:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JQoNu001026;
	Mon, 5 Sep 2011 20:26:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00906-04; Mon,  5 Sep 2011 20:26:46 +0100 (BST)
Received: from [192.168.1.40] (dynamic10.rpnet.com [192.168.1.40])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JQh6I001020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 5 Sep 2011 20:26:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
In-Reply-To: <cover.1315017994.git.bruce.ashfield@windriver.com>
References: <cover.1315017994.git.bruce.ashfield@windriver.com>
Date: Mon, 05 Sep 2011 20:26:43 +0100
Message-ID: <1315250803.1243.12.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
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
X-List-Received-Date: Mon, 05 Sep 2011 19:31:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-02 at 23:03 -0400, Bruce Ashfield wrote:
> Richard/Saul,
> 
> This took a bit longer than I wanted (this was intended for Thursday), but 
> since this was potentially the last minor rev bump for yocto 1.1, I wanted 
> to build and boot all of the qemu targets, and the -rt targets as well.
> 
> While doing this, I noticed that there were still some lurking configuration
> cleanups, which are covered under YOCTO #940, so I took the time to ensure
> that the machines configure without warnings against 3.0.4. The end configs
> are the same (since the options I'm fixing were not translating into the
> final .config), but it completes the update to 3.0.x.
> 
> The machine SRCREV updates represent the update to 3.0.4, while the meta
> branch update contains the following:
> 
> Bruce Ashfield (3):
>       meta/qemuppc: board description fixes
>       meta: remove configuration warnings
>       meta: update kver to v3.0.4
> 
> Saxena, Rahul (2):
>       meta: remove duplicate statement
>       meta: remove unused eg20t configuration fragments
> 
> The kern-tools fixes contain cleanups and a few generalizations that result 
> in easier/more flexible tree generation that I documented for 1.1 and have
> been tested for a week now. They won't impact the patching phase validation, so
> are safe and good for the release.
> 
> I also updated the -rt recipes with the results of the fixes and boot testing.
> 
> cc: Tom Zanussi <tom.zanussi@intel.com>
> cc: Darren Hart <dvhart@linux.intel.com>
> 
> The following changes since commit de5d52711bd810a63a0ad5260b799d6672952c32:
> 
>   sanity.bbclass: fix splitting on newlines of SANITY_TESTED_DISTROS (2011-09-02 18:36:20 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel-oe
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
> 
> Bruce Ashfield (3):
>   linux-yocto: generalize kernel config search pattern
>   linux-yocto: update to v3.0.4
>   linux-yocto: clean configuration for v3.0.4

Merged to master, thanks.

Richard



