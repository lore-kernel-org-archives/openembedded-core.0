Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B6AB3600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 14:06:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 30 Jun 2016 07:06:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,552,1459839600"; d="scan'208";a="998073970"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2016 07:06:10 -0700
Message-ID: <1467295569.6738.50.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Joshua G Lock <joshua.g.lock@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2016 17:06:09 +0300
In-Reply-To: <1467029553.2892.10.camel@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1466764661-24544-10-git-send-email-markus.lehtonen@linux.intel.com>
	<1467029553.2892.10.camel@linux.intel.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: [PATCH 09/28] oeqa.buildperf: add BuildPerfTest class
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
X-List-Received-Date: Thu, 30 Jun 2016 14:06:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-06-27 at 13:12 +0100, Joshua G Lock wrote:
> On Fri, 2016-06-24 at 13:37 +0300, Markus Lehtonen wrote:

[...SNIP...]
> > +
> > +    @staticmethod
> > +    def force_rm(path):
> > +        """Equivalent of 'rm -rf'"""
> 
> we have oe.path.remove() which does similar.

Thanks! I knew we had that but I just didn't remember/find it. Fixed in
the new version of my patchset.
  - Markus

