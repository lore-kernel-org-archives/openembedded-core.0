Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2390373C7E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 12:47:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 08 May 2015 05:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,390,1427785200"; d="scan'208";a="691933481"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.28.13])
	by orsmga001.jf.intel.com with ESMTP; 08 May 2015 05:47:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 08 May 2015 13:47:28 +0100
Message-ID: <2360040.qkyfHW9XAD@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.6 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <CAP9ODKonoGJRGBZdLdZgt8EG+sn79fH_zCy9RgwJpkVEP3Lf2Q@mail.gmail.com>
References: <554C98F7.5090005@dresearch-fe.de>
	<2224585.tBn3dhReiF@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKonoGJRGBZdLdZgt8EG+sn79fH_zCy9RgwJpkVEP3Lf2Q@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: WARNING: The license listed CLOSED was not in the licenses collected for foo
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
X-List-Received-Date: Fri, 08 May 2015 12:47:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 08 May 2015 09:40:48 Otavio Salvador wrote:
> On Fri, May 8, 2015 at 9:39 AM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > On Friday 08 May 2015 13:07:35 Steffen Sledz wrote:
> >> Since switching from dizzy to fido we've some warnings related to some of
> >> our own closed source packages.
> >> 
> >> WARNING: log_check: There is a warn message in the logfile
> >> WARNING: log_check: Matched keyword: [WARNING:]
> >> WARNING: log_check: WARNING: The license listed CLOSED was not in the
> >> licenses collected for foo
> >> 
> >> The recipes contain lines like this one:
> >> 
> >> LICENSE = "CLOSED"
> >> 
> >> How should we fix the recipe to avoid the warning?
> > 
> > I think the part of the code that produces this warning probably should be
> > ignoring the CLOSED value. Can I ask you to please file a bug? Feel free
> > to add me on CC.
> 
> You can use proprietary.

If you mean "Proprietary", yes there is a common license file for that but then 
I believe you will get an error if LIC_FILES_CHKSUM is not set in the recipe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

