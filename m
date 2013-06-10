Return-Path: <andy.voltz@timesys.com>
Received: from exchange07.timesys.com (exchange07.timesys.com
	[209.114.137.116])
	by mail.openembedded.org (Postfix) with ESMTP id 41A526A5C4;
	Mon, 10 Jun 2013 15:50:27 +0000 (UTC)
Received: from timesys.com (192.168.3.27) by exchange07.timesys.com
	(192.168.1.221) with Microsoft SMTP Server id 8.1.436.0;
	Mon, 10 Jun 2013 11:50:26 -0400
Date: Mon, 10 Jun 2013 11:50:44 -0400
From: Andy Voltz <andy.voltz@timesys.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20130610155044.GS17357@timesys.com>
References: <20130607154357.606025038F@opal> <20130608091020.GO22710@jama>
	<20130608091556.GP22710@jama>
MIME-Version: 1.0
In-Reply-To: <20130608091556.GP22710@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Andy Voltz : tune-cortexa.inc: create a common include for cortex-a armv7a tuning
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
X-List-Received-Date: Mon, 10 Jun 2013 15:50:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Martin,

> On Sat, Jun 08, 2013 at 11:10:20AM +0200, Martin Jansa wrote:

> > Something is wrong with this one:
> > 
> > ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
> >     Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
> >     Following is the list of potential problems / advisories:
> > 
> >     Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (${ARMPKGARCH_tune-cortexa8t-neon}).Toolchain tunings invalid:
> > Tuning 'cortexa8t-neon' has no defined features, and cannot be used.
> > 
> > ERROR: Execution of event handler 'check_sanity_eventhandler' failed
> > 
> > Please use tests like
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune2-test
> > to check that all tunes are still valid after such change.
> 

I was not aware of this test. I'll look into this.

> Also it was using -mtune and documentation talks about -mtune, but
> actual tune-cortexa.inc is using -mcpu, this change wasn't mentioned in
> commit message and I don't think it's improvement.
> 

*facepalm*

This is actually my mistake when I squashed my cortex-a5 file into a general
cortexa file. I meant to keep the -mtune in place. I started out using mcpu
before realizing mtune was also valid for cortex-a5.

I have a patch to revert that change / go back to -mtune. I will send it after
I rebuild for cortex-a5.

Sorry about that. It didn't come out because the build was happy with -mcpu=cortex-a5
-- 
Andy Voltz
Timesys Corporation

