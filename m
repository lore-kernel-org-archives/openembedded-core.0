Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D21DF70499
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 12:37:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jul 2014 05:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,658,1400050800"; d="scan'208";a="561483354"
Received: from snaufer-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.80])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2014 05:37:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jul 2014 13:37:14 +0100
Message-ID: <22671291.0T6rJZEYxz@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.2 (Linux/3.15.4-200.fc20.x86_64; KDE/4.13.2; x86_64; ; )
In-Reply-To: <CAD2C2VS999rDn_WEdtaiRPMdtCFgbzY_iqm2ex6Kc3Vm0f8NaQ@mail.gmail.com>
References: <CAD2C2VS999rDn_WEdtaiRPMdtCFgbzY_iqm2ex6Kc3Vm0f8NaQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: OpenEmbedded build issues with beagle board
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
X-List-Received-Date: Mon, 14 Jul 2014 12:37:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Bryan,

On Tuesday 08 July 2014 12:22:59 Bryan wrote:
> Hi All
>  I am trying to build  Openembeeded classic for Beagle board-XM but i am
> getting lot of broken link issues. I have  set DISTRO as angstrom-2010.x in
> local.conf.   Is this approach  ok? or should i move to openembedded core ??
> Pls suggest.
> 
> Broken link e.g.
> 
> Resolving www.angstrom-distribution.org (www.angstrom-distribution.org)...
> 140.211.169.177
>  Connecting to www.angstrom-distribution.org
> (www.angstrom-distribution.org)|140.211.169.177|:80...
> connected.
>  HTTP request sent, awaiting response...
> 404 Not Found  2014-07-08 10:13:43 ERROR 404: Not Found.

I would strongly suggest moving to OE-Core. OE-Classic isn't really supported 
anymore.

Cheers.
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

