Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 49136732C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 16:26:25 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.89.130]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NJK00A9BDNYY360@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 10 Feb 2015 10:26:23 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=CoYIqc8G c=1 sm=1 tr=0	a=ckUr7rGttv+NBxkAVUaaIw==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10	a=jF4rrVJNYA4oRKOHOBYA:9
	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8919820099; Tue,
	10 Feb 2015 11:26:22 -0500 (EST)
Date: Tue, 10 Feb 2015 11:26:22 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20150210162622.GB14949@denix.org>
References: <1423584126-27786-1-git-send-email-denis@denix.org>
	<CAJTo0LZHiTSkhv9YPobmssY_szH4jyzBeUXVyZnnTGYo5oAf4Q@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJTo0LZHiTSkhv9YPobmssY_szH4jyzBeUXVyZnnTGYo5oAf4Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: update to version 2015.01
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
X-List-Received-Date: Tue, 10 Feb 2015 16:26:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 10, 2015 at 04:16:00PM +0000, Burton, Ross wrote:
> Hi Denys,
> 
> On 10 February 2015 at 16:02, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > +DEPENDS = "openssl"
> > +DEPENDS_class-native = "openssl-native"
> >
> 
> That *really* shouldn't be required. :(
> 
> And indeed, the old patch with -e shows that it isn't:

Yes, I understand it completely and my tests show the same exact -e output. 
But since there were no other suggestions, I decided to cheat a bit... :)


> # $DEPENDS [6 operations]
> #   set /home/ross/Yocto/poky/meta/conf/bitbake.conf:246
> #     ""
> #   set /home/ross/Yocto/poky/meta/conf/documentation.conf:135
> #     [doc] "Lists a recipe's build-time dependencies (i.e. other recipe
> files)."
> #   _prepend /home/ross/Yocto/poky/meta/classes/base.bbclass:81
> #     "${BASEDEPENDS} "
> #   set /home/ross/Yocto/poky/meta/recipes-bsp/u-boot/
> u-boot-mkimage_2015.01.bb:6
> #     "openssl"
> #   set native_virtclass_handler(e):27 [map_dependencies]
> #     "openssl-native"
> #   set data_smart.py:437 [finalize]
> #     "${BASEDEPENDS} openssl-native"
> # pre-expansion value:
> #   "${BASEDEPENDS} openssl-native"
> DEPENDS=" openssl-native"
> 
> This is *very* strange.  When the AB is free I'll do another rebuild to see
> what happens under load.

Thanks a lot! Looking forward for the results.


> Was the DEPENDS_class-native change the only difference between v1 and v2?

Yes, that was the only change.

-- 
Denys

