Return-Path: <andy.voltz@timesys.com>
Received: from exchange07.timesys.com (exchange07.timesys.com
	[209.114.137.116])
	by mail.openembedded.org (Postfix) with ESMTP id 077116A9A2;
	Tue, 11 Jun 2013 13:45:24 +0000 (UTC)
Received: from timesys.com (192.168.3.27) by exchange07.timesys.com
	(192.168.1.221) with Microsoft SMTP Server id 8.1.436.0;
	Tue, 11 Jun 2013 09:45:24 -0400
Date: Tue, 11 Jun 2013 09:45:43 -0400
From: Andy Voltz <andy.voltz@timesys.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130611134543.GZ17357@timesys.com>
References: <20130607154357.606025038F@opal> <20130608091020.GO22710@jama>
	<20130608091556.GP22710@jama> <20130610155044.GS17357@timesys.com>
	<CAMKF1spvVOLu5uKFWXC=yqzHV73N61sOqUwj=gg1ZUVK=uN7OQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spvVOLu5uKFWXC=yqzHV73N61sOqUwj=gg1ZUVK=uN7OQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
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
X-List-Received-Date: Tue, 11 Jun 2013 13:45:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Khem,

On Tue, Jun 11, 2013 at 12:12:47AM -0400, Khem Raj wrote:
> On Mon, Jun 10, 2013 at 8:50 AM, Andy Voltz <andy.voltz@timesys.com> wrote:
> >> > ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
> >> >     Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
> >> >     Following is the list of potential problems / advisories:
> >> >
> >> >     Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (${ARMPKGARCH_tune-cortexa8t-neon}).Toolchain tunings invalid:
> >> > Tuning 'cortexa8t-neon' has no defined features, and cannot be used.
> >> >
> >> > ERROR: Execution of event handler 'check_sanity_eventhandler' failed
> >> >
> >> > Please use tests like
> >> > http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune2-test
> >> > to check that all tunes are still valid after such change.
> >>
> >
> > I was not aware of this test. I'll look into this.
> 
> This patch is not going to work. How did you test it ?
> Its trying to substitute into overrides which then are not expanded
> before being treated as overrides.
> as a result overrides variable themselves are wrong.
> We have to revert this patch please and I conur with Martin it did not
> seem like a significant improvement either.

I understand that. I sent an updated patch which reverts to mtune, but I'm getting
acquainted with this tune test and it's still showing issues. I'm need to dig in more.

I tested this originally by building for the cortex-a5. I'm going to revert
locally and keep using this test to keep things consistent.

Regards
-- 
Andy Voltz
Timesys Corporation

