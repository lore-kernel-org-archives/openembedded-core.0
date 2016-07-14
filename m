Return-Path: <denis@denix.org>
X-Greylist: delayed 3601 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Jul 2016 04:04:56 UTC
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9484E6FF0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 04:04:56 +0000 (UTC)
Received: from vz-proxy-m008.mx.aol.com ([64.236.83.1])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OAA000KKB7DD780@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2016 22:04:40 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=IfeYs1eZmZ/JIJO4DN4ZPw==:117
	a=kj9zAlcOel0A:10 a=cAmyUtKerLwA:10	a=UHoPCrU2904b6yr_c0oA:9
	a=EwmOyqi4aYsJlSbv:21 a=whwtp5YpGkQkSlO-:21	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 5cbad026; Thu, 14 Jul 2016 03:04:40 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CE3EA1620B6; Wed,
	13 Jul 2016 23:04:24 -0400 (EDT)
Date: Wed, 13 Jul 2016 23:04:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-id: <20160714030424.GF8521@denix.org>
References: <20160710213559.GC8521@denix.org> <20160710221056.GD8521@denix.org>
	<1468225929.28829.71.camel@linuxfoundation.org>
MIME-version: 1.0
In-reply-to: <1468225929.28829.71.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Can NOT get PRAUTO, exception [Errno -3] Temporary failure in name resolution
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
X-List-Received-Date: Thu, 14 Jul 2016 04:04:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jul 11, 2016 at 09:32:09AM +0100, Richard Purdie wrote:
> On Sun, 2016-07-10 at 18:10 -0400, Denys Dmytriyenko wrote:
> > On Sun, Jul 10, 2016 at 05:35:59PM -0400, Denys Dmytriyenko wrote:
> > > Has anyone ever seen this error message:
> > > 
> > > ERROR: blah-blah do_package: Can NOT get PRAUTO, exception [Errno 
> > > -3] Temporary failure in name resolution
> > > 
> > > I'm using centralized PR Service over the network on a local
> > > subnet. I just 
> > 
> > Oh, forgot to mention - this seems to be intermittent, as it works
> > fine now. 
> > Trying to prevent it from happening again in the future.
> > 
> > 
> > > got this message on 2 different machines for 3 separate packages.
> > > Should I be 
> > > worried about it? Should I look into networking HW issues or into
> > > PR server 
> > > instance or something else? Should I switch over to using IP
> > > address instead 
> > > of FQDN and even more - use static IP? Any best practices? Thanks.
> 
> Failure in name resolution sounds like something went odd with the
> network setup. It would be the host networking stack and the general
> network setup that would be responsible for that rather than bitbake
> specifically.
> 
> I assume you're using a FQDN which needs DNS resolution from a remote
> DNS server? Any local caching of DNS?
> 
> It does sound like the DNS server became unreachable for a short period
> and there wasn't a local cache. Its also possible we resolve the name
> often enough (in many different processes) to trigger some kind of
> repeat lookup protection on a DNS server if you have a more paranoid
> security setup.
> 
> A static IP, or a static entry in hosts would likely work around the
> issue, or simply using an IP address.

Thanks, Richard! I will look into setting a static IP and/or hosts entry to 
avoid any potential DNS resolution issues in the future...

-- 
Denys

