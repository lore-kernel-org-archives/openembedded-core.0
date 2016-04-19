Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by mail.openembedded.org (Postfix) with ESMTP id C5E4860616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 01:01:48 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5U00K4UW6GE040@vms173015.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2016 20:01:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=Q4-j1AaZAAAA:8
	a=GhN1G99jmjVqcmm8yPAA:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 75dab2b8; Tue, 19 Apr 2016 01:01:33 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0ABDD161FAF; Mon,
	18 Apr 2016 21:01:28 -0400 (EDT)
Date: Mon, 18 Apr 2016 21:01:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-id: <20160419010127.GK16135@denix.org>
References: <20160418221455.GJ16135@denix.org>
	<1968586.YaUkzg8nud@peggleto-mobl.ger.corp.intel.com>
MIME-version: 1.0
In-reply-to: <1968586.YaUkzg8nud@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Package management DB in old-style SDK
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
X-List-Received-Date: Tue, 19 Apr 2016 01:01:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 19, 2016 at 10:35:29AM +1200, Paul Eggleton wrote:
> Hi Denys,
> 
> On Mon, 18 Apr 2016 18:14:55 Denys Dmytriyenko wrote:
> > I'm still using the old-style SDK (meta-toolchain) for our products due to
> > some code customizations in it and some of our use cases rely on the opkg
> > package management database being present in sysroots, so packages can be
> > manipulated in SDK with opkg command. It appears that /var/lib/opkg is now
> > empty and the package database is no longer supplied with the SDK.
> > 
> > I know about the new-style populate_sdk and the even newer Extensible SDK,
> > but not yet ready to convert our old use cases to that. Since there were
> > lots of changes around the way SDKs work in OE-Core in the past couple
> > releases, I'm failing to find the change that causes opkg DB to be missing
> > from the old style SDK. I'll appreciate any pointers in helping me debug
> > and/or fix this issue with my SDKs. Thanks.
> 
> As far as ipk is concerned I think it was this commit: 
> 
>   http://cgit.openembedded.org/openembedded-core/commit/?id=c8e0ec2da9ad4ce1c103966906a85f68c15400dd
> 
> Unfortunately it wasn't made optional.

Thanks, Paul!

Unfortunately, the change is in the library, which is quite difficult to 
override in another layer...

Will there be any objections for making that change optional with the default 
being like it is now, but with the ability to restore the old way with a 
variable?

-- 
Denys

