Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id A54C865D24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Apr 2014 17:27:06 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4E005PY5SD2R00@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 21 Apr 2014 12:26:48 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B91E7201BF; Mon,
	21 Apr 2014 13:26:37 -0400 (EDT)
Date: Mon, 21 Apr 2014 13:26:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-id: <20140421172637.GQ11339@denix.org>
References: <1396324451-26983-1-git-send-email-denis@denix.org>
	<20140406224639.GD3370@denix.org> <5342C918.5030307@linux.intel.com>
	<20140407210549.GI3370@denix.org> <1396909331.24597.84.camel@ted>
MIME-version: 1.0
In-reply-to: <1396909331.24597.84.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] udev-extraconf: update mount.sh to use /run/media instead of /media
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
X-List-Received-Date: Mon, 21 Apr 2014 17:27:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 07, 2014 at 11:22:11PM +0100, Richard Purdie wrote:
> On Mon, 2014-04-07 at 17:05 -0400, Denys Dmytriyenko wrote:
> > I understand the timing concern and am fine waiting another week for when 1.7 
> > window opens.
> > 
> > But I'm slightly confused as to since when OE-Core is concerned about breaking 
> > bbappends in other layers? I guess some layers are not created equal, eh? :)
> 
> The question is more one of timing. I don't think its reasonable that we
> break things like that between -rc2 and -rc3 of 1.6 without a better
> reason...
> 
> I'm even nervous changing the sstate checksums but I think the CONFFILES
> change does warrant that for example.

Is 1.7 window now open? Should I resubmit this patch again? Thanks.

-- 
Denys

