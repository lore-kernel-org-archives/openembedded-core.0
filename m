Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF23731DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 15:20:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Jan 2016 07:20:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,300,1449561600"; d="scan'208";a="891183319"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.31.169])
	by orsmga002.jf.intel.com with ESMTP; 15 Jan 2016 07:20:52 -0800
Message-ID: <1452871248.16112.13.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2016 15:20:48 +0000
In-Reply-To: <20160115134144.GD2607@jama>
References: <cover.1449754339.git.Martin.Jansa@gmail.com>
	<7e6b70331d609496c4e21884682c2e93af0347a7.1449754339.git.Martin.Jansa@gmail.com>
	<20160115134144.GD2607@jama>
X-Mailer: Evolution 3.18.3 (3.18.3-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH][fido][RESEND 4/5] texinfo: don't create dependency on INHERIT variable
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
X-List-Received-Date: Fri, 15 Jan 2016 15:20:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-01-15 at 14:41 +0100, Martin Jansa wrote:
> On Thu, Dec 10, 2015 at 02:48:20PM +0100, Martin Jansa wrote:
> > * we don't want the do_package signature depending on INHERIT
> > variable
> > * e.g. just adding the own-mirrors causes texinfo to rebuild:
> >   # bitbake-diffsigs BUILD/sstate-diff/*/*/texinfo/*do_package.sig*
> >   basehash changed from 015df2fd8e396cc1e15622dbac843301 to
> > 9f1d06c4f238c70a99ccb6d8da348b6a
> >   Variable INHERIT value changed from
> >   ' rm_work blacklist blacklist report-error ${PACKAGE_CLASSES}
> > ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} sanity'
> >   to
> >   ' rm_work own-mirrors blacklist blacklist report-error
> > ${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}
> > ${INHERIT_BLACKLIST} sanity'
> 
> Joshua,
> 
> why this one didn't make it to your fido update?

(For the benefit of the list and with apologies to Martin for the spam)

Apologies, that wasn't an intentional omission. I've pushed it to my
joshuagl/fido-next branch and will include it in the next merge request
(hopefully today).

Regards,

Joshua

