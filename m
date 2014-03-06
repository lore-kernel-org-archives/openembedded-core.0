Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AA8556F5D4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 18:49:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Mar 2014 10:49:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,602,1389772800"; d="scan'208";a="467887120"
Received: from unknown (HELO [10.255.13.79]) ([10.255.13.79])
	by orsmga001.jf.intel.com with ESMTP; 06 Mar 2014 10:45:45 -0800
Message-ID: <1394131544.28420.58.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Thu, 06 Mar 2014 12:45:44 -0600
In-Reply-To: <1394129048.24424.271.camel@phil-desktop.brightsign>
References: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394124934.git.tom.zanussi@linux.intel.com>
	<a0c82119ec77c1ad5c8b6a7dc941a96eaeba3fe7.1394124934.git.tom.zanussi@linux.intel.com>
	<1394129048.24424.271.camel@phil-desktop.brightsign>
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
X-List-Received-Date: Thu, 06 Mar 2014 18:49:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-03-06 at 18:04 +0000, Phil Blundell wrote:
> On Thu, 2014-03-06 at 11:09 -0600, Tom Zanussi wrote:
> > +# lttng currently blacklists arm with gcc-4.8
> > +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
> 
> If the issue at hand here is GCC PR 58854 (which the lttng mailing list
> thread seems to suggest it is), can't we just apply the patch for it
> rather than disabling lttng-modules altogether?
> 

Well, I think it's more than that - there's apparently an unbalanced
preempt_disable in lttng somewhere that's the real root of the problem:

http://gcc.gnu.org/ml/gcc/2013-11/msg00393.html

So lttng is still broken, and the blacklist is still in place in the
lttng code.

Tom

> p.
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



