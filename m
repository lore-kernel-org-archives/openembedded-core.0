Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id E946565CF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 16:29:02 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.89.130]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NJK00J7GDSF04B0@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 10 Feb 2015 10:29:04 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Ko/6AtSI c=1 sm=1 tr=0	a=ckUr7rGttv+NBxkAVUaaIw==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10	a=QyXUC8HyAAAA:8
	a=DKKOFzNMEErT2Msziz0A:9 a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 360BE20099; Tue,
	10 Feb 2015 11:29:02 -0500 (EST)
Date: Tue, 10 Feb 2015 11:29:02 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20150210162902.GC14949@denix.org>
References: <1423584126-27786-1-git-send-email-denis@denix.org>
	<CAJTo0LZHiTSkhv9YPobmssY_szH4jyzBeUXVyZnnTGYo5oAf4Q@mail.gmail.com>
	<CAP9ODKogEuxRj0QoO-t5S3svVq9gYUjceBg5LfBrXS8k54US_w@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKogEuxRj0QoO-t5S3svVq9gYUjceBg5LfBrXS8k54US_w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Tue, 10 Feb 2015 16:29:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 10, 2015 at 02:17:55PM -0200, Otavio Salvador wrote:
> Hello Ross,
> 
> On Tue, Feb 10, 2015 at 2:16 PM, Burton, Ross <ross.burton@intel.com> wrote:
> > On 10 February 2015 at 16:02, Denys Dmytriyenko <denis@denix.org> wrote:
> >>
> >> +DEPENDS = "openssl"
> >> +DEPENDS_class-native = "openssl-native"
> >
> >
> > That *really* shouldn't be required. :(
> 
> I agree it is not needed and it does seem to be a fail in meta-fsl-ppc
> which should be fixed there.

? Are you saying it's meta-fsl-ppc specific issue?

-- 
Denys

