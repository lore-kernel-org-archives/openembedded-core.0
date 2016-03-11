Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA9060119
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 10:47:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2016 02:47:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="667626119"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.4.28])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Mar 2016 02:47:04 -0800
Message-ID: <1457693222.7305.2.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 10:47:02 +0000
In-Reply-To: <1457540251-8951-1-git-send-email-nathangutzmann@gmail.com>
References: <1457540251-8951-1-git-send-email-nathangutzmann@gmail.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH v2] nettle: The variable named p in the patch file was incorrectly named.
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
X-List-Received-Date: Fri, 11 Mar 2016 10:47:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-09 at 09:17 -0700, ngutzmann wrote:
> The variable in question should have been called ecc->p. The patch
> has been updated
> so that the compilation of the nettle recipe would complete
> successfully. The backport
> originated from this commit
> https://git.lysator.liu.se/nettle/nettle/commit/c71d2c9d20eeebb985e38
> 72e4550137209e3ce4d

Thanks a lot for this patch, I've just proposed it for inclusion in the
Fido branch.

I missed this originally because it's not tagged fido, for future it's
worth pointing out that in order to be sure patches for stable branches
are noticed by the maintainers we request the subject is prefixed with
[branchname].

Thanks again for your contribution.

Joshua

