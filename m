Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0C26F3AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 18:36:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2014 10:36:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,602,1389772800"; d="scan'208";a="487390889"
Received: from unknown (HELO [10.255.13.79]) ([10.255.13.79])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2014 10:36:04 -0800
Message-ID: <1394130964.28420.53.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Thu, 06 Mar 2014 12:36:04 -0600
In-Reply-To: <1394128597.24424.269.camel@phil-desktop.brightsign>
References: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394124934.git.tom.zanussi@linux.intel.com>
	<a0c82119ec77c1ad5c8b6a7dc941a96eaeba3fe7.1394124934.git.tom.zanussi@linux.intel.com>
	<1394128597.24424.269.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/6] lttng-modules: Exclude arm
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
X-List-Received-Date: Thu, 06 Mar 2014 18:36:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-03-06 at 17:56 +0000, Phil Blundell wrote:
> On Thu, 2014-03-06 at 11:09 -0600, Tom Zanussi wrote:
> > Without lttng-modules, lttng-tools etc don't make sense either so
> > exclude them as well.
> 
> This isn't entirely true; one can quite happily use the ust tracers
> without the modules.  I've no idea why ust is disabled on aarch64
> either.
> 

OK, I can remove the lttng-removal..

Tom

> p.
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



