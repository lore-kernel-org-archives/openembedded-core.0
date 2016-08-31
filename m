Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3051D731F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:52:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 31 Aug 2016 12:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,263,1470726000"; d="scan'208";a="1049813005"
Received: from clim59-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.178.177])
	by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2016 12:52:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 01 Sep 2016 07:52:40 +1200
Message-ID: <1776923.VAIBD4FQEE@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.7-200.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1472640944.29583.77.camel@linuxfoundation.org>
References: <cover.1472607521.git.paul.eggleton@linux.intel.com>
	<88fde4c5d43e2b6ebced1462705241222fb9734a.1472607521.git.paul.eggleton@linux.intel.com>
	<1472640944.29583.77.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] scripts: ensure tinfoil is shut down correctly
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
X-List-Received-Date: Wed, 31 Aug 2016 19:52:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 31 Aug 2016 11:55:44 Richard Purdie wrote:
> On Wed, 2016-08-31 at 13:48 +1200, Paul Eggleton wrote:
> > We should always shut down tinfoil when we're finished with it,
> > either
> > by explicitly calling the shutdown() method or by using it as a
> > context manager ("with ...").
> 
> Could I trouble you to rebase this onto master-next please? It
> currently has conflicts which didn't seem immediately obvious to me to
> resolve.

Done - I've pushed a new paule/tinfoil-fixes-oe branch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

