Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7BA6D60144
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 14:05:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Dec 2014 06:02:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,501,1413270000"; d="scan'208";a="631383188"
Received: from fodonogx-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.21.108])
	by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2014 06:01:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Tue, 02 Dec 2014 14:01:10 +0000
Message-ID: <4967625.9osgGDJBx1@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.3-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <547D45EB.6060508@linaro.org>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<547D45EB.6060508@linaro.org>
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
X-List-Received-Date: Tue, 02 Dec 2014 14:05:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 01 December 2014 23:54:03 Trevor Woerner wrote:
> On 11/25/14 12:28, Paul Eggleton wrote:
> > I've then added a new recipe auto-creation script, recipetool, which can
> > take a source tree or URL and create a skeleton recipe to build it.
> 
> ...
> 
> >  * "recipetool create" ideally needs to become smarter and fill in
> >  
> >    more details of the recipe. At some point we'll probably have to
> >    make the process interactive and possibly have it automate parts of
> >    the build process and examine the output; some things just can't be
> >    practically detected from the source tree without building.
> 
> There is a tool "autoscan" which might be of some use here. If nothing
> else, the resulting configure.scan file could be parsed for DEPENDS
> information and perhaps PACKAGECONFIG items too.

Interesting - I was not aware of this tool. I've added support for running it 
as well as picking converting AC_CHECK_LIB lines over to DEPENDS (with a note 
about some of them possibly being optional). Thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

