Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8A85677046
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 20:19:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 16 Oct 2015 13:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,690,1437462000"; d="scan'208";a="665962674"
Received: from besquive-mobl2.amr.corp.intel.com ([10.219.128.95])
	by orsmga003.jf.intel.com with ESMTP; 16 Oct 2015 13:19:02 -0700
Message-ID: <1445026737.6970.25.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1444989688.17974.1.camel@linuxfoundation.org>
References: <1444930021-4096-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<1444989688.17974.1.camel@linuxfoundation.org>
Organization: Intel Corporation
Date: Fri, 16 Oct 2015 15:18:57 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] populate SDK: prepare calling of bb.utils for exceptions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Oct 2015 20:19:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-10-16 at 11:01 +0100, Richard Purdie wrote:
> On Thu, 2015-10-15 at 12:27 -0500, Benjamin Esquivel wrote:
> > +            if (bb.utils.movefile(sourcefile, destdir) == None):
> > +                raise Exception("moving {} to {} failed".format(
> > +                                        sourcefile, destdir))
> 
> Its a minor issue, however rightly or wrongly, the vast majority of
> the
> code base uses "xxx %s %s" % (var, var2) instead of .format(). Is
> there
> a reason we should be using the latter as for consistency, the former
> would seem to make things more standardised?
> 
No other reason than .format being pythonic and % being an old way of
string formatting. I can move this to % instead on the grounds of
standardizing. 
> Cheers,
> 
> Richard
> 
> 
> 

