Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DA3B86E6F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 09:34:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jan 2014 01:34:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,735,1384329600"; d="scan'208";a="471927972"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.226])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2014 01:34:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>, Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 28 Jan 2014 09:34:02 +0000
Message-ID: <1472782.f11FI8Cdpi@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.8-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <1390900799.3068.5.camel@e130.pbcl.net>
References: <1390479065-24299-1-git-send-email-otavio@ossystems.com.br>
	<1413594.S4HepKQVoQ@peggleto-mobl5.ger.corp.intel.com>
	<1390900799.3068.5.camel@e130.pbcl.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory.bbclass: Improve robustness in image file listing
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
X-List-Received-Date: Tue, 28 Jan 2014 09:34:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 28 January 2014 09:19:59 Phil Blundell wrote:
> On Tue, 2014-01-28 at 08:59 +0000, Paul Eggleton wrote:
> > So I think this is mostly a good change, however, we don't want those ->
> > if the file isn't a symlink. Otavio, can you fix that?
> 
> Isn't that what the sed 's/ -> $//' in the original patch is dealing
> with?

Oops, you're right. Ignore this :)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

