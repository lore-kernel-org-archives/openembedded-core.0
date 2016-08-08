Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 320E1771A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 21:34:33 +0000 (UTC)
Received: from vz-proxy-m006.mx.aol.com ([64.236.83.10])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBM002UW196VG20@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2016 16:34:19 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=pKq81LsWol7b8sI3Hpopew==:117
	a=kj9zAlcOel0A:10 a=7z1cN_iqozsA:10	a=pGLkceISAAAA:8
	a=hWztiHMNAqJHbWtN8XIA:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 1280b7c5; Mon, 08 Aug 2016 21:34:19 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 730EB1620E6; Mon,
	8 Aug 2016 17:34:18 -0400 (EDT)
Date: Mon, 08 Aug 2016 17:34:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20160808213418.GT8521@denix.org>
References: <cover.1470672689.git.george.mccollister@gmail.com>
	<20160808180536.GP8521@denix.org>
	<CAFSKS=M=upTtm_zeHwVAvoka7JQm5h3oDxt1E5Odt6+7xe1CEg@mail.gmail.com>
	<CAJTo0LZBUsQ4qagTYWRwRAKoEoiH44-wGe4NBQFWBsEGOPRRmA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJTo0LZBUsQ4qagTYWRwRAKoEoiH44-wGe4NBQFWBsEGOPRRmA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Marek =?utf-8?B?VmHFoXV0?= <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Andrew Bradford <andrew.bradford@kodakalaris.com>, "Dmytriyenko,
	Denys" <denys@ti.com>
Subject: Re: [PATCH v2 0/5] kernel-fitimage: Add initramfs, x86 support
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
X-List-Received-Date: Mon, 08 Aug 2016 21:34:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Aug 08, 2016 at 09:21:31PM +0100, Burton, Ross wrote:
> On 8 August 2016 at 21:16, George McCollister <george.mccollister@gmail.com>
> wrote:
> 
> > I'm surprised it wasn't accepted when it was a single patch. At this
> > point I don't know what's keeping it from being accepted since I
> > haven't received any feedback. I suspect whoever is maintaining OE
> > core doesn't have time to look at it.
> >
> 
> Yeah that's pretty much the case.  It's now in my staging - thanks for
> rebasing and incorporating - so assuming the reviews from Denys etc are
> good then it should be in master soon.

Ok, I've tested everything, except x86 support, as I don't have necessary 
setup.

-- 
Denys

