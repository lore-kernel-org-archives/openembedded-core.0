Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 550E36C742
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:47:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Jan 2014 03:47:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,705,1384329600"; d="scan'208";a="469579201"
Received: from acdivito-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.15])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2014 03:47:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 23 Jan 2014 11:46:55 +0000
Message-ID: <4969192.gMxUe1Bi1Y@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.8-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <CAP9ODKrUBJJJHTTBkRmq9j+yOrgGyUfX3TC5L69-ynaDbefo0A@mail.gmail.com>
References: <1390467988-25693-1-git-send-email-koen.kooi@linaro.org>
	<17C27E68-3F62-414D-A02A-8AD06ACE0B66@dominion.thruhere.net>
	<CAP9ODKrUBJJJHTTBkRmq9j+yOrgGyUfX3TC5L69-ynaDbefo0A@mail.gmail.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen.kooi@linaro.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lz4: actually install things
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
X-List-Received-Date: Thu, 23 Jan 2014 11:47:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 23 January 2014 09:36:09 Otavio Salvador wrote:
> On Thu, Jan 23, 2014 at 9:35 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> > Op 23 jan. 2014, om 12:31 heeft Otavio Salvador <otavio@ossystems.com.br>
> het volgende geschreven:
> >> On Thu, Jan 23, 2014 at 7:06 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
> >>> This failure was masked by having lz4 installed on the host system :(
> >>> 
> >>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> >> 
> >> Couldn't it inherit autotools?
> > 
> > It's a handcrafted Makefile, not autotools :(
> 
> No problem, it works as well.
> 
> The do_configure checks for configure.ac/configure.in and it avoid you
> to handcraft do_install and like.

Do _not_ inherit autotools if the software being built doesn't use 
autoconf/automake. Whilst it may work now in some situations, there's 
absolutely no guarantee it won't break in the future. autotools.bbclass needs 
to be able to assume it's actually being used with autotools.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

