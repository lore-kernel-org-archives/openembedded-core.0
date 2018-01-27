Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E83AC785E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 23:06:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0RN6b2u007310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 27 Jan 2018 23:06:38 GMT
Message-ID: <1517094397.756.44.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Sat, 27 Jan 2018 23:06:37 +0000
In-Reply-To: <BY2PR02MB347BCA749C4415BE91A11E3B9E70@BY2PR02MB347.namprd02.prod.outlook.com>
References: <1516102686.29722.267.camel@linuxfoundation.org>
	<1517070952.756.40.camel@linuxfoundation.org>
	<BY2PR02MB347BCA749C4415BE91A11E3B9E70@BY2PR02MB347.namprd02.prod.outlook.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: Yocto Project, Spectre and Meltdown
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
X-List-Received-Date: Sat, 27 Jan 2018 23:06:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-01-27 at 16:59 +0000, Manjukumar Harthikote Matha wrote:
> -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of
> > Richard Purdie
> > Sent: Saturday, January 27, 2018 8:36 AM
> > To: openembedded-core <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] Yocto Project, Spectre and Meltdown
> > 
> > On Tue, 2018-01-16 at 11:38 +0000, Richard Purdie wrote:
> > > 
> > > I just wanted to give people an update on where the project
> > > stands
> > > with these issues.
> > Master now contains gcc and kernel fixes (in linux-yocto). meta-
> > yocto- bsp updates
> > are still pending.
> > 
> > rocko-next also has those fixes and is undergoing testing which if
> > it passes, will get
> > pushed to rocko.
> > 
> I see that rocko-next branch is upgrading the GCC version to 7.3 from
> 7.2 , is there a reason to do so?
> I was under the impression that we would backport the security fixes
> to 7.2 version.

As Khem replied, this is the stable gcc series and gcc remapped their
versioning scheme a while back to mean that 7.3 is a point release of
the 7 series.

I'm of the view that the gcc team know a lot more about which patches
should be backported to a stable series and have a better skillset and
knowledge base to know how to apply patches onto the older versions
than we do. As such I believe that 7.3 is the right approach for rocko.

Do you have a reason to believe we should do something else?

Note that for pyro and earlier we will need gcc 6 patches, we are not
upgrading 6 -> 7 on pyro since that would cause a ton of breakage.

Cheers,

Richard


