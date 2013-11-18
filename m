Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 23BCC6D3DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:56:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Nov 2013 07:52:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="410621883"
Received: from unknown (HELO helios.localnet) ([10.252.121.158])
	by orsmga001.jf.intel.com with ESMTP; 18 Nov 2013 07:56:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2013 15:56:17 +0000
Message-ID: <2012748.zEB8QlG4HV@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <528A32C4.3030306@intel.com>
References: <1383312696-421-1-git-send-email-otavio@ossystems.com.br>
	<528A2927.7070009@windriver.com> <528A32C4.3030306@intel.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 1/2] lttng-modules: Update revision to grab last bugfix releases
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
X-List-Received-Date: Mon, 18 Nov 2013 15:56:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 18 November 2013 07:31:16 Saul Wold wrote:
> On 11/18/2013 06:50 AM, Robert Yang wrote:
> > On 11/18/2013 10:18 PM, Otavio Salvador wrote:
> >> On Mon, Nov 18, 2013 at 10:25 AM, Robert Yang
> >> 
> >> <liezhi.yang@windriver.com> wrote:
> >>>> This should be considered for Dora as well as it fixes the deadlock
> >>>> and building with 3.12 kernels.
> >>> 
> >>> Hi Otavio, thanks for suggesting this for dora, but dora's kernel is
> >>> 3.10.11,
> >>> and this is an update for lttng-modules, I'm not sure whether dora needs
> >>> this.
> >>> 
> >>> Add Saul in the CC list.
> >> 
> >> I think Dora ought to get the new 3.10 kernel updates; this can go
> >> along side with it.
> > 
> > Hi Otavio,
> > 
> > I'm sorry, but I'm not sure whether we need update dora's kernel from
> > 3.10.11
> > to 3.10.17, since we seldom do the package update for a stable branch,
> > let's wait for others' comments:-).
> 
> This is correct, I do not think we will be updating the kernel for a
> stable branch.

FWIW, there is a precedent for this in dylan - I relied upon Bruce sending 
patches that he felt were appropriate for the branch, and he did that on at 
least one occasion.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

