Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2F9FF60602
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:53:05 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP; 08 Feb 2017 05:53:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208,217";a="56562313"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.16.172])
	by orsmga004.jf.intel.com with ESMTP; 08 Feb 2017 05:53:04 -0800
Message-ID: <1486561983.3754.4.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
Date: Wed, 08 Feb 2017 13:53:03 +0000
In-Reply-To: <CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
References: <20170207042405.22707-1-raj.khem@gmail.com>
	<CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
X-Mailer: Evolution 3.22.4 (3.22.4-2.fc25) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Wed, 08 Feb 2017 13:53:06 -0000
Content-Type: multipart/alternative; boundary="=-0PqxhnkPziqMIFKMYQhx"

--=-0PqxhnkPziqMIFKMYQhx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-02-07 at 17:35 +0000, Burton, Ross wrote:
> On 7 February 2017 at 04:24, Khem Raj <raj.khem@gmail.com> wrote:
> > This is converging the recipes for go from
> > 
> > meta-virtualization and oe-meta-go
> > 
> 
> I'm still of the opinion that this should be in meta-go, not oe-
> core...

FWIW I disagree. Go is a popular systems language and we're
increasingly supporting a wide-array of systems with OE (from iot to
ivi and beyond). 

Go is already in wide enough use and duplicated in enough layers that
we would be doing folks a favour by including it in OE-Core and our
build/test cycle.

Joshua

--=-0PqxhnkPziqMIFKMYQhx
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Tue, 2017-02-07 at 17:35 +0000, Burton, Ross wrote:</div><blockquote type="cite"><div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On 7 February 2017 at 04:24, Khem Raj <span dir="ltr">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote type="cite"><div id=":3zt" class="a3s aXjCH m15a16d210a62cc87">This is converging the recipes for go from<br>
meta-virtualization and oe-meta-go<br></div><br></blockquote></div><br>I'm still of the opinion that this should be in meta-go, not oe-core...</div></div>
</blockquote><div><br></div><div>FWIW I disagree. Go is a popular systems language and we're increasingly supporting a wide-array of systems with OE (from iot to ivi and beyond).&nbsp;</div><div><br></div><div>Go is already in wide enough use and duplicated in enough layers that we would be doing folks a favour by including it in OE-Core and our build/test cycle.</div><div><br></div><div>Joshua</div></body></html>

--=-0PqxhnkPziqMIFKMYQhx--
