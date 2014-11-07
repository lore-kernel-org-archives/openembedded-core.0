Return-Path: <denis@denix.org>
X-Greylist: delayed 3616 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Nov 2014 20:43:58 UTC
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id D81AC65C87
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 20:43:58 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NEO00DIWPG9RW51@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 07 Nov 2014 13:43:27 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=LdSLMYbn c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=QyXUC8HyAAAA:8	a=iGHA9ds3AAAA:8
	a=hoV0y3zvQ0CMJJl9itcA:9 a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C66312010D; Fri,
	7 Nov 2014 14:43:20 -0500 (EST)
Date: Fri, 07 Nov 2014 14:43:20 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20141107194320.GE9512@denix.org>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0Law3iWz=+A1vA7QsikNozeVP7U49=+T9fkT7YgLzJ_hcA@mail.gmail.com>
	<CAJTo0LZf2oHEnMj2j5mf=wENbuxcN+ya8oS3WZLSt3O=w_O07w@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJTo0LZf2oHEnMj2j5mf=wENbuxcN+ya8oS3WZLSt3O=w_O07w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to version 2014.07
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
X-List-Received-Date: Fri, 07 Nov 2014 20:44:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Nov 05, 2014 at 03:09:51PM +0000, Burton, Ross wrote:
> On 5 November 2014 14:56, Burton, Ross <ross.burton@intel.com> wrote:
> 
> > | scripts/basic/fixdep: 1: scripts/basic/fixdep: Syntax error: word
> > unexpected (expecting ")")
> >
> 
> The autobuilder failed with a more obvious error (and also has more logs
> available if required):
> 
> | /bin/sh: scripts/basic/fixdep:
> /opt/poky/1.7/sysroots/i686-pokysdk-linux/lib/ld-linux.so.2: bad ELF
> interpreter: No such file or directory
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/87/steps/BuildImages_3/logs/stdio

And I also tried looking at the above URL, but couldn't find any of the 
mentionend error messages there. Not sure if the build number got re-used in 
the last couple days... Any other pointers you have to look at the logs?

-- 
Denys

