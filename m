Return-Path: <tom.zanussi@intel.com>
X-Greylist: delayed 580 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 May 2014 14:11:19 UTC
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF6165E87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 14:11:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 May 2014 07:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,874,1392192000"; d="scan'208";a="542101894"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by fmsmga002.fm.intel.com with ESMTP; 20 May 2014 07:01:18 -0700
Message-ID: <1400594477.24339.47.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 20 May 2014 09:01:17 -0500
In-Reply-To: <1400593365.28353.215.camel@ted>
References: <1400155748-26271-1-git-send-email-Martin.Jansa@gmail.com>
	<1400593365.28353.215.camel@ted>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-modules: Fix build with older kernels
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
X-List-Received-Date: Tue, 20 May 2014 14:11:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-05-20 at 14:42 +0100, Richard Purdie wrote:
> On Thu, 2014-05-15 at 14:09 +0200, Martin Jansa wrote:
> > * forward port this patch from daisy:
> >   commit c11b29ff4f24af0445c3c6a694b8dc2037dcd7e4
> >   Author: Tom Zanussi <tom.zanussi@intel.com>
> >   Date:   Thu Mar 6 22:26:20 2014 -0600
> > 
> >     lttng-modules: Fix 3.14 bio tracepoints
> > 
> > * how is it possible that it's in daisy but not in master?
> 
> It looks like we have two versions of lttng-modules and friends. The
> patch was applied in master and daisy to 2.4.0 but not to 2.3.3.
> 
> Why do we have two versions of the lttng pieces? :( One works on arm and
> the other doesn't?
> 

Right, rather than completely pulling the rug out from under arm users,
the 2.3.3 pieces that didn't have arm blacklisted was left in place as
an option for them.

Tom 

> Anyhow, the change was in master and daisy.
> 
> Cheers,
> 
> Richard
> 
> 



