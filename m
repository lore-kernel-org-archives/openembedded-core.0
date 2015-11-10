Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 190D265CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 15:05:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 10 Nov 2015 07:05:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,270,1444719600"; d="scan'208";a="597594653"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Nov 2015 07:05:09 -0800
Message-ID: <564207E6.9090409@linux.intel.com>
Date: Tue, 10 Nov 2015 17:06:14 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
	<5641FF6D.7000508@linux.intel.com>
	<3967262.YS5vrjTqP1@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <3967262.YS5vrjTqP1@peggleto-mobl.ger.corp.intel.com>
Subject: Re: [RFC] Remove vala from oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 15:05:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2015 04:50 PM, Paul Eggleton wrote:

> When considering whether something belongs in OE-Core, typically we apply the
> following criteria (not that this is really formalised, but based on our
> history):
>
> 1) Is it something that a reasonable majority of people need in an embedded
> context?

I should clarify: there might be Vala software out there that someone 
would want to run in an embedded context. And that software might 
require Vala bindings for libraries that are in oe-core. If we don't 
provide those bindings, then either the layer that adds vala recipe also 
has to patch all of our oe-core recipes, or (worse!) the person who 
needs something vala-based also has to ad-hoc-patch the dependency 
recipes of that.

Alex


