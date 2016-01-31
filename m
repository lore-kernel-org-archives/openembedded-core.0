Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5B416E6B1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 23:23:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0VNNXLj002085
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 31 Jan 2016 15:23:33 -0800
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 31 Jan 2016 15:23:33 -0800
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id B0E962800AB; Sun,
	31 Jan 2016 18:23:32 -0500 (EST)
Date: Sun, 31 Jan 2016 18:23:32 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160131232332.GC8889@windriver.com>
References: <1454270163-5294-1-git-send-email-paul.gortmaker@windriver.com>
	<1454273105.7421.24.camel@pbcl.net>
	<20160131215146.GB8889@windriver.com>
	<CAJTo0LbcJUi11Jm4wBXL3w6BQQL-3kLh12T8Nj8x-urTNO=ydA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbcJUi11Jm4wBXL3w6BQQL-3kLh12T8Nj8x-urTNO=ydA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xterm: revert FILES_PN change from recent package uprev
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
X-List-Received-Date: Sun, 31 Jan 2016 23:23:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[Re: [OE-core] [PATCH] xterm: revert FILES_PN change from recent package uprev] On 31/01/2016 (Sun 23:05) Burton, Ross wrote:

> 
> On 31 January 2016 at 21:51, Paul Gortmaker <paul.gortmaker@windriver.com>
> wrote:
> 
>     Of course you are right.  In my defense, in poky, the full path is
>     meta-openembedded/meta-oe/<....> and with two references in the path to
>     OE, I think I can't be the only one consistently getting confused like
>     this.
> 
> 
> There is no meta-oe or meta-openembedded in poky.

A fair comment.  We'd needed the OE components to augment poky
functionality a long time ago, and scripted it to the point that I'd
just forgot it was automatic and where they came from.

Anyway, regardless where the components come from, there is value in
adding clarity to that, I think.

Thanks,
Paul.
--

> 
> Ross

