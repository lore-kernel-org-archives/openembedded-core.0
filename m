Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id B2497601A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 23:23:08 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NC000H9JOYLRGH0@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 16 Sep 2014 18:23:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D33832037D; Tue,
	16 Sep 2014 19:23:06 -0400 (EDT)
Date: Tue, 16 Sep 2014 19:23:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20140916232306.GX2480@denix.org>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0LaB+e=o02t4pbF6kSNKvy8R8YHT5tijT9T43U=6Y_yXdw@mail.gmail.com>
	<CAP9ODKqtnPzfJ2PwBPQcwQ-jF=yT3dxQiNjWvLB6K71woMX4Vg@mail.gmail.com>
	<CAJTo0LZur5=dt6pfPawcEAM50M9W7zd-0_uoDvj5s74RCgNubA@mail.gmail.com>
	<CAP9ODKpSNOeXfgLbviu4G_Bw2Tc9y86cTNmoWDFeSsOFZC4M3Q@mail.gmail.com>
	<CAJTo0Lbz62+cNOohg8LqJ+4fHA1u5podgELqJsyJLYJnBSdD6A@mail.gmail.com>
	<CAP9ODKqbfGW2FkmtTwMA08PL+Gu2AmYaFTJysYUExXXo5F3_mw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKqbfGW2FkmtTwMA08PL+Gu2AmYaFTJysYUExXXo5F3_mw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Tue, 16 Sep 2014 23:23:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Sep 15, 2014 at 11:41:22AM -0300, Otavio Salvador wrote:
> On Mon, Sep 15, 2014 at 11:36 AM, Burton, Ross <ross.burton@intel.com> wrote:
> > On 15 September 2014 15:33, Otavio Salvador <otavio@ossystems.com.br> wrote:
> >> I think it is a way better base for work but I really don't care as I
> >> use my own recipe in fsl-arm and so does TI.
> >
> > And that's the problem really isn't it. :)  Why do you both use your
> > own recipe, instead of keeping the u-boot in oe-core up to date?

The way we use it in meta-ti, is to include u-boot.inc file and add any SRCREV 
bumps or patches on top. So, the base gets reused.


> Well we both require patches; this does not mean we ought to not keep
> OE-Core in sync (or close to).
> 
> This is the reason why I advocate for the inclusion. Denys were
> working on this update for a while but he must have been pulled out of
> it due work commitments as usual ... so it ended sent now.

Correct. I meant to finish and submit it last month, but got pulled into 
resolving other critical issues, hence the delay, sorry.

I've submitted a v2 version that splits the changes into 2 patches - cleanup 
and update. Please provide comments.

-- 
Denys

