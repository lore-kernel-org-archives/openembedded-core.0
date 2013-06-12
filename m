Return-Path: <andy.voltz@timesys.com>
Received: from exchange07.timesys.com (exchange07.timesys.com
	[209.114.137.116])
	by mail.openembedded.org (Postfix) with ESMTP id DCB5D6AA80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 17:13:33 +0000 (UTC)
Received: from timesys.com (192.168.3.27) by exchange07.timesys.com
	(192.168.1.221) with Microsoft SMTP Server id 8.1.436.0;
	Wed, 12 Jun 2013 13:13:34 -0400
Date: Wed, 12 Jun 2013 13:13:54 -0400
From: Andy Voltz <andy.voltz@timesys.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130612171354.GC12032@timesys.com>
References: <1371055081-15301-1-git-send-email-andy.voltz@timesys.com>
	<51B8A870.6040900@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <51B8A870.6040900@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-cortexa*.inc: fix tunings for cortex a5, a7, a8, a9, a15 machines.
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
X-List-Received-Date: Wed, 12 Jun 2013 17:13:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Saul,

On Wed, Jun 12, 2013 at 12:57:20PM -0400, Saul Wold wrote:
> On 06/12/2013 09:38 AM, Andy Voltz wrote:
> > Using CORTEX_ID variable reference in the tuning overrides did not work.
> > This reverts those changes, and adds a tuning file for the cortex-a5.
> >
> > Revert "tune-cortexa5.inc: Add tune file for cortex-a5"
> > Revert "tune-cortexa.inc: create a common include for cortex-a armv7a tuning"
> >
> Andy, does this patch supersede your -mtune not -mcpu patch?  I seem to
> have some trouble applying this patch.
> 

Yes. Sorry I thought that patch was NACK/dead.

> It might be best to provide a series that includes the reverts with
> appropriate commit messages.
> 

Sure, I can send as a series.

Regards
-- 
Andy Voltz
Timesys Corporation

