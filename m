Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1C26A378
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 17:51:25 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 May 2013 10:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,765,1363158000"; d="scan'208";a="309638606"
Received: from unknown (HELO helios.localnet) ([10.252.121.189])
	by azsmga001.ch.intel.com with ESMTP; 29 May 2013 10:51:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 May 2013 18:51:14 +0100
Message-ID: <2384925.8Ec5ojEbuK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-22-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAMKF1sotc9HtmKM8ZAE1k3Z1P8qf7G44T31X4T-Zbo1PcWWS4A@mail.gmail.com>
References: <1369842682-11880-1-git-send-email-paul.eggleton@linux.intel.com>
	<CAMKF1sotc9HtmKM8ZAE1k3Z1P8qf7G44T31X4T-Zbo1PcWWS4A@mail.gmail.com>
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-smartpm: add gettext-native to DEPENDS
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
X-List-Received-Date: Wed, 29 May 2013 17:51:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 29 May 2013 10:41:25 Khem Raj wrote:
> On Wednesday, May 29, 2013, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
> > -DEPENDS = "python rpm"
> > +DEPENDS = "python rpm gettext-native"
> 
> Why not inherit gettext ?

Because that doesn't work for python-smartpm-native - that will add gettext-
minimal-native to DEPENDS which does not provide msgfmt.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

