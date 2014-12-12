Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B9BB2723A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 12:39:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 12 Dec 2014 04:39:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="497777893"
Received: from jmikkola-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.22.9])
	by orsmga003.jf.intel.com with ESMTP; 12 Dec 2014 04:35:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Fri, 12 Dec 2014 12:39:27 +0000
Message-ID: <4354578.hzJShXnB2t@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <548A2481.5080001@linaro.org>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<54871983.1060106@linaro.org> <548A2481.5080001@linaro.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Fri, 12 Dec 2014 12:39:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 11 December 2014 18:10:57 Trevor Woerner wrote:
> I think *this* thread (and question) got lost in the shuffle...
> 
> On 12/09/14 10:47, Trevor Woerner wrote:
> > On 12/02/14 09:01, Paul Eggleton wrote:
> >> On Monday 01 December 2014 23:54:03 Trevor Woerner wrote:
> >>> On 11/25/14 12:28, Paul Eggleton wrote:
> >>>> I've then added a new recipe auto-creation script, recipetool, which
> >>>> can
> >>>> take a source tree or URL and create a skeleton recipe to build it.
> >>> 
> >>> ...
> >>> 
> >>>>  * "recipetool create" ideally needs to become smarter and fill in
> >>>>  
> >>>>    more details of the recipe. At some point we'll probably have to
> >>>>    make the process interactive and possibly have it automate parts of
> >>>>    the build process and examine the output; some things just can't be
> >>>>    practically detected from the source tree without building.
> >>> 
> >>> There is a tool "autoscan" which might be of some use here. If nothing
> >>> else, the resulting configure.scan file could be parsed for DEPENDS
> >>> information and perhaps PACKAGECONFIG items too.
> >> 
> >> Interesting - I was not aware of this tool. I've added support for
> >> running it as well as picking converting AC_CHECK_LIB lines over to
> >> DEPENDS (with a note about some of them possibly being optional).
> >> Thanks!
> > 
> > Finding "AC_PATH_X" in "configure.scan" is probably a good indication
> > there's an RDEPENDS on "libx11". Maybe "recipetool" could check for that?
> 
> *ping*!!

I hadn't missed this, I just hadn't got around to looking at it ;)
 
> Oddly enough, the default recipe even says:
> 
>     # NOTE: the following library dependencies are unknown, ignoring: X11
> 
> 
> Why is it ignoring x11? Coincidentally the code I'm testing this with
> has a dependency on X11 and when I try building, bitbake throws out an
> RDEPENDS warning.

It's ignoring anything that the extremely naive and incomplete mapping that I 
initially added doesn't currently handle. It'll need to be extended, and X11 
would obviously be something we should add straight away. I've added a general 
task to expand the mapping to the todo list. FYI we are tracking more fine-
grained tasks than are covered in bugzilla in the following wiki pages 
(especially since this is currently being worked on in a separate branch):

 https://wiki.yoctoproject.org/wiki/Developer_Workflow_Improvements 

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

