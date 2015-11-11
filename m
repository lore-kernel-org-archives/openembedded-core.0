Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 73B1B76B7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 12:52:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 11 Nov 2015 04:52:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,275,1444719600"; d="scan'208";a="847865741"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 11 Nov 2015 04:52:11 -0800
Message-ID: <56433A3D.9060104@linux.intel.com>
Date: Wed, 11 Nov 2015 14:53:17 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>	<5641FFD4.1050506@windriver.com>
	<56420F08.1050209@linux.intel.com>	<56421DA6.5080700@windriver.com>
	<1447197016.2907.2.camel@pbcl.net>
	<CAJTo0LZ9XcwwEhXwm0awgZ-cb9wDOC6XkiqShXyUYqG6Qi-Fhw@mail.gmail.com>
In-Reply-To: <CAJTo0LZ9XcwwEhXwm0awgZ-cb9wDOC6XkiqShXyUYqG6Qi-Fhw@mail.gmail.com>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Wed, 11 Nov 2015 12:52:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2015 01:40 AM, Burton, Ross wrote:
>
> On 10 November 2015 at 23:10, Phil Blundell <pb@pbcl.net
> <mailto:pb@pbcl.net>> wrote:
>
>     Why does gobject-introspection (presumably giscanner, right?) need to
>     run binaries on the target at all?  I thought it operated mostly on the
>     source code.
>
>
> Same reason gtk-doc's scanner executes code: vast amounts of relevant
> information can't reliably be extracted from source but is trivial to
> introspect at runtime (GObject hierarchy, properties, signals, etc).

Yep; the real problem is that GObject is implementing OOP semantics in a 
language that doesn't natively support them. So you can't extract 
information about those either from the source code, or from the 
finished binaries, or during binary build. The only way to do it is to 
run the actual binary and ask it to describe itself.


Alex


